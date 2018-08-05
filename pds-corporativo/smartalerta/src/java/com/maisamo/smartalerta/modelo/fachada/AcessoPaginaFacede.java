/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.fachada;

import java.util.List;

import com.maisamo.smartalerta.modelo.dao.AcessoPaginaDAO;
import com.maisamo.smartalerta.modelo.entidade.AcessoPagina;
import com.maisamo.smartalerta.modelo.entidade.Pagina;

/**
 *
 * 
 */
public class AcessoPaginaFacede {

    private final AcessoPaginaDAO apdao = new AcessoPaginaDAO();

    public boolean inserir(AcessoPagina acesso_pagina) {
        return apdao.inserir(acesso_pagina);
    }

    public boolean excluir(AcessoPagina acesso_pagina) {
        return apdao.excluir(acesso_pagina);
    }

    public List<AcessoPagina> listar(Pagina pagina) {
        return apdao.listar(pagina);
    }
}
