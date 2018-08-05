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
import java.util.ArrayList;
import java.util.List;

import com.maisamo.smartalerta.modelo.conexao.ConexaoBanco;
import com.maisamo.smartalerta.modelo.entidade.EnvioAlertaContato;
import com.maisamo.smartalerta.modelo.entidade.EnvioAlerta;
import com.maisamo.smartalerta.modelo.entidade.Contato;

/**
 *
 * 
 */
public class EnvioAlertaContatoDAO {

    private Connection conexao;
    private ResultSet rs;
    private PreparedStatement preparador;
    private boolean resultado = false;

    public boolean inserir(EnvioAlertaContato envio_alerta_contato) {
        String sql = "INSERT INTO envio_alerta_contato (envio_alerta_id,contato_id) VALUES (?,?)";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, envio_alerta_contato.getEnvioAlerta().getId());
            preparador.setLong(2, envio_alerta_contato.getContato().getId());
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

    public List<EnvioAlertaContato> listar(EnvioAlerta envio_alerta) {
        String sql = "SELECT * FROM envio_alerta_contato eac "
                    +"JOIN contato c ON c.id = eac.contato_id "
                    +"WHERE envio_alerta_id = ? "
                    +"ORDER BY c.nome";

        List<EnvioAlertaContato> lista = new ArrayList();

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, envio_alerta.getId());

            rs = preparador.executeQuery();

            while (rs.next()) {
                Contato contato = new Contato();
                contato.setNome(rs.getString("nome"));
                contato.setEmail(rs.getString("email"));
                contato.setFone(rs.getString("fone"));
                EnvioAlertaContato envio_alerta_contato = new EnvioAlertaContato(contato, envio_alerta);
                lista.add(envio_alerta_contato);
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
}
