package conexion;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;
    public Connection conectar() {
        try {

            Class.forName("org.postgresql.Driver");

            String url =
                "jdbc:postgresql://db.ibiwfngyimomdhknzgny.supabase.co:5432/postgres"
                + "?sslmode=require";

            String usuario = "postgres";

            String password = "hIROfOSOcBiMrsYR";

            System.out.println("Intentando conectar a Supabase...");

            con = DriverManager.getConnection(
                    url,
                    usuario,
                    password
            );

            System.out.println("Conexion exitosa");

        } catch (Exception e) {

            System.out.println("Error conexion:");
            e.printStackTrace();

        }
        return con;
    }
}