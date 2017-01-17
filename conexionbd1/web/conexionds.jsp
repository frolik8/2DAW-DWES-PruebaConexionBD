<!-- Directivas JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.naming.*,javax.sql.*, java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html">
        <title>Ejemplo de conexión a BD con DataSource</title>
    </head>
    <body>
        <%
        Connection conDB = null;
        out.println("Intentando conectar con la base de datos mediante DataSource...");
        try {
	        InitialContext initCtx = new InitialContext();
	        DataSource ds = (DataSource) initCtx.lookup("java:jboss/datasources/MySQLDS2");
	        //DataSource ds = (DataSource) initCtx.lookup("java:app/env/MySqlDS");
	        conDB = ds.getConnection();
	        Statement s = conDB.createStatement();
	        out.println("Todo está ¡¡OK!!");
        }
        catch(Exception e) 
        {
        	out.println("No ha sido posible conectarse.\n"+e.toString());
        }
        finally
        {
        	if (conDB!=null)
        		conDB.close();
        	conDB = null;
        }
        
        %>
    </body>
</html>