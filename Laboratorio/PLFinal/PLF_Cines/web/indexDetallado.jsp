<%-- 
    Document   : indexDetallado
    Created on : 29 dic 2023, 20:21:19
    Author     : david
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.example.model.Entrada" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.Pelicula" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="com.example.model.Usuario" %>
<%@ page import="java.util.ArrayList" %>




<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Resto del código... -->
    </head>
    <body>
        <!-- Encabezado y otros elementos... -->

        <main>
            <%  String nombrePelicula = request.getParameter("id");
            Pelicula pelicula = DatabaseManager.getInstance().getPeliculaPorNombre(nombrePelicula);

            %>


            <% if (pelicula != null) { %>
            <h2><%= pelicula.getTituloOriginal() %></h2>
            <img src="<%= pelicula.getUrl_image() %>" alt="<%= pelicula.getTituloOriginal() %>">
            <p><%= pelicula.getSinopsis() %></p>
            <p><%= pelicula.getNombre() %></p>
            <p><%= pelicula.getClasificacionEdad() %></p>

            <% if (session.getAttribute("usuario") != null) { %>
            <%
                // Obtener el usuario de la sesión
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                String correoUsuario = (usuario != null) ? usuario.getCorreo() : "";
            %>

            <!-- Sección para hacer comentario -->
            <form action="GestionComentarios" method="post">
                <!-- Otros campos del formulario -->

                <label for="textoComentario">Comentario:</label>
                <textarea id="textoComentario" name="textoComentario" required></textarea>

                <label for="valoracionComentario">Valoración:</label>
                <input type="number" id="valoracionComentario" name="valoracionComentario" required>

                <label for="fecha">Fecha del comentario</label>
                <input type="date" id="fecha" name="fecha" required><br><br>

                <input type="hidden" name="accion" value="escribirComentario">
                <input type="hidden" name="emailDelUsuario" value="<%= correoUsuario %>">
                <input type="hidden" name="nombrePelicula" value="<%= nombrePelicula %>">

                <button type="submit">Enviar Comentario</button>
            </form>
            <% } %>
            <% } else { %>
            <p>No se encontró la película.</p>
            <% } %>
        </main>

        <!-- Pie de página... -->
    </body>
</html>
