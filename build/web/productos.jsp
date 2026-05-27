<%-- 
    Document   : productos
    Created on : 7 may. 2026, 10:34:54 p. m.
    Author     : amaya
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.ProductoDAO"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario u = (Usuario) session.getAttribute("usuario");

    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ProductoDAO dao = new ProductoDAO();
    List<Producto> lista = dao.listar();
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Productos - TechStore</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial, Helvetica, sans-serif;
        }

        body{
            background:#f5f5f5;
        }

        .navbar{
            background:#1e3a8a;
            color:white;
            padding:20px 50px;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .navbar h1{
            font-size:30px;
        }

        .hero{
            background:linear-gradient(to right,#2563eb,#1e40af);
            color:white;
            padding:60px;
            text-align:center;
        }

        .hero h2{
            font-size:45px;
            margin-bottom:20px;
        }

        .hero p{
            font-size:18px;
        }

        .productos{
            width:90%;
            margin:40px auto;
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
            gap:25px;
        }

        .card{
            background:white;
            border-radius:15px;
            overflow:hidden;
            box-shadow:0 5px 15px rgba(0,0,0,0.1);
            transition:0.3s;
        }

        .card:hover{
            transform:translateY(-5px);
        }

        .card img{
            width:100%;
            height:220px;
            object-fit:cover;
        }

        .contenido{
            padding:20px;
        }

        .contenido h3{
            margin-bottom:10px;
            color:#222;
        }

        .contenido p{
            color:#666;
            margin-bottom:15px;
        }

        .precio{
            font-size:22px;
            color:#2563eb;
            font-weight:bold;
            margin-bottom:15px;
        }

        .stock{
            margin-bottom:15px;
            color:#444;
        }

        .btn{
            width:100%;
            padding:12px;
            border:none;
            background:#2563eb;
            color:white;
            border-radius:8px;
            cursor:pointer;
            font-size:15px;
            font-weight:bold;
        }

        .btn:hover{
            background:#1d4ed8;
        }

    </style>

</head>

<body>

    <div class="navbar">

        <h1>TechStore</h1>

        <div>
            Bienvenido: <%= u.getEmail()%>
        </div>

    </div>

    <div class="hero">
        <h2>Tienda Tecnológica</h2>
        <p>Los mejores productos tecnológicos al mejor precio</p>
    </div>

    <div class="productos">

        <%
            for(Producto p : lista){
        %>

        <div class="card">

            <%
                String imagen = "";

                if(p.getNombre().equals("iPhone 15")){
                    imagen = "https://www.plug.tech/cdn/shop/articles/F517Ix-aYAAvXmU_1.jpg?v=1694541875&width=1100";
                }
                else if(p.getNombre().equals("Laptop Gamer")){
                    imagen = "https://media.es.wired.com/photos/6995ed05a76ef6fa41fa7a13/master/w_2560%2Cc_limit/The%2520Ultimate%2520Quest-%2520How%2520to%2520Choose%2520the%2520Right%2520Gaming%2520Laptop.png";
                }
                else if(p.getNombre().equals("Audifonos Sony")){
                    imagen = "https://media.falabella.com/falabellaPE/117173739_01/w=800,h=800,fit=pad";
                }
            %>

            <img src="<%= imagen %>" alt="producto">

            <div class="contenido">

                <h3>
                    <%= p.getNombre() %>
                </h3>

                <p>
                    <%= p.getDescripcion() %>
                </p>

                <div class="precio">
                    S/ <%= p.getPrecio() %>
                </div>

                <div class="stock">
                    Stock: <%= p.getStock() %>
                </div>

                <button class="btn">
                    Agregar al carrito
                </button>

            </div>

        </div>

        <%
            }
        %>

    </div>

</body>

</html>
