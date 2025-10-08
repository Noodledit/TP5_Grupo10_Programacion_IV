package dao;

import dominio.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public interface DaoUsuario {

	public default void cargaMysqlDiver() {
		try {//esta linea es importante para las aplicaciones web
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver MySQL cargado correctamente!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public default Usuario login (String nombreUsuario, String Password) {
		cargaMysqlDiver();	
		Usuario user = new Usuario();
		String query = "Select * from usuario where usuario = ? and contrasena = ?";
		
		try {
			Connection cn = (Connection) new Conexion();
			PreparedStatement pst = cn.prepareStatement(query);
			pst.setString(1, nombreUsuario);
			pst.setString(2, Password);
			
			ResultSet rslt = pst.executeQuery();
			rslt.next();
			
			user.setIdUsuario(rslt.getInt("id_usuario"));
			user.setUsuario(rslt.getString("usuario"));
			user.setContrasenia(rslt.getString("contrasena"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
