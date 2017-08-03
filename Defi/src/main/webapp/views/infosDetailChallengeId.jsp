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
		  <button type="button" class="close quitterInfosChallengeAbc" data-dismiss="modal">&times;</button>
		  <h2>LES DETAILS DE VOS JEUX EN ABC CHALLENGE</h2>
		  <button class="btn-success quitterInfosChallengeAbc">QUITTER</button><br>
		</div>
		<div id="infoPublicationChallenge">
		</div>
			<div class="modal-body">
 				 <div>
						<table class="table table-bordered table-striped table-condensed" style="text-align: center;">
								<thead>
									<tr class="success">
										<th>Le Jeu</th>
										<th colspan="6">Moi</th>
										<th colspan="7">Ami</th>
										<th rowspan="2">Publier</th>
									</tr>
									<tr class="danger">
										<th>Lettre</th>
										<th>Date</th>
										<th>Temps Res</th>
										<th>Score</th>
										<th>Pays</th>
										<th>Capit</th>
										<th>Nobels</th>
										<th>Nom</th>
										<th>Date</th>
										<th>Temps Res</th>
										<th>Score</th>
										<th>Pays</th>
										<th>Capi</th>
										<th>Nobels</th>
									</tr>
								</thead>
								<tbody>
									<%-- <c:forEach items="${gm.mesChallengesJoues }" var="cha"> --%>
										<tr>
											<td><c:out value="${challengellenge.lettre }"></c:out></td>
											<td><c:out value="${challengellenge.dateString }"></c:out></td>
											<td><c:out value="${challenge.tempsRestant }"></c:out></td>
											<td><c:out value="${challenge.score }"></c:out>/<c:out value="${challenge.scoreMax }"></c:out></td>
											<td>
												<c:forEach items="${challenge.pays }" var="pays">
													<c:out value="${pays}"></c:out><br>
												</c:forEach>
											</td>
											<td>
												<c:forEach items="${challenge.capitale }" var="capi">
													<c:out value="${capi}"></c:out><br>
												</c:forEach>
											</td>
											<td>
												<c:forEach items="${challenge.nobel }" var="pays">
													<c:out value="${pays}"></c:out><br>
												</c:forEach>
											</td>
											<td><c:out value="${challenge.monFriend.nom }"></c:out></td>
											<td><c:out value="${challenge.dateStringAmi }"></c:out></td>
											<td><c:out value="${challenge.tempsRestantAmi }"></c:out></td>
											<td><c:out value="${challenge.scoreAmi }"></c:out>/<c:out value="${challenge.scoreMax }"></c:out></td>											
											<td>
												<c:forEach items="${challenge.paysAmi }" var="pays">
													<c:out value="${pays}"></c:out><br>
												</c:forEach>
											</td>
											<td>
												<c:forEach items="${challenge.capitaleAmi }" var="capi">
													<c:out value="${capi}"></c:out><br>
												</c:forEach>
											</td>
											<td>
												<c:forEach items="${challenge.nobelAmi }" var="pays">
													<c:out value="${pays}"></c:out><br>
												</c:forEach>
											</td>
											<td>PUB</td>
										</tr>
									<%-- </c:forEach> --%>	
								</tbody>
							</table>	
					</div>
				</div>
					<script type="text/javascript">
					$(function(){
						$('.quitterInfosChallengeAbc')
						.click(function(){
							 location = "http://localhost:8080/abcChallengeHome";
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