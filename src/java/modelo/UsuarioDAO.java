package modelo;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {

    Conexion cn = new Conexion();

    public Usuario validar(String email, String contrasena) {
        Usuario u = null;
        String sql = "SELECT * FROM usuarios WHERE email=? AND contrasena=?";

        try (Connection con = cn.conectar();
                PreparedStatement ps = con.prepareStatement(sql)) {

            if (con != null) {
                ps.setString(1, email);
                ps.setString(2, contrasena);

                try (ResultSet rs = ps.executeQuery()) {
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