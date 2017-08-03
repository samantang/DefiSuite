<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">

<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ABC Challenge</title>
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
tr, th, td{
	text-align: center;
}
</style>
</head>
<body>
 <jsp:include page="entete1.jsp"></jsp:include> 
<%-- <%@include file="entete.jsp" %> --%>
<%-- <c:import url="entete.jsp"></c:import> --%>
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
						<a href="user_profile"><img src="photoUser?id=${id }" height="80px" width="80px"/></a>
					</c:otherwise>
				</c:choose>
					<div class="menuGauche">
						<c:import url="menuGauche.jsp"></c:import>
					</div>	
			</div>
			<div class="col-md-6 col-lg-6">
				<div align="center">
				<div>
					<h2 style="text-align: center; color: white; text-shadow: 2px 2px 4px #000000;  ">ABC CHALLENGE</h2>
				</div><br>
					<div id="onglets">
						  <ul>
						    <li><a href="#onglet-1">challenges recus</a></li>
						    <li><a href="#onglet-2">challenges à jouer</a></li>
						    <li><a href="#onglet-3">challenges envoyés</a></li>
						  </ul>
						  <div id="onglet-1">
						    <!--contenu -->
						    <c:forEach items="${gm.mesChallengesRecus }" var="ami">
						    	<div id="actionRecus"></div><br>
						    	<ul>
						    		<li>
						    			<c:choose>
											<c:when test="${ami.nomPhoto == null}">
												<img height="20px" width="20px" src="<%=request.getContextPath()%>/resources/images/user.png" alt="">
											</c:when>
											<c:otherwise>
												<a href="user_profile"><img src="photoUser?id=${ami.id }" height="20px" width="20px"/></a>
											</c:otherwise>
										</c:choose>
						    			<c:out value="${ami.nom }" />&nbsp;<c:out value="${ami.prenom }" /> &nbsp;
						    			<button type="button" class="btn btn-success btn-xs"  id="accepter" onclick="accepterChallenge(this, ${ami.id} )" > <span class="glyphicon glyphicon-ok-sign"></span> Accepter</button>&nbsp;
						    			<button type="button" class="btn btn-danger btn-xs " id="refuser" onclick="refuserChallenge(this, ${ami.id} )"> <span class="glyphicon glyphicon-remove-sign"></span> Refuser</button>
						    		</li>
						    	</ul>
						    </c:forEach>
						  </div>
						  <div id="onglet-2">
						    <!--contenu -->
						    <c:forEach items="${gm.mesChallengesEnAttentes }" var="ami">
						    <div id="actionAttentes"></div><br>
						    	<ul>
						    		<li>
						    			<c:choose>
											<c:when test="${ami.nomPhoto == null}">
												<img height="20px" width="20px" src="<%=request.getContextPath()%>/resources/images/user.png" alt="">
											</c:when>
											<c:otherwise>
												<a href="user_profile"><img src="photoUser?id=${ami.id }" height="20px" width="20px"/></a>
											</c:otherwise>
										</c:choose>
						    			<c:out value="${ami.nom }" />&nbsp;<c:out value="${ami.prenom }" /> &nbsp;
						    			<button type="button" class="btn btn-success btn-xs" onclick="allerAuDuelChallenge(this, ${ami.id} )"> <span class="glyphicon glyphicon-play-circle"></span> Allez au Duel</button>
						    		</li>
						    	</ul>
						    </c:forEach>
						  </div>
						  <div id="onglet-3">
						    <!--contenu -->
						    <c:forEach items="${gm.mesChallengesEnvoyes }" var="ami">
						    	<div id="actionEnvoi"></div><br>
						    	<ul>
						    		<li>
						    			<c:choose>
											<c:when test="${ami.nomPhoto == null}">
												<img height="20px" width="20px" src="<%=request.getContextPath()%>/resources/images/user.png" alt="">
											</c:when>
											<c:otherwise>
												<a href="user_profile"><img src="photoUser?id=${ami.id }" height="20px" width="20px"/></a>
											</c:otherwise>
										</c:choose>
						    			<c:out value="${ami.nom }" />&nbsp;<c:out value="${ami.prenom }" /> &nbsp;
						    			<button type="button" class="btn btn-warning btn-xs" onclick="annulerEnvoiChallenge(this, ${ami.id} )" > <span class="glyphicon glyphicon-ban-circle"></span> Annulez l'envoi</button>
						    		</li>
						    	</ul>
						    </c:forEach>
						  </div>
					</div><br><br>
					<div>
						<ul class="list-group">
						  <a href="#" class="list-group-item ">
						    <h4 class="list-group-item-heading">COMMENT CA MARCHE</h4>
						    <p  class="list-group-item-text pull-right"><i><b> 
						    La lettre avec laquelle vous devez jouer est tirée automatiquement si vous êtes le premier à jouer (si votre ami a joué avant vous alors jouerez avec la lettre avec laquelle il a joué) et le temps est calculé en fonction du nombre
							de réponses possibles (<span style="color: aqua;">18 secondes</span> par réponse): exemple: s'il y a <span style="color: lime;">10</span> réponses possibles => <span style="color: lime;">10</span> * <span style="color: aqua;">18</span>  = 180 secondes = 3 minutes</b></i></p>
						    <img src="<%=request.getContextPath()%>/resources/images/user.png" height="50px" width="50px">
						  </a>
						 </ul> 
					</div>
					<div>
					<c:choose>
						<c:when test="${empty gm.mesChallengesJoues}">
							<h3 style="text-align: center; color: white; text-shadow: 2px 2px 4px #000000;  ">Vous n'avez pas de jeux à afficher pour l'instant</h3>
						</c:when>
						<c:otherwise><br>
							<div>
								<!-- bouton détails sur les jeux ------------------------------------------------------------------------------------------- -->
								 <button data-toggle="modal" href="infosDetailsChallenge" data-target="#infos" class="btn btn-primary">
							        Détails sur vos jeux en ABC CHALLENGE
							      </button><br>
							      <div class="modal fade" id="infos">
							        <div class="modal-dialog modal-lg">  
							          <div class="modal-content"></div>  
							        </div> 
							      </div>
							</div><br>
							<div>
								<h2 style="text-align: center; color: white; text-shadow: 2px 2px 4px #000000;  ">Vos dix derniers jeux</h2>
							</div>
							<table id="tableauDataTable" class="table table-bordered table-striped table-condensed" style="text-align: center;">
								<thead>
									<tr class="success">
										<th colspan="2">Le Jeu</th>
										<th>Moi</th>
										<th colspan="2">Ami</th>
										<th rowspan="2">Détails</th>
									</tr>
									<tr class="warning">
										<th>Date</th>
										<th>Lettre</th>
										<th>Score</th>
										<th>Nom</th>
										<th>Score</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${gm.mesChallengesJoues }" var="cha">
										<tr>
											<td><c:out value="${cha.dateString }"></c:out></td>
											<td> <c:out value="${cha.lettre }"></c:out> </td>
											<td><c:out value="${cha.score }"></c:out>/<c:out value="${cha.scoreMax }"></c:out></td>
											<td><a href="voirAmi?id=${cha.monFriend.id }"><c:out value="${cha.monFriend.nom }"></c:out></a></td>
											<!-- si l'ami a joué on affiche son score, sinon on affiche qu'il n'a pas encore joué -->
											<td><c:out value="${cha.scoreAmi }"></c:out>/<c:out value="${cha.scoreMax }"></c:out></td>
											<td>
												<button data-toggle="modal" href="infosDetailChallengeId?idChallenge=${cha.id }" data-target="#infos"  class="btn btn-primary" >
									        	<span class="glyphicon glyphicon-eye-open"></span>
									        	</button>
											</td>
										</tr>
									</c:forEach>	
								</tbody>
							</table>		
						</c:otherwise>
					</c:choose>
					</div>			
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
		  $(function() {
		    $('#onglets').tabs();
		  });
		  function accepterChallenge(lui, id){
			  lui.disabled = 'true';
			  document.getElementById("refuser").disabled=true;
			  var param = 'idAmi='+id+'&action=accepter';
			  $(function(){
				  $("#actionRecus").load("accepterEtInfosChallengesRecus .accpeterRecu", param);
			  })			  
		  };
		  function refuserChallenge(lui, id){
			  lui.disabled = 'true';
			  document.getElementById("accepter").disabled=true;
			  var param = 'idAmi='+id+'&action=refuser';
			  $(function(){
				  $("#actionRecus").load("accepterEtInfosChallengesRecus .refuserRecu", param);
			  })			  
		  };
		  function allerAuDuelChallenge(lui, id){
			  lui.disabled = 'true';
			  var param = 'idAmi='+id+'&action=allerAuDuel';
		//	  $(function(){
				  window.location = 'AbcChallengeJeu?idAmi='+id;
				//  $("#actionAttentes").load("accepterEtInfosChallengeDicoRecus .allerAuDuel", param);
		//	  })			  
		  };
		  function annulerEnvoiChallenge(lui, id){
			  lui.disabled = 'true';
			  var param = 'idAmi='+id+'&action=annulerEnvoi';
			  $(function(){
				  $("#actionEnvoi").load("accepterEtInfosChallengesRecus .annulerEnvoi", param);
			  })			  
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
		
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js" type="text/javascript"></script>

</body>
</html>