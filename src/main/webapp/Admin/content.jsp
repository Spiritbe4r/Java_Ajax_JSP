<%-- 
    Document   : content
    Created on : 27 dic. 2020, 09:40:56
    Author     : ronal
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% request.setAttribute("action",request.getParameter("page")); %>

<c:choose>
    <c:when test="${action eq 'products'}">
        <jsp:include page='page/products.jsp'/>
    </c:when>
    <c:otherwise>
    <jsp:include page="page/dashboard.jsp"/>
    
</c:otherwise>
</c:choose>

