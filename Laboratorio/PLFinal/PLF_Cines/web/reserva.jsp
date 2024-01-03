<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Pelicula" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Seleccionar Hora, Fecha y Sala</title>
    </head>
    <body>

        <form action="Reservas" method="post">
            <label for="pelicula">Pelicula:</label>

            <% 
                Pelicula peliculaSeleccionada = (Pelicula) session.getAttribute("pelicula");
            %>
            <input type="text" name="pelicula" value="<%= peliculaSeleccionada.getNombre() %>" readonly>
            <br>

            <label for="fecha">Fecha:</label>
            <input type ="date" name="fecha" required><br>
            <label for="hora">Hora:</label>
            <input type="time" name="hora" required><br>

            <label for="sala">Sala:</label>
            <select name="salaSeleccionada" id="salaSeleccionada">
                <% List<Sala> salas = new ArrayList<>();
                    try {
                        salas = DatabaseManager.getAllSalas(); // Obtener todas las salas
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <option value="" disabled selected>Selecciona una sala</option>
                <% 
                    for (Sala sala : salas) { 
                        System.out.println(sala.getNombre_pelicula());

                        if (sala.getNombre_pelicula().equals(peliculaSeleccionada.getNombre())) {
                            System.out.println(sala.getNombre_pelicula());
                            System.out.println(peliculaSeleccionada.getNombre());

                %>
                <option value="<%= sala.getNombreSala() %>"><%= sala.getNombreSala()%></option>
                <% 
                        }
                    } 
                %>
            </select><br>

            <input type="submit" value="Seleccionar Asientos">
        </form>

        <script>
            function filtrarSalas() {
                // No es necesario realizar ninguna modificación en el script.
            }
        </script>

    </body>
</html>
