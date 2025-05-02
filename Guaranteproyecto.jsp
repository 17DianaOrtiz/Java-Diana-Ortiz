<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<%
    request.setCharacterEncoding("UTF-8");
%>
<sql:query var="rolNombre" dataSource="${sistema}">
    SELECT nombre FROM roles WHERE id = ?
    <sql:param value="${sessionScope.rol}" />
</sql:query>

<c:set var="idIdea" value="${param.idea}" />
<c:set var="enlaceAnteproyecto" value="${param.enlace}" />
<c:set var="pago" value="${param.pago}" />
<c:set var="est2" value="${param.estudiante2}" />

<!-- Obtener ID del estudiante logueado -->
<sql:query dataSource="${sistema}" var="datosEstudiante">
    SELECT estudiantes.id 
    FROM estudiantes 
    INNER JOIN usuarios ON estudiantes.usuario_id = usuarios.id 
    WHERE usuarios.correo = ?
    <sql:param value="${sessionScope.usuario}" />
</sql:query>

<c:set var="idEstudiante" value="${datosEstudiante.rows[0].id}" />

<!-- Insertar nuevo proyecto (sin anteproyecto aún) -->
<sql:update dataSource="${sistema}">
    INSERT INTO proyectos (id_estudiante1, id_estudiante2, id_idea, pago)
    VALUES (?, ?, ?, ?)
    <sql:param value="${idEstudiante}" />
    <sql:param value="${est2}" />
    <sql:param value="${idIdea}" />
    <sql:param value="${pago}" />
</sql:update>

<!-- Obtener el ID del proyecto recién creado -->
<sql:query dataSource="${sistema}" var="proyectoReciente">
    SELECT id FROM proyectos
    WHERE id_estudiante1 = ? AND id_idea = ?
    ORDER BY id DESC
    LIMIT 1
    <sql:param value="${idEstudiante}" />
    <sql:param value="${idIdea}" />
</sql:query>

<c:set var="idProyecto" value="${proyectoReciente.rows[0].id}" />

<!-- Insertar el anteproyecto -->
<sql:update dataSource="${sistema}">
    INSERT INTO anteproyectos (id_proyecto, enlace)
    VALUES (?, ?)
    <sql:param value="${idProyecto}" />
    <sql:param value="${enlaceAnteproyecto}" />
</sql:update>

<!-- Obtener el ID del anteproyecto recién insertado -->
<sql:query dataSource="${sistema}" var="anteproyectoReciente">
    SELECT id FROM anteproyectos
    WHERE id_proyecto = ?
    ORDER BY id DESC
    LIMIT 1
    <sql:param value="${idProyecto}" />
</sql:query>

<c:set var="idAnteproyecto" value="${anteproyectoReciente.rows[0].id}" />

<!-- Actualizar el proyecto con el id_anteproyecto_actual -->
<sql:update dataSource="${sistema}">
    UPDATE proyectos
    SET id_anteproyecto = ?
    WHERE id = ?
    <sql:param value="${idAnteproyecto}" />
    <sql:param value="${idProyecto}" />
</sql:update>

<!-- Redirigir a alguna página -->
<c:redirect url="IndicarIdea.jsp" />