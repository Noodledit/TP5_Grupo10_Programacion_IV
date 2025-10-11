<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String username = (String) session.getAttribute("username");
if (username == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!-- Menú Lateral -->
<div class="sidebar bg-primary">
    <input type="checkbox" id="hamburgerCheck" hidden>
    <div class="menu-header d-flex align-items-center gap-2 p-2">
        <!-- Label solo para hamburguesa -->
        <label for="hamburgerCheck" class="hamburger-horizontal m-0">
            <span class="taparriba"></span>
            <span class="carne"></span>
            <span class="tapabajo"></span>
        </label>

        <label for="hamburgerCheck" class="btn btn-primary w-100 text-start menu-toggle mb-0">
            <strong>Menú</strong>
        </label>
    </div>

    <div class="menu-content">
        <div class="d-flex flex-column p-2">
                <a href="AltaCliente.jsp"
				class="btn btn-outline-light mb-2 text-start"> Alta cliente </a> <a
				href="SistemaClientesServlet?Param=ListadoCliente"
				class="btn btn-outline-light text-start"> Listado de clientes </a>
        </div>
    </div>
</div>
