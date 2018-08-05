/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.fachada;

import java.util.List;

import com.maisamo.smartalerta.modelo.dao.ContatoDAO;
import com.maisamo.smartalerta.modelo.entidade.Contato;
import com.maisamo.smartalerta.modelo.entidade.Usuario;


public class ContatoFacede {

    private final ContatoDAO cdao = new ContatoDAO();

    public boolean inserir(Contato contato) {
        return cdao.inserir(contato);
    }

    public boolean atualizar(Contato contato) {
        return cdao.atualizar(contato);
    }

    public boolean excluir(Contato contato) {
        return cdao.excluir(contato);
    }

    public List<Contato> listar(Usuario usuario) {
        return cdao.listar(usuario);
    }

    public boolean procurar(String valor, String coluna, Usuario usuario) {
        return cdao.procurar(valor, coluna, usuario);
    }

    public Contato procurarPorId(Long id) {
        return cdao.procurarPorId(id);
    }
}
