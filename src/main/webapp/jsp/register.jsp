<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Registro</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%
        request.setCharacterEncoding("UTF-8");

        String user=request.getParameter("");
        String password=request.getParameter("");
    
        Class.forName("com.mysql.cj.jdbc.Driver");
        try{
            Connection dbconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ourfirstloginDB", "phpmyadmin", ".admin1234.");
            Statement query = dbconnection.createStatement();

            String sentenceSQL = "INSERT INTO clients (User, Password) VALUES ('"+user+"', '"+password+"')";

            query.executeUpdate(sentenceSQL);
            out.println("Registrado con éxito");
        }catch(Exception e){
            out.println("Ha ocurrido un error");
            e.printStackTrace();
        }
        %>
    </body>
</html>