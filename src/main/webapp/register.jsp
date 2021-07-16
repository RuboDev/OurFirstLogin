<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>

<head>
    <meta charset="utf-8">
    <title class="Sign-up">Register</title>
    <link rel="stylesheet" href="./css/style-logup.css">
</head>

<body class="fondo">

    <%@ page import="java.sql.*" %>
    <%
    request.setCharacterEncoding("UTF-8");

    String registerok = "";
    String registerfail = "";

    if(request.getMethod().equals("post") || request.getMethod().equals("POST")){

    String user=request.getParameter("email");
    String password=request.getParameter("pass");

    Class.forName("com.mysql.cj.jdbc.Driver");
    try{
        Connection dbconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ourfirstloginDB", "phpmyadmin", ".admin1234.");
        Statement query = dbconnection.createStatement();

        String sentenceSQL = "INSERT INTO clients (User, Password) VALUES ('"+user+"', '"+password+"')";

        query.executeUpdate(sentenceSQL);
        // out.println("Registrado con éxito");
        registerok = "Registrado con éxito";
    }catch(Exception e){
        // out.println("Ha ocurrido un error");
        registerfail = "El correo ya está registrado o Ha ocurrido un error";
        e.printStackTrace();
    }
    }
    %>

    <!--Este es el nav-->
    <nav>
        <div id="dentroNav">
            <ul>
                <li><a id="enlace1" href="login.jsp" target="_blank">Login</a></li>
                <li><a id="enlace2" href="register.jsp" target="_blank">Sign-up</a>
                </li>
            </ul>
        </div>
    </nav>
    <!--Contenedor sign-up-->
    <section class="padre">
        <div class="sign-up-box">

            <h1>SIGN-UP</h1>
            <div id="Mensaje"></div>
            <div id="Mensaje2"></div>
            <div id="registerMessage"><%= registerok %></div>
            <div id="registerMessage2"><%= registerfail %></div>


            <form action="register.jsp" method="post">
                <!-- Correo -->
                <input type="text" name="email" id="email" class="e-mail" required placeholder="E-mail">
                <br />
                <!-- Password -->
                <input type="password" name="pass" id="pass" required class="password" placeholder="Password">
                <br />
                <input type="submit" class="sign" value="SIGN-UP" onclick=" return ValidarCampos()">

            </form>
        </div>
    </section>
    <script src="./js/mensajes2.js"></script>
</body>

</html>