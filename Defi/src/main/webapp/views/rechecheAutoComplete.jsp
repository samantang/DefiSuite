
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${nbAmis == 0 }">
	<% out.print("no"); %>
	</c:when>
	<c:otherwise>
		<c:forEach items="${mesAmisLike}" var="ami">
			<img style="margin-left: 10px;" alt="" src="photoUser?id=${ami.id }" height="30px" width="30px">&nbsp;
			<a href="amiProfile?id=${ami.id}"><c:out value="${ami.prenom }"/>&nbsp;<c:out value="${ami.nom }"/></a>
			
			<br><hr>
		</c:forEach>
	</c:otherwise>
</c:choose>
