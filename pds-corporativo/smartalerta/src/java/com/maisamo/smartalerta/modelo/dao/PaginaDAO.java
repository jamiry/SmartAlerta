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
import com.maisamo.smartalerta.modelo.entidade.Pagina;
import com.maisamo.smartalerta.modelo.entidade.Alerta;
import com.maisamo.smartalerta.modelo.entidade.Usuario;
import com.maisamo.smartalerta.modelo.entidade.Contato;

/**
 *
 * 
 */
public class PaginaDAO {

    private Connection conexao;
    private ResultSet rs;
    private PreparedStatement preparador;
    private boolean resultado;

    public boolean inserir(Pagina pagina) {
        String sql = "INSERT INTO pagina (url, data_expira, hora_expira, alerta_id, usuario_id, contato_id) values (?,?,?,?,?,?)";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setString(1, pagina.getUrl());
            preparador.setDate(2, Date.valueOf(pagina.getDataExpira()));
            preparador.setTime(3, Time.valueOf(pagina.getHoraExpira()));
            preparador.setLong(4, pagina.getAlerta().getId());
            preparador.setLong(5, pagina.getUsuario().getId());
            preparador.setLong(6, pagina.getContato().getId());
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

    public boolean excluir(Pagina pagina) {
        String sql = "DELETE FROM pagina WHERE 1=?";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setBoolean(1, pagina.expirou());
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

    public List<Pagina> listar() {
        String sql = "SELECT p.id, p.data_expira, p.hora_expira, "
                    +"u.nome AS unome, c.nome AS cnome, "
                    +"a.categoria AS acat, a.titulo AS atit, a.mensagem AS amsg "
                    +"FROM pagina p "
                    +"JOIN alerta a ON a.id = p.alerta_id "
                    +"JOIN usuario u ON u.id = p.usuario_id "
                    +"JOIN contato c ON c.id = p.contato_id "
                    +"ORDER BY p.id DESC";

        List<Pagina> lista = new ArrayList();

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);

            rs = preparador.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setNome(rs.getString("unome"));
                
                Alerta alerta = new Alerta(usuario);
                alerta.setTitulo(rs.getString("atit"));
                alerta.setMensagem(rs.getString("amsg"));
                alerta.setCategoria(rs.getString("acat"));
                
                Contato contato = new Contato(usuario);
                contato.setNome(rs.getString("cnome"));
                
                Pagina pagina = new Pagina(alerta, usuario, contato);
                pagina.setId(rs.getLong("id"));
                pagina.setDataHoraExpira(
                        LocalDateTime.of(
                                rs.getDate("data_expira").toLocalDate(),
                                rs.getTime("hora_expira").toLocalTime()
                        )
                );
                lista.add(pagina);
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
    
    public Pagina procurarPorId(Long id) {
        String sql = "SELECT p.id, p.data_expira, p.hora_expira, "
                    +"u.nome AS unome, c.nome AS cnome, "
                    +"a.categoria AS acat, a.titulo AS atit, a.mensagem AS amsg "
                    +"FROM pagina p "
                    +"JOIN alerta a ON a.id = p.alerta_id "
                    +"JOIN usuario u ON u.id = p.usuario_id "
                    +"JOIN contato c ON c.id = p.contato_id "
                    +"WHERE p.id = ?";
        
        Pagina pagina = null;
        
        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, id);
            
            rs = preparador.executeQuery();
            
            if (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setNome(rs.getString("unome"));
                
                Alerta alerta = new Alerta(usuario);
                alerta.setTitulo(rs.getString("atit"));
                alerta.setMensagem(rs.getString("amsg"));
                alerta.setCategoria(rs.getString("acat"));
                
                Contato contato = new Contato(usuario);
                contato.setNome(rs.getString("cnome"));
                
                pagina = new Pagina(alerta, usuario, contato);
                pagina.setId(rs.getLong("id"));
                pagina.setDataHoraExpira(
                        LocalDateTime.of(
                                rs.getDate("data_expira").toLocalDate(),
                                rs.getTime("hora_expira").toLocalTime()
                        )
                );
            }
            
        } catch (SQLException ex) {
            ex.getStackTrace();
        } finally {
            ConexaoBanco.fecharResultSet(rs);
            ConexaoBanco.fecharInstrucao(preparador);
            ConexaoBanco.fecharConexao(conexao);
        }
        return pagina;
    }
    
    public Pagina procurarRecente(Alerta alerta, Usuario usuario, Contato contato) {
        String sql = "SELECT * FROM pagina WHERE alerta_id = ? AND usuario_id = ? AND contato_id = ? ORDER BY id DESC LIMIT 1";
        
        Pagina pagina = null;
        
        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, alerta.getId());
            preparador.setLong(2, usuario.getId());
            preparador.setLong(3, contato.getId());
            
            rs = preparador.executeQuery();
            
            if (rs.next()) {
                pagina = new Pagina(alerta, usuario, contato);
                pagina.setId(rs.getLong("id"));
                pagina.setDataHoraExpira(
                        LocalDateTime.of(
                                rs.getDate("data_expira").toLocalDate(),
                                rs.getTime("hora_expira").toLocalTime()
                        )
                );
            }
            
        } catch (SQLException ex) {
            ex.getStackTrace();
        } finally {
            ConexaoBanco.fecharResultSet(rs);
            ConexaoBanco.fecharInstrucao(preparador);
            ConexaoBanco.fecharConexao(conexao);
        }
        return pagina;
    }
}
