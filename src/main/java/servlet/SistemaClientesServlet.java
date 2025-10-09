package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.util.List;

import dao.DaoUsuarioImp;
import dao.DaoClienteImp;
import dominio.Cliente;
import dominio.Usuario;

@WebServlet("/SistemaClientesServlet")
public class SistemaClientesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuarioImp daoUsuario = new DaoUsuarioImp();
	private DaoClienteImp daoCliente = new DaoClienteImp();

	public SistemaClientesServlet() {
		super();
		this.daoUsuario = new DaoUsuarioImp() {
		};
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String parametro = request.getParameter("Param");
		
		if(parametro != null && parametro.equals("ListadoCliente")) {
			procesarListadoClientes(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if ("login".equals(action)) {
			procesarLogin(request, response);
		} else if ("altaCliente".equals(action)) {
			procesarAltaCliente(request, response);
		}	
	}

	private void procesarLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String usuario = request.getParameter("txtUsuario");
		String contrasenia = request.getParameter("txtContrasenia");

		try {
			Usuario user = daoUsuario.login(usuario, contrasenia);

			if (user != null && user.getIdUsuario() > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("usuario", user);
				session.setAttribute("username", user.getUsuario());
				session.setMaxInactiveInterval(30 * 60);

				response.sendRedirect("AltaCliente.jsp");
			} else {
				request.setAttribute("error", "Usuario no registrado");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error en el sistema: " + e.getMessage());
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	private void procesarAltaCliente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Aquí va la lógica para guardar el cliente en la base de datos
		// Por ahora solo redirigimos al listado
		response.sendRedirect("ListadoClientes.jsp");
	}

	private void procesarListadoClientes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Cliente> aListClientes = new ArrayList<>();
		
		try {
			aListClientes = daoCliente.obtenerTodos();
			System.out.println("se intento obtener clientes");
		} catch (Exception e) {
			e.printStackTrace();
			 request.setAttribute("Mensaje", "Error al obtener clientes: " + e.getMessage());
			 System.out.println("error al obtener clientes");
		}
	
		if(!aListClientes.isEmpty()) {
			request.setAttribute("ListadoClientes", aListClientes);
			System.out.println("Entre en listado clientes");
		}else {
			request.setAttribute("Mensaje", "No hay clientes o no se pudo cargar listado");
			System.out.println("Entre en no hay clientes");
		}
		request.getRequestDispatcher("ListadoCliente.jsp").forward(request, response);
	}
}
