package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dominio.Usuario;

public class DaoUsuarioImp implements DaoUsuario {

	@Override
	public Usuario login(String nombreUsuario, String Password) {
		{
			Conexion.cargaMysqlDiver();
			Usuario user = null; 
			String query = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?"; 

			try (Connection cn = Conexion.getConexion(); PreparedStatement pst = cn.prepareStatement(query)) {

				pst.setString(1, nombreUsuario);
				pst.setString(2, Password);

				ResultSet rslt = pst.executeQuery();

				if (rslt.next()) { // Verificar si hay resultados
					user = new Usuario();
					user.setIdUsuario(rslt.getInt("id_usuario"));
					user.setUsuario(rslt.getString("usuario"));
					user.setContrasenia(rslt.getString("contrasena"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return user;

		}
	}
}
