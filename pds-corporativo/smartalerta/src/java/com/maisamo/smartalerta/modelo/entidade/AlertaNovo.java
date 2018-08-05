/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.entidade;

import java.io.Serializable;

/**
 *
 * @author Jamiry
 */
public class AlertaNovo implements Serializable {
    
    long id;
    String titulo,mensagem,categoria,logDate,logUser;

    public long getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getMensagem() {
        return mensagem;
    }

    public String getCategoria() {
        return categoria;
    }

    public String getLogDate() {
        return logDate;
    }

    public String getLogUser() {
        return logUser;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public void setLogDate(String logDate) {
        this.logDate = logDate;
    }

    public void setLogUser(String logUser) {
        this.logUser = logUser;
    }

    @Override
    public String toString() {
        return "AlertaNovo{" + "id=" + id + ", titulo=" + titulo + ", mensagem=" + mensagem + ", categoria=" + categoria + ", logDate=" + logDate + ", logUser=" + logUser + '}';
    }
    
}
