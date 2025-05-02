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
<c:set var="enlaceradicado" value="${param.enlace}" />


<sql:update dataSource="${sistema}">
    UPDATE proyectos 
    SET estado_final = ?, radicado_comite = ?
    WHERE id = ?
    <sql:param value="${calificacion}" />
    <sql:param value="${enlaceradicado}" />
    <sql:param value="${idproyecto}" />
</sql:update>


<c:redirect url="CalificacionFinal.jsp" />