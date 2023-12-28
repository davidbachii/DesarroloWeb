<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>

<%
    DatabaseManager databaseManager = DatabaseManager.getInstance();
    
    try {
        // Obtén la lista de salas
        List<Sala> salas = DatabaseManager.getAllSalas();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Selección de Butacas</title>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'><link rel="stylesheet" href="estilos/butacas.css"></head>
    <body>

        <h2>Butacas:</h2>
        <form action="GestionButacas" method="post">
            <select name="escogerButacas">
                <% for (Sala sala : salas) { %>
                <option value="<%= sala.getNombreSala() %>" <%= (sala.getNombreSala().equals(salaSeleccionada)) ? "selected" : "" %>><%= sala.getNombreSala() %></option>
                <% } %>
            </select>
            <button type="submit">Mostrar Butacas</button>
        </form>
        <br>

        <% if (salaSeleccionadaObj != null) { %>
        <h3>Butacas para la Sala: <%= salaElegida %></h3>
        <table style='border-collapse: collapse;'>
            <% 
                for (int i = 0; i < salaSeleccionadaObj.getFilas(); i++) {
            %>
            <tr>
                <% 
                    for (int j = 0; j < salaSeleccionadaObj.getColumnas(); j++) {
                %>
                <td>
                    <img class='butaca' src='butacas/butaca_libre.png' alt='Butaca <%= (i + 1) %>-<%= (j + 1) %>' data-fila='<%= i %>' data-columna='<%= j %>'>
                </td>
                <%
                    }
                %>
            </tr>
            <%
                }
            %>
        </table>
        <% } %>
        <!-- Botón de compra -->
        <button id="botonCompra">Comprar</button>

        <script>
            $(document).ready(function () {
                // Manejar el clic en una butaca
                $('.butaca').click(function () {
                    // Obtener la ruta actual de la imagen
                    var currentSrc = $(this).attr('src');

                    // Cambiar la imagen entre libre y ocupada
                    if (currentSrc.includes('butacas/butaca_libre.png')) {
                        // Si la butaca está libre, cambiar a ocupada
                        $(this).attr('src', 'butacas/butaca_ocupada.png');
                        // También puedes agregar una clase para estilos adicionales
                        $(this).addClass('ocupada');
                    } else {
                        // Si la butaca está ocupada, cambiar a libre
                        $(this).attr('src', 'butacas/butaca_libre.png');
                        // También puedes quitar la clase 'ocupada' si la habías agregado anteriormente
                        $(this).removeClass('ocupada');
                    }
                });

                // Función para el botón de compra
                $('#botonCompra').click(function () {
                    // Implementa tu lógica de compra aquí
                    // Puedes obtener información sobre las butacas seleccionadas
                    var butacasSeleccionadas = $('.butaca.ocupada');
                    // Puedes enviar esta información al servidor o realizar otras acciones según tu necesidad
                    alert("Compra realizada para las butacas seleccionadas: " + butacasSeleccionadas.length);
                });
            });
        </script>
    </body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        DatabaseManager.cerrarConexion();
    }
%>