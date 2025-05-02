<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>


<c:set var="correo" value="${param.usuario}" />
<c:set var="password" value="${param.password}" />

<sql:query var="datosUsuario" dataSource="${sistema}">
    SELECT * FROM usuarios WHERE correo = ? AND contrasena = ?
    <sql:param value="${correo}" />
    <sql:param value="${password}" />
</sql:query>

<c:if test="${not empty datosUsuario.rows}">
    <c:set var="usuario" value="${datosUsuario.rows[0]}" />
    <c:set var="idUsuario" value="${usuario.id}" />
    <c:set var="rolUsuario" value="${usuario.rol_id}" />

    <c:set var="usuario" value="${usuario.correo}" scope="session" />
    <c:set var="rol" value="${rolUsuario}" scope="session" />
    <c:set var="id" value="${idUsuario}" scope="session" />

    <c:redirect url="PaginaPrincipal.jsp" />
</c:if>

<c:if test="${empty datosUsuario.rows}">
    <script>
        alert("Correo o contraseña incorrectos.");
        window.location.href = "index.jsp";
    </script>
</c:if>

