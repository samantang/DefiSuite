<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">

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


<title>PenduSolo</title>
</head>
<body>
		<jsp:include page="entete.jsp"></jsp:include>
 <div style="margin-top: 55px" >		
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-lg-3 menuGaucheFixe">
					<div class="menuGauche">
						<c:import url="menuGauche.jsp"></c:import>
					</div>	
			</div>
			<div class="col-md-6 col-lg-6">
				<div align="center">
					<h3>LE JEU DU PENDU SUJETS SOLO</h3>
					<div style="text-align: center;">
						<a class="btn btn-success" href="penduSoloSujetJeu">commencer une nouvellle partie</a><br>
					</div><br>
					<%-- <div>
						<ul class="list-group">
						  <a href="#" class="list-group-item ">
						    <h4 class="list-group-item-heading">Pendu Dico Solo</h4>
						    <p  class="list-group-item-text pull-right">Jouer avec les mots du dictionnaire, vous en avez plus de 36 000,
						    le mot avec lequel vous allez jouer est tiré au sort et une littre vous ai indiqué dans le mot pour vous guider.</p>
						    <img src="<%=request.getContextPath()%>/resources/images/user.png" height="50px" width="50px">
						  </a>
						 </ul> 
					</div> --%>
					<div>
						  <ul class="media-list">
						    <li class="media thumbnail">
						      <a class="pull-left" href="#">
						        <img class="media-object" src="<%=request.getContextPath()%>/resources/images/user.png" height="50px" width="50px">
						      </a>
						      <div class="media-body">
						        <h4 class="media-heading">Pendu Sujets Solo</h4>
						        <p>Jouer avec les 5 sujets qui vous sont proposés pour augmenter votre culture général, pour chaque sujet
						    le mot avec lequel vous allez jouer est tiré au sort et une littre vous ai dévoilée dans le mot pour vous guider.</p>
						      </div>  
						   </li>
						 </ul>
					</div>
					<!-- bouton détails sur les jeux ------------------------------------------------------------------------------------------- -->
					 <button data-toggle="modal" href="infosPenduSujetsSolo" data-target="#infos" class="btn btn-primary">
				        Détails sur tous vos jeux en solo Sujets
				      </button><br><br>
				      <div class="modal fade" id="infos">
				        <div class="modal-dialog modal-lg">  
				          <div class="modal-content"></div>  
				        </div> 
				      </div>
				</div>
				<div>
					<h2 style="text-align: center; color: white; text-shadow: 2px 2px 4px #000000;  ">Vos dix derniers jeux</h2>
				</div><br>
				<div id="infoPublicationSolo">
				</div>
				<div>
					<table id="tableauDataTable" class="table table-bordered table-striped table-condensed" style="text-align: center; border: 2px" >
						<thead>
								<tr class="success">
									<th>Date</th>
									<th>Points <br>Pays</th>
									<th>Points <br>Capitale</th>
									<th>Points <br>Presi</th>
									<th>Points <br>Nobel</th>
									<th>Points <br>Artiste</th>
									<th>Points <br>TOTAUX</th>
									<th>Détail<br> JEU</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${penduModel.mesSujetsoSolo }" var="solo" >
									<tr>
										<td ><c:out value="${solo.dateString }"></c:out></td>
										<td><c:out value="${solo.scorePays }"></c:out>/<c:out value="${solo.scoreMaxPays }"></c:out></td>
										<td><c:out value="${solo.scoreCapitale }"></c:out>/<c:out value="${solo.scoreMaxCapitale }"></c:out></td>
										<td><c:out value="${solo.scorePresident }"></c:out>/<c:out value="${solo.scoreMaxPresident }"></c:out></td>
										<td><c:out value="${solo.scoreNobel }"></c:out>/<c:out value="${solo.scoreMaxNobel }"></c:out></td>
										<td><c:out value="${solo.scoreArtiste }"></c:out>/<c:out value="${solo.scoreMaxArtiste }"></c:out></td>
										<td><c:out value="${solo.score }"></c:out>/<c:out value="${solo.scoreMax }"></c:out></td>
										<%-- <td><a href="publierSoloDico?id=${solo.id}">pubier</a></td>
										<td><a href="supprimerSoloDico?id=${solo.id}">Supp</a></td> --%>
									 	<td><button data-toggle="modal" href="infosPenduSujetSoloId?id=${solo.id }" data-target="#infos"  class="btn btn-primary" >
									        	<span class="glyphicon glyphicon-eye-open"></span>
									     	 </button>
								      	</td> 
									</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>	
				
			</div>
			<div class="col-md-3 col-lg-3">
				<div>
					<%-- <jsp:include page="menuDroit.jsp"></jsp:include> --%>
					<c:import url="menuDroit.jsp"></c:import>
				</div>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript">
	function publierUnSolo(lui, id){
		lui.disabled='true';
		var param = 'idSolo='+id+'';
	//	alert(id);
		$("#infoPublicationSolo").load("infoPublicationSolo", param);
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