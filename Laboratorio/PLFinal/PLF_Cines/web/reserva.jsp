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
            <select name="peliculaSeleccionada">
                <% List<Pelicula> peliculas = new ArrayList<>();
                    try {
                        peliculas = DatabaseManager.getAllPeliculas(); // Asume que tienes un método para obtener todas las películas
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    for (Pelicula pelicula : peliculas) { %>
                <option value="<%= pelicula.getNombre() %>"><%= pelicula.getNombre() %></option>
                <% } %>
            </select><br>

            <label for="fecha">Fecha:</label>
            <input type="date" name="fecha" required><br>

            <label for="hora">Hora:</label>
            <input type="time" name="hora" required><br>

            <label for="sala">Sala:</label>
            <select name="salaSeleccionada">
                <% List<Sala> salas = new ArrayList<>();
                    try {
                        salas = DatabaseManager.getAllSalas(); // Asume que tienes un método para obtener todas las películas
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    for (Sala sala : salas) { %>
                <option value="<%= sala.getNombreSala() %>"><%= sala.getNombreSala() %></option>
                <% } %>
            </select><br>

            <input type="submit" value="Seleccionar Asientos">
        </form>

    </body>
</html>