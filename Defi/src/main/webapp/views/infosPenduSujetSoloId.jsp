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
		  <button type="button" class="close quitterInfosSujetsSolo" data-dismiss="modal">&times;</button>
		  <h2>LES DETAILS DU JEU</h2>
		  <button class="btn-success quitterInfosSujetsSolo">QUITTER</button>
		  <div id="infoPublicationSoloSujet" style="text-align: center;"></div>
		</div>
<div class="modal-body">
  <div>
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr class="success">
									<th>Date</th>
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
									<th>Date</th>
									<th>Nom</th>
									<th>Lettre</th>
									<th>Temps Rest</th>
									<th>Score</th>
									<th>Nom</th>
									<th>Lettre</th>
									<th>Temps Rest</th>
									<th>Score</th>
									<th>Nom</th>
									<th>Lettre</th>
									<th>Temps Rest</th>
									<th>Score</th>
									<th>Nom</th>
									<th>Lettre</th>
									<th>Temps Restt</th>
									<th>Score</th>
									<th>Nom</th>
									<th>Lettre</th>
									<th>Temps Rest</th>
									<th>Score</th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td><c:out value="${penduSujetsSolo.dateString }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.motPays }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.lettreStringPays }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.tempsRestantPays }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.scorePays }"></c:out>/<c:out value="${penduSujetsSolo.scoreMaxPays }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.motCapitale }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.scoreCapitale}"></c:out>/<c:out value="${penduSujetsSolo.scoreMaxCapitale}"></c:out></td>
										<td><c:out value="${penduSujetsSolo.tempsRestantCapitale }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.lettreStringCapitale }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.motNobel}"></c:out></td>
										<td><c:out value="${penduSujetsSolo.scoreNobel}"></c:out>/<c:out value="${penduSujetsSolo.scoreMaxNobel}"></c:out></td>
										<td><c:out value="${penduSujetsSolo.tempsRestantNobel}"></c:out></td>
										<td><c:out value="${penduSujetsSolo.lettreStringNobel}"></c:out></td>
										<td><c:out value="${penduSujetsSolo.motPresident }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.scorePresident }"></c:out>/<c:out value="${penduSujetsSolo.scoreMaxPresident }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.tempsRestantPresident }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.lettreStringPresident }"></c:out></td>
										<td><c:out value="${penduSujetsSolo.motArtiste}"></c:out></td>
										<td><c:out value="${penduSujetsSolo.scoreArtiste}"></c:out>/<c:out value="${penduSujetsSolo.scoreMaxArtiste}"></c:out></td>
										<td><c:out value="${penduSujetsSolo.tempsRestantArtiste}"></c:out></td>
										<td><c:out value="${penduSujetsSolo.lettreStringArtiste}"></c:out></td>
										<td><c:out value="${penduSujetsSolo.tempsRestantString }"></c:out></td>	
										<td><c:out value="${penduSujetsSolo.score }"></c:out>/<c:out value="${penduSujetsSolo.scoreMax }"></c:out></td>
										<td>
											<button  onclick="publierUnSoloSujet(this,${penduSujetsSolo.id} )" class="btn btn-primary" >
									        	<span class="glyphicon glyphicon-share"></span>
									     	</button>
									    </td>
									</tr>
							</tbody>
						</table>
					</div>
</div>
<script type="text/javascript">
	$(function(){
		$('.quitterInfosSujetsSolo')
		.click(function(){
			 location = "http://localhost:8080/pendusoloSujets";
		})
	});
	function publierUnSoloSujet(lui, id){
		lui.disabled='true';
		var param = 'idSolo='+id+'';
		$("#infoPublicationSoloSujet").load("infoPublicationSoloSujet", param);
	}
</script>
</body>
</html>