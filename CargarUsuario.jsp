<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<c:set var="id" value="${param.id}" />

<sql:query var="datosUsuario" dataSource="${sistema}">
    SELECT p.id, p.nombre, p.correo, p.contrasena, p.rol_id, es.semestre, es.carrera , pr.especialidad 
    FROM usuarios p LEFT join estudiantes es on es.usuario_id = p.id LEFT join profesores pr on pr.usuario_id = p.id 
    WHERE p.id = ?
    <sql:param value="${param.id}" />
</sql:query>

<c:if test="${not empty datosUsuario.rows}">
    <c:set var="usuario" value="${datosUsuario.rows[0]}" />
</c:if>

<c:redirect url="ActualizarUsuario.jsp">
    <c:param name="id2" value="${usuario.id}" />
    <c:param name="nombre" value="${usuario.nombre}" />
    <c:param name="correo" value="${usuario.correo}" />
    <c:param name="contrasena" value="${usuario.contrasena}" />
    <c:param name="rol" value="${usuario.rol_id}" />
    <c:param name="especialidad" value="${usuario.especialidad}" /> 
    <c:param name="carrera" value="${usuario.carrera}" /> 
    <c:param name="semestre" value="${usuario.semestre}" /> 
</c:redirect>

