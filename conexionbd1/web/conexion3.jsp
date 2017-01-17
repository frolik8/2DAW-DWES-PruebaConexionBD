<!-- Directivas JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cómo obtener los nombres de las tablas de una BD</title>
  </head>
  <body bgcolor="Gray">
    <!-- Scriptlets JSP -->
    <%
        Connection conDB = null;
        ResultSet rs = null;
        DatabaseMetaData dbmd = null;
        Vector listaTablas = new Vector();
        String basedatos = "mysql";
        String[] tipoTabla = {"TABLE"};    
      try {
        String nombreTabla = null;
        //Se carga el controlador de MySQL 
        Class.forName("com.mysql.jdbc.Driver"); //Puede lanzar ClassNotFoundException
        //Se establece la conexión
        conDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+basedatos,"root",""); //Puede lanzar un SQLException
        dbmd = conDB.getMetaData();  
        rs = dbmd.getTables(null,null,null,tipoTabla);
        while (rs.next()) {
          nombreTabla = rs.getString("TABLE_NAME");
          listaTablas.add(nombreTabla);
        }
    %>
    <table bgcolor="Olive" cellspacing="0" cellpadding="0" border="1" width="550" align="center">  
      <tr>
        <td colspan="2">
          <DIV align="center">
            <H5>Nombres de tabla de  
              <FONT color="#ff0033">
                <%=   basedatos%>
              </FONT>
            </H5>
            </DIV>
    <%
        for (int i = 0; i<listaTablas.size(); i++) {
    %>
          <tr><td align="center"><%= listaTablas.elementAt(i) %> </td>
    <%
        }
    %>
    </table>
    <%
      }
      catch (ClassNotFoundException cnfe) {
        out.println("Error: Clase de controlador no encontrada."+cnfe.toString());
      }
      catch (SQLException sqle) {
        out.println("Error: excepción SQL."+sqle.toString());
      }
    %>    
  </body>
</html>