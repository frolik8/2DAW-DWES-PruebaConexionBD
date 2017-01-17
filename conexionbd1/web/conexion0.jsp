<!-- Directivas JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ejemplo de consulta a BD con PreparedStatement</title>
  </head>
  <body>
    <!-- Scriptlets JSP -->
    <%
      ResultSet rs = null; 
      Connection conDB = null;
      try { 
        //Se carga el controlador de MySQL
        Class.forName("com.mysql.jdbc.Driver"); //Puede lanzar ClassNotFoundException
        //Se establece la conexión. Puede lanzar un SQLException
        conDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdfotogramas","eclipse","eclipse");    
        if (conDB!=null)
        {
        %>
        ¡¡Conexión establecida!!
        <%
          conDB.close(); 
        }
        else
        {
        %>
        ¡¡Error en el proceso de conexión!!
        <%
        }
       
      }
      catch (ClassNotFoundException cnfe) {
        out.println("Error: Clase no encontrada."+cnfe.toString());
      }
      catch (SQLException sqle) {
        out.println("Error: SQLException."+sqle.toString());
      }
      catch (Exception e) { 
        out.println("Error durante el proceso.\n"+e.toString());
      }
    %>
  </body>
</html>