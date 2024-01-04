<%-- 
    Document   : gestionInformes
    Created on : 4 ene 2024, 17:18:31
    Author     : victorsanavia
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.Pelicula" %>
<%@ page import="com.example.model.Entrada" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Informes</title>
    </head>
    <body>
        <header>
            <div class="navbar">
            <a href="gestionPeliculas.jsp">Gestión de Películas</a>
            <a href="gestionSalas.jsp">Gestión de Salas</a>
            <a href="gestionEntradas.jsp">Gestión de Entradas</a>
            <a href="gestionReservas.jsp">Gestión de Reservas</a>
            <a href="gestionInformes.jsp">Gestión de Informes</a>
        </div>
        </header>
        <form action="GestionInforme" method="post">
            <h2>Informe por Géneros</h2>
            <label>Selecciona un género:</label>
            <select name="generoElegido">
                <% List<String> listaGeneros = new ArrayList<>();
                    List<Pelicula> listaPeliculas = new ArrayList<>();
                    try {
                        //Tenemos la lista con todas las peliculas
                        listaPeliculas = DatabaseManager.getInstance().getAllPeliculas();

                        //Una vez que tengamos la lista, podemos recorrer los generos que hay en cada pelicula y añadirlo a la lista
                        for (Pelicula pelicula : listaPeliculas) {
                            if (!listaGeneros.contains(pelicula.getGenero())) {
                                listaGeneros.add(pelicula.getGenero());
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    for (String genero : listaGeneros) { %>
                <option value="<%= genero %>"><%= genero %></option>
                <% } %>
            </select><br>
            <!-- Campos que esta ocultos para saber que accion esta realizando el servlet y no crear un servlet exclusivo para cada accion de 
            boorar de insertar, modificar o mostrar contenido-->
            <input type="hidden" name="filtro" value="borrar">

            <button type="submit">Filtrar por género</button><br>

            <label>Resultados</label>
            <input type="text" id="resultadoFiltroGenero" name="resultadoFiltroGenero" value="${resultadoFiltroGenero}" ><br>

        </form>

        
    </body>
</html>
