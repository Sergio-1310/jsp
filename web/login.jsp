<%-- 
    Document   : Login
    Created on : 7 may. 2026, 10:34:17 p. m.
    Author     : amaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h2>Iniciar Sesion</h2>

        <form action="Validar" method="POST">

            Email:
            <input type="text" name="txtemail">

            <br><br>

            Password:
            <input type="password" name="txtpass">

            <br><br>

            <input type="submit" name="accion" value="Ingresar">

        </form>
    </body>
</html>
