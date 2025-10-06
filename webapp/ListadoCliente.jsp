<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <%@ include file="Menu.jsp" %>
    
    <div class="main-content">
        <div class="container mt-4">
            <header>
                <h1 class="titulo-principal">Listado de Clientes</h1>
                <p class="usuario-info">Usuario: admin</p>
            </header>

            <main>
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
                        <tr>
                            <td>12345678</td>
                            <td>20-12345678-9</td>
                            <td>Juan Pérez</td>
                            <td>M</td>
                            <td>01/01/1990</td>
                            <td>Av. Siempre Viva 123</td>
                            <td>Argentina</td>
                            <td>Tigre</td>
                            <td>Buenos Aires</td>
                        </tr>
                        <tr>
                            <td>87654321</td>
                            <td>27-87654321-4</td>
                            <td>María López</td>
                            <td>F</td>
                            <td>15/05/1985</td>
                            <td>Calle Falsa 456</td>
                            <td>Argentina</td>
                            <td>Rosario</td>
                            <td>Santa Fe</td>
                        </tr>
                        
                    </tbody>
                </table>
            </main>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
