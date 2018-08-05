/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.maisamo.smartalerta.modelo.conexao.ConexaoBanco;
import com.maisamo.smartalerta.modelo.entidade.EnvioAlerta;
import com.maisamo.smartalerta.modelo.entidade.Alerta;
import com.maisamo.smartalerta.modelo.entidade.Usuario;

/**
 *
 * 
 */
public class EnvioAlertaDAO {

    private Connection conexao;
    private ResultSet rs;
    private PreparedStatement preparador;
    private boolean resultado = false;

    public boolean inserir(EnvioAlerta envio_alerta) {
        String sql = "INSERT INTO envio_alerta (data_envio,hora_envio,alerta_id) VALUES (?,?,?)";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setDate(1, Date.valueOf(envio_alerta.getDataEnvio()));
            preparador.setTime(2, Time.valueOf(envio_alerta.getHoraEnvio()));
            preparador.setLong(3, envio_alerta.getAlerta().getId());
            preparador.execute();
            resultado = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexaoBanco.fecharInstrucao(preparador);
            ConexaoBanco.fecharConexao(conexao);
        }
        return resultado;
    }

    public boolean excluir(EnvioAlerta envio_alerta) {
        String sql = "DELETE FROM envio_alerta WHERE id = ?";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, envio_alerta.getId());
            preparador.execute();
            resultado = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexaoBanco.fecharInstrucao(preparador);
            ConexaoBanco.fecharConexao(conexao);
        }
        return resultado;
    }

    public List<EnvioAlerta> listar(Usuario usuario) {
        String sql = "SELECT * FROM envio_alerta ea "
                    +"JOIN (SELECT * FROM alerta WHERE usuario_id = ?) au "
                    +"ON au.id = ea.alerta_id "
                    +"ORDER BY ea.data_envio DESC";

        List<EnvioAlerta> lista = new ArrayList();

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, usuario.getId());

            rs = preparador.executeQuery();

            while (rs.next()) {
                Alerta alerta = new Alerta(usuario);
                alerta.setTitulo(rs.getString("titulo"));
                alerta.setCategoria(rs.getString("categoria"));
                EnvioAlerta envio_alerta = new EnvioAlerta(alerta);
                envio_alerta.setId(rs.getLong(1));
                envio_alerta.setDataHoraEnvio(
                        LocalDateTime.of(
                                rs.getDate("data_envio").toLocalDate(),
                                rs.getTime("hora_envio").toLocalTime()
                        )
                );
                lista.add(envio_alerta);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexaoBanco.fecharResultSet(rs);
            ConexaoBanco.fecharInstrucao(preparador);
            ConexaoBanco.fecharConexao(conexao);
        }
        return lista;
    }

    public EnvioAlerta procurarPorId(Long id) {
        String sql = "SELECT * FROM envio_alerta WHERE id = ?";

        EnvioAlerta envio_alerta = null;

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, id);
            
            rs = preparador.executeQuery();

            if (rs.next()) {
                envio_alerta = new EnvioAlerta();
                envio_alerta.setId(rs.getLong("id"));
                envio_alerta.setDataHoraEnvio(
                        LocalDateTime.of(
                                rs.getDate("data_envio").toLocalDate(),
                                rs.getTime("hora_envio").toLocalTime()
                        )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexaoBanco.fecharResultSet(rs);
            ConexaoBanco.fecharInstrucao(preparador);
            ConexaoBanco.fecharConexao(conexao);
        }
        return envio_alerta;
    }
    
    public EnvioAlerta procurarRecente(Alerta alerta) {
        String sql = "SELECT * FROM envio_alerta WHERE alerta_id = ? ORDER BY id DESC LIMIT 1";

        EnvioAlerta envio_alerta = null;

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, alerta.getId());
            
            rs = preparador.executeQuery();

            if (rs.next()) {
                envio_alerta = new EnvioAlerta();
                envio_alerta.setId(rs.getLong("id"));
                envio_alerta.setDataHoraEnvio(
                        LocalDateTime.of(
                                rs.getDate("data_envio").toLocalDate(),
                                rs.getTime("hora_envio").toLocalTime()
                        )
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexaoBanco.fecharResultSet(rs);
            ConexaoBanco.fecharInstrucao(preparador);
            ConexaoBanco.fecharConexao(conexao);
        }
        return envio_alerta;
    }
}
