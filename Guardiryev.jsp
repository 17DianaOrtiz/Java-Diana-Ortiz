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
<c:set var="idProyecto" value="${param.id}" />
<c:set var="idDirector" value="${param.director}" />
<c:set var="idEvaluador" value="${param.evaluador}" />

<!-- Actualizar el proyecto -->
<sql:update dataSource="${sistema}">
    UPDATE proyectos 
    SET id_director = ?, id_evaluador = ?
    WHERE id = ?
    <sql:param value="${idDirector}" />
    <sql:param value="${idEvaluador}" />
    <sql:param value="${idProyecto}" />
</sql:update>

<!-- Redireccionar o mostrar mensaje -->
<c:redirect url="DirectoryEvaluador.jsp" />