package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
	
	private static final String host = "jdbc:mysql://localhost:3306/";
	private static final String user = "root";
	private static final String pass = "root";
	private static final String DBName = "sistema_clientes";
	
	
	public static Connection getConexion() throws SQLException{
			
		 return DriverManager.getConnection(host+DBName,user, pass);		 
	}
	
    public static void cargaMysqlDiver() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver MySQL cargado correctamente!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
