package com.example.servlets;

import com.example.model.DatabaseManager;
import com.example.model.Sala;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Alejandro
 */
@WebServlet("/GestionButacas")
public class GestionButacas extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Obtener la cadena JSON de la solicitud
        String butacasSeleccionadasJSON = request.getParameter("butacasSeleccionadas");
        String cleanString = butacasSeleccionadasJSON.replaceAll("[\\[\\]\\{\\}\" ]", "");
        
        System.out.println(cleanString);
        // Dividir la cadena en pares clave-valor
        String[] keyValuePairs = cleanString.split(",");

        // Iterar sobre los pares clave-valor
        for (String pair : keyValuePairs) {
            // Dividir cada par en clave y valor
            String[] entry = pair.split(":");

            // Obtener la clave y el valor
            String key = entry[0];
            int value = Integer.parseInt(entry[1]);

            // Imprimir la clave y el valor
            System.out.println(key + ": " + value);
        }

    }
}
