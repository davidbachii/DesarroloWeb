<%-- 
    Document   : index.jsp
    Created on : 29 dic 2023, 13:54:32
    Author     : david
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
    <title>Cine</title>
    <!-- Aquí puedes enlazar tu archivo CSS -->
    <link rel="stylesheet" href="./estilos/index.css">
</head>
<body>
    <header>
        <div class="app-info">
            <h1>CinesWeb</h1>
        </div>
        <nav>
            <div class="user-profile">
                <a href="login.jsp">Registrarse</a>
            </div>
        </nav>
    </header>
    <main>
        <h2>Cartelera</h2>
        <%
        // Llamamos al metodo getAllPeliculas para iterar sobre todas las peliculas
        List<Pelicula> listaPeliculas = DatabaseManager.getInstance().getAllPeliculas();
        
        //Una vez que tenemos la lista con todas las películas, vamos a extraer los titulos que hay en ellas
        for(Pelicula pelicula : listaPeliculas){
        //Cogemos la pelicula que corresponde de la lista
        String titulo = pelicula.getNombre();
        String urlImagen = pelicula.getUrl_image();
        
        //Una vez que ya tengamos el titulo cogido, lo mostramos en la pagina
        %>
        <div class="pelicula">
            
            <h3><a href="indexDetallado.jsp?id=<%= pelicula.getNombre() %>"><%= titulo %></a></h3>
            <img src="<%= urlImagen %>" alt="<%= titulo %>">
            <!-- Puedes agregar más detalles de la película si es necesario -->
        </div>
        <%
            }
        %>
    </main>
    <footer>
        <!-- Aquí puedes agregar información de contacto y derechos de autor -->
    </footer>
</body>
</html>