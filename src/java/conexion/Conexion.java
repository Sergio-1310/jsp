package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    Connection con;

    public Connection conectar() {

        try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            String url = "jdbc:sqlserver://DESKTOP-83I5SAH\\SQLEXPRESS;"
                    + "databaseName=dbEcommerce1;"
                    + "encrypt=true;"
                    + "trustServerCertificate=true;"
                    + "integratedSecurity=true;";

            System.out.println("Intentando conectar a SQL Server...");

            con = DriverManager.getConnection(url);

            System.out.println("Conexion exitosa");

        } catch (Exception e) {

            System.out.println("Error conexion:");
            e.printStackTrace();

        }

        return con;
    }
}