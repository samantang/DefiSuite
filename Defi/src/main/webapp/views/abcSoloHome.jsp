<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">
<title>Abc Solo</title>
<style type="text/css">
.menuGauche ul {
    background: #CCCCFF;
    padding: 20px;
    margin-top: 10px;
    list-style-type: none;
}
.menuGauche ul li {
    background: #cce5ff;
    margin: 5px;
}
.menuGauche ul li a{
	color: #000000;
    text-decoration: none;
}
.menuGauche ul li a:hover{
	color: green;
}
.menuDroit {
	position: fixed;
}
.menuGauche{
	position: fixed;
}
</style>
</head>
<body>
			<jsp:include page="entete.jsp"></jsp:include>
 <div style="margin-top: 55px" >		
	<div class="container">
	     
		<div class="row">
			<div class="col-md-3 col-lg-3">
				<c:choose>
					<c:when test="${moi.nomPhoto == null}">
						<img height="50px" width="50px" src="<%=request.getContextPath()%>/resources/images/user.png" alt="">
						<p>Ajouter de photo de profil </p>
						<f:form action="changerPhoto" method="POST" enctype="multipart/form-data" modelAttribute="sm">
							<input type="file" name="file">
							<input type="submit" value="changer">
						</f:form>
					</c:when>
					<c:otherwise>
						<a href="userhome"><img src="photoUser?id=${id }" height="80px" width="80px"/></a>
					</c:otherwise>
				</c:choose>
				<div>
					<div class="menuGauche">
						<c:import url="menuGauche.jsp"></c:import>
					</div>
					<%-- <%@include file="menuGauche.jsp" %> --%>	
				</div>	
			</div>
			<div class="col-md-6 col-lg-6">
				<div align="center">
					<h2 style="text-align: center; color: navy; text-shadow: 2px 2px 4px #000000;  ">JEU ABC SOLO</h2>
				
				
				<div>
					<div>
						<ul class="list-group">
						  <a href="#" class="list-group-item ">
						    <h4 class="list-group-item-heading">ABC SOLO</h4>
						    <p  class="list-group-item-text pull-right"><i><b> pouvoir jouer, vous devez cocher les intitulés que vous souhaitez <span style="color: orange;">(au moins 3)</span> .
						    La lettre avec laquelle vous devez jouer est titrée automatiquement et le temps est calculé en fonction du nombre
							de réponses possibles (<span style="color: aqua;">18 secondes</span> par réponse): exemple: s'il y a <span style="color: lime;">10</span> réponses possibles => <span style="color: lime;">10</span> * <span style="color: aqua;">18</span>  = 180 secondes = 3 minutes</b></i></p>
						    <img src="<%=request.getContextPath()%>/resources/images/user.png" height="50px" width="50px">
						  </a>
						 </ul> 
					</div>	
						<h4 style="text-align: center; color: infotext; text-shadow: 2px 2px 4px #000000;  ">COCHEZ ET JOUEZ MAINTENANT</h4>
						<form action="abcSoloJeu"  method="post">
								<table>
									<tr>
										<th>
											<input type="hidden" id="nbClicksCheckBoxe">
											<input onclick="clickSurCheck()"  type="checkbox"   name="pays" value="pays" /> pays &nbsp;&nbsp;	
											<input onclick="clickSurCheck()" type="checkbox"  name="capitales" value="capitales"/> capitales&nbsp;&nbsp;
											<input onclick="clickSurCheck()" type="checkbox" name="presidents" value="presidents"/> présidents ou chefs de gouvernement actuels&nbsp;&nbsp;
										</th>
									</tr>
									<tr>	
										<th>	
											<input onclick="clickSurCheck()" type="checkbox" name="nobels" value="nobels" /> prix nobel depuis 2 000&nbsp;&nbsp;
											<input onclick="clickSurCheck()" type="checkbox" name="chanteurs" value="chanteurs" /> chanteurs ou groupe avec plus 200 millions de disques vendus&nbsp;&nbsp;
										</th>
									</tr>
									<tr>	
										<th>	
											<input onclick="clickSurCheck()" type="checkbox" name="villesFrance" value="villesFrance" /> Villes de France de plus de 30 000 hts&nbsp;&nbsp;
											<input onclick="clickSurCheck()" type="checkbox" name="ancienPresidents" value="ancienPresidents" /> anciens prési ou chefs de gouv dépuis 2000&nbsp;&nbsp;
										</th>
									</tr>
									<tr>
										<th>	
											<input onclick="clickSurCheck()" type="checkbox" name="aglomerations" value="aglomerations" /> 100 plus grandes agglomerations mondiales&nbsp;&nbsp;
											<input onclick="clickSurCheck()" type="checkbox" name="animaux" value="animaux" /> animaux nationaux <br><br>
										</th>															
									</tr>
									<tr>
										<td>
											<input id="validerCheckBoxes"  class="btn btn-info btn-lg" type="submit" value="valider" disabled="disabled">
										</td>
									</tr>
								</table>
							</form>
					</div><hr>
				<c:choose>
					<c:when test="${empty gm.mesSolos}">
						<h3 style="text-align: center; color: white; text-shadow: 2px 2px 4px #000000;  ">VOUS N'AVEZ PAS DE JEUX &Agrave;	 AFFICHER POUR LE MOMMENT</h3>
					</c:when>
					<c:otherwise>
						<!-- bouton détails sur les jeux ------------------------------------------------------------------------------------------- -->
						 <button data-toggle="modal" href="infoJeuSolo" data-target="#infos" class="btn btn-info">
					        Détails sur les jeux en Solo
					      </button><br><br>
					      <div class="modal fade" id="infos">
					        <div class="modal-dialog modal-lg">  
					          <div class="modal-content"></div>  
					        </div> 
					      </div>
					      <!-- FIN     bouton détails sur le jeu --------------------------------------------------------------------------------- -->
							<div>
								<table id="tableauDataTable" class="table table-bordered table-striped table-condensed">
									<thead>
										<tr class="success">
											<th>Date</th>
											<th>Lettre</th>
											<th>Aide</th>
											<th>Temps</th>
											<th>Score</th>
											<!-- <th>Publier</th> -->
											<!-- <th>Supprimer</th> -->
											<th>Détails</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${gm.mesSolos }" var="solo">
											<tr>
												<td>${solo.abcsolojeux.datestring }</td>
												<td>${solo.abcsolojeux.lettrechar }</td>
												<td>${solo.abcsolojeux.help }</td>
												<td>${solo.abcsolojeux.time }</td>
												<td>${solo.abcsolojeux.score }/${solo.abcsolojeux.scoreMax }</td>
												<%-- <td><a href="publierSolo?id=${solo.abcsolojeux.id}">pubier</a></td> --%>
												<%-- <td><a href="supprimerSolo?id=${solo.id}">Sup</a></td> --%>
												<%-- <td><a href="detailSolo?id=${solo.id}">Detail</a></td> --%>
												<td><button data-toggle="modal" href="detailSolo?id=${solo.id}" data-target="#infos" class="btn btn-success">
											        	Détail
											     	 </button>
										      	</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div><br><br>
					</c:otherwise>
				</c:choose>
				</div>	
			</div>
			<div class="col-md-3 col-lg-3">
				<div>
					<jsp:include page="menuDroit.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function clickSurCheck(){
	var cpt = $('#nbClicksCheckBoxe').text();
	cpt = cpt +1;
	$('#nbClicksCheckBoxe').html(cpt);
	if(cpt == 111){
		document.getElementById('validerCheckBoxes').disabled = false;
	}
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