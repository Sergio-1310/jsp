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
        <title>Login - TechStore</title>

        <style>

            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
                font-family:Arial, Helvetica, sans-serif;
            }

            body{
                height:100vh;
                display:flex;
                justify-content:center;
                align-items:center;
                background:linear-gradient(135deg,#2563eb,#1e3a8a);
            }

            .contenedor{
                width:400px;
                background:white;
                padding:40px;
                border-radius:15px;
                box-shadow:0 10px 30px rgba(0,0,0,0.2);
            }

            .logo{
                text-align:center;
                margin-bottom:30px;
            }

            .logo h1{
                color:#2563eb;
                font-size:35px;
            }

            .logo p{
                color:#666;
                margin-top:10px;
            }

            .grupo{
                margin-bottom:20px;
                text-align: center;
            }

            .grupo label{
                display:block;
                margin-bottom:8px;
                color:#333;
                font-weight:bold;
            }
            .grupo input:focus{
                outline:none;
                border:1px solid #2563eb;
            }

            .btn{
                width:100%;
                padding:14px;
                background:#2563eb;
                border:none;
                border-radius:8px;
                color:white;
                font-size:16px;
                font-weight:bold;
                cursor:pointer;
                transition:0.3s;
            }

            .btn:hover{
                background:#1d4ed8;
            }

            .footer{
                text-align:center;
                margin-top:20px;
                color:#777;
                font-size:14px;
            }

        </style>

    </head>

    <body>

        <div class="contenedor">

            <div class="logo">
                <h1>TechStore</h1>
                <p>Inicia sesión para continuar</p>
            </div>

            <form action="Validar" method="POST">

                <div class="grupo">
                    <label>Email</label>
                    <input type="text" name="txtemail" placeholder="Ingrese su correo" required>
                </div>

                <div class="grupo">
                    <label>Password</label>
                    <input type="password" name="txtpass" placeholder="Ingrese su contraseña" required>
                </div>

                <input type="submit" name="accion" value="Ingresar" class="btn">

            </form>

            <div class="footer">
                © 2026 TechStore S.A.C.
            </div>

        </div>

    </body>
</html>
