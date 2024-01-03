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
        <meta charset="UTF-8">

        <title>Cine</title>
        <!-- Aquí puedes enlazar tu archivo CSS -->
        <link rel="stylesheet" href="./estilos/indexDetallado.css">
    </head>
    <body>
        <!-- Encabezado y otros elementos... -->

        <main>
            <%  String nombrePelicula = request.getParameter("id");
            Pelicula pelicula = DatabaseManager.getInstance().getPeliculaPorNombre(nombrePelicula);

            %>


            <% if (pelicula != null) { %>
            <div class="pelicula">
                <div class="arriba">
                    <div class="imagen-titulo">
                        <h2><%= pelicula.getTituloOriginal() %></h2>
                        <img src="<%= pelicula.getUrl_image() %>" alt="<%= pelicula.getTituloOriginal() %>">
                    </div>
                    <div class="datos">

                        <div><strong>Nombre:</strong> <br> <span><%= pelicula.getNombre() %></span></div>
                        <div><strong>Género:</strong> <br> <span><%= pelicula.getGenero() %></span></div>
                        <div><strong>Nacionalidad:</strong> <br> <span><%= pelicula.getNacionalidad() %></span></div>
                        <div><strong>Duración:</strong> <br> <span><%= pelicula.getDuracion() %> minutos</span></div>
                        <div><strong>Año:</strong> <br> <span><%= pelicula.getAño() %></span></div>
                        <div><strong>Distribuidora:</strong> <br> <span><%= pelicula.getDistribuidora() %></span></div>
                        <div><strong>Director:</strong> <br> <span><%= pelicula.getDirector() %></span></div>
                        <div><strong>Clasificación de edad:</strong> <br> <span><%= pelicula.getClasificacionEdad() %></span></div>
                        <div><strong>Otros datos:</strong> <br> <span><%= pelicula.getOtrosDatos() %></span></div>
                        <div><strong>Actores:</strong> <br> <span><%= pelicula.getActores() %></span></div>
                        <!-- Resto de los datos... -->
                    </div>
                </div>
                <div class="abajo">
                    <div class="sinopsis">
                        <strong>Sinopsis:</strong> <br> <span><%= pelicula.getSinopsis() %></span>
                    </div>

                    <% if (session.getAttribute("usuario") != null) { %>
                    <%
                        // Obtener el usuario de la sesión
                        Usuario usuario = (Usuario) session.getAttribute("usuario");
                        String correoUsuario = (usuario != null) ? usuario.getCorreo() : "";
                    %>
                    <div class="comentarios">
                        <!-- Sección para hacer comentario -->
                        <form action="GestionComentarios" method="post">
                            <!-- Otros campos del formulario -->

                            <label for="textoComentario">Comentario:</label>
                            <textarea id="textoComentario" name="textoComentario" required></textarea>

                            <label for="valoracionComentario">Valoración:</label>
                            <input type="number" id="valoracionComentario" name="valoracionComentario" required>

                            <label for="fecha">Fecha del comentario</label>
                            <input type="date" id="fecha" name="fecha" required><br>

                            <input type="hidden" name="accion" value="escribirComentario">
                            <input type="hidden" name="emailDelUsuario" value="<%= correoUsuario %>">
                            <input type="hidden" name="nombrePelicula" value="<%= nombrePelicula %>">

                            <button type="submit">Enviar Comentario</button>
                        </form>
                    </div>
                    <% session.setAttribute("pelicula", pelicula); %>

                    <button onclick="location.href='reserva.jsp'">Reservar</button>                    
                    <% } %>
                </div>
            </div>
            <!-- Resto del código... -->
            <% } else { %>
            <p>No se encontró la película.</p>
            <% } %>
        </main>

        <!-- Pie de página... -->
    </body>
</html>
