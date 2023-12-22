<%-- 
    Document   : crearPelicula
    Created on : 22 dic 2023, 11:30:13
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Crear Película</title>
        <link rel="stylesheet" href="./Estilos/DiseñopPanelAdmin.css">
    </head>
    <body>


        <form action="CrearPelicula" method="post">

            <h1>Crear Nueva Película</h1>
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br>

            <label for="sinopsis">Sinopsis:</label>
            <textarea id="sinopsis" name="sinopsis" required></textarea><br>

            <label for="paginaOficial">Página Oficial:</label>
            <input type="text" id="paginaOficial" name="paginaOficial"><br>

            <label for="tituloOriginal">Título Original:</label>
            <input type="text" id="tituloOriginal" name="tituloOriginal"><br>

            <label for="genero">Género:</label>
            <input type="text" id="genero" name="genero"><br>

            <label for="nacionalidad">Nacionalidad:</label>
            <input type="text" id="nacionalidad" name="nacionalidad"><br>

            <label for="duracion">Duración (minutos):</label>
            <input type="number" id="duracion" name="duracion" required><br>

            <label for="año">Año:</label>
            <input type="number" id="año" name="año" required><br>

            <label for="distribuidora">Distribuidora:</label>
            <input type="text" id="distribuidora" name="distribuidora"><br>

            <label for="director">Director:</label>
            <input type="text" id="director" name="director"><br>

            <label for="actores">Actores (separados por comas):</label>
            <input type="text" id="actores" name="actores" required><br>

            <label for="edad">Clasificacion por edad</label>
            <input type="number" id="edad" name="edad" required><br>

            <button type="submit" id="Guardar">Guardar</button>

        </form>

    </body>
</html>