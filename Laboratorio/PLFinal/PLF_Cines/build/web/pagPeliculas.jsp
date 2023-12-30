<%-- 
    Document   : pagPeliculas
    Created on : 28 dic 2023, 17:16:20
    Author     : victorsanavia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Pelicula" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina peliculas</title>
        <link rel="stylesheet" type="text/css" href="estilos\pagPeliculas.css">
    </head>
    <body>
        <h1>Lista de peliculas</h1>
        <%
        // Llamamos al metodo getAllPeliculas para iterar sobre todas las peliculas
        List<Pelicula> listaPeliculas = DatabaseManager.getInstance().getAllPeliculas();
        
        //Una vez que tenemos la lista con todas las películas, vamos a extraer los titulos que hay en ellas
        for(Pelicula pelicula : listaPeliculas){
        //Cogemos la pelicula que corresponde de la lista
        String titulo = pelicula.getTituloOriginal();
        
        //Una vez que ya tengamos el titulo cogido, lo mostramos en la pagina
        %>
            <div>
                <h2><%= titulo %></h2>
                <!-- Faltaria poner por aqui algo para las imagenes de cada pelicula -->
            </div>
        <%
            }
        %>
    </body>
</html>
