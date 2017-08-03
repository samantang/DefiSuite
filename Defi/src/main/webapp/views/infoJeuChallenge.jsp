<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Abc Solo</title>
<style type="text/css">
.modal-dialog {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.modal-content {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}
.modal-body{
    height: 650px;
    overflow-y: auto;
    overflow-x: auto;
}
</style>
</head>
<body>
		<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h1>Les détails de vos jeux en challenge</h1>
  
</div>
<div class="modal-body">
  <div>
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th>Joueur</th>
									<th>Date</th>
									<th>Lettre</th>
									<th>Aide</th>
									<th>Temps</th>
									<th>Score</th>
									<th>Publier</th>
									<th>Supprimer</th>
									<th>Agglos</th>
									<th>Pays</th>
									<th>Capitales</th>
									<th>Nobels</th>
									<th>Artistes</th>
									<th>Prési</th>
									<th>Ancien Prési</th>
									<th>Villes</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${mixChallenge }" var="cha">
									<tr>
										<c:choose>
											<c:when test="${cha.codeIndentification=='xxx' }">
												<td colspan="16">il n'a pas encore joué</td>
											</c:when>
											<c:otherwise>
											
										<td>${cha.friend.nom }</td>
										<td>${cha.date }</td>
										<td>${cha.lettre }</td>
										<td>${cha.help }</td>
										<td>${cha.time }</td>
										<td>${cha.score }</td>
										<td><a href="publierSolo?id=${cha.id}">pub</a></td>
										<td><a href="suprimerSolo?id=${cha.id}">sup</a></td>
										<td>
											<c:forEach items="${cha.agglo}" var="agglo">
												${agglo}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${cha.pays}" var="pays">
												${pays}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${cha.capitale}" var="capitale">
												${capitale}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${cha.nobel}" var="nobel">
												${nobel}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${cha.artiste}" var="artiste">
												${artiste}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${cha.president}" var="president">
												${president}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${cha.aPresident}" var="apresident">
												${apresident}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${cha.ville}" var="ville">
												${ville}<br>
											</c:forEach>
										</td>
										</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
</div>
</body>
</html>