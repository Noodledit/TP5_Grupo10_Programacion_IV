package dao;

import dominio.Cliente;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class  DaoCliente {
	 // obtengo los clientes de la bd
	public List<Cliente> obtenerTodos() {
	    List<Cliente> lista = new ArrayList<>();
	    String query = "SELECT * FROM clientes";
	    try (Connection cn = Conexion.getConexion();
	         Statement st = cn.createStatement();
	         ResultSet rs = st.executeQuery(query)) {

	        while (rs.next()) {
	            Cliente c = new Cliente();
	            c.setIdCliente(rs.getInt("id_cliente"));
	            c.setDni(rs.getString("dni"));
	            c.setCuil(rs.getString("cuil"));
	            c.setNombre(rs.getString("nombre"));
	            c.setApellido(rs.getString("apellido"));
	            c.setSexo(rs.getString("sexo"));
	            c.setFechaNacimiento(rs.getString("fecha_nacimiento"));
	            c.setDireccion(rs.getString("direccion"));
	            c.setNacionalidad(rs.getString("nacionalidad"));
	            c.setLocalidad(rs.getString("localidad"));
	            c.setProvincia(rs.getString("provincia"));
	            c.setCorreoElectronico(rs.getString("correo_electronico"));
	            c.setTelefono(rs.getString("telefono"));
	            lista.add(c);
	        }

	    } catch (SQLException e) {
	        System.err.println("error al obtener clientes:(  : " + e.getMessage());
	    }

	    return lista;
	}
}
