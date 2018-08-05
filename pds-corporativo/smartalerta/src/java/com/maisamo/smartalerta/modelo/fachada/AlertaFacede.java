/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.fachada;

import java.util.List;

import com.maisamo.smartalerta.modelo.dao.AlertaDAO;
import com.maisamo.smartalerta.modelo.entidade.Alerta;
import com.maisamo.smartalerta.modelo.entidade.Usuario;

/**
 *
 * 
 */
public class AlertaFacede {

    private final AlertaDAO adao = new AlertaDAO();

    public boolean inserir(Alerta alerta) {
        return adao.inserir(alerta);
    }

    public boolean atualizar(Alerta alerta) {
        return adao.atualizar(alerta);
    }

    public boolean excluir(Alerta alerta) {
        return adao.excluir(alerta);
    }

    public List<Alerta> listar(Usuario usuario) {
        return adao.listar(usuario);
    }
    
    public List<String> listarCategorias(Usuario usuario) {
        return adao.listarCategorias(usuario);
    }
    
    public List<String> listarTitulosPorCategoria(String categoria) {
        return adao.listarTitulosPorCategoria(categoria);
    }

    public boolean procurar(String valor, String coluna, Usuario usuario) {
        return adao.procurar(valor, coluna, usuario);
    }
    
    public Alerta procurarPorTitulo(String titulo, Usuario usuario) {
        return adao.procurarPorTitulo(titulo, usuario);
    }
    
    public Alerta procurarPorId(Long id) {
        return adao.procurarPorId(id);
    }
}
