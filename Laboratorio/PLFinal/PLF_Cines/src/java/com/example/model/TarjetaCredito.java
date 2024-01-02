/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.model;

/**
 *
 * @author david
 */
public class TarjetaCredito {
    
    private String numeroTarjeta;
    private String nombreTitular;
    private String fecha_caducidad;
    private String codigoSeguridad;
    private String email_user;

    public TarjetaCredito(String numeroTarjeta, String nombreTitular, String fecha_caducidad, String codigoSeguridad, String email_user) {
        this.numeroTarjeta = numeroTarjeta;
        this.nombreTitular = nombreTitular;
        this.fecha_caducidad = fecha_caducidad;
        this.codigoSeguridad = codigoSeguridad;
        this.email_user = email_user;
    }

    public String getNumeroTarjeta() {
        return numeroTarjeta;
    }

    public void setNumeroTarjeta(String numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    public String getNombreTitular() {
        return nombreTitular;
    }

    public void setNombreTitular(String nombreTitular) {
        this.nombreTitular = nombreTitular;
    }

    public String getFecha_caducidad() {
        return fecha_caducidad;
    }

    public void setFecha_caducidad(String fecha_caducidad) {
        this.fecha_caducidad = fecha_caducidad;
    }

    public String getCodigoSeguridad() {
        return codigoSeguridad;
    }

    public void setCodigoSeguridad(String codigoSeguridad) {
        this.codigoSeguridad = codigoSeguridad;
    }

    public String getEmail_user() {
        return email_user;
    }

    public void setEmail_user(String email_user) {
        this.email_user = email_user;
    }

    @Override
    public String toString() {
        return "TarjetaCredito{" + "numeroTarjeta=" + numeroTarjeta + ", nombreTitular=" + nombreTitular + ", fecha_caducidad=" + fecha_caducidad + ", codigoSeguridad=" + codigoSeguridad + ", email_user=" + email_user + '}';
    }

   
    
    
}