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
        
        <form action="Guaranteproyecto.jsp" method="post">

           <sql:query dataSource="${sistema}" var="listaEstudiantes">
                SELECT estudiantes.id, usuarios.nombre 
                FROM estudiantes 
                INNER JOIN usuarios ON estudiantes.usuario_id = usuarios.id 
                WHERE usuarios.correo = ?
                <sql:param value="${sessionScope.usuario}" />
            </sql:query>

            <div class="form-group">
                <label for="estudiante"><i class="fas fa-user-graduate"></i> Estudiante</label>
                <select class="form-control" id="estudiante" name="estudiante" required>
                    <option value="" disabled selected>Seleccione su nombre</option>
                    <c:forEach var="estudiante" items="${listaEstudiantes.rows}">
                        <option value="${estudiante.id}">${estudiante.nombre}</option>
                    </c:forEach>
                </select>
            </div>

            <p> Ingrese el nombre de otro integrante del proyecto (no obligatorio)</p>

            <sql:query dataSource="${sistema}" var="listaEstudiantes2">
                SELECT estudiantes.id, usuarios.nombre
                FROM estudiantes
                INNER JOIN usuarios ON estudiantes.usuario_id = usuarios.id
                WHERE estudiantes.id NOT IN (
                    SELECT id_estudiante1 FROM proyectos WHERE id_estudiante1 IS NOT NULL
                    UNION
                    SELECT id_estudiante2 FROM proyectos WHERE id_estudiante2 IS NOT NULL
                )
                AND usuarios.correo <> ?
                ORDER BY usuarios.nombre
                <sql:param value="${sessionScope.usuario}" />
            </sql:query>

            <div class="form-group">
                <label for="estudiante2"><i class="fas fa-user-graduate"></i> Estudiante</label>
                <select class="form-control" id="estudiante2" name="estudiante2" >
                    <option value="" disabled selected>Seleccione el estudiante 2 </option>
                    <c:forEach var="estudiante2" items="${listaEstudiantes2.rows}">
                        <option value="${estudiante2.id}">${estudiante2.nombre}</option>
                    </c:forEach>
                </select>
            </div>

            <sql:query dataSource="${sistema}" var="listaIdeas">
                SELECT id, titulo 
                FROM idea
                WHERE id NOT IN (
                    SELECT id_idea FROM proyectos
                    WHERE id_idea IS NOT NULL
                )
            </sql:query>

            <div class="form-group">
                <label for="idea"><i class="fas fa-lightbulb"></i> Idea de proyecto</label>
                <select class="form-control" id="idea" name="idea" required>
                    <option value="" disabled selected>Seleccione una idea de proyecto</option>
                    <c:forEach var="idea" items="${listaIdeas.rows}">
                        <option value="${idea.id}">${idea.titulo}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="pago">Ingrese el enlace de pago:</label>
                <input type="text" class="form-control" name="pago" placeholder="https://... o archivos/ejemplo.pdf" required>
            </div>

            <div class="form-group">
                <label for="enlace">Ingrese el enlace de archivo anteproyecto:</label>
                <input type="text" class="form-control" name="enlace" placeholder="https://... o archivos/ejemplo.pdf" required>
            </div>
            
            
              
            <button type="submit" class="btn btn-success  btn-custom mt-1">Guardar Registro</button>
            <a href="VisualizarIdeas.jsp" class="btn btn-warning btn-custom mt-1">Ver Ideas</a>
            <a href="VerProyecto.jsp" class="btn btn-light btn-custom mt-1">Regresar</a>
        </form>
    </div>
</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>


