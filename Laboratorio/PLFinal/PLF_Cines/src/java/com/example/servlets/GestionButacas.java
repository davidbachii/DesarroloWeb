package com.example.servlets;

import com.example.model.DatabaseManager;
import com.example.model.Sala;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alejandro
 */
@WebServlet("/GestionButacas")
public class GestionButacas extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String salaSeleccionada = request.getParameter("escogerButacas");
        System.out.println(salaSeleccionada);
        try {
            // Obtén la información de la sala seleccionada
            Sala sala = DatabaseManager.getInstance().getSalaPorNombre(salaSeleccionada);
            
            if (sala != null) {
                // Guarda la información de la sala en el atributo "sala" para usarla en el JSP
                request.setAttribute("sala", sala);
                // Redirige a tu JSP que mostrará las butacas
                request.getRequestDispatcher("mostrarButacas.jsp").forward(request, response);
                System.out.println("entrando para mostrar sala");
            } else {
                response.getWriter().println("No se encontró la sala seleccionada.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al obtener la información de la sala.");
        }
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
