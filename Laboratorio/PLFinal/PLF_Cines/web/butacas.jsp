<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>

<%
try {
    Sala salaSelec = (Sala) session.getAttribute("sala");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Selección de Butacas</title>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
        <link rel="stylesheet" href="estilos/butacas.css">
    </head>
    <body>
        <h2>Butacas para la Sala: <%= salaSelec.getNombreSala() %></h2>
        <form action="GestionButacas" method="post">
            <table style='border-collapse: collapse;'>
                <%
                    for (int i = 0; i < salaSelec.getFilas(); i++) {
                %>
                <tr>
                    <%
                        for (int j = 0; j < salaSelec.getColumnas(); j++) {
                    %>
                    <td>
                        <img class='butaca' src='butacas/butaca_libre.png' alt='Butaca <%= (i + 1) %>-<%= (j + 1) %>'
                             data-fila='<%= i + 1 %>' data-columna='<%= j + 1 %>'>
                    </td>
                    <%
                        }
                    %>
                </tr>
                <%
                }
                %>
            </table>

            <!-- Campo oculto para almacenar butacas seleccionadas -->
            <input type="hidden" name="butacasSeleccionadas" id="butacasSeleccionadas">

            <button type="submit" name="comprarButacas">Comprar</button>
        </form>
        <script>
            $(document).ready(function () {
                var butacasSeleccionadas = [];

                // Manejar el clic en una butaca
                $('.butaca').click(function () {
                    // Obtener la fila y columna de la butaca
                    var fila = $(this).data('fila');
                    var columna = $(this).data('columna');

                    // Verificar si la butaca está libre u ocupada
                    var ocupada = $(this).hasClass('ocupada');

                    if (!ocupada) {
                        // Si la butaca está libre, cambiar a ocupada
                        $(this).attr('src', 'butacas/butaca_ocupada.png');
                        $(this).addClass('ocupada');
                        // Agregar la butaca a la lista de seleccionadas
                        butacasSeleccionadas.push({fila: fila, columna: columna});
                    } else {
                        // Si la butaca está ocupada, cambiar a libre
                        $(this).attr('src', 'butacas/butaca_libre.png');
                        $(this).removeClass('ocupada');
                        // Eliminar la butaca de la lista de seleccionadas
                        butacasSeleccionadas = butacasSeleccionadas.filter(function (butaca) {
                            return butaca.fila !== fila || butaca.columna !== columna;
                        });
                    }

                    // Actualizar el campo oculto con las butacas seleccionadas
                    $('#butacasSeleccionadas').val(JSON.stringify(butacasSeleccionadas));
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
}
%>