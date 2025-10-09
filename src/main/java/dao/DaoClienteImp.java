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
}
