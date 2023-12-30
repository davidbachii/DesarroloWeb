package com.example.servlets;

import com.example.model.DatabaseManager;
import com.example.model.Entrada;
import com.example.model.Fecha;
import com.example.model.Sala;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alejandro
 */
@WebServlet("/GestionButacas")
public class GestionButacas extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Sala sala = (Sala) session.getAttribute("sala");
        // Obtener la cadena JSON de la solicitud
        String butacasSeleccionadasJSON = request.getParameter("butacasSeleccionadas");

        // Eliminar corchetes y comillas para obtener pares clave-valor separados por comas
        String cleanString = butacasSeleccionadasJSON.replaceAll("[\\[\\]\\{\\}\" ]", "");
        
        System.out.println(cleanString);

        // Dividir la cadena en pares clave-valor
        String[] keyValuePairs = cleanString.split(",");
        
        // Obtener información adicional de la sesión
        String idEntrada = "";

        String fechaStr = (String) session.getAttribute("fecha");
        Fecha fecha = new Fecha(fechaStr);

        String horaStr = (String) session.getAttribute("hora");
        LocalTime hora = LocalTime.parse(horaStr);

        int fila = 0;
        int columna = 0;

        String nombreSala = sala.getNombreSala();


        for (int i = 0; i < keyValuePairs.length; i += 2) {
            // Obtener la fila y columna
            int numeroAleatorio = new Random().nextInt(90000000) + 100000000;  
            //Extraemos la fila
            String[] filaKC = keyValuePairs[i].split(":");
            fila = Integer.parseInt(filaKC[1]);
            //Extraemos la columna
            String[] columnaKC = keyValuePairs[i+1].split(":");
            columna = Integer.parseInt(columnaKC[1]);
            
            idEntrada = "E" + Integer.toString(numeroAleatorio);// Crear una nueva entrada
            Entrada entrada = new Entrada(idEntrada, fecha, hora, fila, columna, nombreSala);

            try {
                // Guardar la entrada en la base de datos
                DatabaseManager.getInstance().guardarEntrada(entrada);
            } catch (SQLException ex) {
                Logger.getLogger(GestionButacas.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
