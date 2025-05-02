<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<title>Title</title>
<style>
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
</style>
</head>
<body style="background-color: #e8f5e9;"> 

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

    <div class="container d-flex justify-content-center align-items-center">
        
        
            <div class="d-flex flex-column m-4 justify-content-center">
           
                <h3 class="text-center ">Lista de Proyectos</h3>
                <table class="table table-secondary table-striped table-bordered mt-3 small">
                    <thead>
                        <tr>
                            <th style="width: 200px;">ID Proyecto</th>
                            <th style="width: 200px;">ID 1</th>
                            <th style="width: 200px;">Estudiante 1</th>
                            <th style="width: 200px;">ID 2</th>
                            <th style="width: 200px;">Estudiante 2</th>
                            <th style="width: 250px;">Idea</th>
                            <th style="width: 120px;">Pago</th>
                            <th style="width: 120px;">Anteproyecto</th>
                            <th style="width: 200px;">Director</th>
                            <th style="width: 150px;">Calificación Director</th>
                            <th style="width: 120px;">Radicado</th>
                            <th style="width: 200px;">Evaluador</th>
                            <th style="width: 150px;">Calificación Evaluador</th>
                            <th style="width: 150px;">Estado Final</th>
                            <th style="width: 150px;">Radicado Comité</th>
                        </tr>
                    </thead>
                    <tbody>
                            <sql:query var="result" dataSource="${sistema}">
                                SELECT * FROM vista_proyectos_completa
                            </sql:query>

                            <c:forEach var="fila" items="${result.rows}">
                                <tr>
                                    <td><c:choose><c:when test="${empty fila.id_proyecto}">Sin gestionar</c:when><c:otherwise>${fila.id_proyecto}</c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.id_estudiante1}">Sin gestionar</c:when><c:otherwise>${fila.id_estudiante1}</c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.nombre_estudiante1}">Sin gestionar</c:when><c:otherwise>${fila.nombre_estudiante1}</c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.id_estudiante2}"></c:when><c:otherwise>${fila.id_estudiante2}</c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.nombre_estudiante2}"></c:when><c:otherwise>${fila.nombre_estudiante2}</c:otherwise></c:choose></td>

                                    <td><c:choose><c:when test="${empty fila.titulo_idea}">Sin gestionar</c:when><c:otherwise>${fila.titulo_idea}</c:otherwise></c:choose></td>
                                     <td><c:choose><c:when test="${empty fila.pago}">Sin gestionar</c:when><c:otherwise>
                                        <a href="${fila.pago}" target="_blank" class="btn btn-success">Abrir</a>
                                    </c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.enlace_anteproyecto_actual}">Sin gestionar</c:when><c:otherwise>
                                        <a href="${fila.enlace_anteproyecto_actual}" target="_blank" class="btn btn-success">Abrir</a>
                                    </c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.nombre_director}">Sin gestionar</c:when><c:otherwise>${fila.nombre_director}</c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.calificacion_director}">Sin gestionar</c:when><c:otherwise>${fila.calificacion_director}</c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.radicado}">Sin gestionar</c:when><c:otherwise>
                                        <a href="${fila.radicado}" target="_blank" class="btn btn-success">Abrir</a>
                                    </c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.nombre_evaluador}">Sin gestionar</c:when><c:otherwise>${fila.nombre_evaluador}</c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.calificacion_evaluador}">Sin gestionar</c:when><c:otherwise>${fila.calificacion_evaluador}</c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.estado_final}">Sin gestionar</c:when><c:otherwise>${fila.estado_final}</c:otherwise></c:choose></td>
                                    <td><c:choose><c:when test="${empty fila.radicado_comite}">Sin gestionar</c:when><c:otherwise>
                                        <a href="${fila.radicado_comite}" target="_blank" class="btn btn-success">Abrir</a>
                                    </c:otherwise></c:choose></td>
                                    
                                </tr>
                            </c:forEach>
                    </tbody>
                </table>

                <p>Ingrese Director y Evaluador a los proyectos</p>
                <a href="DirectoryEvaluador.jsp" class="btn btn-outline-secondary btn-custom">Gestionar</a>

                 <p>Ingrese el estado final y el radicado del comite</p>
                <a href="CalificacionFinal.jsp" class="btn btn-outline-secondary btn-custom mt-1">Gestionar</a>

                <p>Cambie el radicado del comite y estado final</p>
                <a href="CambiarCalificacion3.jsp" class="btn btn-outline-secondary btn-custom mt-1">Editar</a>

                <p>Ver Historial de Anteproyectos</p>
                <a href="VerAnteproyectos.jsp" class="btn btn-outline-secondary btn-custom mt-1">Historial</a>

            </div>
       
    </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>

