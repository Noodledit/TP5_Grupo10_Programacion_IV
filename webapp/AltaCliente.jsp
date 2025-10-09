<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Alta de cliente</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="CSS/StyleSheet.css">
</head>
<body class="bg-light">
    <!-- Incluir el menú -->
    <%@ include file="Menu.jsp" %>
    
    <div class="main-content">
        <div class="container mt-4">
            <header>
                <h1 class="titulo-principal">Formulario de Cliente</h1>
                <p class="usuario-info">Usuario: ${username}</p>
            </header>

            <main>
                <form class="formulario-contenedor p-4" method="post" action="SistemaClientesServlet">
                    <input type="hidden" name="action" value="altaCliente">
                    
                    <!-- Resto del formulario se mantiene igual -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="dni" class="form-label required-label">DNI</label>
                            <input class="form-control" required id="dni" type="number" 
                                   name="Dni" min="100000" max="99999999" 
                                   placeholder="12345678">
                            <div class="aclarativo">Solo números: 6 a 8 dígitos (ej: 12345678)</div>
                        </div>

                        <div class="col-md-6">
                            <label for="cuil" class="form-label required-label">CUIL</label>
                            <input class="form-control" required type="number" 
                                   name="Cuil" min="10000000000" max="99999999999" 
                                   placeholder="20123456789">
                            <div class="aclarativo">Formato: 11 dígitos (ej: 20131444515)</div>
                        </div>
                    </div>

                    <!-- Segunda fila: Nombre y Apellido -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="nombre" class="form-label required-label">Nombre</label>
                            <input class="form-control" required id="nombre" 
                                   type="text" name="Nombre" placeholder="Juan">
                        </div>
                        <div class="col-md-6">
                            <label for="apellido" class="form-label required-label">Apellido</label>
                            <input class="form-control" required id="apellido" 
                                   type="text" name="Apellido" placeholder="Pérez">
                        </div>
                    </div>

                    <!-- Tercera fila: Sexo y Nacionalidad -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="sexo" class="form-label required-label">Sexo</label>
                            <select class="form-select" id="sexo" name="Sexo" required>
                                <option value="" disabled selected>-- Seleccione --</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="nacionalidad" class="form-label">Nacionalidad</label>
                            <input class="form-control" id="nacionalidad" 
                                   type="text" name="Nacionalidad" placeholder="Argentina">
                        </div>
                    </div>

                    <!-- Fecha de nacimiento -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="fechaNacimiento" class="form-label required-label">Fecha de nacimiento</label>
                            <input class="form-control" required id="fechaNacimiento" 
                                   type="date" name="FechaNacimiento">
                            <div class="aclarativo">dd / mm / aaaa</div>
                        </div>
                        <div class="col-md-6">
                            <label for="localidad" class="form-label">Localidad</label>
                            <input class="form-control" id="localidad" 
                                   type="text" name="Localidad" placeholder="Ciudad">
                        </div>
                    </div>

                    <!-- Dirección y Provincia -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input class="form-control" id="direccion" 
                                   type="text" name="Direccion" placeholder="Calle 123">
                        </div>
                        <div class="col-md-6">
                            <label for="provincia" class="form-label">Provincia</label>
                            <input class="form-control" id="provincia" 
                                   type="text" name="Provincia" placeholder="Buenos Aires">
                        </div>
                    </div>

                    <!-- Correo y Teléfono -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label for="correo" class="form-label required-label">Correo electrónico</label>
                            <input class="form-control" required id="correo" 
                                   type="email" name="Correo" placeholder="nombre@dominio.com">
                        </div>
                        <div class="col-md-6">
                            <label for="telefono" class="form-label">Teléfono</label>
                            <input class="form-control" id="telefono" 
                                   type="tel" name="Telefono" placeholder="+54 11 1234-5678">
                        </div>
                    </div>

                    <!-- Botón de envío -->
                    <div class="row">
                        <div class="col-12 text-center">
                            <button type="submit" class="btn btn-primary btn-lg boton-guardar">Guardar cliente</button>
                        </div>
                    </div>
                </form>
            </main>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>