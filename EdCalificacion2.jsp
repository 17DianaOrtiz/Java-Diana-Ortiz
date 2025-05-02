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

<c:set var="idproyecto" value="${param.id}" />
<c:set var="calificacion" value="${param.opcion}" />


<sql:update dataSource="${sistema}">
    UPDATE proyectos 
    SET calificacion_evaluador = ?
    WHERE id = ?
    <sql:param value="${calificacion}" />
    <sql:param value="${idproyecto}" />
</sql:update>

<!-- Redireccionar o mostrar mensaje -->
<c:redirect url="CambiarCalificacion2.jsp" />