<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">
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
    height: 450px;
    overflow-y: auto;
    overflow-x: auto;
}
</style>
</head>
<body>
		<div class="modal-header">
  <button type="button" class="close quitterInfosDicoSolo" data-dismiss="modal">&times;</button>
  <h2 style="text-align: center; color: navy; text-shadow: 2px 2px 4px #000000;  ">DETAILS DE VOS JEUX ABC SOLO</h2>
  <button class="btn-success quitterInfosDicoSolo">QUITTER</button>
  <div id=infoPublicationSolo style="text-align: center;"></div>
  
</div>
<div class="modal-body">
  <div>
						<table id="tableauDataTable" class="table table-bordered table-striped table-condensed">
							<thead>
								<tr class="success">
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
										<td>${solo.abcsolojeux.datestring }</td>
										<td>${solo.abcsolojeux.lettrechar }</td>
										<td>${solo.abcsolojeux.help }</td>
										<td>${solo.abcsolojeux.tempsRestant }</td>
										<td>${solo.abcsolojeux.score}/${solo.abcsolojeux.scoreMax}</td>
										<td>
											<c:choose>
												<c:when test="${solo.abcsolojeux.publie == true}">
													<button class="btn btn-danger" >
											        	<span class="glyphicon glyphicon-ban-circle"></span>
											     	</button>
												</c:when>
												<c:otherwise>
													<button  onclick="publierSolo(this,${solo.id} )" class="btn btn-primary" >
											        	<span class="glyphicon glyphicon-share"></span>
											     	</button>
												</c:otherwise>
											</c:choose>
										</td>
										<td>---</td>
										<td>
											<div style="overflow: auto; height: 60px">
												<c:forEach items="${solo.abcsolojeux.agglo}" var="agglo">
													${agglo}<br>
												</c:forEach>
											</div>
										</td>
										<td>
											<div style="overflow: auto; height: 60px">
												<c:forEach items="${solo.abcsolojeux.pays}" var="pays">
													${pays}<br>
												</c:forEach>
											</div>
										</td>
										<td>
											<div style="overflow: auto; height: 60px">
												<c:forEach items="${solo.abcsolojeux.capitale}" var="capitale">
													${capitale}<br>
												</c:forEach>
											</div>	
										</td>
										<td>
											<div style="overflow: auto; height: 60px">
												<c:forEach items="${solo.abcsolojeux.nobel}" var="nobel">
													${nobel}<br>
												</c:forEach>
											</div>
										</td>
										<td>
											<div style="overflow: auto; height: 60px">
												<c:forEach items="${solo.abcsolojeux.artiste}" var="artiste">
													${artiste}<br>
												</c:forEach>
											</div>
										</td>
										<td>
											<div style="overflow: auto; height: 60px">
												<c:forEach items="${solo.abcsolojeux.president}" var="president">
													${president}<br>
												</c:forEach>
											</div>
										</td>
										<td>
											<div style="overflow: auto; height: 60px">
												<c:forEach items="${solo.abcsolojeux.aPresident}" var="apresident">
													${apresident}<br>
												</c:forEach>
											</div>	
										</td>
										<td>
											<div style="overflow: auto; height: 60px">
												<c:forEach items="${solo.abcsolojeux.ville}" var="ville">
													${ville}<br>
												</c:forEach>
											</div>
										</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
</div>
<script type="text/javascript">
$(function (){
	$('.quitterInfosDicoSolo').click(function(){
		location = 'http://localhost:8080/abcSoloHome';
	})
});
function publierSolo(lui, id){
	lui.disabled='true';
	var param = 'idSolo='+id+'';
	$("#infoPublicationSolo").load("publierSolo", param);
}
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