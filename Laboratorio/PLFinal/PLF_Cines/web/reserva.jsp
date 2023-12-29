<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seleccionar Hora, Fecha y Sala</title>
</head>
<body>

<form action="SeleccionarAsientosServlet" method="post">
    <label for="pelicula">Pelicula:</label>
    <select name="pelicula">
        <%-- Agrega opciones de películas aquí --%>
        <option value="pelicula1">Película 1</option>
        <option value="pelicula2">Película 2</option>
        <option value="pelicula3">Película 3</option>
    </select><br>

    <label for="fecha">Fecha:</label>
    <input type="date" name="fecha" required><br>

    <label for="hora">Hora:</label>
    <input type="time" name="hora" required><br>

    <label for="sala">Sala:</label>
    <select name="sala">
        <%-- Agrega opciones de salas aquí --%>
        <option value="sala1">Sala 1</option>
        <option value="sala2">Sala 2</option>
        <option value="sala3">Sala 3</option>
    </select><br>

    <input type="submit" value="Seleccionar Asientos">
</form>

</body>
</html>