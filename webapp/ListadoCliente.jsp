<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dominio.Cliente"%>
<%
// Validación de sesión sin declarar username aquí
if (session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de Clientes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="CSS/StyleSheet.css">
</head>
<body class="bg-light">
	<!-- Incluir el menú -->
	<%@ include file="Menu.jsp"%>

	<div class="main-content">
		<div class="container mt-4">
			<header>
				<h1 class="titulo-principal">Listado de Clientes</h1>
				<p class="usuario-info">Usuario: ${username}</p>
			</header>

			<main>
				<%
				ArrayList<Cliente> ListaClientes = new ArrayList<>();
				String Mensaje = "";
				if (request.getAttribute("ListadoClientes") != null) {
					ListaClientes = (ArrayList<Cliente>) request.getAttribute("ListadoClientes");
				} else {
					Mensaje = (String) request.getAttribute("Mensaje");
				}
				%>
				<table class="table table-bordered table-striped mt-4">
					<thead class="table-dark">
						<tr>
							<th>DNI</th>
							<th>CUIL</th>
							<th>Nombre y Apellido</th>
							<th>Sexo</th>
							<th>Fecha de Nacimiento</th>
							<th>Dirección</th>
							<th>Nacionalidad</th>
							<th>Localidad</th>
							<th>Provincia</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (!ListaClientes.isEmpty()) {
							for (Cliente cli : ListaClientes) {
						%>
						<tr>
							<td><%=cli.getDni()%></td>
							<td><%=cli.getCuil()%></td>
							<td><%=cli.getNombre() + " " + cli.getApellido()%></td>
							<td><%=cli.getSexo()%></td>
							<td><%=cli.getFechaNacimiento()%></td>
							<td><%=cli.getDireccion()%></td>
							<td><%=cli.getNacionalidad()%></td>
							<td><%=cli.getLocalidad()%></td>
							<td><%=cli.getProvincia()%></td>
						</tr>
						<%
						}
						}else{%>
							<tr>
				            <td colspan="9" style="text-align:center;">No hay datos para mostrar</td>
				        </tr><%
						}
						%>
					</tbody>
				</table>
			</main>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
