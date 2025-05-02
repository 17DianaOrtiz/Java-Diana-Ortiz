<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<%
    request.setCharacterEncoding("UTF-8");
%>


<c:set var="nombre" value="${param.nombre}" />
<c:set var="correo" value="${param.correo}" />
<c:set var="contrasena" value="${param.contrasena}" />
<c:set var="rol" value="${param.rol}" />
<c:set var="especialidad" value="${param.especialidad}" />
<c:set var="carrera" value="${param.carrera}" />
<c:set var="semestre" value="${param.semestre}" />

<!-- Insertar en la tabla usuarios -->
<sql:update dataSource="${sistema}" var="resultado">
    INSERT INTO usuarios (nombre, correo, contrasena, rol_id)
    VALUES (?, ?, ?, ?)
    <sql:param value="${nombre}" />
    <sql:param value="${correo}" />
    <sql:param value="${contrasena}" />
    <sql:param value="${rol}" />
</sql:update>

<!-- Obtener el ID buscando por correo -->
<sql:query dataSource="${sistema}" var="idUser">
    SELECT id FROM usuarios WHERE correo = ?
    <sql:param value="${correo}" />
</sql:query>
<c:set var="idUsuario" value="${idUser.rows[0].id}" />


<!-- Insertar en tabla según rol -->
<c:choose>
    <c:when test="${rol == '3' || rol == '4'}">
        <sql:update dataSource="${sistema}">
            INSERT INTO profesores (usuario_id, especialidad)
            VALUES (?, ?)
            <sql:param value="${idUsuario}" />
            <sql:param value="${especialidad}" />
        </sql:update>
    </c:when>
    <c:when test="${rol == '5'}">
        <sql:update dataSource="${sistema}">
            INSERT INTO estudiantes (usuario_id, carrera, semestre)
            VALUES (?, ?, ?)
            <sql:param value="${idUsuario}" />
            <sql:param value="${carrera}" />
            <sql:param value="${semestre}" />
        </sql:update>
    </c:when>
</c:choose>

<c:redirect url="RegistrarUsuario.jsp" />