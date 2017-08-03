<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<h4>Les Pays</h4>
	 		<div>
	 			<p> Le Pays qui était <c:out value="${motCompletPays}"></c:out></p>
	 			<p> La lettre d'indication était <c:out value="${lettreCharPays }"></c:out> </p>
	 			<p>Vous avez gagnez pour ce sujet un Total de  <c:out value="${ pointsPays}"></c:out> Points Sur <c:out value="${ pointsMaxPays}"></c:out> Possibles </p>
	 			<p> Pour ce Sujet vous avez fait <c:out value="${ nbErreursPays}"></c:out> erreurs.
	 		</div><hr><br>
	 		<h4>Les Capitales</h4>
	 		<div>
	 			<p> Le Capitales qui était <c:out value="${motCompletCapitales}"></c:out></p>
	 			<p> La lettre d'indication était <c:out value="${lettreCharCapitales }"></c:out> </p>
	 			<p>Vous avez gagnez pour ce sujet un Total de  <c:out value="${ pointsCapitales}"></c:out> Points Sur <c:out value="${ pointsMaxCapitales}"></c:out> Possibles </p>
	 			<p> Pour ce Sujet vous avez fait <c:out value="${ nbErreursCapitales}"></c:out> erreurs.
	 		</div><hr><br>
	 		<h4>Les Nobels</h4>
	 		<div>
	 			<p> Le Nobels qui était <c:out value="${motCompletNobels}"></c:out></p>
	 			<p> La lettre d'indication était <c:out value="${lettreCharNobels }"></c:out> </p>
	 			<p>Vous avez gagnez pour ce sujet un Total de  <c:out value="${ pointsNobels}"></c:out> Points Sur <c:out value="${ pointsMaxNobels}"></c:out> Possibles </p>
	 			<p> Pour ce Sujet vous avez fait <c:out value="${ nbErreursNobels}"></c:out> erreurs.
	 		</div>	<hr><br>
	 		<h4>Les Artistes</h4>
	 		<div>
	 			<p> Le Artistes qui était <c:out value="${motCompletArtistes}"></c:out></p>
	 			<p> La lettre d'indication était <c:out value="${lettreCharArtistes }"></c:out> </p>
	 			<p>Vous avez gagnez pour ce sujet un Total de  <c:out value="${ pointsArtistes}"></c:out> Points Sur <c:out value="${ pointsMaxArtistes}"></c:out> Possibles </p>
	 			<p> Pour ce Sujet vous avez fait <c:out value="${ nbErreursArtistes}"></c:out> erreurs.
	 		</div>	<hr><br>
	 		<h4>Les Presidents</h4>
	 		<div>
	 			<p> Le Presidents qui était <c:out value="${motCompletPresidents}"></c:out></p>
	 			<p> La lettre d'indication était <c:out value="${lettreCharPresidents }"></c:out> </p>
	 			<p>Vous avez gagnez pour ce sujet un Total de  <c:out value="${ pointsPresidents}"></c:out> Points Sur <c:out value="${ pointsMaxPresidents}"></c:out> Possibles </p>
	 			<p> Pour ce Sujet vous avez fait <c:out value="${ nbErreursPresidents}"></c:out> erreurs.
	 		</div>	 
		</div>

</body>
</html>