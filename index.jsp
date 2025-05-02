<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Sistema de Registro de Libros - Login"/>

    <title>Iniciar Sesión - Sistema de Trabajo de Grado</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
    body {
        background: linear-gradient(to right top, #e8f5e9, #c8e6c9, #a5d6a7, #81c784, #66bb6a);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .login-container {
        max-width: 600px;
        margin: 60px auto;
        padding: 30px;
        border-radius: 15px;
        background-color: white;
        box-shadow: 0px 10px 40px rgba(0, 0, 0, 0.1);
    }

    .login-header {
        background-color: #43a047; /* verde oscuro elegante */
        padding: 20px;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        color: white;
        text-align: center;
    }

    .login-footer {
        text-align: center;
        margin-top: 20px;
    }

    .btn-custom {
        width: 100%;
    }

    .form-control:focus {
        border-color: #66bb6a;
        box-shadow: 0 0 0 0.2rem rgba(102, 187, 106, 0.25);
    }
</style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div class="login-header">
                <h2>Sistema de Trabajo de Grado</h2>
                <p>Ingreso de Usuarios</p>
            </div>
            <div class="p-4">
                <form action="login.jsp" method="post">
                    <div class="form-group">
                        <label for="usuario"><i class="fas fa-user"></i> Usuario</label>
                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Escriba su usuario" required>
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Contraseña</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Escriba su contraseña" required>
                    </div>
                    <button type="submit" class="btn btn-success btn-custom mb-3">Iniciar Sesión</button>
                    <a href="VisualizarUsuarios.jsp" class="btn btn-secondary btn-custom mb-3">Usuarios</a>
                    <button type="reset" class="btn btn-outline-danger btn-custom">Restablecer</button>

                </form>
            </div>
            <div class="login-footer text-muted">
                <small>Desarrollado por Diana Sofía Ortiz Morales</small>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>