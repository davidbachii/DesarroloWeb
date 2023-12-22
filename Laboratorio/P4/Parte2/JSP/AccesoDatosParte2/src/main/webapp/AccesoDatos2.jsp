<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <title>Consulta de Alumnos</title>
    </head>
    <body>

        <%
            Connection c = null;
            Statement s = null;
            ResultSet rs = null;
            ResultSetMetaData rsmd = null;
            boolean profesorEncontrado = false; // Mover la declaración aquí

            String nombreProfesor = request.getParameter("nombreProfesor");

            if (nombreProfesor != null && !nombreProfesor.isEmpty()) {
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    c = DriverManager.getConnection("jdbc:derby://localhost:1527/UNIVERSIDAD/", "app", "app");
                    s = c.createStatement();
                    String query = "SELECT ALUMNO.DNI, ALUMNO.nombre " +
                                   "FROM ALUMNO " +
                                   "JOIN ALUMNO_ASIGNATURA ON ALUMNO.DNI = ALUMNO_ASIGNATURA.DNI_alumno " +
                                   "JOIN ASIGNATURA ON ALUMNO_ASIGNATURA.cod_asig_asignatura = ASIGNATURA.cod_asig " +
                                   "JOIN PROFESOR ON ASIGNATURA.profesor_asig = PROFESOR.DNI " +
                                   "WHERE PROFESOR.nombre = '" + nombreProfesor + "'";
                    rs = s.executeQuery(query);
                    rsmd = rs.getMetaData();

                    // Verificamos si se encontraron resultados
                    profesorEncontrado = rsmd != null && rs.next();
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
            }
            }
        %>

        <% if (profesorEncontrado) { %>
        <table width="100%" border="1">
            <tr>
                <% for (int i = 1; i <= rsmd.getColumnCount(); i++) { %>
                <th><%= rsmd.getColumnLabel(i) %></th>
                    <% } %>
            </tr>
            <% do { %>
            <tr>
                <% for (int i = 1; i <= rsmd.getColumnCount(); i++) { %>
                <td><%= rs.getString(i) %></td>
                <% } %>
            </tr>
            <% } while (rs.next()); %>
        </table>
        <% } else if (nombreProfesor != null && !nombreProfesor.isEmpty()) { %>
        <script>
            alert("No se encontraron resultados para el profesor <%= nombreProfesor %>");
            window.location.href = "formulario.jsp";
        </script>
        <% } %>

    </body>
</html>