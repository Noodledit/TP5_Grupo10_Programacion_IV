package dao;

import dominio.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface DaoUsuario {

    public default void cargaMysqlDiver() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver MySQL cargado correctamente!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public default Usuario login(String nombreUsuario, String Password) {
        cargaMysqlDiver();	
        Usuario user = null; // Inicializar como null
        String query = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?"; // Corregido: 'usuarios' no 'usuario'
        
        try (Connection cn = Conexion.getConexion();
             PreparedStatement pst = cn.prepareStatement(query)) {
            
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
