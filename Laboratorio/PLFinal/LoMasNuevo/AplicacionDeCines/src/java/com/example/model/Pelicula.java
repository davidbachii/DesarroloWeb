/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.model;

/**
 *
 * @author david
 */
public class Pelicula {
    private String nombre;
    private String sinopsis;
    private String paginaOficial;
    private String tituloOriginal;
    
    private String genero;
    private String nacionalidad;
    private int duracion;
    private String año;
  //  private String distribuidora;
  //  private String director;
  //  private String actores;
 //   private int clasificacionEdad;

    public Pelicula(String nombre, String sinopsis, String paginaOficial, String tituloOriginal, String genero, String nacionalidad, int duracion, String año) {
        this.nombre = nombre;
        this.sinopsis = sinopsis;
        this.paginaOficial = paginaOficial;
        this.tituloOriginal = tituloOriginal;
        this.genero = genero;
        this.nacionalidad = nacionalidad;
        this.duracion = duracion;
        this.año = año;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSinopsis() {
        return sinopsis;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public String getPaginaOficial() {
        return paginaOficial;
    }

    public void setPaginaOficial(String paginaOficial) {
        this.paginaOficial = paginaOficial;
    }

    public String getTituloOriginal() {
        return tituloOriginal;
    }

    public void setTituloOriginal(String tituloOriginal) {
        this.tituloOriginal = tituloOriginal;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public String getAño() {
        return año;
    }

    public void setAño(String año) {
        this.año = año;
    }

    @Override
    public String toString() {
        return "Pelicula{" + "nombre=" + nombre + ", sinopsis=" + sinopsis + ", paginaOficial=" + paginaOficial + ", tituloOriginal=" + tituloOriginal + ", genero=" + genero + ", nacionalidad=" + nacionalidad + ", duracion=" + duracion + ", a\u00f1o=" + año + '}';
    }

  

}