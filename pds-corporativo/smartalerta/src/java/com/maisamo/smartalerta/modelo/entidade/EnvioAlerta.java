/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.maisamo.smartalerta.modelo.entidade;

import java.time.LocalDateTime;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * 
 */
public class EnvioAlerta {

    private Long id;
    private LocalDateTime datahora_envio;
    private Alerta alerta;

    public EnvioAlerta() {
    }

    public EnvioAlerta(Alerta alerta) {
        this.alerta = alerta;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDataEnvio() {
        return datahora_envio.toLocalDate();
    }

    public LocalTime getHoraEnvio() {
        return datahora_envio.toLocalTime();
    }
    
    public void setDataHoraEnvio(LocalDateTime datahora_envio) {
        this.datahora_envio = datahora_envio;
    }
    
    public String getDataHoraEnvio() {
        return datahora_envio.format(DateTimeFormatter.ofPattern("dd-MM-uuuu / HH:mm:ss"));
    }
    
    public Alerta getAlerta() {
        return alerta;
    }
}
