<%-- 
    Document   : index.jsp
    Created on : 29 dic 2023, 13:54:32
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.example.model.Entrada" %>
<%@ page import="com.example.model.Sala" %>
<%@ page import="com.example.model.Pelicula" %>
<%@ page import="com.example.model.DatabaseManager" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cine</title>
    <!-- Aquí puedes enlazar tu archivo CSS -->
    <link rel="stylesheet" href="estilos/index.css">
</head>
<body>
    <header>
        <div class="app-info">
            <h1>CinesWeb</h1>
        </div>
        <nav>
            
            <div class="search-bar">
                <input type="text" placeholder="Buscar...">
                <button>Buscar</button>
            </div>
            <div class="user-profile">
                
                <a href="login.jsp">Registrarse</a>
            </div>
        </nav>
    </header>
    <main>
        <!-- Aquí puedes agregar un carrusel de películas -->
    </main>
    <footer>
        <!-- Aquí puedes agregar información de contacto y derechos de autor -->
    </footer>
</body>
</html>