<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="/WEB-INF/jspf/conexion.jspf" %>




    <sql:update var="updateResult" dataSource="${sistema}">
        UPDATE usuarios 
        SET nombre = ?, correo = ?, contrasena = ?, rol_id = ?
        WHERE id = ?
        <sql:param value="${param.nombre}" />
        <sql:param value="${param.correo}" />
        <sql:param value="${param.contrasena}" />
        <sql:param value="${param.rol}" />
        <sql:param value="${param.id3}" />
    </sql:update>



<!-- Insertar en tabla según rol -->
<c:choose>
    <c:when test="${param.rol == '3' || param.rol == '4'}">
        <sql:update dataSource="${sistema}">

            UPDATE profesores 
            SET especialidad = ?
            WHERE usuario_id = ?
         
            <sql:param value="${param.especialidad}" />
            <sql:param value="${param.id3}" />
            
           
        </sql:update>
    </c:when>
    <c:when test="${param.rol == '5'}">
        <sql:update dataSource="${sistema}">

           UPDATE estudiantes 
            SET carrera = ?, semestre = ?
            WHERE usuario_id = ?
           
            <sql:param value="${param.carrera}" />
            <sql:param value="${param.semestre}" />
            <sql:param value="${param.id3}" />
            
        </sql:update>
    </c:when>
</c:choose>

    <c:redirect url="ActualizarUsuario.jsp" />


