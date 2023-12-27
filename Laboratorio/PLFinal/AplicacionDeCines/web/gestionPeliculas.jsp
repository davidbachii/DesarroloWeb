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
            <h2>Crear Peliculas</h2>
            Nombre <input type="text" name="nombre" required><br>
            Sinopsis <input type="text" name="sinopsis" required><br>
            Pagina Oficial <input type="text" name="paginaOficial" required><br>
            Titulo Original <input type="text" name="tituloOriginal"  required><br>
            Genero: <input type="text" name="genero"  required><br>
            Nacionalidad: <input type="text" type="nacionalidad"  required><br>
            Duracion <input type="number" name="duracion" required><br>
            Año <input type="number" name="año" required><br>
            Distribuidora <input type="text" name="distribuidora" required><br>
            Director <input type="text" name="director"  required><br>
            Actores <input type="text" name="actores"  required><br>
            Clasificacion por edad <input type="number" name="clasificacionEdad"  required><br>
            <button type="submit" id="Guardar">Guardar Pelicula</button>

        </form>
    </body>
</html>