<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Pelicula" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seleccionar Hora, Fecha y Sala</title>
    <link rel="stylesheet" href="./estilos/index.css">
</head>
<body>
    <header>
        <div class="app-info">
            <h1>CinesWeb</h1>
        </div>
    </header>
    <form action="Reservas" method="post" onsubmit="return validarFormulario()">
        <label for="pelicula">Pelicula:</label>

        <% 
            Pelicula peliculaSeleccionada = (Pelicula) session.getAttribute("pelicula");
        %>
        <input type="text" name="pelicula" value="<%= peliculaSeleccionada.getNombre() %>" readonly>
        <br>

        <label for="fecha">Fecha:</label>
        <input type ="date" name="fecha" id="fecha" required><br>

        <label for="hora">Hora:</label>
        <input type="time" name="hora" id="hora" required><br>

        <label for="sala">Sala:</label>
        <select name="salaSeleccionada" id="salaSeleccionada">
            <% List<Sala> salas = new ArrayList<>();
                try {
                    salas = DatabaseManager.getAllSalas(); // Obtener todas las salas
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <option value="" disabled selected>Selecciona una sala</option>
            <% 
                for (Sala sala : salas) { 
                    if (sala.getNombre_pelicula().equals(peliculaSeleccionada.getNombre())) {
            %>
            <option value="<%= sala.getNombreSala() %>"><%= sala.getNombreSala()%></option>
            <% 
                    }
                } 
            %>
        </select><br>

        <input type="submit" value="Seleccionar Asientos">
    </form>

    <script>
        function validarFormulario() {
            // Validar la fecha
            var fechaInput = document.getElementById("fecha").value;
            var fechaSeleccionada = new Date(fechaInput);
            var fechaActual = new Date();

            if (fechaSeleccionada < fechaActual) {
                alert("La fecha no puede ser menor que el día actual");
                return false;
            }

            // Validar la hora
            var horaInput = document.getElementById("hora").value;
            var horaSeleccionada = new Date("1970-01-01T" + horaInput);

            // Establecer el rango de horas permitido (14:00 hasta las 00:00)
            var horaMinima = new Date("1970-01-01T14:00:00");
            var horaMaxima = new Date("1970-01-02T00:00:00");

            if (horaSeleccionada < horaMinima || horaSeleccionada > horaMaxima) {
                alert("La hora debe ser en el horario de apertura del cine: 14:00 - 00:00 ");
                return false;
            }

            // El formulario es válido
            return true;
        }
    </script>

</body>
</html>
