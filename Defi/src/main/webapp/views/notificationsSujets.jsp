
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:choose>
	<c:when test="${nbNotificationsSujets == 0 }">
	<% out.print("no"); %>
	</c:when>
	<c:otherwise>
		<c:if test="${not empty mesChallengesRecus}">
			<br>
			<p style="margin-left: 10px; margin-right: 10px;">LES CHALLENGES A ACCEPTER POUR SUJETS</p>
			<c:forEach items="${mesChallengesRecus }" var="ami"><br><hr>
				<img style="margin-left: 10px;" alt="" src="photoUser?id=${ami.id }" height="30px" width="30px">&nbsp;
				<c:out value="${ami.nom }"></c:out> &nbsp;&nbsp;<c:out value="${ami.prenom }"></c:out>&nbsp;&nbsp;
				<a href="accepteChallenge?idAmi=${ami.id}">Accepter</a>&nbsp;&nbsp;
				<a href="refuseChallege?idAmi=${ami.id}">Refuser</a><br>
			</c:forEach>
		</c:if><hr>
		<c:if test="${ not empty challengesEnAttentes}">
			<p style="margin-left: 10px; margin-right: 10px;">LES CHALLENGES A JOUES POUR SUJETS</p>
			<c:forEach items="${challengesEnAttentes }" var="ami"><hr>
				<img style="margin-left: 10px;" alt="" src="photoUser?id=${ami.id }" height="30px" width="30px">&nbsp;
				<c:out value="${ami.nom }"></c:out> &nbsp;&nbsp;<c:out value="${ami.prenom }"></c:out>&nbsp;&nbsp;
				<a href="jouerChallenge?idAmi=${ami.id}">JOUER</a><br>
			</c:forEach>
		</c:if><hr>
	</c:otherwise>
</c:choose>
