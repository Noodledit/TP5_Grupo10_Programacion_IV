package dao;

import java.util.List;

import dominio.Cliente;

public interface DaoCliente {
	public List<Cliente> obtenerTodos();
	public int altaCliente(Cliente client);
}
