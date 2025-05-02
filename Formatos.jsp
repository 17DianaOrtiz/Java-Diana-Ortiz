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

    .card {
    height: 300px; 
    }

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
                                <c:when test="${rolNombre.rows[0].nombre eq 'Evaluador'}">

                                    <a class="dropdown-item" href="VerProyectosEvaluador.jsp">Evaluar Proyectos</a>
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

    
<div class="container mt-2">
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card text-center shadow border-success p-3">
                <div class="card-body">
                    <i class="fas fa-file-word fa-3x text-success mb-3"></i>
                    <h5 class="card-title">F-AM-04</h5>
                    <p class="card-text">F-AM-04 Solicitud Grado V17</p>
                    <a href="archivos/F-AM-04.docx" target="_blank" class="btn btn-outline-success btn-block">
                        Descargar
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card text-center shadow border-success p-3">
                <div class="card-body">
                    <i class="fas fa-file-word fa-3x text-success mb-3"></i>
                    <h5 class="card-title">F-DC-124</h5>
                    <p class="card-text">F-DC-124 Propuesta trabajo grado  Investigación, Desarrollo Tecnológico, Monografía y Emprendimiento V2</p>
                    <a href="archivos/F-DC-124.doc" target="_blank" class="btn btn-outline-success btn-block">
                        Descargar
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card text-center shadow border-success p-3">
                <div class="card-body">
                    <i class="fas fa-file-word fa-3x text-success mb-3"></i>
                    <h5 class="card-title">F-DC-125</h5>
                    <p class="card-text">F-DC-125  Informe final trabajo grado modalidad proyecto de investigación, desarrollo tecnológico, monografía, emprendimiento y seminario V2</p>
                    <a href="archivos/F-DC-125.docx" target="_blank" class="btn btn-outline-success btn-block">
                        Descargar
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card text-center shadow border-success p-3">
                <div class="card-body">
                    <i class="fas fa-file-word fa-3x text-success mb-3"></i>
                    <h5 class="card-title">F-DC-127</h5>
                    <p class="card-text">F-DC-127 Propuesta de trabajo de grado_ Modalidad Práctica  V2</p>
                    <a href="archivos/F-DC-127.doc" target="_blank" class="btn btn-outline-success btn-block">
                        Descargar
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card text-center shadow border-success p-3">
                <div class="card-body">
                    <i class="fas fa-file-word fa-3x text-success mb-3"></i>
                    <h5 class="card-title">F-DC-128</h5>
                    <p class="card-text">F-DC-128 Informe final de trabajo de grado en modalidad de práctica V2</p>
                    <a href="archivos/F-DC-128.docx" target="_blank" class="btn btn-outline-success btn-block">
                        Descargar
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card text-center shadow border-success p-3">
                <div class="card-body">
                    <i class="fas fa-file-word fa-3x text-success mb-3"></i>
                    <h5 class="card-title">F-DC-129</h5>
                    <p class="card-text">F-DC-129 Rejilla de evaluación informe final de trabajo de grado V2</p>
                    <a href="archivos/F-DC-129.docx" target="_blank" class="btn btn-outline-success btn-block">
                        Descargar
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card text-center shadow border-success p-3">
                <div class="card-body">
                    <i class="fas fa-file-word fa-3x text-success mb-3"></i>
                    <h5 class="card-title">F-DC-130</h5>
                    <p class="card-text">F-DC-130 Concepto final del trabajo de grado V2</p>
                    <a href="archivos/F-DC-130.docx" target="_blank" class="btn btn-outline-success btn-block">
                        Descargar
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card text-center shadow border-success p-3">
                <div class="card-body">
                    <i class="fas fa-file-word fa-3x text-success mb-3"></i>
                    <h5 class="card-title">F-DC-196</h5>
                    <p class="card-text">F-DC-196 Acta de Terminación y Recibo a Satisfacción de Prácticas V2</p>
                    <a href="archivos/F-DC-196.doc" target="_blank" class="btn btn-outline-success btn-block">
                        Descargar
                    </a>
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


