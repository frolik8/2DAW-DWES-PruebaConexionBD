<!-- Directivas JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Acceso a los MetaDatos de un ResultSet</title>
  </head>
  <body>
    <!-- Scriptlets JSP -->
    <%
        Connection conDB = null;
        ResultSet rs = null;
        ResultSetMetaData rsmd = null;
        Statement st = null;
        String basedatos = "bdfotogramas";
        String tabla = "usuarios";
        int numColumnas;
        String nombreColumna;
        String nombreTabla;
        String nombreEsquema;
        String nombreClase;
        int tipo; //Tipo definido en java.sql.Types
        String nombreTipo;     
      int i;
      try {
        //Se carga el controlador de MySQL
        Class.forName("com.mysql.jdbc.Driver"); //Puede lanzar ClassNotFoundException
        //Se establece la conexión
        conDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+basedatos,"eclipse","eclipse"); //Puede lanzar un SQLException
        st = conDB.createStatement();
        rs = st.executeQuery("select * from "+tabla);
        rsmd = rs.getMetaData();
      %>
      <table bgcolor="Olive" cellspacing="0" cellpadding="0" border="1" width="550" align="center">          
        <tr>
          <td colspan=6>
          <DIV align="center">
            <H5>Algunos metadatos de la tabla
              <FONT color="#ff0033">
                <%= tabla%>
              </FONT>
            </H5>
            </DIV>
          <tr>
            <td align="center">Columna:
            <td align="center">Nombre:
            <td align="center">Nombre tabla:
            <td align="center">Nombre clase:
            <td align="center">Tipo columna:
            <td align="center">Nombre del tipo:
      <%
        numColumnas = rsmd.getColumnCount();
        for (i = 1; i <= numColumnas; i++) {
          nombreColumna= rsmd.getColumnName(i);
          nombreTabla= rsmd.getTableName(i);
          nombreClase= rsmd.getColumnClassName(i);
          tipo= rsmd.getColumnType(i);
          nombreTipo= rsmd.getColumnTypeName(i);
      %>
          <tr>
              <td align="center"><%= i %>
              <td align="center"><%= nombreColumna%>
              <td align="center"><%= nombreTabla%>
              <td align="center"><%= nombreClase%>
              <td align="center"><%= tipo%>
              <td align="center"><%= nombreTipo%>
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