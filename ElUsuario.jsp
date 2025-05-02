<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<c:set var="id" value="${param.id}" />

<!-- Primero obtenemos el rol del usuario -->
<sql:query dataSource="${sistema}" var="resultado">
    SELECT roles.id 
    FROM usuarios 
    INNER JOIN roles ON usuarios.rol_id = roles.id 
    WHERE usuarios.id = ?
    <sql:param value="${id}" />
</sql:query>

<c:set var="rolUsuario" value="${resultado.rows[0].id}" />

<!-- Obtenemos ID del estudiante (si aplica) -->
<sql:query dataSource="${sistema}" var="resultado2">
    SELECT estudiantes.id 
    FROM estudiantes 
    WHERE usuario_id = ?
    <sql:param value="${id}" />
</sql:query>

<c:set var="idestudiante" value="${resultado2.rows[0].id}" />

<!-- Obtenemos ID del profesor (si aplica) -->
<sql:query dataSource="${sistema}" var="resultado5">
    SELECT profesores.id 
    FROM profesores 
    WHERE usuario_id = ?
    <sql:param value="${id}" />
</sql:query>

<c:set var="idprofesor" value="${resultado5.rows[0].id}" />

<!-- Eliminamos de tabla correspondiente según el rol -->
<c:choose>
    

    <c:when test="${rolUsuario == 3 || rolUsuario == 4}">
        <sql:update dataSource="${sistema}">
            DELETE FROM estudiantes WHERE id = ?
            <sql:param value="${idestudiante}" />
        </sql:update>
    </c:when>

    <c:when test="${rolUsuario == 5}">
        <sql:update dataSource="${sistema}">
            DELETE FROM profesores WHERE id = ?
            <sql:param value="${idprofesor}" />
        </sql:update>
    </c:when>
</c:choose>

<!-- Finalmente eliminamos al usuario -->
<sql:update dataSource="${sistema}">
    DELETE FROM usuarios WHERE id = ?
    <sql:param value="${id}" />
</sql:update>

<!-- Redirección -->
<c:redirect url="EliminarUsuario.jsp" />