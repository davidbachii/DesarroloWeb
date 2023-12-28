import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SalaCineServlet")
public class SalaCine extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear la conexión a la base de datos
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            // Consulta SQL para insertar una nueva fila en la tabla SalaCine
            String sql = "INSERT INTO SalaCine (fila, columna) VALUES (?, ?)";

            // Parámetros de fila y columna (ajusta según tus datos)
            int fila = 3;
            int columna = 2;

            // Crear la declaración preparada y establecer los parámetros
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, fila);
                statement.setInt(2, columna);

                // Ejecutar la consulta
                statement.executeUpdate();
            }

            // Redirigir a tu página JSP
            response.sendRedirect("tupagina.jsp");

        } catch (SQLException e) {
            // Manejar las excepciones de la base de datos
            e.printStackTrace();
        }
    }
}