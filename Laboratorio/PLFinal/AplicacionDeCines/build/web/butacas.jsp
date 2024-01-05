<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sala de Cine</title>
    <style>
        .butaca {
            width: 30px;
            height: 30px;
            margin: 5px;
            display: inline-block;
            border: 1px solid #ccc;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Selecciona una butaca:</h2>
    
    <form action="reservar" method="post">
        <%
            int filas = (int) request.getAttribute("filas");
            int columnas = (int) request.getAttribute("columnas");
            
            for (int i = 1; i <= filas; i++) {
                for (int j = 1; j <= columnas; j++) {
                    String asientoId = "Fila" + i + "-Columna" + j;
        %>
                    <div class="butaca" onclick="seleccionarButaca('<%= asientoId %>')">
                        <%= asientoId %>
                    </div>
        <%
                }
        %>
                <br>
        <%
            }
        %>

        <input type="hidden" id="asientoSeleccionado" name="asientoSeleccionado" value="" />
        <br>
        <input type="submit" value="Reservar" />
    </form>

    <script>
        function seleccionarButaca(asientoId) {
            var inputAsiento = document.getElementById("asientoSeleccionado");
            inputAsiento.value = asientoId;

            // Puedes agregar estilos para resaltar la butaca seleccionada si lo deseas
            // Por ejemplo, cambiar el fondo de la butaca
            document.querySelectorAll('.butaca').forEach(function(element) {
                element.style.backgroundColor = 'white';
            });
            document.getElementById(asientoId).style.backgroundColor = 'lightblue';
        }
    </script>
</body>
</html>