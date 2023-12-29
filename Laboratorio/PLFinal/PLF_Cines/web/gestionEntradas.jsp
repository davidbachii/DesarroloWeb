<%-- 
    Document   : gestionEntradas
    Created on : 29 dic 2023, 11:47:42
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.example.model.Entrada" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de entradas</title>
        <link rel="stylesheet" type="text/css" href="./estilos/panelAdmin.css">
        <!-- Agrega tus estilos y scripts si es necesario -->
    </head>
    <body>
        <form action="GestionEntrada" method="post">
            <h2>Crear Entrada</h2>

            <label for="idEntrada">ID de Entrada</label>
            <input type="text" id="idEntrada" name="idEntrada" required><br>

            <label for="fecha">Fecha</label>
            <input type="date" id="fecha" name="fecha" required><br><br>

            <label for="hora">Hora</label>
            <input type="time" id="hora" name="hora" required><br><br>

            <label for="fila">Fila</label>
            <input type="number" id="fila" name="fila" required><br>

            <label for="columna">Columna</label>
            <input type="number" id="columna" name="columna" required><br>
            
             <label for="nombreSala">Selecciona uan sala</label>
            <select name="nombreSala">
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

            <!-- Campos que están ocultos para saber qué acción está realizando el servlet -->
            <input type="hidden" name="accion" value="crear">

            <button type="submit">Guardar Entrada</button>
        </form>

        <form action="GestionEntrada" method="post">
            <h2>Borrar Entrada</h2>
            <label>Selecciona una entrada para borrar:</label>
            <select name="entradaABorrar">
                <% List<Entrada> entradas = new ArrayList<>();
                    try {
                        entradas = DatabaseManager.getAllEntradas();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    for (Entrada entrada : entradas) { %>
                <option value="<%= entrada.getIdEntrada() %>"><%= entrada.getIdEntrada() %></option>
                <% } %>
            </select><br>

            <!-- Campos que están ocultos para saber qué acción está realizando el servlet -->
            <input type="hidden" name="accion" value="borrar">

            <button type="submit">Borrar Entrada</button>
        </form>

        <form action="GestionEntrada" method="post">
            <h2>Modificar Entrada</h2>
            <label>Selecciona una entrada para modificar:</label>
            <select name="entradaAModificar">
                <% List<Entrada> entradas2 = new ArrayList<>();
                    try {
                        entradas2 = DatabaseManager.getAllEntradas();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    for (Entrada entrada2 : entradas2) { %>
                <option value="<%= entrada2.getIdEntrada() %>"><%= entrada2.getIdEntrada() %></option>
                <% } %>
            </select><br>

            <label>Nuevo ID de Entrada:</label>
            <input type="text" name="nuevoIdEntrada" required><br>

            <label>Nueva Fecha:</label>
            <input type="date" name="nuevaFecha" required><br><br>

            <label>Nueva Hora:</label>
            <input type="time" name="nuevaHora" required><br><br>

            <label>Nueva Fila:</label>
            <input type="number" name="nuevaFila" required><br>

            <label>Nueva Columna:</label>
            <input type="number" name="nuevaColumna" required><br>

            <label>Nuevo Nombre de Sala:</label>
            <select name="nuevaNombreSala">
                <% List<Sala> salas2 = new ArrayList<>();
                    try {
                        salas2 = DatabaseManager.getAllSalas(); // Asume que tienes un método para obtener todas las películas
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    for (Sala sala2 : salas2) { %>
                <option value="<%= sala2.getNombreSala() %>"><%= sala2.getNombreSala() %></option>
                <% } %>
            </select><br>

            <!-- Campos que están ocultos para saber qué acción está realizando el servlet -->
            <input type="hidden" name="accion" value="modificar">

            <button type="submit">Modificar Entrada</button>
        </form>
    </body>
</html>
