<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<html>
    <head>
        <title>Pago Exitoso</title>
    </head>
    <body>

        <h2>Pago Exitoso</h2>
        <p>Su número de Referencia es: <%= session.getAttribute("numRef") %></p>

        <h3>Entradas Reservadas:</h3>
        <%-- Mostrar información de cada entrada --%>
        <% String butacasJSON = (String) session.getAttribute("butacasSeleccionadas");

               // Eliminar corchetes y comillas para obtener pares clave-valor separados por comas
               String cleanString = butacasJSON.replaceAll("[\\[\\]\\{\\}\" ]", "");

               // Dividir la cadena en pares clave-valor
               String[] keyValuePairs = cleanString.split(",");

               // Crear una lista de mapas para almacenar las butacas seleccionadas
               List<Map<String, Integer>> butacasList = new ArrayList<>();

               // Iterar sobre los pares clave-valor y agregar a la lista de mapas
               for (int i = 0; i < keyValuePairs.length; i += 2) {
                   String[] filaKC = keyValuePairs[i].split(":");
                   String[] columnaKC = keyValuePairs[i + 1].split(":");
                   Map<String, Integer> butaca = Map.of("fila", Integer.parseInt(filaKC[1]), "columna", Integer.parseInt(columnaKC[1]));
                   butacasList.add(butaca);
               }
        %>
        <ul>
            <% for (Map<String, Integer> butaca : butacasList) { %>
            <li>Fila: <%= butaca.get("fila") %>, Columna: <%= butaca.get("columna") %></li>
                <% } %>
        </ul>

        <p>Día: <%= session.getAttribute("fecha") %></p>
        <p>Hora: <%= session.getAttribute("hora") %></p>
          
        
         <a href="index.jsp"><button type="button">Seguir Comprando</button></a>     
    </body>
</html>