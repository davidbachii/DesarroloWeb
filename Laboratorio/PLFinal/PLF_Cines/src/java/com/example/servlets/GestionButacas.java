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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String salaSeleccionada = request.getParameter("escogerButaca");
        String salaElegida = null; // Declaración de la variable antes de usarla

        Sala salaSeleccionadaObj = null;

        List<Sala> salas;
        try {
            salas = DatabaseManager.getAllSalas();
            if (salaSeleccionada != null && !salaSeleccionada.isEmpty()) {
                for (Sala sala : salas) {
                    if (sala.getNombreSala().equals(salaSeleccionada)) {
                        salaSeleccionadaObj = sala;
                        salaElegida = sala.getNombreSala();
                        break;
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestionButacas.class.getName()).log(Level.SEVERE, null, ex);
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
