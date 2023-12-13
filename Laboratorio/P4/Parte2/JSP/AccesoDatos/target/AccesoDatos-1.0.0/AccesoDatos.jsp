
<html>
<head>
<title>Tutorial JSP, Base de Datos</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%!
// Declaraciones de las variables utilizadas para la conexión a la base de datos y para la //recuperación de datos de las tablas
Connection c;
Statement s;
ResultSet rs;
ResultSetMetaData rsmd;
%>
<%
// Inicialización de las variables necesarias para la conexión a la base de datos y realización de //consultas
c = DriverManager.getConnection("jdbc:derby://localhost:1527/sample/", "app", "app");
s = c.createStatement();
rs = s.executeQuery("SELECT * FROM LIBROS");
rsmd = rs.getMetaData();
%>
13 de 15
<table width="100%" border="1">
<tr>
<% for( int i=1; i <= rsmd.getColumnCount(); i++ ) { %>
<%-- Obtenemos los nombres de las columnas y los colocamos
como cabecera de la tabla --%>
<th><%= rsmd.getColumnLabel( i ) %></th>
<% } %>
</tr>
<% while( rs.next() ) { %>
<tr>
<% for( int i=1; i <= rsmd.getColumnCount(); i++ ) { %>
<%-- Recuperamos los valores de las columnas que
corresponden a cada uno de los registros de la
tabla. Hay que recoger correctamente el tipo de
dato que contiene la columna --%>
<% if( i == 3 ) { %>
<td><%= rs.getInt( i ) %></td>
<% } else { %>
<td><%= rs.getString( i ) %></td>
<% } } %>
</tr>
<% } %>
</table>
</body>
</html>