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
import com.maisamo.smartalerta.modelo.entidade.AcessoPagina;
import com.maisamo.smartalerta.modelo.entidade.Pagina;

/**
 *
 * 
 */
public class AcessoPaginaDAO {

    private Connection conexao;
    private ResultSet rs;
    private PreparedStatement preparador;
    private boolean resultado = false;

    public boolean inserir(AcessoPagina acesso_pagina) {
        String sql = "INSERT INTO acesso_pagina (data_acesso,hora_acesso,pagina_id) values (?,?,?)";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setDate(1, Date.valueOf(acesso_pagina.getDataAcesso()));
            preparador.setTime(2, Time.valueOf(acesso_pagina.getHoraAcesso()));
            preparador.setLong(3, acesso_pagina.getPagina().getId());
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

    public boolean excluir(AcessoPagina acesso_pagina) {
        String sql = "DELETE FROM acesso_pagina where id = ?";

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, acesso_pagina.getId());
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

    public List<AcessoPagina> listar(Pagina pagina) {
        String sql = "SELECT * FROM acesso_pagina WHERE pagina_id = ? ORDER BY id DESC";

        List<AcessoPagina> lista = new ArrayList();

        try {
            conexao = ConexaoBanco.abrirConexao();
            preparador = conexao.prepareStatement(sql);
            preparador.setLong(1, pagina.getId());

            rs = preparador.executeQuery();

            while (rs.next()) {
                AcessoPagina acesso_pagina = new AcessoPagina(pagina);
                acesso_pagina.setId(rs.getLong("id"));
                acesso_pagina.setDataHoraAcesso(
                        LocalDateTime.of(
                                rs.getDate("data_acesso").toLocalDate(),
                                rs.getTime("hora_acesso").toLocalTime()
                        )
                );
                lista.add(acesso_pagina);
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
