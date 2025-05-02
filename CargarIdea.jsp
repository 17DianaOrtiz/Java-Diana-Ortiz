<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<c:set var="id" value="${param.id}" />

<sql:query var="datosidea" dataSource="${sistema}">
    SELECT  p.id, c.nombre, p.titulo, p.descripcion, p.area, p.enlace
    FROM idea p 
    INNER JOIN usuarios c ON p.id_usuario = c.id
    WHERE p.id = ?
    <sql:param value="${id}" />
</sql:query>

<c:if test="${not empty datosidea.rows}">
    <c:set var="idea" value="${datosidea.rows[0]}" />
</c:if>

<c:redirect url="ActualizarIdea.jsp">
    <c:param name="id2" value="${idea.id}" />
    <c:param name="nombre" value="${idea.nombre}" />
    <c:param name="titulo" value="${idea.titulo}" />
    <c:param name="descripcion" value="${idea.descripcion}" />
    <c:param name="area" value="${idea.area}" />
    <c:param name="enlace" value="${idea.enlace}" /> 
</c:redirect>