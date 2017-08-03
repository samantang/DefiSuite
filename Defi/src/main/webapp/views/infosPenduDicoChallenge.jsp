<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">
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
		  <h2>LES DETAILS DE VOS JEUX EN DICO CHALLENGE</h2>
		  
		  <button class="btn-success quitterInfos">QUITTER</button>
		</div>
		<div id="infoPublicationChallenge">
		</div>
			<div class="modal-body">
 				 <div>
						<table id="tableauDataTable" class="table table-bordered table-striped table-condensed" style="text-align: center;">
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
									<c:forEach items="${penduModel.mesChallengesDico }" var="pendu">
										<tr>
											<td><c:out value="${pendu.mot }"></c:out></td>
											<td><c:out value="${pendu.lettreString }"></c:out></td>
											<td><c:out value="${pendu.dateString }"></c:out></td>
											<td><c:out value="${pendu.score }"></c:out>/<c:out value="${pendu.scoreMax }"></c:out></td>
											<td><c:out value="${pendu.tempsRestantMoi }"></c:out></td>
											<td><c:out value="${pendu.nbErreurs }"></c:out></td>
											<td><a href="voirAmi?id=${pendu.monFriend.id }"><c:out value="${pendu.monFriend.nom }"/>&nbsp;<c:out value="${pendu.monFriend.prenom }"/></a></td>
											<c:choose>
												<c:when test="${pendu.dateStringAmi == null }">
													<td>pas joué</td>
													<td>pas joué</td>
													<td>pas joué</td>
													<td>pas joué</td>
												</c:when>
												<c:otherwise>
													<td><c:out value="${pendu.dateStringAmi }"></c:out></td>
													<td><c:out value="${pendu.scoreAmi }"></c:out>/<c:out value="${pendu.scoreMax }"></c:out></td>
													<td><c:out value="${pendu.tempsRestantAmi }"></c:out></td>
													<td><c:out value="${pendu.nbErreursAmi }"></c:out></td>
												</c:otherwise>
											</c:choose>
											<td>
												<c:choose>
													<c:when test="${pendu.publie == true }">
														<em style="color: green;">publié</em>
													</c:when>
													<c:otherwise>
														<button id="${pendu.id}" onclick="publierUnDicoChallenge(this,${pendu.id} )"  class="btn btn-primary" >
											        		<span class="glyphicon glyphicon-share"></span>
											        	</button>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>	
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
						function publierUnDicoChallenge(lui, id){
							lui.disabled='true';
							var param = 'idChallenge='+id+'';
							$("#infoPublicationChallenge").load("publierDicoChallengeEtInfos", param);
						};
						$(document).ready(function() {
						    $('#tableauDataTable').DataTable({
						    	"language": {
						    		"sProcessing": "Traitement en cours...",
						    		"sSearch": "Rechercher&nbsp;:",
						    		"sLengthMenu": "Afficher _MENU_ &eacute;l&eacute;ments",
						    		"sInfo": "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
						    		"sInfoEmpty": "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
						    		"sInfoFiltered": "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
						    		"sInfoPostFix": "",
						    		"sLoadingRecords": "Chargement en cours...",
						    		"sZeroRecords": "Aucun &eacute;l&eacute;ment &agrave; afficher",
						    		"sEmptyTable": "Aucune donn&eacute;e disponible dans le tableau",
						    		"oPaginate": {
						    		"sFirst": "Premier",
						    		"sPrevious": "Pr&eacute;c&eacute;dent",
						    		"sNext": "Suivant",
						    		"sLast": "Dernier"
						    		},
						    		"oAria": {
						    		"sSortAscending": ": activer pour trier la colonne par ordre croissant",
						    		"sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
						    		}
						    		}
						    });
						    
						} );
						</script>
		<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
		<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
	</body>
</html>