<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">
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
		  <h2>LES DETAILS DE VOS JEUX EN DICO SOLO</h2>
		  <button class="btn-success quitterInfosSoloDico">QUITTER</button><br>
		</div>
		<div id="infoPublicationSolo">
		</div>
			<div class="modal-body">
 				 <div>
						<table id="tableauDataTable" class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th>Date</th>
									<th>Lettre</th>
									<th>Mot</th>
									<th>Temps Restant</th>
									<th>Score</th>
									<th>Score Max</th>
									<th>Aide</th>
									<th>NB Erreurs</th>
									<th>Etat</th>
									<th>Publier</th>
									<th>Supprimer</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${penduModel.mesDicoSolo }" var="solo">
									<tr>
										<td>${solo.dateString }</td>
										<td>${solo.lettreString }</td>
										<td>${solo.mot }</td>
										<td>${solo.tempsRestant } <em>secondes</em></td>
										<td>${solo.score }</td>
										<td>${solo.scoreMax }</td>
										<td>
											<c:choose>
												<c:when test="${solo.aide ==true }">
													OUI
												</c:when>
												<c:otherwise>
													NON
												</c:otherwise>
											</c:choose>	
										</td>
										<td>${solo.nbErreurs }</td>
										<td>
											<c:choose>
												<c:when test="${solo.publie ==true }">
													<em style="color: green;">Publié</em>
												</c:when>
												<c:otherwise>
													Non Publié
												</c:otherwise>
											</c:choose>	
										</td>
										<td>
											<c:choose>
												<c:when test="${solo.publie == true }">
													<button class="btn btn-danger">
														<span>Publié</span>
													</button>
												</c:when>
												<c:otherwise>
													<button id="${solo.id}" onclick="publierUnSolo(this,${solo.id} )"  class="btn btn-primary" >
											        	<span class="glyphicon glyphicon-share"></span>
											     	 </button>
												</c:otherwise>
											</c:choose>
										</td>
										<td><a href="#">Supprimer</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
					<script type="text/javascript">
						function publierUnSolo(lui, id){
							lui.disabled='true';
							var param = 'idSolo='+id+'';
							$("#infoPublicationSolo").load("infoPublicationSolo", param);
						};
						$(function(){
							$('.quitterInfosSoloDico').click(function(){
								location ='http://localhost:8080/penduSoloDico';
							})
						});
						
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