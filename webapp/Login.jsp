<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="CSS/StyleSheet.css">
</head>
<body>
	<div Class="login">
		<b> Iniciar Sesión</b><br>
		<form method="post" action="SistemaClientesServlet">
			<input type="hidden" name="action" value="login">
			Usuario<br> <input type="text" name="txtUsuario"><br>
			Contraseña<br> <input type="password" name="txtContrasenia"><br>
			<input type="submit" value="Ingresar" name="btnIngresar">
		</form>
		

	</div>
</body>
</html>