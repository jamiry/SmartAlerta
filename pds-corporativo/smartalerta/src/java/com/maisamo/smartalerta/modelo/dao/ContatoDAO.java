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
import com.maisamo.smartalerta.modelo.entidade.Contato;
import com.maisamo.smartalerta.modelo.entidade.Usuario;

/**
 *
 *
 */
public class ContatoDAO {

    private Connection conexao;
    private ResultSet rs;
    private PreparedStatement preparador;
    private boolean resultado = false;

    public boolean inserir(Contato contato) {
        String sql = "INSERT INTO contato (nome,email,fone,usuario_id) VALUES (?,?,?,?)";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setString(1, contato.getNome());
            preparador.setString(2, contato.getEmail());
            preparador.setString(3, contato.getFone());
            preparador.setLong(4, contato.getUsuario().getId());
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

    public boolean atualizar(Contato contato) {
        String sql = "UPDATE contato SET nome = ?, email = ?, fone = ? WHERE id = ?";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setString(1, contato.getNome());
            preparador.setString(2, contato.getEmail());
            preparador.setString(3, contato.getFone());
            preparador.setLong(4, contato.getId());
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

    public boolean excluir(Contato contato) {
        String sql = "DELETE FROM contato WHERE id = ?";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, contato.getId());
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

    public List<Contato> listar(Usuario usuario) {
        String sql = "SELECT * FROM contato WHERE usuario_id = ? ORDER BY id DESC";

        List<Contato> lista = new ArrayList();

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, usuario.getId());

            rs = preparador.executeQuery();

            while (rs.next()) {
                Contato contato = new Contato(usuario);
                contato.setId(rs.getLong("id"));
                contato.setNome(rs.getString("nome"));
                contato.setEmail(rs.getString("email"));
                contato.setFone(rs.getString("fone"));
                lista.add(contato);
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

    public boolean procurar(String valor, String coluna, Usuario usuario) {
        String sql = "SELECT * FROM contato WHERE " + coluna + " = ? AND usuario_id = ?";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setString(1, valor);
            preparador.setLong(2, usuario.getId());

            rs = preparador.executeQuery();

            if (rs.next()) {
                resultado = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexaoBanco.fecharResultSet(rs);
            ConexaoBanco.fecharInstrucao(preparador);
            ConexaoBanco.fecharConexao(conexao);
        }
        return resultado;
    }

    public Contato procurarPorId(Long id) {
        String sql = "SELECT * FROM contato WHERE id = ?";
        Contato contato = null;

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, id);

            rs = preparador.executeQuery();

            if (rs.next()) {
                contato =  new Contato();
                contato.setId(rs.getLong("id"));
                contato.setNome(rs.getString("nome"));
                contato.setEmail(rs.getString("email"));
                contato.setFone(rs.getString("fone"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConexaoBanco.fecharResultSet(rs);
            ConexaoBanco.fecharInstrucao(preparador);
            ConexaoBanco.fecharConexao(conexao);
        }
        return contato;
    }
}
