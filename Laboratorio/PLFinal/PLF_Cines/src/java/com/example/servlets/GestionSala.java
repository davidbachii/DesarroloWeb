/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example.servlets;

import com.example.model.DatabaseManager;
import com.example.model.Pelicula;
import com.example.model.Sala;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 *
 * @author david
 */
@WebServlet("/GestionSala")
public class GestionSala extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Obtén el parámetro de acción desde el formulario
        String accion = request.getParameter("accion");

        // Realiza diferentes acciones según el valor de 'accion'
        if ("crear".equals(accion)) {
            // Obtén los parámetros del formulario de registro
            String nombresala = request.getParameter("nombreSala");
            int filas = Integer.parseInt(request.getParameter("filas"));
            int columnas = Integer.parseInt(request.getParameter("columnas"));
            String nombrepelicula_pelicula = request.getParameter("peliculaSeleccionar");

            try {

                Sala sala = new Sala(nombresala, filas, columnas, nombresala);

                // Guardar el usuario en la base de datos
                DatabaseManager.getInstance().guardarSala(sala);
                response.sendRedirect("gestionSalas.jsp"); // Redirigir a la página principal
            } catch (SQLException e) {
                response.getWriter().println("Error al crear la sala en el servlet.");
            }

        } else if ("borrar".equals(accion)) {
            // Obten el nombre de la película a borrar desde la solicitud
            String nombreSalaABorrar = request.getParameter("salaBorrar");

            try {
                // Obtén la película por su nombre
                Sala sala = DatabaseManager.getInstance().getSalaPorNombre(nombreSalaABorrar);

                if (sala != null) {
                    // Borra la película de la base de datos
                    DatabaseManager.getInstance().borrarSala(sala);
                    response.sendRedirect("gestionPeliculas.jsp"); // Redirigir a la página principal
                    System.out.println("Pelicula borrada con exito");
                } else {
                    response.getWriter().println("No se encontró la película a borrar.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error al borrar la película.");
            }

        } else if ("modificar".equals(accion)) {
// Obtén el nombre de la película a modificar desde la solicitud
            String nombreSalaAModificar = request.getParameter("salaAModificar");

            try {
                // Obtén la película por su nombre
                Sala sala = DatabaseManager.getSalaPorNombre(nombreSalaAModificar);
                System.out.println(nombreSalaAModificar);

                if (sala != null) {
                    // Modifica la película con los nuevos valores
                    sala.setNombreSala(request.getParameter("nuevoNombreSala")); 
                    sala.setFilas(Integer.parseInt(request.getParameter("nuevoFilas")));
                    sala.setColumnas(Integer.parseInt(request.getParameter("nuevoColumnas")));
                    sala.setNombre_pelicula(request.getParameter("peliculaCambioSala"));
                    

                    // Guarda la película modificada en la base de datos
                    DatabaseManager.getInstance().modificarSala(nombreSalaAModificar, sala);

                    response.sendRedirect("gestionPeliculas.jsp");

                } else {
                    response.getWriter().println("No se encontró la película a modificar.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error al modificar la película.");
            }
        } else {
            response.getWriter().println("Acción no reconocida");
        }

    }

}
