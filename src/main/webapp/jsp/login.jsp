<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Login</title>
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
            PreparedStatement prepQuery = dbconnection.prepareStatement("SELECT * FROM clients WHERE User=? AND Password=?");

            prepQuery.setString(1, user);
            prepQuery.setString(2, password);

            ResultSet rs = prepQuery.executeQuery();

            if(rs.next()){
                out.println("Usuario autorizado");
                // request.sendRedirect("");
            }else{
                out.println("El usuario no existe o la contraseña es incorrecta");
                // request.sendRedirect("");
            }
            rs.close();

        }catch(Exception e){
            out.println("Ha ocurrido un error");
            e.printStackTrace();
        }
        %>

    </body>
</html>