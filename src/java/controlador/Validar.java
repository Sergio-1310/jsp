package controlador;

import modelo.Usuario;
import modelo.UsuarioDAO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Validar")
public class Validar extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion != null && accion.equalsIgnoreCase("Ingresar")) {

            String email = request.getParameter("txtemail");
            String pass = request.getParameter("txtpass");

            Usuario u = dao.validar(email, pass);

            if (u != null && u.getEmail() != null) {

                request.getSession().setAttribute("usuario", u);

                response.sendRedirect("productos.jsp");

            } else {

                response.sendRedirect("login.jsp");

            }
        } else if (accion != null && accion.equalsIgnoreCase("Salir")) {
            // Destruye la sesión actual del usuario
            request.getSession().invalidate();
            // Redirige al catálogo para verlo como invitado
            response.sendRedirect("productos.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }
}