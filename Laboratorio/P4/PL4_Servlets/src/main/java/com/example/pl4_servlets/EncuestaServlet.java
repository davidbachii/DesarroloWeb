package com.example.pl4_servlets;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;


@WebServlet("/EncuestsS")
public class EncuestaServlet extends HttpServlet
{
    Statement mandato = null;
    Connection conexion = null;
    public void init(ServletConfig config) throws ServletException
    {
        try
        {
            conexion = DriverManager.getConnection ("jdbc:derby://localhost:1527/sample","app","app");
        mandato = conexion.createStatement();
        }
        catch (Exception e)
        {
            System.out.println("Problemas al conectar con la base de datos");
        }
    }


    public void service( HttpServletRequest peticion, HttpServletResponse
            respuesta ) throws ServletException, IOException
    {
        /* creación del flujo de salida hacia el cliente */
        ServletOutputStream out = respuesta.getOutputStream();
        respuesta.setContentType("text/html");
        /* recuperamos los valores que nos manda el cliente */
        String strNombre = peticion.getParameter("NOMBRE");
        String strEmail = peticion.getParameter("EMAIL");
        String strRespuesta = peticion.getParameter("RESPUESTA");
        /* insertamos los datos en la base de datos */
        try
        {
            mandato.executeUpdate("INSERT INTO ENCUESTA VALUES( '" + strNombre + "', '" + strEmail + "', '" + strRespuesta + "');");
        } catch(SQLException e)
        {
            System.out.println(e);
            return;
        }
        /* leemos todos los registros para crear la estadística */
        try
        {
            int intSI = 0;
            int intNO = 0;
            ResultSet resultado = mandato.executeQuery("SELECT RESPUESTA FROM ENCUESTA");
            while(resultado.next())
            {
                String resp = resultado.getString("RESPUESTA");
                if(resp.compareTo("SI")==0) intSI++;
                else intNO++;
            }
            out.println("<h2><center>Encuesta Servlet</center></h2>");
            out.println("<BR>Gracias por participar en esta encuesta.");
            out.println("<BR>Los resultados hasta este momento son :");
            out.println("<BR> SI : "+intSI);
            out.println("<BR> NO : "+intNO);
        }
        catch(Exception e)
        {
            System.out.println(e);
            return;
        }
    }
    public void destroy()
    {
        try
        {
            conexion.close();
        }
        catch(SQLException e)
        {
            System.out.println(e);
            return; } } }