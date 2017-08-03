
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${nDemadesAacceter == 0 }">
		<% out.print("no"); %>
	</c:when>
	<c:otherwise>
		<c:forEach items="${amisAccepterDemande }" var="ami"><br><hr>
			<c:out value="${ami.nom }"></c:out> &nbsp;&nbsp;<c:out value="${ami.prenom }"></c:out>&nbsp;&nbsp;&nbsp;
			<a href="accepteChallenge?idAmi=${ami.id}">Accepter</a>&nbsp;&nbsp;
			<a href="refuseChallege?idAmi=${ami.id}">Refuser</a><br>
		</c:forEach>
	</c:otherwise>
</c:choose>
