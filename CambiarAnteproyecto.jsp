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

<!-- Recoger los parámetros del formulario -->
<c:set var="idproyecto" value="${param.id}" />
<c:set var="enlace" value="${param.enlace}" />

<sql:update dataSource="${sistema}">
    INSERT INTO anteproyectos (id_proyecto, enlace)
    VALUES (?, ?)
    <sql:param value="${idproyecto}" />
    <sql:param value="${enlace}" />
</sql:update>

<sql:query dataSource="${sistema}" var="anteproyectoReciente">
    SELECT id FROM anteproyectos
    WHERE id_proyecto = ?
    ORDER BY id DESC
    LIMIT 1
    <sql:param value="${idproyecto}" />
</sql:query>

<c:set var="idAnteproyecto" value="${anteproyectoReciente.rows[0].id}" />

<!-- Actualizar el proyecto -->
<sql:update dataSource="${sistema}">
    UPDATE proyectos 
    SET id_anteproyecto = ?
    WHERE id = ?
    <sql:param value="${idAnteproyecto}" />
    <sql:param value="${idproyecto}" />
</sql:update>

<!-- Redireccionar o mostrar mensaje -->
<c:redirect url="EditarAnteproyecto.jsp" />