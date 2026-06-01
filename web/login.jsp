<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TechStore - Iniciar Sesión</title>
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
            input:focus { border-color: rgba(200,255,0,0.4) !important; }
        </style>
    </head>
    <body class="min-h-screen flex items-center justify-center px-4 bg-ink-950">
        <div class="w-full max-w-md bg-ink-800 border border-ink-600 rounded-2xl p-8">
            <div class="text-center mb-8">
                <h1 class="font-display text-3xl font-800 text-volt tracking-widest mb-1 uppercase">TECHSTORE</h1>
                <p class="text-ink-300 text-sm">S.A.C. — Productos Electrónicos</p>
            </div>

            <div class="flex bg-ink-700 rounded-xl p-1 mb-6">
                <button class="flex-1 py-2 rounded-lg text-sm font-medium transition-all bg-ink-800 text-ink-50 border border-ink-500">Iniciar sesión</button>
                <button class="flex-1 py-2 rounded-lg text-sm font-medium transition-all text-ink-300 opacity-50 cursor-not-allowed">Registrarse</button>
            </div>

            <form action="Validar" method="POST">
                <div class="mb-4">
                    <label class="block text-xs font-semibold text-ink-300 uppercase tracking-wider mb-2">Correo electrónico</label>
                    <input type="email" name="txtemail" placeholder="tu@correo.com" required 
                           class="w-full bg-ink-700 border border-ink-500 rounded-lg px-4 py-2.5 text-ink-50 text-sm placeholder-ink-400 outline-none transition-all">
                </div>

                <div class="mb-6">
                    <label class="block text-xs font-semibold text-ink-300 uppercase tracking-wider mb-2">Contraseña</label>
                    <input type="password" name="txtpass" placeholder="••••••••" required 
                           class="w-full bg-ink-700 border border-ink-500 rounded-lg px-4 py-2.5 text-ink-50 text-sm placeholder-ink-400 outline-none transition-all">
                </div>

                <button type="submit" name="accion" value="Ingresar" 
                        class="w-full bg-volt text-ink-950 font-display font-700 tracking-wide py-3 rounded-lg hover:bg-volt-dark transition-colors uppercase">
                    Entrar
                </button>
            </form>

            <div class="text-center mt-6">
                <p class="text-ink-400 text-xs">Demo admin: <span class="text-ink-200 font-medium">admin@techstore.com</span> / <span class="text-ink-200 font-medium">admin123</span></p>
            </div>

            <div class="text-center mt-8 text-ink-500 text-xs border-t border-ink-700 pt-4">
                © 2026 TechStore S.A.C. — Todos los derechos reservados.
            </div>
        </div>
    </body>
</html>
