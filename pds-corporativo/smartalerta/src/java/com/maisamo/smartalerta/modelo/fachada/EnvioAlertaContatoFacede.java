/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.fachada;

import java.util.List;

import com.maisamo.smartalerta.modelo.dao.EnvioAlertaContatoDAO;
import com.maisamo.smartalerta.modelo.entidade.EnvioAlertaContato;
import com.maisamo.smartalerta.modelo.entidade.EnvioAlerta;


public class EnvioAlertaContatoFacede {

    private final EnvioAlertaContatoDAO eacdao = new EnvioAlertaContatoDAO();

    public boolean inserir(EnvioAlertaContato envio_alerta_contato) {
        return eacdao.inserir(envio_alerta_contato);
    }

    public List<EnvioAlertaContato> listar(EnvioAlerta envio_alerta) {
        return eacdao.listar(envio_alerta);
    }
}
