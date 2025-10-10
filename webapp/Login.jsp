<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="CSS/StyleSheet.css">
</head>
<body>
    <div class="login">
        <b>Iniciar sesión</b>
        <form method="post" action="SistemaClientesServlet">
            <input type="hidden" name="action" value="login">

            <label for="usuario">Usuario</label>
            <input type="text" id="usuario" name="txtUsuario">

            <label for="contrasenia">Contraseña</label>
            <input type="password" id="contrasenia" name="txtContrasenia">

            <input type="submit" value="Ingresar" name="btnIngresar">
        </form>
    </div>
</body>
</html>