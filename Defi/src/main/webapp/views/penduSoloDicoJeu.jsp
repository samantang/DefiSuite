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
					<div class="menuGauche">
						<c:import url="menuGauche.jsp"></c:import>
					</div>	
			</div>
			<div class="col-md-6 col-lg-6">
				<div align="center" >
				
					 <div id="infosTempsRestant" class="infosTempsRestant"><h3>Votre temps restant est de  <span id="time"></span> minutes !</h3></div><br> 
					<div id="resultat"></div>
					<div>
						<p> Nombre d'erreurs: &nbsp; <span id="nbErreur">0</span></p>
						<div id="valeurMotCache">${word.secretWord }</div><br>
						<%-- <c:out value="${word.nbreCoup }"></c:out> --%>
						<div id="linge1boutons" class="btn-group">
							<a id="A" class="btn btn-info commun" href="#" style="margin: 2px;">A</a>
							<a id="Z" class="btn btn-info commun" href="#" style="margin: 2px;">Z</a>
							<a id="E" class="btn btn-info commun" href="#" style="margin: 2px;">E</a>
							<a id="R" class="btn btn-info commun" href="#" style="margin: 2px;">R</a>
							<a id="T" class="btn btn-info commun" href="#" style="margin: 2px;">T</a>
							<a id="Y" class="btn btn-info commun" href="#" style="margin: 2px;">Y</a>
							<a id="U" class="btn btn-info commun" href="#" style="margin: 2px;">U</a>
							<a id="I" class="btn btn-info commun" href="#" style="margin: 2px;">I</a>
							<a id="O" class="btn btn-info commun" href="#" style="margin: 2px;">O</a>
							<a id="P" class="btn btn-info commun" href="#" style="margin: 2px;">P</a>
						</div><br>
						<div id="linge2boutons" class="btn-group">
							<a id="Q" class="btn btn-info commun" href="#" style="margin: 2px;">Q</a>
							<a id="S" class="btn btn-info commun" href="#" style="margin: 2px;">S</a>
							<a id="D" class="btn btn-info commun" href="#" style="margin: 2px;">D</a>
							<a id="F" class="btn btn-info commun" href="#" style="margin: 2px;">F</a>
							<a id="G" class="btn btn-info commun" href="#" style="margin: 2px;">G</a>
							<a id="H" class="btn btn-info commun" href="#" style="margin: 2px;">H</a>
							<a id="J" class="btn btn-info commun" href="#" style="margin: 2px;">J</a>
							<a id="K" class="btn btn-info commun" href="#" style="margin: 2px;">K</a>
							<a id="L" class="btn btn-info commun" href="#" style="margin: 2px;">L</a>
							<a id="M" class="btn btn-info commun" href="#" style="margin: 2px;">M</a>
						</div><br>
						<div id="linge3boutons" class="btn-group">
							<a id="W" class="btn btn-info commun" href="#" style="margin: 2px;">W</a>
							<a id="X" class="btn btn-info commun" href="#" style="margin: 2px;">X</a>
							<a id="C" class="btn btn-info commun" href="#" style="margin: 2px;">C</a>
							<a id="V" class="btn btn-info commun" href="#" style="margin: 2px;">V</a>
							<a id="B" class="btn btn-info commun" href="#" style="margin: 2px;">B</a>
							<a id="N" class="btn btn-info commun" href="#" style="margin: 2px;">N</a>
						</div>
					</div><br><br><br>
					<div>
						<ul class="list-group">
						  <a href="#" class="list-group-item ">
						    <h4 class="list-group-item-heading">Pendu Dico Solo</h4>
						    <p  class="list-group-item-text pull-right">Jouer avec les mots du dictionnaire, vous en avez plus de 36 000,
						    le mot avec lequel vous allez jouer est tiré au sort et une lettre vous ai indiqué dans le mot pour vous guider.</p>
						    <img src="<%=request.getContextPath()%>/resources/images/user.png" height="50px" width="50px">
						  </a>
						 </ul> 
					</div>	
				</div>
			</div>
			<div class="col-md-3 col-lg-3">
				<div id ="image" style="text-align: center; margin-top: 15px;"></div>
				<div>
				</div>
			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
	/* fonction pour dévoiler la lettre choisie au hasard dans le mot */
		$( document ).ready(function() {
		    var lettre ="${lettreDevoilee}";
		    $('#${lettreDevoilee}').removeClass('btn-info').addClass('btn-warning'); 
			$('#${lettreDevoilee}').attr('disabled','disabled'); 
		    var mot = "${word.word }";
			var motSecret = "${word.secretWord }";
			var motContientLettre = 0;
			for(var i=0; i<mot.length; i++){
				 if(mot[i]===lettre){
					 var index = i;
					 motSecret = motSecret.substr(0, index) + lettre + motSecret.substr(index + 1);
				 }
				 if(lettre === 'A' || lettre === 'À' || lettre === 'Â' || lettre === 'Ä'){
					 $('#A').removeClass('btn-info').addClass('btn-warning'); 
					 $('#A').attr('disabled','disabled');
					 if (mot[i]==='À') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'À' + motSecret.substr(index + 1);
					}else if (mot[i]==='Â') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Â' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ä') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ä' + motSecret.substr(index + 1);
					}else if (mot[i]==='A') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'A' + motSecret.substr(index + 1);
					}
				 }
				 if( lettre === 'E' || lettre === 'É' || lettre === 'È' || lettre === 'Ê' || lettre === 'Ë' ){
					 $('#E').removeClass('btn-info').addClass('btn-warning'); 
					 $('#E').attr('disabled','disabled');
					 if (mot[i]==='É') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'É' + motSecret.substr(index + 1);
					}else if (mot[i]==='È') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'È' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ê') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ê' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ë') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ë' + motSecret.substr(index + 1);
					}
					else if (mot[i]==='E') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'E' + motSecret.substr(index + 1);
					}
				 }
				 if(lettre === 'U' || lettre === 'Û' || lettre === 'Ü'){
					 $('#U').removeClass('btn-info').addClass('btn-warning'); 
					 $('#U').attr('disabled','disabled');
					 if (mot[i]==='Û') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'Û' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ü') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ü' + motSecret.substr(index + 1);
					}else if (mot[i]==='U') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'U' + motSecret.substr(index + 1);
					}
				 }
				 if(lettre === 'I' || lettre === 'Î' || lettre === 'Ï'){
					 $('#I').removeClass('btn-info').addClass('btn-warning'); 
					$('#I').attr('disabled','disabled');
					 if (mot[i]==='Î') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'Î' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ï') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ï' + motSecret.substr(index + 1);
					}else if (mot[i]==='I') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'I' + motSecret.substr(index + 1);
					}
				 }
				 if(lettre === 'O' || lettre === 'Ô' || lettre === 'Ö'){
					 $('#O').removeClass('btn-info').addClass('btn-warning'); 
					 $('#O').attr('disabled','disabled');
						 if (mot[i]==='O') {
							 motContientLettre ++;
							 var index = i;
							 motSecret = motSecret.substr(0, index) + 'O' + motSecret.substr(index + 1);
						}else if (mot[i]==='Ô') {
							motContientLettre ++;
							var index = i;
							 motSecret = motSecret.substr(0, index) + 'Ô' + motSecret.substr(index + 1);
						}else if (mot[i]==='Ö') {
							motContientLettre ++;
							var index = i;
							 motSecret = motSecret.substr(0, index) + 'Ö' + motSecret.substr(index + 1);
						}
				 }
				 if(lettre === 'C' || lettre === 'Ç'){
					 $('#C').removeClass('btn-info').addClass('btn-warning'); 
					 $('#C').attr('disabled','disabled');
						 if (mot[i]==='C') {
							 motContientLettre ++;
							 var index = i;
							 motSecret = motSecret.substr(0, index) + 'C' + motSecret.substr(index + 1);
						}else if (mot[i]==='Ç') {
							motContientLettre ++;
							var index = i;
							 motSecret = motSecret.substr(0, index) + 'Ç' + motSecret.substr(index + 1);
						}
				 }
			}
			$('#valeurMotCache').html(motSecret);
		});
	/* ======================================================================================================================== */
	/* commencent ici les methodes concernant les lettres (il faudra les factoriser)  */
		$(function(){
			 $('#A').click(function(){
				 $('#A').removeClass('btn-info').addClass('btn-success'); 
				 $('#A').attr('disabled','disabled'); 
				var lettre = $('#A').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var motContientLettre = 0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'A' + motSecret.substr(index + 1);
					 }else if (mot[i]==='À') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'À' + motSecret.substr(index + 1);
					}else if (mot[i]==='Â') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Â' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ä') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ä' + motSecret.substr(index + 1);
					}
				}
				if(motContientLettre === 0) {
					 $('#A').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
				
			}); 
			 $('#Z').click(function(){
				 $('#Z').removeClass('btn-info').addClass('btn-success'); 
				 $('#Z').attr('disabled','disabled'); 
				var lettre = $('#Z').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var motContientLettre = 0;
				for(var i=0; i<mot.length; i++){
						if(mot[i]===lettre){
							 motContientLettre ++;
							 var index = i;
							 motSecret = motSecret.substr(0, index) + 'Z' + motSecret.substr(index + 1);
						}
				}
				if(motContientLettre === 0) {
					 $('#Z').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}				
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
				
			}); 
			 $('#E').click(function(){
				 $('#E').removeClass('btn-info').addClass('btn-success'); 
				 $('#E').attr('disabled','disabled'); 
				var lettre = $('#E').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var motContientLettre = 0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'E' + motSecret.substr(index + 1);
					 }else if (mot[i]==='É') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'É' + motSecret.substr(index + 1);
					}else if (mot[i]==='È') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'È' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ê') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ê' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ë') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ë' + motSecret.substr(index + 1);
					}
				}
				if(motContientLettre === 0) {
					 $('#E').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#R').click(function(){
				 $('#R').removeClass('btn-info').addClass('btn-success'); 
				 $('#R').attr('disabled','disabled'); 
				var lettre = $('#R').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'R' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#R').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#T').click(function(){
				 $('#T').removeClass('btn-info').addClass('btn-success'); 
				 $('#T').attr('disabled','disabled'); 
				var lettre = $('#T').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'T' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#T').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			});
			 
			 $('#Y').click(function(){
				 $('#Y').removeClass('btn-info').addClass('btn-success'); 
				 $('#Y').attr('disabled','disabled'); 
				var lettre = $('#Y').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'Y' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#Y').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#U').click(function(){
				 $('#U').removeClass('btn-info').addClass('btn-success'); 
				 $('#U').attr('disabled','disabled'); 
				var lettre = $('#U').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'U' + motSecret.substr(index + 1);
					 }else if (mot[i]==='Û') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'Û' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ü') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ü' + motSecret.substr(index + 1);
					}
				}
				if(motContientLettre === 0) {
					 $('#U').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#I').click(function(){
				 $('#I').removeClass('btn-info').addClass('btn-success'); 
				 $('#I').attr('disabled','disabled'); 
				var lettre = $('#I').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'I' + motSecret.substr(index + 1);
					 }else if (mot[i]==='Î') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'Î' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ï') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ï' + motSecret.substr(index + 1);
					}
				}
				if(motContientLettre === 0) {
					 $('#I').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#O').click(function(){
				 $('#O').removeClass('btn-info').addClass('btn-success'); 
				 $('#O').attr('disabled','disabled'); 
				var lettre = $('#O').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'O' + motSecret.substr(index + 1);
					 }else if (mot[i]==='Ô') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ô' + motSecret.substr(index + 1);
					}else if (mot[i]==='Ö') {
						motContientLettre ++;
						var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ö' + motSecret.substr(index + 1);
					}
				}
				if(motContientLettre === 0) {
					 $('#O').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#P').click(function(){
				 $('#P').removeClass('btn-info').addClass('btn-success'); 
				 $('#P').attr('disabled','disabled'); 
				var lettre = $('#P').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'P' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#P').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#Q').click(function(){
				 $('#Q').removeClass('btn-info').addClass('btn-success'); 
				 $('#Q').attr('disabled','disabled'); 
				var lettre = $('#Q').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'Q' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#Q').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#S').click(function(){
				 $('#S').removeClass('btn-info').addClass('btn-success'); 
				 $('#S').attr('disabled','disabled'); 
				var lettre = $('#S').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'S' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#S').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#D').click(function(){
				 $('#D').removeClass('btn-info').addClass('btn-success'); 
				 $('#D').attr('disabled','disabled'); 
				var lettre = $('#D').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'D' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#D').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#F').click(function(){
				 $('#F').removeClass('btn-info').addClass('btn-success'); 
				 $('#F').attr('disabled','disabled'); 
				var lettre = $('#F').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'F' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#F').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#G').click(function(){
				 $('#G').removeClass('btn-info').addClass('btn-success'); 
				 $('#G').attr('disabled','disabled'); 
				var lettre = $('#G').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'G' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#G').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#H').click(function(){
				 $('#H').removeClass('btn-info').addClass('btn-success'); 
				 $('#H').attr('disabled','disabled'); 
				var lettre = $('#H').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'H' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#H').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
			}); 
			 $('#J').click(function(){
				 $('#J').removeClass('btn-info').addClass('btn-success'); 
				 $('#J').attr('disabled','disabled'); 
				var lettre = $('#J').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'J' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#J').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#K').click(function(){
				 $('#K').removeClass('btn-info').addClass('btn-success'); 
				 $('#K').attr('disabled','disabled'); 
				var lettre = $('#K').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'K' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#K').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#L').click(function(){
				 $('#L').removeClass('btn-info').addClass('btn-success'); 
				 $('#L').attr('disabled','disabled'); 
				var lettre = $('#L').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'L' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#L').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#M').click(function(){
				 $('#M').removeClass('btn-info').addClass('btn-success'); 
				 $('#M').attr('disabled','disabled'); 
				var lettre = $('#M').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'M' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#M').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#W').click(function(){
				 $('#W').removeClass('btn-info').addClass('btn-success'); 
				 $('#W').attr('disabled','disabled'); 
				var lettre = $('#W').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'W' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#W').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#X').click(function(){
				 $('#X').removeClass('btn-info').addClass('btn-success'); 
				 $('#X').attr('disabled','disabled'); 
				var lettre = $('#X').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'X' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#X').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#C').click(function(){
				 $('#C').removeClass('btn-info').addClass('btn-success'); 
				 $('#C').attr('disabled','disabled'); 
				var lettre = $('#C').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'C' + motSecret.substr(index + 1);
					 }else if (mot[i]==='Ç') {
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'Ç' + motSecret.substr(index + 1);
					}
				}
				if(motContientLettre === 0) {
					 $('#C').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#V').click(function(){
				 $('#V').removeClass('btn-info').addClass('btn-success'); 
				 $('#V').attr('disabled','disabled'); 
				var lettre = $('#V').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'V' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#V').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#B').click(function(){
				 $('#B').removeClass('btn-info').addClass('btn-success'); 
				 $('#B').attr('disabled','disabled'); 
				var lettre = $('#B').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'B' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#B').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			 $('#N').click(function(){
				 $('#N').removeClass('btn-info').addClass('btn-success'); 
				 $('#N').attr('disabled','disabled'); 
				var lettre = $('#N').text();
				var mot = "${word.word }";
				var motSecret = $('#valeurMotCache').text();
				var  motContientLettre =0;
				for(var i=0; i<mot.length; i++){
					 if(mot[i]===lettre){
						 motContientLettre ++;
						 var index = i;
						 motSecret = motSecret.substr(0, index) + 'N' + motSecret.substr(index + 1);
					 }
				}
				if(motContientLettre === 0) {
					 $('#N').removeClass('btn-info').addClass('btn-danger');
					 var nbE = $('#nbErreur').text();
					 nbE ++;
					 $('#nbErreur').html(nbE);
				}	
				 $('#valeurMotCache').html(motSecret);
				 
				 var image = $('#nbErreur').text();
				 chargerImage(image);
				 verifieMotEntierOuNombreErreurMax(mot, motSecret);
			}); 
			function chargerImage (image){
				if(image === "1"){
					 $('#image').load('imageErreurPendu #image1');
				 }
				 if(image === "2"){
					 $('#image').load('imageErreurPendu #image2');
				 }
				 if(image === "3"){
					 $('#image').load('imageErreurPendu #image3');
				 }
				 if(image === "4"){
					 $('#image').load('imageErreurPendu #image4');
				 }
				 if(image === "5"){
					 $('#image').load('imageErreurPendu #image5');
				 }
			}
			function verifieMotEntierOuNombreErreurMax(mot, motSecret){
				 /* si tout le mot est trouve */
				 if(mot === motSecret){
					 /* on envoie la lettre, le mot, le temps,le nombre derreur, on rend tous les bouttons non clickables */
					 alert("Bravo !!! vous avez trouvé tout le mot");
					 var param ='nbErreurs='+$('#nbErreur').text()+'&tempsRestant='+$('#time').text()+'&motUser='+$('#valeurMotCache').text();
					 $('#resultat').load('resultatPendu .resultatGagnant', param);
					 $('.commun').attr('disabled','disabled');
					 //pour augmenter le temps
					 var minutes = 60 * 10000000,
				     display = document.querySelector('#time');
				     startTimer(minutes, display);
				    
				     $('#image').load('imageErreurPendu #imageGagnant');
					 $('#time').remove();
					 $('#infosTempsRestant').remove(); 
					 $('#resultat').show();
				 }
				 /* si le nombre d'erreur est égal à 5, le jeu est fini */
				 var nbErreurs = $('#nbErreur').text();
				 if(nbErreurs === "5"){
					 var motCache = $('#valeurMotCache').text();
					 var param ='nbErreurs='+$('#nbErreur').text()+'&tempsRestant='+$('#time').text()+'&motUser='+$('#valeurMotCache').text();
					 $('#resultat').load('resultatPendu .resultatCinqErreurs', param);
					 $('.commun').attr('disabled','disabled');
					 $('#infosTempsRestant').remove();					 
					 $('#resultat').show();
					 $('#image').load('imageErreurPendu #image5');
					 
					 var minutes = 60 * 1000000,
				     display = document.querySelector('#time');
				    startTimer(minutes, display);
				 }
			}
		});
			/* POUR LA GESTION DU TIMER ----------------------------------------------------- */
			window.onload = function () {
				$('#resultat').hide();
				$('#image').load('imageErreurPendu #imageDepart');
				
				var corrects = '${longueurMot}';
			    var fiveMinutes = 60 * 0.2 * corrects,
			        display = document.querySelector('#time');
			    startTimer(fiveMinutes, display);
			};
			function startTimer(duration, display) {
		   	  	var start = Date.now(),
		        diff,
		        minutes,
		        seconds;
		   	  	
		    	function timer() {
		    		display = document.querySelector('#time');
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

			        	 var motCache = $('#valeurMotCache').text();
			        	 var timeOut = "oui";
						 var param ='nbErreurs='+$('#nbErreur').text()+'&tempsRestant='+$('#time').text()+'&motUser='+$('#valeurMotCache').text()+'&timeOut='+timeOut;
			        	 $('#resultat').load('resultatPendu .resultatTempsFini', param);
			        	 $('.commun').attr('disabled','disabled');
			        	 $('#time').remove();
						 $('#infosTempsRestant').remove();
			        	 $('#resultat').show();
			        	 $('#image').load('imageErreurPendu #image5');
			        	 
			            // augmentation du temps meme si le temps n'est plus visibles pour empecher une nouvelle insertion dans la BDD
			            var minutes = 60 * 10000000,
					     display = document.querySelector('#time');
					    startTimer(minutes, display);
			            
			              start = Date.now() + 10000000; 
			        }
		    };
		    // we don't want to wait a full second before the timer starts
		    timer();
		    setInterval(timer, 1000);
		}
		
		
		
		
	</script>
</body>
</html>