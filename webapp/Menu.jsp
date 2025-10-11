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
	<button class="btn btn-primary w-100 text-start menu-toggle"
		type="button" data-bs-toggle="collapse" data-bs-target="#menuContent"
		aria-expanded="false" aria-controls="menuContent">
		<span class="hamburger-horizontal">
        <span></span>
        <span></span>
        <span></span>
    	</span>
		<strong>Menú</strong>
	</button>
	
	

	<div class="collapse" id="menuContent">
		<div class="d-flex flex-column p-2">
			<a href="AltaCliente.jsp"
				class="btn btn-outline-light mb-2 text-start"> Alta cliente </a> 
			<a href="SistemaClientesServlet?Param=ListadoCliente"
				class="btn btn-outline-light text-start"> Listado de clientes </a>
		</div>
	</div>
</div>