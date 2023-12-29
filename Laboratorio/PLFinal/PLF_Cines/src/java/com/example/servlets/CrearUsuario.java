/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example.servlets;

import com.example.model.DatabaseManager;
import com.example.model.Fecha;
import com.example.model.Usuario;
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
@WebServlet("/CrearUsuario")
public class CrearUsuario extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        // Obtén los parámetros del formulario de registro
        String nombre = request.getParameter("Name");
        String apellidos = request.getParameter("Apellidos");
        String correo = request.getParameter("mail");
        String contraseña = request.getParameter("pswd");
        String fechaNacimiento = request.getParameter("Fecha-nacimiento");

        try {
            // Crea una instancia de la clase Fecha con la fecha de nacimiento
            Fecha fecha = new Fecha(fechaNacimiento);
<<<<<<< HEAD


            Usuario user = new Usuario(nombre,apellidos, correo, contraseña, fecha);
=======
            
            Usuario user = new Usuario(nombre, apellidos, contraseña, correo, fecha);
           
>>>>>>> parent of ef071dc (Merge branch 'realese_bachi' into release_alex2)

            // Guardar el usuario en la base de datos
            DatabaseManager.getInstance().guardarUsuario(user);
            response.sendRedirect("index.jsp"); // Redirigir a la página principal
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al crear el usuario.");
        }
    }
  
}
