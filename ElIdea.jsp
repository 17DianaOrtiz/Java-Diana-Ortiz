<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<c:set var="id" value="${param.id}" />

<sql:update dataSource="${sistema}" var="resultado">
   DELETE FROM idea WHERE id = ?
   <sql:param value="${id}" />
</sql:update>


<c:redirect url="EliminarIdea.jsp" />

