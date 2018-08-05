/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.entidade;

/**
 *
 *
 */
public class EnvioAlertaContato {

    private Long id;
    private final Contato contato;
    private final EnvioAlerta envio_alerta;

    public EnvioAlertaContato(Contato contato, EnvioAlerta envio_alerta) {
        this.contato = contato;
        this.envio_alerta = envio_alerta;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Contato getContato() {
        return contato;
    }

    public EnvioAlerta getEnvioAlerta() {
        return envio_alerta;
    }
}
