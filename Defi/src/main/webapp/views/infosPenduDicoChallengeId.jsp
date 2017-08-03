<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PENDU DICO CHALLENGE</title>
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
		  <button type="button" class="close quitterInfos" data-dismiss="modal">&times;</button>
		  <h2>LES DETAILS DU  JEU</h2>
		  <button class="btn-success quitterInfos">QUITTER</button>
		</div>
		<div id="infoPublicationChallenge">
		</div>
			<div class="modal-body">
 				 <div>
						<table class="table table-bordered table-striped table-condensed" style="text-align: center;">
								<thead>
									<tr class="success">
										<th colspan="2">Le Jeu</th>
										<th colspan="4">Moi</th>
										<th colspan="5">Ami</th>
										<th rowspan="2">Publier</th>
									</tr>
									<tr>
										
										<th>Mot</th>
										<th>Lettre</th>
										<th>Date</th>
										<th>Score</th>
										<th>Temps Res</th>
										<th>NB Err</th>
										<th>Nom</th>
										<th>Date</th>
										<th>Score</th>
										<th>Temps Res</th>
										<th>NB Err</th>
										<!-- <th>Publier</th> -->
									</tr>
								</thead>
								<tbody>
									<%-- <c:forEach items="${challenge }" var="pendu"> --%>
										<tr>
											<td><c:out value="${challenge.mot }"></c:out></td>
											<td><c:out value="${challenge.lettreString }"></c:out></td>
											<td><c:out value="${challenge.dateString }"></c:out></td>
											<td><c:out value="${challenge.score }"></c:out>/<c:out value="${challenge.scoreMax }"></c:out></td>
											<td><c:out value="${challenge.tempsRestantMoi }"></c:out></td>
											<td><c:out value="${challenge.nbErreurs }"></c:out></td>
											<td><a href="voirAmi?id=${challenge.monFriend.id }"><c:out value="${challenge.monFriend.nom }"/>&nbsp;<c:out value="${challenge.monFriend.prenom }"/></a></td>
											<c:choose>
												<c:when test="${challenge.dateStringAmi == null }">
													<td>pas joué</td>
													<td>pas joué</td>
													<td>pas joué</td>
													<td>pas joué</td>
												</c:when>
												<c:otherwise>
													<td><c:out value="${challenge.dateStringAmi }"></c:out></td>
													<td><c:out value="${challenge.scoreAmi }"></c:out>/<c:out value="${challenge.scoreMax }"></c:out></td>
													<td><c:out value="${challenge.tempsRestantAmi }"></c:out></td>
													<td><c:out value="${challenge.nbErreursAmi }"></c:out></td>
												</c:otherwise>
											</c:choose>
											<td>
												<c:choose>
													<c:when test="${challenge.dateStringAmi == null }">
														<button class="btn btn-danger">
															<span class="glyphicon glyphicon-ban-circle"></span>
														</button>
													</c:when>
													<c:when test="${challenge.publie == true }">
														<em style="color: green;">publié</em>
													</c:when>
													<c:otherwise>
														<button id="${challenge.id}" onclick="publierUnChallenge(this,${challenge.id} )"  class="btn btn-primary" >
											        		<span class="glyphicon glyphicon-share"></span>
											        	</button>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									<%-- </c:forEach>	 --%>
								</tbody>
							</table>	
					</div>
				</div>
					<script type="text/javascript">
					$(function (){
						$('.quitterInfos').click(function(){
							location = 'http://localhost:8080/penduChallengeDico';
						})
					});
					function publierUnChallenge(lui, id){
						lui.disabled='true';
						var param = 'idChallenge='+id+'';
					//	alert(id);
						$("#infoPublicationChallenge").load("publierDicoChallengeEtInfos", param);
					};
						</script>
	</body>
</html>