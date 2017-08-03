<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:forEach items="${amisAccepterDemande }" var="ami">
	<p>les amis à accepter</p>
	<div>
		<p><c:out value="${ami.nom }"></c:out> &nbsp;
		<c:out value="${ami.prenom }"></c:out></p>
		<p><a href="accepterChallenge?id=${ami.id}">accepter</a>&nbsp;<a href="refuserChallenge?id=${ami.id}">refuser</a></p>
	</div><hr>
</c:forEach>

<c:forEach items="${amisJouerAvec }" var="ami">
		<p>les amis à jouer avec
	<div>
		<p><c:out value="${ami.nom }"></c:out> &nbsp;
		<c:out value="${ami.prenom }"></c:out></p>
		<p><a href="jouerChallenge?id=${ami.id}">accepter</a>&nbsp;&nbsp;<a href="annulerChallenge?id=${ami.id}">Annuler</a></p>
	</div><hr>
</c:forEach>