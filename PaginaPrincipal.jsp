<%@ page contentType="text/html;charset=UTF-8" %>
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
<title>Sistema de trabajo de grado</title>

    <style>
    body {
        background-color: #f8f9fa;
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

    .card {
        margin-top: 2rem;
    }

    .icono {
    font-size: 1.5rem; 
    margin-right: 0.5rem; 
    color: #2e7d32; 
    vertical-align: middle;
    }

    .card-header {
        background-color: #66bb6a; 
    }

    .alert-success {
        background-color: #a5d6a7;
        color: #2e7d32;
        border-color: #81c784;
    }

    .btn-outline-danger {
        border-color: #c62828;
        color: #c62828;
    }

    .btn-outline-danger:hover {
        background-color: #c62828;
        color: #fff;
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
        <p class="lead">Has iniciado sesión correctamente</p>
    </div>

    
    <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg border-0">
                <div class="card-header text-white d-flex align-items-center">
                    <i class="fas fa-user-circle fa-2x mr-3"></i>
                    <h4 class="mb-0">Información del Usuario</h4>
                </div>
                <div class="card-body bg-light">
                    <div class="mb-3">
                        <p><i class="fas fa-envelope  mr-2 icono"></i><strong>Correo:</strong> ${sessionScope.usuario}</p>
                        <p><i class="fas fa-user-tag  mr-2 icono"></i><strong>Rol:</strong> ${rolNombre.rows[0].nombre}</p>
                    </div>

                   
                    <c:choose>
                        <c:when test="${rolNombre.rows[0].nombre eq 'Administrador'}">
                            <div class="alert alert-success">
                                <i class="fas fa-cogs mr-2"></i>
                                <strong>Administrador:</strong> Ingrese a <strong>Opciones</strong> y realice los cambios necesarios.
                            </div>
                        </c:when>
                        <c:when test="${rolNombre.rows[0].nombre eq 'Estudiante'}">
                            <div class="alert alert-success">
                                <i class="fas fa-user-graduate mr-2"></i>
                                Opciones exclusivas para <strong>Estudiantes</strong>.
                            </div>
                        </c:when>
                        <c:when test="${rolNombre.rows[0].nombre eq 'Coordinación'}">
                            <div class="alert alert-success">
                                <i class="fas fa-briefcase mr-2"></i>
                                Coordinador: Ingrese a  <strong>Opciones</strong>.
                            </div>
                        </c:when>
                         <c:when test="${rolNombre.rows[0].nombre eq 'Evaluador'}">
                            <div class="alert alert-success">
                                <i class="fas fa-chalkboard-teacher mr-2"></i>
                                 Bienvenido <strong>docente Evaluador</strong>, ingrese a Opciones .
                            </div>
                        </c:when>
                        <c:when test="${rolNombre.rows[0].nombre eq 'Director'}">
                            <div class="alert alert-success">
                                <i class="fas fa-chalkboard-teacher mr-2"></i>
                                 Bienvenido <strong>docente Director</strong>, ingrese a Opciones .
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-danger">
                                <i class="fas fa-exclamation-triangle mr-2"></i>
                                Rol no reconocido.
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <div class="text-right">
                        <a href="index.jsp" class="btn btn-outline-danger mt-3">
                            <i class="fas fa-sign-out-alt mr-1"></i> Cerrar Sesión
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>


