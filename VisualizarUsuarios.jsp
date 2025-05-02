<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<title>Title</title>
</head>
<body style="background-color: #e8f5e9;"> 

    <div class="container d-flex justify-content-center align-items-center">
        
        <div class="container p-5 bg-white shadow-lg m-3 rounded border border-success">
            <div class="d-flex flex-column justify-content-center">
            <a href="index.jsp" class="btn btn-success btn-custom mb-3">Regresar</a>
                <h3 class="text-center ">Lista de Usuarios</h3>
                <table class="table table-secondary table-striped table-bordered mt-3">
                    <thead>
                        <tr>
                            <th width="100px">ID</th>
                            <th width="300px">Rol</th>
                            <th width="300px">Correo</th>
                            <th width="100px">Contraseña</th>
                        </tr>
                    </thead>
                    <tbody>
                        <sql:query var="result" dataSource="${sistema}">
                            SELECT roles.nombre , usuarios.id, usuarios.correo, usuarios.Contrasena
                            FROM usuarios INNER JOIN roles ON usuarios.rol_id = roles.id;
                        </sql:query>

                        <c:forEach var="fila" items="${result.rows}">
                            <tr>
                                <td><c:out value="${fila.id}" /></td>
                                <td><c:out value="${fila.nombre}" /></td>
                                <td><c:out value="${fila.correo}" /></td>
                                <td><c:out value="${fila.contrasena}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>

