/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.model;

/**
 *
 * @author david
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DatabaseManager {

    private static final String DB_URL = "jdbc:derby://localhost:1527/Sample2;user=app;password=app";
    private static Connection connection;

    private static DatabaseManager instance;

    private DatabaseManager() {
        // Constructor privado para evitar instancias múltiples
        /*
        Vamos a aplicar el patrón Singleton a tu clase DatabaseManager para asegurar que solo 
        haya una instancia de la conexión en toda la aplicación. Esto ayuda a evitar problemas
        relacionados con múltiples conexiones innecesarias.
         */
    }

    public static synchronized DatabaseManager getInstance() {
        if (instance == null) {
            instance = new DatabaseManager();
        }
        return instance;
    }

    public static void abrirConexion() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            DriverManager.registerDriver(new org.apache.derby.jdbc.ClientDriver());
            connection = DriverManager.getConnection(DB_URL);
            System.out.println("Se ha conectado");
        } catch (Exception e) {
            System.out.println("No se ha conectado");
            e.printStackTrace();
        }
    }

    public static void cerrarConexion() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Se ha cerrado la conexión");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void guardarUsuario(Usuario user) throws SQLException {
        abrirConexion();
        try {
            if (user != null && user.getFecha() != null) {
                String sql = "INSERT INTO usuario (nombre, correo, contraseña, fecha) VALUES (?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, user.getNombre());
                    preparedStatement.setString(2, user.getCorreo());
                    preparedStatement.setString(3, user.getContraseña());
                    // Obtén la fecha del usuario y conviértela a java.sql.Date
                    LocalDate localDate = user.getFecha().toLocalDate();
                    java.sql.Date fechaSQL = java.sql.Date.valueOf(localDate);

                    preparedStatement.setDate(4, fechaSQL);
                    preparedStatement.executeUpdate();
                }
            } else {
                System.out.println("Error: Usuario o fecha es nulo.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public static Usuario getUsuarioPorCorreo(String correo) throws SQLException {
        abrirConexion();
        try {
            String sql = "SELECT * FROM usuario WHERE correo = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, correo);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {

                    if (resultSet.next()) {

                        // Aquí estás creando un nuevo objeto Usuario y asignando los valores desde el ResultSet
                        Usuario usuario = new Usuario(
                                resultSet.getString("nombre"),
                                resultSet.getString("correo"),
                                resultSet.getString("contraseña"),
                                new Fecha(resultSet.getString("fecha"))
                        );
                        System.out.println(usuario.toString());
                        return usuario;
                    } else {
                        System.out.println("No se encontraron resultados para el correo electrónico proporcionado.");
                        return null;
                    }
                }
            }
        } finally {
            cerrarConexion();
        }

    }

    public static void guardarPelicula(Pelicula pelicula) throws SQLException {
        abrirConexion();
        try {
            if (pelicula != null) {
                String sql = "INSERT INTO peliculas (nombre, sinopsis, paginaOficial, tituloOriginal, genero, nacionalidad, duracion, año, distribuidora, director, actores, clasificacionEdad) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, pelicula.getNombre());
                    preparedStatement.setString(2, pelicula.getSinopsis());
                    preparedStatement.setString(3, pelicula.getPaginaOficial());
                    preparedStatement.setString(4, pelicula.getTituloOriginal());
                    preparedStatement.setString(5, pelicula.getGenero());
                    preparedStatement.setString(6, pelicula.getNacionalidad());
                    preparedStatement.setInt(7, pelicula.getDuracion());
                    preparedStatement.setInt(8, pelicula.getAño());
                    preparedStatement.setString(9, pelicula.getDistribuidora());
                    preparedStatement.setString(10, pelicula.getDirector());
                    preparedStatement.setString(11, pelicula.getActores());
                    preparedStatement.setInt(12, pelicula.getClasificacionEdad());

                    preparedStatement.executeUpdate();
                }
            } else {
                System.out.println("Error: La película no se ha creado correctamente.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }



/*
     
      public static List<Car> getAllCars() throws SQLException {
        abrirConexion();
        List<Car> cars = new ArrayList<>();
        try {
            String sql = "SELECT * FROM cars";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Car car = new Car(
                                resultSet.getString("name"),
                                resultSet.getInt("powerPerCurve")
                        );
                        cars.add(car);
                    }
                }
            }
        } finally {
            cerrarConexion();
        }
        return cars;
    }
      
    // Métodos para obtener un coche por ID
    public static Car getCarById(String carId) throws SQLException {
        abrirConexion();
        try {
            String sql = "SELECT * FROM cars WHERE name = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, carId);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        return new Car(
                                resultSet.getString("name"),
                                resultSet.getInt("powerPerCurve")
                        );
                    }
                }
            }
        } finally {
            cerrarConexion();
        }
        return null;
    }  
      

    public static void saveCircuit(Circuit circuit) throws SQLException {
        abrirConexion();
        try {
            String sql = "INSERT INTO circuits (name, city, country, laps, lapLength, curves  ) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, circuit.getName());
                preparedStatement.setString(2, circuit.getCity());
                preparedStatement.setString(3, circuit.getCountry());
                preparedStatement.setInt(4, circuit.getLaps());
                preparedStatement.setInt(5, circuit.getLapLength());
                preparedStatement.setInt(6, circuit.getCurves());
                preparedStatement.executeUpdate();
            }
        } finally {
            cerrarConexion();
        }
    }

   
    // Dentro del método getAllCircuits
public static List<Circuit> getAllCircuits() throws SQLException {
    abrirConexion();
    List<Circuit> circuits = new ArrayList<>();
    try {
        String sql = "SELECT * FROM circuits";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Circuit circuit = new Circuit(
                            resultSet.getString("name"),
                            resultSet.getString("city"),
                            resultSet.getString("country"),
                            resultSet.getInt("laps"),
                            resultSet.getInt("lapLength"),
                            resultSet.getInt("curves")
                    );
                    circuits.add(circuit);
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Agrega este mensaje de registro
    } finally {
        cerrarConexion();
    }
    return circuits;
}


   

    // Métodos para obtener un circuito por ID
    public static Circuit getCircuitById(String circuitId) throws SQLException {
        abrirConexion();
        try {
            String sql = "SELECT * FROM circuits WHERE name = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, circuitId);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        return new Circuit(
                                resultSet.getString("name"),
                                resultSet.getString("city"),
                                resultSet.getString("country"),
                                resultSet.getInt("laps"),
                                resultSet.getInt("lapLength"),
                                resultSet.getInt("curves")
                        );
                    }
                }
            }
        } finally {
            cerrarConexion();
        }
        return null;
    }

    

 */
}
