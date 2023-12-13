package com.example.servlet;

import com.example.model.Circuit;
import com.example.model.DatabaseManager;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CreateCircuitServlet")
public class CreateCircuitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        int laps = Integer.parseInt(request.getParameter("laps"));
        double lapLength = Double.parseDouble(request.getParameter("lapLength"));
        int curves = Integer.parseInt(request.getParameter("curves"));

        Circuit circuit = new Circuit(name, city, country, laps, lapLength, curves);

        try {
            // Guardar el circuito en la base de datos
            DatabaseManager.saveCircuit(circuit);
            response.sendRedirect("index.jsp"); // Redirigir a la página principal
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al crear el circuito.");
        }
    }
}
