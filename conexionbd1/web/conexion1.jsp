<!-- Directivas JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        conDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdtest","eclipse","eclipse"); 
        //Se prepara la sentencia SQL
        String consulta = "SELECT * FROM usuarios WHERE login like ?;";
        //Se crea el contenedor de ejecución de sentencias
        PreparedStatement ps = conDB.prepareStatement(consulta);
        //Se proporciona un valor al parámetro que almacena el nombre de la tabla
        String cond[] = {"ed%","al%","%vita%","%do"};
        //Se asigna el parámetro a la sentencia SQL mediante ciclo for
        for (int i=0;i<cond.length;i++) {        
          ps.setString(1,cond[i]);
          //Se obtiene el resultado
          rs = ps.executeQuery();
    %>
          <center>
          <DIV>
            <table cellspacing="0" cellpadding="0" border="2" width="250">
              <tr><td>login de usuarios del sistema</td></tr>
    <%
                try {
                  while (rs.next()) { 
    %>
                    <tr><td ><%= rs.getString("login")%></td></tr>
    <%
                  }
                }
                catch (SQLException sqle) {
                    System.out.println("Error en procesamiento de datos.\n"+sqle.toString());
                }
    %>
            </table>
          </DIV></center>
    <%   
        }
        conDB.close();        
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