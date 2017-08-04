<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
 <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

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
    height: 500px;
    overflow-y: auto;
    overflow-x: auto;
}
</style>
</head>
<body>
		<div class="modal-header">
		  <button type="button" class="close quitterInfosSujetsChallenge" data-dismiss="modal">&times;</button>
		  <h2>LES DETAILS DU JEU</h2>
		  <button class="btn-success quitterInfosSujetsChallenge">QUITTER</button><br>
		  <div id=infoPublicationChallengeSujet style="text-align: center;"></div>
  
		</div>
<div class="modal-body">
  <div>
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr class="success">
									<th rowspan="2">Joueur</th>
									<th rowspan="2">Date</th>
									<th colspan="4">Pays</th>
									<th colspan="4">Capitale</th>
									<th colspan="4">Nobel</th>
									<th colspan="4">President</th>
									<th colspan="4">Artiste</th>
									<th rowspan="2">Temps Rest</th>
									<th rowspan="2">Score</th>
									<th rowspan="2">Pub</th>
								</tr>
								<tr class="warning">	
									<th>Nom</th>
									<th>Lettre</th>
									<th>NB Err</th>
									<th>Score</th>
									<th>Nom</th>
									<th>Lettre</th>
									<th>NB Err</th>
									<th>Score</th>
									<th>Nom</th>
									<th>Lettre</th>
									<th>NB Err</th>
									<th>Score</th>
									<th>Nom</th>
									<th>Lettre</th>
									<th>NB Err</th>
									<th>Score</th>
									<th>Nom</th>
									<th>Lettre</th>
									<th>nb Err</th>
									<th>Score</th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td>MOI</td>
										<td><c:out value="${pendu.dateStringMoi }"></c:out></td>
										<td><c:out value="${pendu.pays }"></c:out></td>
										<td><c:out value="${pendu.lettrePays }"></c:out></td>
										<td><c:out value="${pendu.nbErreursPaysMoi }"></c:out></td>
										<td><c:out value="${pendu.scorePaysMoi }"></c:out>/<c:out value="${pendu.scoreMaxPays }"></c:out></td>
										<td><c:out value="${pendu.capitale }"></c:out></td>
										<td><c:out value="${pendu.lettreCapitale }"></c:out></td>
										<td><c:out value="${pendu.nbErreursPaysMoi }"></c:out></td>
										<td><c:out value="${pendu.scoreCapitaleMoi}"></c:out>/<c:out value="${pendu.scoreMaxCapitale}"></c:out></td>										
										<td><c:out value="${pendu.nobel}"></c:out></td>
										<td><c:out value="${pendu.lettreNoble}"></c:out></td>
										<td><c:out value="${pendu.nbErreursNobelMoi}"></c:out></td>
										<td><c:out value="${pendu.scoreNobelMoi}"></c:out>/<c:out value="${pendu.scoreMaxNobel}"></c:out></td>
										<td><c:out value="${pendu.president }"></c:out></td>
										<td><c:out value="${pendu.lettrePresident }"></c:out></td>
										<td><c:out value="${pendu.nbErreursPresidentMoi }"></c:out></td>
										<td><c:out value="${pendu.scorePresidentMoi }"></c:out>/<c:out value="${pendu.scoreMaxPresident }"></c:out></td>										
										<td><c:out value="${pendu.artiste}"></c:out></td>
										<td><c:out value="${pendu.lettreArtiste}"></c:out></td>
										<td><c:out value="${pendu.nbErreursArtisteMoi}"></c:out></td>
										<td><c:out value="${pendu.scoreArtisteMoi}"></c:out>/<c:out value="${pendu.scoreMaxArtiste}"></c:out></td>	
										<td><c:out value="${pendu.tempsRestantMoi }"></c:out></td>									
										<td><c:out value="${pendu.scoreTotalMoi }"></c:out>/<c:out value="${pendu.scoreTotalMax }"></c:out></td>
										<td rowspan="2">
											<button  onclick="publierUnChallengeSujet(this,${pendu.id} )" class="btn btn-primary" >
									        	<span class="glyphicon glyphicon-share"></span>
									     	</button>
									     </td>
									</tr>
									<!-- affichage des jeux de l'ami -->
									<tr>
										<td><a href="voirAmi?id=${pendu.monFriend.id }"><c:out value="${pendu.monFriend.nom }"/></a></td>
										<td><c:out value="${pendu.dateStringAmi }"></c:out></td>
										<td><c:out value="${pendu.pays }"></c:out></td>
										<td><c:out value="${pendu.lettrePays }"></c:out></td>
										<td><c:out value="${pendu.nbErreursPaysAmi }"></c:out></td>
										<td><c:out value="${pendu.scorePaysAmi }"></c:out>/<c:out value="${pendu.scoreMaxPays }"></c:out></td>
										<td><c:out value="${pendu.capitale }"></c:out></td>
										<td><c:out value="${pendu.lettreCapitale }"></c:out></td>
										<td><c:out value="${pendu.nbErreursPaysAmi }"></c:out></td>
										<td><c:out value="${pendu.scoreCapitaleAmi}"></c:out>/<c:out value="${pendu.scoreMaxCapitale}"></c:out></td>										
										<td><c:out value="${pendu.nobel}"></c:out></td>
										<td><c:out value="${pendu.lettreNoble}"></c:out></td>
										<td><c:out value="${pendu.nbErreursNobelAmi}"></c:out></td>
										<td><c:out value="${pendu.scoreNobelAmi}"></c:out>/<c:out value="${pendu.scoreMaxNobel}"></c:out></td>
										<td><c:out value="${pendu.president }"></c:out></td>
										<td><c:out value="${pendu.lettrePresident }"></c:out></td>
										<td><c:out value="${pendu.nbErreursPresidentAmi }"></c:out></td>
										<td><c:out value="${pendu.scorePresidentAmi }"></c:out>/<c:out value="${pendu.scoreMaxPresident }"></c:out></td>										
										<td><c:out value="${pendu.artiste}"></c:out></td>
										<td><c:out value="${pendu.lettreArtiste}"></c:out></td>
										<td><c:out value="${pendu.nbErreursArtisteAmi}"></c:out></td>
										<td><c:out value="${pendu.scoreArtisteAmi}"></c:out>/<c:out value="${pendu.scoreMaxArtiste}"></c:out></td>	
										<td><c:out value="${pendu.tempsRestantAmi }"></c:out></td>									
										<td><c:out value="${pendu.scoreTotalAmi }"></c:out>/<c:out value="${pendu.scoreTotalMax }"></c:out></td>
										
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
							</tbody>
						</table>
					</div>
</div>
					

<script type="text/javascript">
	$(function(){
		$('.quitterInfosSujetsChallenge')
		.click(function(){
			 location = "http://localhost:8080/penduChallengeSujets";
		})
	});
	function publierUnChallengeSujet(lui, id){
		lui.disabled='true';
		var param = 'idSolo='+id+'';
		$("#infoPublicationChallengeSujet").load("infoPublicationChallengeSujet", param);
	}
	
</script>
</body>
</html>