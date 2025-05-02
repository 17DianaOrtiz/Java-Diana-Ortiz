<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>


<sql:query var="rolNombre" dataSource="${sistema}">
    SELECT nombre FROM roles WHERE id = ?
    <sql:param value="${sessionScope.rol}" />
</sql:query>

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
<title>Sistema de trabajo de grado </title>

<style>
    body {
        background: linear-gradient(to right top, #e8f5e9, #c8e6c9, #a5d6a7, #81c784, #66bb6a);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .navegacion {
        background-color: #4CAF50;
    }

    .header {
        background: linear-gradient(to right, #43a047, #7cc67c); 
        color: white;
        padding: 2rem 1rem;
        border-radius: 0 0 1rem 1rem;
        text-align: center;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .register-container {
        max-width: 700px;
        margin: 50px auto;
        background: #ffffff;
        border-radius: 15px;
        box-shadow: 0px 10px 35px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .register-header {
        background-color: #43a047; /* verde fuerte elegante */
        color: white;
        padding: 20px;
        text-align: center;
    }

    .form-section {
        padding: 30px;
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


    <nav class="navbar navbar-expand-lg navbar-dark navegacion">
        <div class="container-fluid">
            <a class="navbar-brand" >Gestion de Proyectos</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active " href="PaginaPrincipal.jsp">Inicio</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" id="opcionesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Opciones
                        </a>
                        <div class="dropdown-menu" aria-labelledby="opcionesDropdown">
                            <c:choose>
                                <c:when test="${rolNombre.rows[0].nombre eq 'Administrador'}">
                                    <a class="dropdown-item" href="Usuarios.jsp">Gestionar Usuarios</a>
                                    <a class="dropdown-item" href="VisualizarUsuarios2.jsp">Ver Usuarios</a>
                                    <a class="dropdown-item" href="CalendarioAcademico.jsp">Calendario Academico</a>
                                    <a class="dropdown-item" href="Formatos.jsp">Formatos de grado</a>
                                </c:when>
                                <c:when test="${rolNombre.rows[0].nombre eq 'Coordinación'}">

                                    <a class="dropdown-item" href="Proyectos.jsp">Gestionar Proyectos</a>
                                    <a class="dropdown-item" href="Ideas.jsp">Gestionar ideas de proyectos de grado</a>
                                    <a class="dropdown-item" href="VisualizarIdeas.jsp">Ver ideas de grado</a>
                                    <a class="dropdown-item" href="CalendarioAcademico.jsp">Calendario Academico</a>
                                    <a class="dropdown-item" href="Formatos.jsp">Formatos de grado</a>
                                    
                                </c:when>
                                <c:when test="${rolNombre.rows[0].nombre eq 'Estudiante'}">

                                    
                                    <a class="dropdown-item" href="VerProyecto.jsp">Gestionar Proyecto</a>
                                    <a class="dropdown-item" href="CalendarioAcademico.jsp">Calendario Academico</a>
                                    <a class="dropdown-item" href="Formatos.jsp">Formatos de grado</a>
                                    
                                </c:when>
                                <c:when test="${rolNombre.rows[0].nombre eq 'Director'}">

                                    <a class="dropdown-item" href="VerProyectoDirector.jsp">Gestionar Proyectos</a>
                                    <a class="dropdown-item" href="CalendarioAcademico.jsp">Calendario Academico</a>
                                    <a class="dropdown-item" href="Formatos.jsp">Formatos de grado</a>
                                    
                                </c:when>
                                <c:when test="${rolNombre.rows[0].nombre eq 'Evaluador'}">

                                    <a class="dropdown-item" href="VerProyectosEvaluador.jsp">Gestionar Proyectos</a>
                                    <a class="dropdown-item" href="CalendarioAcademico.jsp">Calendario Academico</a>
                                    <a class="dropdown-item" href="Formatos.jsp">Formatos de grado</a>
                                    
                                </c:when>
                                <c:otherwise>
                                    <span class="dropdown-item text-danger">Sin opciones disponibles</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </li>
                    
                </ul>
                <span class="navbar-text text-white">
                    ${sessionScope.usuario}
                </span>
            </div>
        </div>
    </nav>

    <div class="header">
        <h1>Bienvenido/a</h1>
        <p class="lead">
                <span class="navbar-text text-white">
                    ${sessionScope.usuario}
                </span>
                <br>
                <span class="navbar-text text-white">
                    ${rolNombre.rows[0].nombre}
                </span>
        </p>
    </div>

<div class="container">
<div class="register-container">
    <div class="register-header">
        <h2>Actualizar Usuario</h2>
        <p>Complete el formulario</p>
    </div>
    <div class="form-section">

        <form action="CargarUsuario.jsp" method="get">
            <label class="mt-2" for="id">Ingrese el ID del usuario:</label>
            <input type="text" name="id" id="id" required>
            <button class="btn-warning" type="submit">Cargar Datos</button>
        </form>

        
        <form action="ActlUsuario.jsp" method="post">

            <div class="form-group">
                <label for="id3">ID</label>
                <input type="number" class="form-control" name="id3" id="id3" value="${param.id2}" readonly>
            </div>

            <sql:query dataSource="${sistema}" var="listaideas">
                SELECT id, nombre FROM usuarios 
                WHERE rol_id = 2 AND correo = ?
                <sql:param value="${sessionScope.usuario}" />
            </sql:query>

            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" class="form-control" name="nombre" value="${param.nombre}" required>
            </div>
            <div class="form-group">
                <label for="correo">Correo:</label>
                <textarea class="form-control" name="correo"  required>${param.correo}</textarea>
            </div>
            <div class="form-group">
                <label for="contrasena" >Contraseña:</label>
                <input class="form-control" name="contrasena" value="${param.contrasena}" required>
            </div>


            <sql:query var="listaRoles" dataSource="${sistema}">
                SELECT id, nombre FROM roles
            </sql:query>

            <div class="form-group">
                <label for="rol"><i class="fas fa-user-tag"></i> Rol</label>
                <select class="form-control" id="rol" name="rol" required>
                    <option disabled ${empty param.rol ? 'selected' : ''}>Seleccione un rol</option>
                    <c:forEach var="rolItem" items="${listaRoles.rows}">
                        <option value="${rolItem.id}" ${rolItem.id == param.rol ? 'selected' : ''}>
                            ${rolItem.nombre}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="especialidad"><i class="fas fa-book"></i> Especialidad (si es Evaluador o Director)</label>
                <input type="text" class="form-control" id="especialidad" name="especialidad" value="${param.especialidad}">
            </div>

            <div class="form-group">
                <label for="carrera"><i class="fas fa-graduation-cap"></i> Carrera (si es Estudiante)</label>
                <input type="text" class="form-control" id="carrera" name="carrera" value="${param.carrera}">
            </div>

            <div class="form-group">
                <label for="semestre"><i class="fas fa-layer-group"></i> Semestre</label>
                <input type="number" class="form-control" id="semestre" name="semestre" min="1" max="12" value="${param.semestre}">
            </div>
            
            <button type="submit" class="btn btn-success btn-custom mt-1">Actualizar Usuario</button>
            <a href="VisualizarUsuarios2.jsp" class="btn btn-warning btn-custom mt-1">Ver Usuarios</a>
            <a href="Usuarios.jsp" class="btn btn-light btn-custom mt-1">Regresar</a>
             
        </form>
    </div>
</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>


