/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example.servlets;

import com.example.model.DatabaseManager;
import com.example.model.Pelicula;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/CrearPelicula")
public class CrearPelicula extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Obtén los parámetros del formulario de registro
        String nombre = request.getParameter("nombre");
        String sinopsis = request.getParameter("sinopsis");
        String pagina_oficial = request.getParameter("paginaOficial");
        String titulo_original = request.getParameter("tituloOriginal");

        String genero = request.getParameter("genero");
        String nacionalidad = request.getParameter("nacionalidad");
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        String año = request.getParameter("año");
       
        

        try {

            Pelicula pelicula = new Pelicula(nombre, sinopsis, pagina_oficial, titulo_original, genero, nacionalidad, duracion, año);

            // Guardar el usuario en la base de datos
            DatabaseManager.guardarPelicula(pelicula);
            response.sendRedirect("gestionPeliculas.jsp"); // Redirigir a la página principal
        } catch (SQLException e) {
            response.getWriter().println("Error al crear la pelicula en el servlet.");
        }
    }

}
