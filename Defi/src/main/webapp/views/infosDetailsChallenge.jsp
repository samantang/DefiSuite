<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">

<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ABC CHALLENGE</title>
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
    width: auto;
    overflow-y: auto;
    overflow-x: auto;
}

/* pour le resize de la table  */
table td {
    border: 1px;
    /* border-style: solid;
    border-color: black;
    background-color: green; */
    /* cursor: col-resize; */ 
}

table td.resizing {
    cursor: col-resize;
}

.noCrsr {
    cursor: default;
    margin-right: +5px;
}

.noSelect {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
</style>
</head>
<body>
		<div class="modal-header">
		  <button type="button" class="close quitterInfosChallengeAbc" data-dismiss="modal">&times;</button>
		  <h2>LES DETAILS DE VOS JEUX EN ABC CHALLENGE</h2>
		  <button class="btn-success quitterInfosChallengeAbc">QUITTER</button><br>
		  <div id="infoPublicationAbcChalleng"></div>
		</div>
		<div id="infoPublicationChallenge">
		</div>
			<div class="modal-body">
 				 <div>
						<table id="tableauDataTable" class="table table-bordered table-striped table-condensed">
								<thead>
									<tr class="success">
										<th>Le Jeu</th>
										<th colspan="9">Moi</th>
										<th colspan="10">Ami</th>
										<th rowspan="2">Publier</th>
									</tr>
									<tr class="danger">
										<th>Lettre</th>
										<th>Date</th>
										<th>bonus</th>
										<th>Score</th>
										<th>Pays</th>
										<th>Capit</th>
										<th>Nobel</th>
										
										<th>Arti</th>
										<th>Agglo</th>
										<th>Ville Fr</th>
										
										<th>Nom</th>
										<th>Date</th>
										<th>bonus</th>
										<th>Score</th>
										<th>Pays</th>
										<th>Capi</th>
										<th>Nobel</th>
										
										<th>Arti</th>
										<th>Agglo</th>
										<th>Ville Fr</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${gm.mesChallengesJoues }" var="cha">
										<tr style="ma">
											<td><c:out value="${cha.lettre }"></c:out></td>
											<td><c:out value="${cha.dateString }"></c:out></td>
											<td><c:out value="${cha.tempsRestant }"></c:out></td>
											<td><c:out value="${cha.score }"></c:out>/<c:out value="${cha.scoreMax }"></c:out></td>
											<td>
												<div style="overflow: auto; height: 60px">
													<c:forEach items="${cha.pays }" var="pays">
														<c:out value="${pays}"></c:out><br>
													</c:forEach>
												</div>
											</td>
											<td>
												<div style="overflow: auto; height: 60px">
													<c:forEach items="${cha.capitale }" var="capi">
														<c:out value="${capi}"></c:out><br>
													</c:forEach>
												</div>	
											</td>
											<td>
												<div style="overflow: auto; height: 60px">
													<c:forEach items="${cha.nobel }" var="pays">
														<c:out value="${pays}"></c:out><br>
													</c:forEach>
												</div>
											</td>											
											<td>
												<div style="overflow: auto; height: 60px">
													<c:forEach items="${cha.artiste }" var="pays">
														<c:out value="${pays}"></c:out><br>
													</c:forEach>
												</div>	
											</td>
											<td>
												<div style="overflow: auto; height: 60px">
													<c:forEach items="${cha.agglo }" var="pays">
														<c:out value="${pays}"></c:out><br>
													</c:forEach>
												</div>
											</td>
											<td>
												<div style="overflow: auto; height: 60px">
													<c:forEach items="${cha.ville }" var="pays">
														<c:out value="${pays}"></c:out><br>
													</c:forEach>
												</div>	
											</td>
											<td><a href="abcChallengeHome"><c:out value="${cha.monFriend.nom }"></c:out></a></td>
											<c:choose>
												<c:when test="${cha.amiJoue == true }">
													<td><c:out value="${cha.dateStringAmi }"></c:out></td>
													<td><c:out value="${cha.tempsRestantAmi }"></c:out></td>
													<td><c:out value="${cha.scoreAmi }"></c:out>/<c:out value="${cha.scoreMax }"></c:out></td>											
													<td>
														<div style="overflow: auto; height: 60px">
															<c:forEach items="${cha.paysAmi }" var="pays">
																<c:out value="${pays}"></c:out><br>
															</c:forEach>
														</div>	
													</td>
													<td>
														<div style="overflow: auto; height: 60px">
															<c:forEach items="${cha.capitaleAmi }" var="capi">
																<c:out value="${capi}"></c:out><br>
															</c:forEach>
														</div>
													</td>
													<td>
														<div style="overflow: auto; height: 60px">
															<c:forEach items="${cha.nobelAmi }" var="pays">
																<c:out value="${pays}"></c:out><br>
															</c:forEach>
														</div>
													</td>											
													<td>
														<div style="overflow: auto; height: 60px">
															<c:forEach items="${cha.artisteAmi }" var="pays">
																<c:out value="${pays}"></c:out><br>
															</c:forEach>
														</div>	
													</td>
													<td>
														<div style="overflow: auto; height: 60px">
															<c:forEach items="${cha.aggloAmi }" var="pays">
																<c:out value="${pays}"></c:out><br>
															</c:forEach>
														</div>	
													</td>
													<td>
														<div style="overflow: auto; height: 60px">
															<c:forEach items="${cha.villeAmi }" var="pays">
																<c:out value="${pays}"></c:out><br>
															</c:forEach>
														</div>	
													</td>
													<td>
														<c:choose>
															<c:when test="${cha.publie == true }">
																publié
															</c:when>
															<c:otherwise>
																<button id="${cha.id}" onclick="publierAbcChallenge(this,${cha.id} )"  class="btn btn-primary" >
													        		<span class="glyphicon glyphicon-share"></span>
													        	</button>
															</c:otherwise>
														</c:choose>
													</td>
												</c:when>
												<c:otherwise>
													<td style="color: orange;" colspan="1">pas enc</td>
													<td style="color: orange;" colspan="1">pas enc</td>
													<td style="color: orange;" colspan="1">pas enc</td>
													<td style="color: orange;" colspan="1">pas enc</td>
													<td style="color: orange;" colspan="1">pas enc</td>
													<td style="color: orange;" colspan="1">pas enc</td>
													<td style="color: orange;" colspan="1">pas enc</td>
													<td style="color: orange;" colspan="1">pas enc</td>
													<td style="color: orange;" colspan="1">pas enc</td>
													<td style="color: orange;" colspan="1">pas enc</td>
												</c:otherwise>
											</c:choose>											
											
										</tr>
									</c:forEach>	
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
	function publierAbcChallenge(lui, id){
		lui.disabled='true';
		var param = 'idJeu='+id+'';
		 $("#infoPublicationAbcChalleng").load("infoPublicationSoloAbcChallenge", param);
	}
	 /* pour le resize de la table =========== */
		$(function() {
		    var pressed = false;
		    var start = undefined;
		    var startX, startWidth;
		
		    $("table td").mousedown(function(e) {
		        start = $(this);
		        pressed = true;
		        startX = e.pageX;
		        startWidth = $(this).width();
		        $(start).addClass("resizing");
		        $(start).addClass("noSelect");
		    });
		
		    $(document).mousemove(function(e) {
		        if(pressed) {
		            $(start).width(startWidth+(e.pageX-startX));
		        }
		    });
		
		    $(document).mouseup(function() {
		        if(pressed) {
		            $(start).removeClass("resizing");
		            $(start).removeClass("noSelect");
		            pressed = false;
		        }
		    });
		});
		 /* $('th').resizable();
		$('td').resizable(); */ 
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js" type="text/javascript"></script>

	</body>
</html>