<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Abc Challenge</title>
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
					<h2 style="text-align: center; color: white; text-shadow: 2px 2px 4px #000000;  ">PENDU SUJETS CHALLENGE</h2>
				</div><br>
						<div id="onglets">
						  <ul>
						    <li><a href="#onglet-1">challenges recus</a></li>
						    <li><a href="#onglet-2">challenges à jouer</a></li>
						    <li><a href="#onglet-3">challenges envoyés</a></li>
						  </ul>
						  <div id="onglet-1">
						    <!--contenu -->
						    <c:forEach items="${penduModel.mesChallengesSujetsRecus }" var="ami">
						    	<div id="actionRecus"></div><br>
						    	<ul>
						    		<li>
						    			<c:choose>
											<c:when test="${moi.nomPhoto == null}">
												<img height="20px" width="20px" src="<%=request.getContextPath()%>/resources/images/user.png" alt="">
											</c:when>
											<c:otherwise>
												<a href="user_profile"><img src="photoUser?id=${ami.id }" height="20px" width="20px"/></a>
											</c:otherwise>
										</c:choose>
						    			<c:out value="${ami.nom }" />&nbsp;<c:out value="${ami.prenom }" /> &nbsp;
						    			<button type="button" class="btn btn-success btn-xs"  id="accepter" onclick="accepterChallengeSujets(this, ${ami.id} )" > <span class="glyphicon glyphicon-ok-sign"></span> Accepter</button>&nbsp;
						    			<button type="button" class="btn btn-danger btn-xs " id="refuser" onclick="refuserChallengeSujets(this, ${ami.id} )"> <span class="glyphicon glyphicon-remove-sign"></span> Refuser</button>
						    		</li>
						    	</ul>
						    </c:forEach>
						  </div>
						  <div id="onglet-2">
						    <!--contenu -->
						    <c:forEach items="${penduModel.mesChallengesSujetsEnAttentes }" var="ami">
						    <div id="actionAttentes"></div><br>
						    	<ul>
						    		<li>
						    			<c:choose>
											<c:when test="${moi.nomPhoto == null}">
												<img height="20px" width="20px" src="<%=request.getContextPath()%>/resources/images/user.png" alt="">
											</c:when>
											<c:otherwise>
												<a href="user_profile"><img src="photoUser?id=${ami.id }" height="20px" width="20px"/></a>
											</c:otherwise>
										</c:choose>
						    			<c:out value="${ami.nom }" />&nbsp;<c:out value="${ami.prenom }" /> &nbsp;
						    			<button type="button" class="btn btn-success btn-xs" onclick="allerAuDuelChallengeSujets(this, ${ami.id} )"> <span class="glyphicon glyphicon-play-circle"></span> Allez au Duel</button>
						    		</li>
						    	</ul>
						    </c:forEach>
						  </div>
						  <div id="onglet-3">
						    <!--contenu -->
						    <c:forEach items="${penduModel.mesChallengesSujetsEnvoyes }" var="ami">
						    	<div id="actionEnvoi"></div><br>
						    	<ul>
						    		<li>
						    			<c:choose>
											<c:when test="${moi.nomPhoto == null}">
												<img height="20px" width="20px" src="<%=request.getContextPath()%>/resources/images/user.png" alt="">
											</c:when>
											<c:otherwise>
												<a href="user_profile"><img src="photoUser?id=${ami.id }" height="20px" width="20px"/></a>
											</c:otherwise>
										</c:choose>
						    			<c:out value="${ami.nom }" />&nbsp;<c:out value="${ami.prenom }" /> &nbsp;
						    			<button type="button" class="btn btn-warning btn-xs" onclick="annulerEnvoiChallengeSujets(this, ${ami.id} )" > <span class="glyphicon glyphicon-ban-circle"></span> Annulez l'envoi</button>
						    		</li>
						    	</ul>
						    </c:forEach>
						  </div>
						</div>
					<div>
					<c:choose>
						<c:when test="${empty penduModel.mesChallengesSujetsJoues}">
							<h3 style="text-align: center; color: white; text-shadow: 2px 2px 4px #000000;  ">Vous n'avez pas de jeux à afficher pour l'instant</h3>
						</c:when>
						<c:otherwise><br>
							<div>
								<!-- bouton détails sur les jeux ------------------------------------------------------------------------------------------- -->
								 <button data-toggle="modal" href="infosPenduSujetsChallenge" data-target="#infos" class="btn btn-primary">
							        Détails de vos jeux
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
							<table class="table table-bordered table-striped table-condensed" style="text-align: center;">
								<thead>
									<tr>
										<th colspan="3">Moi</th>
										<th colspan="4">Ami</th>
										<th rowspan="2">Détails</th>
									</tr>
									<tr>
										<th>Date</th>
										<th>temps Res</th>
										<th>Score</th>
										<th>Nom</th>
										<th>Date</th>
										<th>temps Res</th>
										<th>Score</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${penduModel.mesChallengesSujetsJoues }" var="pendu">
										<tr>
											<td><c:out value="${pendu.dateStringMoi }"></c:out></td>
											<td><c:out value="${pendu.tempsRestantMoi }"></c:out></td>
											<td> <c:out value="${pendu.scoreTotalMoi }"/>/<c:out value="${pendu.scoreTotalMax}"/></td>
											<td><a href="voirAmi?id=${pendu.monFriend.id }"><c:out value="${pendu.monFriend.nom }"/></a></td>
											<td><c:out value="${pendu.dateStringAmi }"></c:out></td>
											<td><c:out value="${pendu.tempsRestantAmi }"></c:out></td>
											<td> <c:out value="${pendu.scoreTotalAmi }"/>/<c:out value="${pendu.scoreTotalMax}"/></td>
											<td>
												<button data-toggle="modal" href="infosPenduSujetsChallengeId?idChallenge=${pendu.id }" data-target="#infos"  class="btn btn-primary" >
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
		  function accepterChallengeSujets(lui, id){
			  lui.disabled = 'true';
			  document.getElementById("refuser").disabled=true;
			  var param = 'idAmi='+id+'&action=accepter';
			  $(function(){
				  $("#actionRecus").load("accepterEtInfosChallengeSujetsRecus .accpeterRecu", param);
			  })			  
		  };
		  function refuserChallengeSujets(lui, id){
			  lui.disabled = 'true';
			  document.getElementById("accepter").disabled=true;
			  var param = 'idAmi='+id+'&action=refuser';
			  $(function(){
				  $("#actionRecus").load("accepterEtInfosChallengeSujetsRecus .refuserRecu", param);
			  })			  
		  };
		  function allerAuDuelChallengeSujets(lui, id){
			  lui.disabled = 'true';
			  var param = 'idAmi='+id+'&action=allerAuDuel';
		//	  $(function(){
				  window.location = 'penduChallengeSujetsJeu?idAmi='+id;
				//  $("#actionAttentes").load("accepterEtInfosChallengeDicoRecus .allerAuDuel", param);
		//	  })			  
		  };
		  function annulerEnvoiChallengeSujets(lui, id){
			  lui.disabled = 'true';
			  var param = 'idAmi='+id+'&action=annulerEnvoi';
			  $(function(){
				  $("#actionEnvoi").load("accepterEtInfosChallengeSujetsRecus .annulerEnvoi", param);
			  })			  
		  };
		</script>
		
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>