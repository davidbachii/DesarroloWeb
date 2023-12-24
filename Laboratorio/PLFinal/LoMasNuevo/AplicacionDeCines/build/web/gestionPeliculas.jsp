<%-- 
    Document   : gestionPeliculas
    Created on : 22 dic 2023, 20:00:27
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de peliculas</title>
        <link rel="stylesheet" href="./Estilos/DiseñopPanelAdmin.css">
        <script>
            function validarAño() {
                var año = document.getElementById("año").value;
                var mensajeError = document.getElementById("mensajeErrorAño");

                if (año < 1980 || año > 2024) {
                    mensajeError.innerHTML = "Por favor, introduce un año entre 1980 y 2024.";
                    mensajeError.style.color = "red";
                    return false;
                } else {
                    mensajeError.innerHTML = "";
                    return true;
                }
            }
        </script>
    </head>
    <body>
        <form action="CrearPelicula" method="post"  onsubmit="return validarAño();">
            <h2>Crear Película</h2>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br>

            <label for="sinopsis">Sinopsis:</label>
            <textarea id="sinopsis" name="sinopsis" required></textarea><br>

            <label for="paginaOficial">Página Oficial:</label>
            <input type="text" id="paginaOficial" name="paginaOficial" required><br>

            <label for="tituloOriginal">Título Original:</label>
            <input type="text" id="tituloOriginal" name="tituloOriginal" required><br>

            <label for="genero">Género:</label>
            <input type="text" id="genero" name="genero" required><br>

            <label for="nacionalidad">Nacionalidad:</label>
            <input type="text" id="nacionalidad" name="nacionalidad" required><br>

            <label for="duracion">Duración (minutos):</label>
            <input type="number" id="duracion" name="duracion" required><br>

            <label for="año">Año:</label>
            <input type="text" id="año" name="año" required><br>
            <span id="mensajeErrorAño"></span><br>


            <!-- Agrega aquí los demás campos según sea necesario -->

            <button type="submit">Guardar Película</button>
        </form>
    </body>
</html>
