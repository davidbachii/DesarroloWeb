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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


/**
 *
 * @author david
 */
@WebServlet("/CrearUsuario")
public class CrearUsuario extends HttpServlet {
    @Override
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


            Usuario user = new Usuario(nombre, correo, contraseña, fecha);

            // Guardar el usuario en la base de datos
            DatabaseManager.getInstance().guardarUsuario(user);
            response.sendRedirect("index.jsp"); // Redirigir a la página principal
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al crear el usuario.");
        }
    }

}
