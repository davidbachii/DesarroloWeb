<%-- 
    Document   : indexDetallado
    Created on : 29 dic 2023, 19:13:15
    Author     : victorsanavia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.example.model.Entrada" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.Pelicula" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle de Película</title>
    <!-- Aquí puedes enlazar tu archivo CSS -->
    <link rel="stylesheet" href="estilos/index.css">
</head>
<body>
    <header>
        <div class="app-info">
            <h1>CinesWeb</h1>
        </div>
    </header>
    <main>
        <%
        // Obtén el ID de la película de la URL
        String id = request.getParameter("id");

        // Busca la película en la base de datos
        Pelicula pelicula = DatabaseManager.getInstance().getPeliculaPorNombre(id);

        // Muestra los detalles de la película
        if (pelicula != null) {
            String titulo = pelicula.getTituloOriginal();
            String urlImagen = pelicula.getUrl_image();
            String sinopsis = pelicula.getSinopsis();
            String nombre = pelicula.getNombre();
            int rangoEdad = pelicula.getClasificacionEdad();
        %>
            <h2><%= titulo %></h2>
            <img src="<%= urlImagen %>" alt="<%= titulo %>">
            <p><%= sinopsis %></p>
            <p><%= nombre %></p>
            <p><%= rangoEdad %></p>
        <%
        } else {
        %>
            <p>No se encontró la película.</p>
        <%
        }
        %>
    </main>
    <footer>
        <!-- Aquí puedes agregar información de contacto y derechos de autor -->
    </footer>
</body>
</html>
