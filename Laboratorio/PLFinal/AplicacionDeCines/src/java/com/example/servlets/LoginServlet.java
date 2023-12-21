/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.example.servlets;

import com.example.model.DatabaseManager;
import com.example.model.Usuario;
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
@WebServlet("/AccederUsuario")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("mail-2");
        String contrasena = request.getParameter("pswd-2");

        try {
            // Obtener el usuario por correo
            Usuario usuario = DatabaseManager.getUsuarioPorCorreo(correo);
            System.out.println(usuario.getContraseña());

            if (usuario != null && usuario.getContraseña().equals(contrasena)) {
                // Usuario autenticado correctamente

                // Aquí puedes redirigir a una página de bienvenida o realizar otras acciones
                response.getWriter().println("Acceso autorizado. ¡Bienvenido, " + usuario.getNombre() + "!");
            } else {
                // Usuario no encontrado o contraseña incorrecta
                response.getWriter().println("Correo o contraseña incorrectos.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al acceder.");
        }
    }
}