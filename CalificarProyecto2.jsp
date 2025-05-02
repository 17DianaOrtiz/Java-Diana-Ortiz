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
        <h2>Gestionar Proyecto</h2>
        <p>Complete el formulario</p>
    </div>
    <div class="form-section">
        
        <form action="GuarCalificacion2.jsp" method="post">

            <sql:query dataSource="${sistema}" var="listaProyectos">
                SELECT p.id
                FROM proyectos p
                INNER JOIN profesores prof ON p.id_evaluador = prof.id
                INNER JOIN usuarios u ON prof.usuario_id = u.id
                WHERE u.correo = ? AND p.calificacion_evaluador IS NULL  AND p.calificacion_director = 'Aprobado'
                <sql:param value="${sessionScope.usuario}" />
            </sql:query>

            <div class="form-group">
                <label for="id"><i class="fas fa-folder-open"></i> ID del anteproyecto</label>
                <select class="form-control" id="id" name="id" required>
                    <option value="" disabled selected>Seleccione el id del anteproyecto</option>
                    <c:forEach var="id" items="${listaProyectos.rows}">
                        <option value="${id.id}">${id.id}</option>
                    </c:forEach>
                </select>
            </div>

           <div class="form-check">
                <input class="form-check-input" type="radio" name="opcion" id="opcion1" value="Aprobado">
                <label class="form-check-label" for="opcion1">
                    Aprobado
                </label>
                </div>
                <div class="form-check">
                <input class="form-check-input" type="radio" name="opcion" id="opcion2" value="Desaprobado">
                <label class="form-check-label" for="opcion2">
                   Desaprobado
                </label>
                </div>
                <div class="form-check">
                <input class="form-check-input" type="radio" name="opcion" id="opcion3" value="Sin Revisar">
                <label class="form-check-label" for="opcion3">
                    Sin Revisar
                </label>
                </div>
                <div class="form-check">
                <input class="form-check-input" type="radio" name="opcion" id="opcion4" value="Correcciones">
                <label class="form-check-label" for="opcion4">
                    Correcciones
                </label>
            </div>
            
            
              
            <button type="submit" class="btn btn-success  btn-custom mt-1">Guardar</button>
            <a href="VerProyectosEvaluador.jsp" class="btn btn-light btn-custom mt-1">Regresar</a>
        </form>
    </div>
</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>


