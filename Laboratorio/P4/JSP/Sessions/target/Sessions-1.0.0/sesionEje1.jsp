<%-- 
    Document   : sesionEje1
    Created on : Dec 5, 2023, 6:22:57 PM
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML><head> <title> Ejemplo de Sesión </title> </head> <body>
    <center> <h1>Ejemplo de Sesión</h1>
        Hola, <%=session.getAttribute("Nombre")%>
        Bienvenido a la página 1
    </body> 
</HTML>
