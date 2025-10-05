<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta de cliente</title>
<link rel="stylesheet" type="text/css" href="CSS/StyleSheet.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<h1>Formulario de cliente</h1>
	</header>
	<main>
		<section>
			<aside></aside>
		</section>

		<section class="container">

			<p class="col">
				<label for="dni" class="form-label"> DNI * </label><br> <input
					class="form-control" required id="dni" type="number" name="Dni"
					min="100000" max="99999999" placeholder="35123456"> <br>
				<span class="aclarativo"> Solo numeros de 6 a 8 digitos</span>
			</p>

			<p class="col">
				<label for="cuil" class="form-label"> Cuil * </label> <br> <input
					class="form-control" required type="number" name="Cuil"
					max="99999999999" pattern="\d{11}" placeholder="20351234568">
				<br> <span class="aclarativo"> Formato 11 digitos:</span>
			</p>


			<p class="col">
				<label for="nombre"> Nombre * </label> <br> <input required
					id="nombre" type="text" name="Nombre" placeholder="Armando Estefan">
			</p>
			<p class="col">
				<label for="apellido"> Apellido * </label> <br> <input required
					id="apellido" type="text" name="Apellido"
					placeholder="Tasticobanquito">
			</p>
			<p class="col">
				<label for="sexo">Sexo *</label> <br> <select id="sexo"
					name="Sexo">
					<option value="" disabled selected>-- Seleccionar --</option>
					<option value="Masculino">Masculino</option>
					<option value="Femenino">Femenino</option>
					<option value="Otro">Otro</option>
				</select>
			</p>

			<p class="col">
				<label for="nacionalidad"> Nacionalidad </label> <br> <input
					id="nacionalidad" type="text" name="Nacionalidad"
					placeholder="Argentina">
			</p>

		</section>
	</main>

	<footer> </footer>
</body>
</html>