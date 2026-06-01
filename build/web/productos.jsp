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

    // Ya no redireccionamos. Si u es null, el usuario es un "Invitado".

    ProductoDAO dao = new ProductoDAO();
    List<Producto> lista = dao.listar();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechStore - Catálogo</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;500;600;700;800&family=Mulish:wght@300;400;500;600&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        display: ['Syne', 'sans-serif'],
                        body: ['Mulish', 'sans-serif'],
                    },
                    colors: {
                        ink: { 950: '#080810', 900: '#0f0f1a', 800: '#161625', 700: '#1e1e30', 600: '#28283e', 500: '#3a3a54', 400: '#5a5a7a', 300: '#8888aa', 200: '#b0b0cc', 100: '#d8d8ee', 50: '#f0f0f8' },
                        volt: { DEFAULT: '#c8ff00', dark: '#a0cc00', dim: 'rgba(200,255,0,0.12)', border: 'rgba(200,255,0,0.25)' },
                    }
                }
            }
        }
    </script>
    <style>
        body { font-family: 'Mulish', sans-serif; background: #080810; color: #d8d8ee; }
        .nav-link:hover { color: #c8ff00; background: rgba(22, 22, 37, 0.8); }
    </style>
</head>
<body class="min-h-screen pb-20">
    <!-- NAV -->
    <nav class="sticky top-0 z-50 bg-ink-900/90 backdrop-blur-md border-b border-ink-700 px-6 flex items-center h-16 justify-between">
        <div class="font-display text-xl font-800 tracking-widest text-volt uppercase">
            TECH<span class="text-ink-300 font-400">STORE</span>
        </div>
        
        <div class="hidden md:flex gap-1 items-center">
            <a href="#" class="px-4 py-1.5 rounded-lg text-sm text-ink-300 nav-link transition-all">Inicio</a>
            <a href="#" class="px-4 py-1.5 rounded-lg text-sm text-ink-50 bg-ink-700 font-medium transition-all">Productos</a>
            <a href="#" class="px-4 py-1.5 rounded-lg text-sm text-ink-300 nav-link transition-all">Mis Pedidos</a>
        </div>

        <div class="flex items-center gap-4">
            <% if (u != null) { %>
                <span class="text-xs font-semibold text-ink-400 uppercase tracking-tighter">
                    ROL: <span class="text-volt"><%= u.getRol() %></span>
                </span>
                <a href="Validar?accion=Salir" class="px-3 py-1.5 text-sm text-ink-400 hover:text-ink-100 border border-ink-600 rounded-lg hover:border-ink-400 transition-all">Salir</a>
            <% } else { %>
                <a href="login.jsp" class="px-4 py-2 bg-volt text-ink-950 text-xs font-800 rounded-lg hover:bg-volt-dark transition-all uppercase tracking-wider">Iniciar Sesión</a>
            <% } %>
        </div>
    </nav>

    <!-- HERO -->
    <div class="max-w-7xl mx-auto px-6 py-8">
        <div class="bg-ink-800 border border-ink-600 rounded-2xl px-10 py-12 mb-8 relative overflow-hidden shadow-2xl">
            <div class="absolute top-0 right-0 w-64 h-64 rounded-full opacity-10 bg-volt blur-3xl -translate-y-1/2 translate-x-1/2"></div>
            <span class="inline-block border border-volt-border bg-volt-dim text-volt text-xs font-semibold tracking-widest px-3 py-1 rounded-full mb-4 uppercase">Catálogo Oficial 2026</span>
            <h2 class="font-display text-4xl font-800 leading-tight mb-3">
                <%= (u != null) ? "Bienvenido, " + u.getEmail().split("@")[0] : "Explora TechStore" %>
            </h2>
            <p class="text-ink-300 max-w-md text-sm leading-relaxed">Explora nuestra selección de hardware premium y tecnología de última generación.</p>
        </div>

        <!-- PRODUCTOS GRID -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        <%
            for(Producto p : lista){
                // Lógica de imágenes
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
            <div class="bg-ink-800 border border-ink-600 rounded-2xl overflow-hidden hover:border-volt-border hover:-translate-y-1 transition-all duration-300 group flex flex-col">
                <div class="aspect-video bg-ink-900 overflow-hidden flex items-center justify-center">
                    <% if(!imagen.isEmpty()){ %>
                        <img src="<%= imagen %>" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" alt="<%= p.getNombre() %>">
                    <% } else { %>
                        <span class="font-display text-4xl font-700 text-ink-500 uppercase"><%= p.getNombre().charAt(0) %></span>
                    <% } %>
                </div>
                
                <div class="p-5 flex flex-col flex-1">
                    <div class="flex justify-between items-start mb-2">
                        <h3 class="font-bold text-ink-50 text-base leading-tight line-clamp-1"><%= p.getNombre() %></h3>
                        <span class="text-[10px] bg-ink-700 text-ink-300 px-2 py-0.5 rounded border border-ink-600 whitespace-nowrap">Stock: <%= p.getStock() %></span>
                    </div>
                    
                    <p class="text-ink-400 text-xs line-clamp-2 mb-4 h-8"><%= p.getDescripcion() %></p>
                    
                    <div class="flex items-center justify-between mt-auto">
                        <div class="font-display text-xl font-700 text-volt">S/ <%= String.format("%.2f", p.getPrecio()) %></div>
                        <button onclick="location.href='<%= (u == null) ? "login.jsp" : "#" %>'" 
                                class="bg-volt/10 border border-volt-border text-volt text-[10px] font-800 px-3 py-2 rounded-lg hover:bg-volt hover:text-ink-950 transition-all uppercase tracking-tighter">
                            Añadir
                        </button>
                    </div>
                </div>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>
