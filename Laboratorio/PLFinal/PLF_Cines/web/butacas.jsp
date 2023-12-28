<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="tu_paquete.SalaCine" %>

<%
    // Crear una instancia de SalaCine con 5 filas y 5 columnas
    SalaCine sala = new SalaCine(5, 5);
    // Guardar la instancia en el ámbito de la sesión para mantener el estado
    session.setAttribute("sala", sala);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seleccionar Butacas</title>
    <!-- Agregar aquí enlaces a jQuery u otras bibliotecas si es necesario -->
</head>
<body>

<h2>Butacas:</h2>

<%
    // Obtener la instancia de SalaCine del ámbito de la sesión
    SalaCine sala = (SalaCine) session.getAttribute("sala");

    // Mostrar las butacas en la tabla
    out.println("<table border='1'>");
    for (int i = 0; i < 5; i++) {
        out.println("<tr>");
        for (int j = 0; j < 5; j++) {
            String estado = sala.getEstadoButaca(i, j);
            String imagen = (estado.equals("libre")) ? "path/to/butaca_libre.png" : "path/to/butaca_ocupada.png";
            out.println("<td><img class='butaca' src='" + imagen + "' alt='Butaca " + (i + 1) + "-" + (j + 1) + "' data-fila='" + i + "' data-columna='" + j + "'></td>");
        }
        out.println("</tr>");
    }
    out.println("</table>");
%>

<!-- Botón de compra -->
<button id="botonCompra">Comprar</button>

<script>
    // jQuery function
    $(document).ready(function() {
        $('.butaca').click(function() {
            // Toggle entre los estados de libre y ocupado
            $(this).attr('src', function(_, attr) {
                return (attr.includes('butaca_libre.png')) ? 'butaca_ocupada.png' : 'butaca_libre.png';
            });
        });

        // Función para el botón de compra
        $('#botonCompra').click(function() {
            // Implementa tu lógica de compra aquí
            alert("Compra realizada");
        });
    });
</script>
</body>
</html>