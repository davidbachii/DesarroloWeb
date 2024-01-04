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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author victorsanavia
 */
@WebServlet(name = "GestionInformes")
public class GestionInforme extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filtro = request.getParameter("filtro");

        switch(filtro){
            case "genero":
                //Comprobamos que se quiere filtrar por genero

                //Comprobamos el genero que se ha elegido en el formulario
                String genero = request.getParameter("generoElegido");

                //Una vez que tenemos el genero elegido, vamos a ver las peliculas que tienen el genero que buscamos
                //List<Pelicula> peliculas = DatabaseManager.getPeliculasPorGenero(genero);
                
                
                break;
        }
        
    }
    

}
