package modelo;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {

    Conexion cn = new Conexion();

    Connection con;

    PreparedStatement ps;

    ResultSet rs;

    public Usuario validar(String email, String contrasena) {

        Usuario u = null;

        String sql = "SELECT * FROM usuarios WHERE email=? AND contrasena=?";

        try {

            con = cn.conectar();

            if (con != null) {

                System.out.println("Correo recibido: " + email);
                System.out.println("Password recibido: " + contrasena);

                ps = con.prepareStatement(sql);

                ps.setString(1, email);
                ps.setString(2, contrasena);

                rs = ps.executeQuery();

                if (rs.next()) {

                    System.out.println("USUARIO ENCONTRADO");

                    u = new Usuario();

                    u.setId(rs.getString("id"));
                    u.setEmail(rs.getString("email"));
                    u.setContrasena(rs.getString("contrasena"));
                    u.setRol(rs.getString("rol"));

                } else {

                    System.out.println("USUARIO NO EXISTE");

                }

            } else {

                System.out.println("La conexion vino null");

            }

        } catch (Exception e) {

            System.out.println("Error login:");
            e.printStackTrace();

        }

        return u;
    }
}