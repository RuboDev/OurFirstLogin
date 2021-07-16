<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<html lang="es">

<head>
    <meta charset="utf-8">
    <title>Login</title>
    <link rel="stylesheet" href="./css/style-login.css">
</head>

<body>
    <%@ page import="java.sql.*" %>

        <% 
        request.setCharacterEncoding("UTF-8");

        String authfail = "";
        String authok = "";

        if(request.getMethod().equals("post") || request.getMethod().equals("POST")){
    
            String user=request.getParameter("email");
            String password=request.getParameter("pass");
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            try{
                Connection dbconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ourfirstloginDB", "phpmyadmin", ".admin1234.");
                PreparedStatement prepQuery = dbconnection.prepareStatement("SELECT * FROM clients WHERE User=? AND Password=?");

                prepQuery.setString(1, user);
                prepQuery.setString(2, password);

                ResultSet rs = prepQuery.executeQuery();

                if(rs.next()){
                    authok = "Acceso permitido";

                    response.sendRedirect("index.jsp");
                }else{
                    authfail = "Autenticación fallida!!";
                    // response.sendRedirect("");
                }
                rs.close();

            }catch(Exception e){
                out.println("Ha ocurrido un error");
                e.printStackTrace();
            }
        }
        %>
    <nav>
        <div id="dentroNav">
            <ul>
                <li><a href="login.jsp" target="_blank">Login</a></li>
                <li><a href="register.jsp" target="_blank">Sign-up</a></li>
            </ul>
        </div>
    </nav>
    <body class="fondo">
    <div class="bloque">
        
        <h1>LOGIN</h1>
        <div id="authMessage"><%= authfail %></div>
        <div id="authMessage2"><%= authok %></div>


        <form action="login.jsp" method="post">
            <input type="text" name="email" placeholder="Correo Electronico">
            <input type="password" name="pass" placeholder="Contraseña">
            <input type="submit" value="LOGIN">
        </form>
    </div>

</body>

</html>