<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="/WEB-INF/jspf/conexion.jspf" %>

<sql:query var="rolNombre" dataSource="${sistema}">
    SELECT nombre FROM roles WHERE id = ?
    <sql:param value="${sessionScope.rol}" />
</sql:query>

<sql:query var="IdeaSeleccionada" dataSource="${sistema}">
    SELECT id FROM usuarios WHERE correo = ?
   <sql:param value="${sessionScope.usuario}" />
</sql:query>

<sql:update var="updateResult" dataSource="${sistema}">
    UPDATE idea 
    SET  id_usuario= ?, titulo = ?, descripcion = ?, area = ?, enlace = ?
    WHERE id = ?
    <sql:param value="${IdeaSeleccionada.rows[0].id}" />
    <sql:param value="${param.titulo}" />
    <sql:param value="${param.descripcion}" />
    <sql:param value="${param.area}" />
    <sql:param value="${param.enlace}" />
    
    <sql:param value="${param.id3}" />
</sql:update>


<c:redirect url="ActualizarIdea.jsp" />
