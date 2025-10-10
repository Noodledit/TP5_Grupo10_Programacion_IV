package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dominio.Cliente;

public class DaoClienteImp implements DaoCliente {

	public List<Cliente> obtenerTodos() {
		final String query = "SELECT * FROM clientes";
		Conexion.cargaMysqlDiver();
		List<Cliente> lista = new ArrayList<>();

		System.out.println("1cliente");
		try (Connection cn = Conexion.getConexion();
				PreparedStatement ps = cn.prepareStatement(query);
				ResultSet rs = ps.executeQuery()) {

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
	
	
	public int altaCliente(Cliente client) {
		
		String consulta = "INSERT INTO clientes (dni, cuil, nombre, apellido, sexo, fecha_nacimiento, direccion, nacionalidad, localidad, provincia, correo_electronico, telefono) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?,?,?)";
		
		int filas = 0;
		try(Connection conesion = Conexion.getConexion();
				PreparedStatement pst = conesion.prepareStatement(consulta) ){
			
			pst.setString(1, client.getDni());
			pst.setString(2, client.getCuil());
			pst.setString(3, client.getNombre());
			pst.setString(4, client.getApellido());
			pst.setString(5, client.getSexo());
			pst.setString(6, client.getFechaNacimiento());
			pst.setString(7, client.getDireccion());
			pst.setString(8, client.getNacionalidad());
			pst.setString(9, client.getLocalidad());
			pst.setString(10, client.getProvincia());
			pst.setString(11, client.getCorreoElectronico());
			pst.setString(12, client.getTelefono());
			
			filas = pst.executeUpdate();
		}
		catch (SQLException e) {
            e.printStackTrace();
        }
		
		return filas;
	}

}
