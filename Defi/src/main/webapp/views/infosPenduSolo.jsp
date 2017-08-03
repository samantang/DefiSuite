<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PENDU SOLO</title>
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
    height: 450px;
    overflow-y: auto;
    overflow-x: auto;
}
</style>
</head>
<body>
		<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h2>LES DETAILS DE VOS JEUX</h2>
  
</div>
<div class="modal-body">
  <div>
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
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
								<c:forEach items="${gm.mesSolos }" var="solo">
									<tr>
										<td>${solo.date }</td>
										<td>${solo.lettre }</td>
										<td>${solo.help }</td>
										<td>${solo.time }</td>
										<td>${solo.score }</td>
										<td><a href="publierSolo?id=${solo.id}">pub</a></td>
										<td><a href="suprimerSolo?id=${solo.id}">sup</a></td>
										<td>
											<c:forEach items="${solo.abcsolojeux.agglo}" var="agglo">
												${agglo}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.pays}" var="pays">
												${pays}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.capitale}" var="capitale">
												${capitale}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.nobel}" var="nobel">
												${nobel}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.artiste}" var="artiste">
												${artiste}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.president}" var="president">
												${president}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.aPresident}" var="apresident">
												${apresident}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.ville}" var="ville">
												${ville}<br>
											</c:forEach>
										</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
</div>
</body>
</html>