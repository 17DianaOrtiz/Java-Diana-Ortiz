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

<c:set var="docente" value="${param.idea}" />
<c:set var="titulo" value="${param.titulo}" />
<c:set var="descripcion" value="${param.descripcion}" />
<c:set var="area" value="${param.area}" />
<c:set var="enlace" value="${param.enlace}" />

<sql:query dataSource="${sistema}" var="idUser">
    SELECT id FROM usuarios WHERE correo = ?
    <sql:param value="${sessionScope.usuario}" />
</sql:query>

<c:set var="idUsuario" value="${idUser.rows[0].id}" />

<sql:update dataSource="${sistema}">
    INSERT INTO idea (id_usuario, titulo, descripcion, area, enlace)
    VALUES (?, ?, ?, ?, ?)
    <sql:param value="${idUsuario}" />
    <sql:param value="${titulo}" />
    <sql:param value="${descripcion}" />
    <sql:param value="${area}" />
    <sql:param value="${enlace}" />
</sql:update>



<c:redirect url="GuardarIdea.jsp" />