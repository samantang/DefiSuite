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


<title>PenduSoloJeu</title>
</head>
<body>
		<jsp:include page="entete.jsp"></jsp:include>
 <div style="margin-top: 55px" >		
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-lg-3 menuGaucheFixe">
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
			<div class="col-md-9 col-lg-9">
				
				<div style="text-align: center;">
				<div id ="infosTemps"><h3>il vous reste au toal <span id="infosTempsFini">00</span> <span id="time"></span> minutes</h3></div>
				<div><button data-toggle="modal" class="btn btn-success validerSujets" data-target="#infos">Valider Tous les Sujets</button></div><br><hr>
				<div id="resultatChallengeSujets"></div>
				<div class="modal fade" id="infos">
			        <div class="modal-dialog modal-lg">  
			          <div class="modal-content"></div>  
			        </div>
			      </div>
			      <div><button class="btn btn-danger quitterLeJeuPenduChallengeSujets">Quitter la page</button></div> <br><hr>
				<div id="resultatSujets"></div>
					<ul class="nav nav-pills">
					    <li class="active"><a href="#pays">Pays</a></li>
					    <li><a href="#capitales">Capitales</a></li>
					    <li><a href="#nobels">Prix Nobels</a></li>
					    <li><a href="#artistes">Artistes</a></li>
					    <li><a href="#presidents">Présidents/Chef d'Etats</a></li>
					    <!-- <li><a href="#animaux">Animaux</a></li>
					    <li><a href="#agglos">Agglomerations</a></li> -->
					    <!-- <li><a href="#villesFr">Villes de France</a></li> -->
					</ul><hr>
					<div class="tab-content">
					    <div class="tab-pane active" id="pays">
					    	<c:import url="penduSujetPays.jsp"></c:import>
					    </div>
					    <div class="tab-pane" id="capitales">
					    	<c:import url="penduSujetCapitales.jsp"></c:import>
					    </div>
					    <div class="tab-pane" id="nobels">
					    	<c:import url="penduSujetNobels.jsp"></c:import>
					    </div>
					    <div class="tab-pane" id="artistes">
					    	<c:import url="penduSujetArtistes.jsp"></c:import>
					    </div>
					    <div class="tab-pane" id="presidents">
					    	<c:import url="penduSujetPresidents.jsp"></c:import>
					    </div>
					    <div class="tab-pane" id="Animaux">LES ANIMAUX</div>
					    <div class="tab-pane" id="agglos">LES AGGLOMERATIONS</div>
					    <!-- <div class="tab-pane" id="villesFr">LES VILLES DE FRANCE</div> -->
					</div>
				</div>
			</div>
			<%-- <div class="col-md-3 col-lg-3">
				<div id ="image"> ici une image qui représente le jeu</div>
				<div>
					<jsp:include page="menuDroit.jsp"></jsp:include>
					<c:import url="menuDroit.jsp"></c:import>
				</div>
			</div> --%>
		</div>
	</div>
</div>

	<script type="text/javascript">
			$(function(){
				/* pour naviguer entre les liens des intitules */
				  $('a')
				  .click(function (e) {
				    e.preventDefault();
				    $(this).tab('show');
				  })
				  .on('shown.bs.tab', function (e) {
				    $('#actif span').html($(e.target).text());
				    $('#precedent span').html($(e.relatedTarget).text());
				  });
				  /* pour la validation du jeu avec le boutton */
				  $('.validerSujets')
				 	 .click(function(){
					  var param ='tempsRestant='+$('#time').text()+'';
					  	window.location.href ='resultatPenduSujetsChallenge/?'+param; 
					  	/* $('button').attr('href', 'resultatPenduSujetsChallenge/?'+param); */
					  	$('.communPays').attr('disabled','disabled');
			        	 $('.communCapitales').attr('disabled','disabled');
			        	 $('.communArtistes').attr('disabled','disabled');
			        	 $('.communNobels').attr('disabled','disabled');
			        	 $('.communPresidents').attr('disabled','disabled');
			        	 $('#infosTemps').remove();
			        	 $('.quitterLeJeuPenduChallengeSujets').show();
			        	 $('.validerSujets').hide();
			        	 
			        	 
				  });
				  $('.quitterLeJeuPenduChallengeSujets')
				  .click(function(){
					  location = "http://localhost:8080/penduChallengeSujets";
				  })
				});
			
			/* POUR LA GESTION DU TIMER ----------------------------------------------------- */
					window.onload = function () {
						$('#infosTempsFini').hide();
						/* $('#resultatTempsFini').hide();
						$('#resultatCinqErreurs').hide(); */
						$('.quitterLeJeuPenduChallengeSujets').hide();
						
						var corrects = '${longueurMot}';
					    var fiveMinutes = 60 * 0.2 * corrects,
					        display = document.querySelector('#time');
					    startTimer(fiveMinutes, display);
				    
					};
					function startTimer(duration, display) {
					      /* $('#redirect').hide(); */
				   	  	var start = Date.now(),
				        diff,
				        minutes,
				        seconds;
				    	function timer() {
					        // get the number of seconds that have elapsed since 
					        // startTimer() was called
					        diff = duration - (((Date.now() - start) / 1000) | 0);
					
					        // does the same job as parseInt truncates the float
					        minutes = (diff / 60) | 0;
					        seconds = (diff % 60) | 0;
					
					        minutes = minutes < 10 ? "0" + minutes : minutes;
					        seconds = seconds < 10 ? "0" + seconds : seconds;
					
					        display.textContent = minutes + ":" + seconds; 
				
					        if (diff <= 0) {
					        	 $('.communPays').attr('disabled','disabled');
					        	 $('.communCapitales').attr('disabled','disabled');
					        	 $('.communArtistes').attr('disabled','disabled');
					        	 $('.communNobels').attr('disabled','disabled');
					        	 $('.communPresident').attr('disabled','disabled');
					        	 $('button').attr('disabled','disabled');
					        	 $('#time').remove();
					        	 $('#infosTempsFini').show();
					        	 $('#infosTempsFini').val('00');
					        	 
					        	 $('#image').load('imageErreurPendu #image5'); 
					        }
				    };
				    timer();
				    setInterval(timer, 1000);
				};
									
	</script>
</body>
</html>