
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:choose>
<c:when test="${nAmisJouerAvec == 0 }">
<% out.print("no"); %>
Pas de Challenge
</c:when>
<c:otherwise>
<c:forEach items="${amisJouerAvec }" var="ami"><br><hr>
<c:out value="${ami.nom }"></c:out> &nbsp;&nbsp;<c:out value="${ami.prenom }"></c:out>&nbsp;&nbsp;&nbsp;
<a href="accepterChallege?idAmi=${ami.id}">Accepter</a>&nbsp;&nbsp;
<a href="refuserChallege?idAmi=${ami.id}">Refuser</a>
</c:forEach>
</c:otherwise>
</c:choose>
