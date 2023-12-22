/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example.servlets;


import com.example.model.DatabaseManager;
import com.example.model.Pelicula;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author david
 */
@WebServlet("/CrearPelicula")
public class CrearPelicula extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String sinopsis = request.getParameter("sinopsis");
        String paginaOficial = request.getParameter("paginaOficial");
        String tituloOriginal = request.getParameter("tituloOriginal");
        String genero = request.getParameter("genero");
        String nacionalidad = request.getParameter("nacionalidad");
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        int año = Integer.parseInt(request.getParameter("año"));
        String distribuidora = request.getParameter("distribuidora");
        String director = request.getParameter("director");
        String actores = request.getParameter("actores");
        int clasificacionEdad = Integer.parseInt(request.getParameter("clasificacionEdad"));
        
        System.out.println("Datos bien leidos");

        // Crear instancia de la clase Pelicula
        Pelicula pelicula = new Pelicula(nombre, sinopsis, paginaOficial, tituloOriginal, genero,
                nacionalidad, duracion, año, distribuidora, director, actores, clasificacionEdad);
        
        System.out.println(pelicula.toString());

        try {
            // Guardar la película en la base de datos
            DatabaseManager.getInstance().guardarPelicula(pelicula);
            response.sendRedirect("panel_admin.jsp"); // Redirigir al panel de administrador
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al crear la película.");
        }
    }
}