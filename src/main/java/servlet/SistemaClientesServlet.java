package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoUsuario;
import dominio.Usuario;

@WebServlet("/SistemaClientesServlet")
public class SistemaClientesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private DaoUsuario daoUsuario;

    public SistemaClientesServlet() {
        super();
        this.daoUsuario = new DaoUsuario() {};
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
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
}
