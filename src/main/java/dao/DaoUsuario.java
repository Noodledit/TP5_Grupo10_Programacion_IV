package dao;

import dominio.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface DaoUsuario {

    public Usuario login(String nombreUsuario, String Password);
}
