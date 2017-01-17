<!-- Directivas JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ejemplo de consulta a BD</title>
  </head>
  <body bgcolor="Gray">
    <!-- Scriptlets JSP -->
    <%
      String basedatos = "bdfotogramas";
      try {
        //Se carga el controlador de MySQL
        Class.forName("com.mysql.jdbc.Driver"); //Puede lanzar ClassNotFoundException
        //Se establece la conexión. Puede lanzar un SQLException
        Connection conDB = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+basedatos,"eclipse","eclipse"); 
        DatabaseMetaData dbmd = conDB.getMetaData();        
    %>
    <table bgcolor="Olive" cellspacing="0" cellpadding="0" border="1" width="550" align="center">  
      <tr>
        <td colspan="2">
          <DIV align="center">
            <H5>Metadatos sobre la base de datos 
              <FONT color="#ff0033">
                <%=   basedatos%>
              </FONT>
            </H5>
            </DIV>
        </td>
      </tr>
      <tr>
        <td width="193">
          <DIV align="right">
            <H5>Nombre del sistema gestor:</H5>
          </DIV>
        </td>
        <td width="89">
          <H5>
            <%=  dbmd.getDatabaseProductName() %>
          </H5>
        </td>
      </tr>
      <tr>
        <td width="193">
          <DIV align="right">
            <H5>Versi&oacute;n del sistema gestor:</H5>
          </DIV>
        </td>
        <td width="89">
          <H5>
            <%=  dbmd.getDatabaseProductVersion()%>
          </H5>
        </td>
      </tr>
      <tr>
        <td width="193">
          <DIV align="right">
            <H5>Nombre del controlador:</H5>
          </DIV>
        </td>
        <td width="89">
          <H5>
            <%=  dbmd.getDriverName()%>
          </H5>
        </td>
      </tr>
      <tr>
        <td width="193">
          <DIV align="right">
            <H5>Versi&oacute;n del controlador:</H5>
          </DIV>
        </td>
        <td width="89">
          <H5>
            <%=  dbmd.getDriverVersion()%>
          </H5>
        </td>
      </tr>
      <tr>
        <td width="193">
          <DIV align="right">
            <H5>Soporte del ANSI92 completo:</H5>
          </DIV>
        </td>
        <td width="89">
          <H5>
            <%=  dbmd.supportsANSI92FullSQL()%>
          </H5>
        </td>
      </tr>
      <tr>
        <td width="193">
          <DIV align="right">
            <H5>Versi&oacute;n menor de JDBC que soporta el controlador:</H5>
          </DIV>
        </td>
        <td width="89">
          <H5>
            <%=  dbmd.getDriverMinorVersion()%>
          </H5>
        </td>
      </tr>
      <tr>
        <td width="193">
          <DIV align="right">
            <H5>Versi&oacute;n mayor de JDBC que soporta el controlador:</H5>
          </DIV>
        </td>
        <td width="89">
          <H5>
            <%=  dbmd.getDriverMajorVersion()%>
          </H5>
        </td>
      </tr>
      <tr>
        <td width="193">
          <DIV align="right">
            <H5>M&aacute;ximo n&uacute;mero de conexiones concurrentes:</H5>
          </DIV>
        </td>
        <H5>
          <%  if (dbmd.getMaxConnections()==0)
            {
        %>
        </H5>
                <td width="89">
                  <H5>sin l&iacute;mite o desconocido</H5>
                </td>
                <H5>
                  <% 
            }
            else
            {
        %>
                </H5>
                  <td>
                    <H5>
                      <%=  dbmd.getMaxConnections()%>
                    </H5>
                  </td>
                  <H5>
                    <% 
            }
        %>
                  </H5>
      </tr>
      <tr>
        <td width="193">
          <DIV align="right">
            <H5>Tama&ntilde;o m&aacute;ximo de nombre de tabla:</H5>
          </DIV>
        </td>
        <td width="89">
          <H5>
            <%=  dbmd.getMaxTableNameLength()%>
          </H5>
        </td>
      </tr>
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