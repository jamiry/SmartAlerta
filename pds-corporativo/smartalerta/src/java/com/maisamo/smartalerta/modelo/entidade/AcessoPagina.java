/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.entidade;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;

/**
 *
 * 
 */
public class AcessoPagina {

    private Long id;
    private LocalDateTime datahora_acesso;
    private final Pagina pagina;

    public AcessoPagina(Pagina pagina) {
        this.pagina = pagina;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDataAcesso() {
        return datahora_acesso.toLocalDate();
    }

    public LocalTime getHoraAcesso() {
        return datahora_acesso.toLocalTime();
    }

    public void setDataHoraAcesso(LocalDateTime datahora_acesso) {
        this.datahora_acesso = datahora_acesso;
    }

    public Pagina getPagina() {
        return pagina;
    }
}
