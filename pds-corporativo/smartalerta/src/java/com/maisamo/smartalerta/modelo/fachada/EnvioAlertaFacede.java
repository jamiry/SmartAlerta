/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.fachada;

import java.util.List;

import com.maisamo.smartalerta.modelo.dao.EnvioAlertaDAO;
import com.maisamo.smartalerta.modelo.entidade.EnvioAlerta;
import com.maisamo.smartalerta.modelo.entidade.Alerta;
import com.maisamo.smartalerta.modelo.entidade.Usuario;


public class EnvioAlertaFacede {

    private final EnvioAlertaDAO eadao = new EnvioAlertaDAO();

    public boolean inserir(EnvioAlerta envio_alerta) {
        return eadao.inserir(envio_alerta);
    }

    public boolean excluir(EnvioAlerta envio_alerta) {
        return eadao.excluir(envio_alerta);
    }

    public List<EnvioAlerta> listar(Usuario usuario) {
        return eadao.listar(usuario);
    }

    public EnvioAlerta procurarPorId(Long id) {
        return eadao.procurarPorId(id);
    }
    
    public EnvioAlerta procurarRecente(Alerta alerta) {
        return eadao.procurarRecente(alerta);
    }
}
