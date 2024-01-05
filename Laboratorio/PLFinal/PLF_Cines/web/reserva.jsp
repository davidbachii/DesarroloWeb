<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Pelicula" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>

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
            <select name="hora" id="hora" required></select><br>


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
            // Obtener la duración de la película y el tiempo entre pases desde el servidor
            var duracionPelicula = <%= peliculaSeleccionada.getDuracion() %>;
            var tiempoEntrePases = 15; // minutos

            // Establecer la hora de inicio y fin del cine
            var horaInicioCine = new Date();
            horaInicioCine.setHours(14, 0, 0, 0);

            var horaFinCine = new Date();
            horaFinCine.setHours(23, 59, 0, 0);

            // Calcular los horarios de los pases redondeando a las horas enteras
            var horarios = [];
            var sdf = new Intl.DateTimeFormat('en-US', {hour: 'numeric', minute: 'numeric', hour12: false});

            // Calcular el número de pases en el día
            var numPases = Math.floor((9 * 60 / duracionPelicula));
            for (var i = 0; i < numPases; i++) {
                // Formatear la hora
                var horaRedondeada = new Date(horaInicioCine);
                horaRedondeada.setMinutes(Math.round(horaRedondeada.getMinutes() / 15) * 15);

                // Verificar si la hora está dentro del horario del cine
                if (horaRedondeada >= horaInicioCine && horaRedondeada <= horaFinCine) {
                    horarios.push(sdf.format(horaRedondeada));
                }

                // Calcular el siguiente pase
                horaInicioCine.setMinutes(horaInicioCine.getMinutes() + duracionPelicula + tiempoEntrePases);
            }

            // Limpiar la lista de horarios
            var selectHora = document.getElementById("hora");
            selectHora.innerHTML = "";

            // Añadir opciones a la lista de horarios
            for (var i = 0; i < horarios.length; i++) {
                var option = document.createElement("option");
                option.value = horarios[i];
                option.textContent = horarios[i];

                // Agregar la opción a la lista de horarios
                selectHora.appendChild(option);
            }
            function validarFormulario() {
                // Validar la fecha
                var fechaInput = document.getElementById("fecha").value;
                var fechaSeleccionada = new Date(fechaInput);
                var fechaActual = new Date();

                if (fechaSeleccionada < fechaActual) {
                    alert("La fecha no puede ser menor que el día actual");
                    return false;
                }
                // El formulario es válido
                return true;
            }
        </script>
    </body>
</html>
