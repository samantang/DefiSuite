<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>					 
					<div id="resultatArtistes"></div>
					<div>
					
						<c:out value="${motArtistes }"></c:out><br>
						<%-- <c:out value="${word.secretWord }"></c:out><br>
						<input id="valeurMotCache" type="text" value="${word.secretWord }" ><br> --%>
						<p> Nombre d'erreurs: &nbsp; <span id="nbErreurArtistes">0</span></p>
						<p> Nombre de mots trouvés: &nbsp; <span id="nbMotsTrouvesArtistes">0</span> </p>
						<div id="valeurMotCacheArtistes">${motCacheDepartArtistes }</div><br>
						<%-- <c:out value="${word.nbreCoup }"></c:out> --%>
						<div id="linge1boutons" class="btn-group">
							<a id="AArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">A</a>
							<a id="ZArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">Z</a>
							<a id="EArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">E</a>
							<a id="RArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">R</a>
							<a id="TArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">T</a>
							<a id="YArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">Y</a>
							<a id="UArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">U</a>
							<a id="IArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">I</a>
							<a id="OArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">O</a>
							<a id="PArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">P</a>
						</div><br>
						<div id="linge2boutons" class="btn-group">
							<a id="QArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">Q</a>
							<a id="SArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">S</a>
							<a id="DArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">D</a>
							<a id="FArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">F</a>
							<a id="GArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">G</a>
							<a id="HArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">H</a>
							<a id="JArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">J</a>
							<a id="KArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">K</a>
							<a id="LArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">L</a>
							<a id="MArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">M</a>
						</div><br>
						<div id="linge3boutons" class="btn-group">
							<a id="WArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">W</a>
							<a id="XArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">X</a>
							<a id="CArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">C</a>
							<a id="VArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">V</a>
							<a id="BArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">B</a>
							<a id="NArtistes" class="btn btn-info communArtistes" href="#" style="margin: 2px;">N</a>
						</div>
					</div>
					<div >
						<div id ="imageArtistes"> </div>
					</div>


<script type="text/javascript">
/* fonction pour dévoiler la lettre choisie au hasard dans le mot */
				$( document ).ready(function() {
				    var lettre ="${lettreArtistes}";
				    $('#${idBoutonArtistes}').removeClass('btn-info').addClass('btn-warning'); 
					$('#${idBoutonArtistes}').attr('disabled','disabled'); 
				    var mot = "${motArtistes }";
					var motSecret = "${motCacheDepartArtistes }";
					var motContientLettre = 0;
					for(var i=0; i<mot.length; i++){
						 if(mot[i]===lettre){
							 var index = i;
							 motSecret = motSecret.substr(0, index) + lettre + motSecret.substr(index + 1);
						 }
						 if(lettre === 'A' || lettre === 'À' || lettre === 'Â' || lettre === 'Ä'){
							 $('#AArtistes').removeClass('btn-info').addClass('btn-warning'); 
							 $('#AArtistes').attr('disabled','disabled');
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
							 $('#EArtistes').removeClass('btn-info').addClass('btn-warning'); 
							 $('#EArtistes').attr('disabled','disabled');
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
							 $('#UArtistes').removeClass('btn-info').addClass('btn-warning'); 
							 $('#UArtistes').attr('disabled','disabled');
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
							 $('#IArtistes').removeClass('btn-info').addClass('btn-warning'); 
							$('#IArtistes').attr('disabled','disabled');
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
							 $('#OArtistes').removeClass('btn-info').addClass('btn-warning'); 
							 $('#OArtistes').attr('disabled','disabled');
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
							 $('#CArtistes').removeClass('btn-info').addClass('btn-warning'); 
							 $('#CArtistes').attr('disabled','disabled');
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
					$('#valeurMotCacheArtistes').html(motSecret);
				});
				/* ======================================================================================================================== */
				/* commencent ici les methodes concernant les lettres (il faudra les factoriser)  */
				$(function(){
					 $('#AArtistes').click(function(){
						 $('#AArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#AArtistes').attr('disabled','disabled'); 
						var lettre = $('#AArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
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
							 $('#AArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#ZArtistes').click(function(){
						 $('#ZArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#ZArtistes').attr('disabled','disabled'); 
						var lettre = $('#ZArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var motContientLettre = 0;
						for(var i=0; i<mot.length; i++){
								if(mot[i]===lettre){
									 motContientLettre ++;
									 var index = i;
									 motSecret = motSecret.substr(0, index) + 'Z' + motSecret.substr(index + 1);
								}
						}
						if(motContientLettre === 0) {
							 $('#ZArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}				
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#EArtistes').click(function(){
						 $('#EArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#EArtistes').attr('disabled','disabled'); 
						var lettre = $('#EArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
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
							 $('#EArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#RArtistes').click(function(){
						 $('#RArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#RArtistes').attr('disabled','disabled'); 
						var lettre = $('#RArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'R' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#RArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#TArtistes').click(function(){
						 $('#TArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#TArtistes').attr('disabled','disabled'); 
						var lettre = $('#TArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'T' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#TArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					});
					 
					 $('#YArtistes').click(function(){
						 $('#YArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#YArtistes').attr('disabled','disabled'); 
						var lettre = $('#YArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Y' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#YArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#UArtistes').click(function(){
						 $('#UArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#UArtistes').attr('disabled','disabled'); 
						var lettre = $('#UArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
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
							 $('#UArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#IArtistes').click(function(){
						 $('#IArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#IArtistes').attr('disabled','disabled'); 
						var lettre = $('#IArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
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
							 $('#IArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#OArtistes').click(function(){
						 $('#OArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#OArtistes').attr('disabled','disabled'); 
						var lettre = $('#OArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
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
							 $('#OArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#PArtistes').click(function(){
						 $('#PArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#PArtistes').attr('disabled','disabled'); 
						var lettre = $('#PArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'P' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#PArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#QArtistes').click(function(){
						 $('#QArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#QArtistes').attr('disabled','disabled'); 
						var lettre = $('#QArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Q' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#QArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#SArtistes').click(function(){
						 $('#SArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#SArtistes').attr('disabled','disabled'); 
						var lettre = $('#SArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'S' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#SArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#DArtistes').click(function(){
						 $('#DArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#DArtistes').attr('disabled','disabled'); 
						var lettre = $('#DArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'D' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#DArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#FArtistes').click(function(){
						 $('#FArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#FArtistes').attr('disabled','disabled'); 
						var lettre = $('#FArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'F' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#FArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#GArtistes').click(function(){
						 $('#GArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#GArtistes').attr('disabled','disabled'); 
						var lettre = $('#GArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'G' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#GArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreuArtistesr').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#HArtistes').click(function(){
						 $('#HArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#HArtistes').attr('disabled','disabled'); 
						var lettre = $('#HArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'H' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#HArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#JArtistes').click(function(){
						 $('#JArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#JArtistes').attr('disabled','disabled'); 
						var lettre = $('#JArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'J' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#JArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#KArtistes').click(function(){
						 $('#KArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#KArtistes').attr('disabled','disabled'); 
						var lettre = $('#KArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'K' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#KArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#LArtistes').click(function(){
						 $('#LArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#LArtistes').attr('disabled','disabled'); 
						var lettre = $('#LArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'L' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#LArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#MArtistes').click(function(){
						 $('#MArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#MArtistes').attr('disabled','disabled'); 
						var lettre = $('#MArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'M' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#MArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#WArtistes').click(function(){
						 $('#WArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#WArtistes').attr('disabled','disabled'); 
						var lettre = $('#WArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'W' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#WArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#XArtistes').click(function(){
						 $('#XArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#XArtistes').attr('disabled','disabled'); 
						var lettre = $('#XArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'X' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#XArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#CArtistes').click(function(){
						 $('#CArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#CArtistes').attr('disabled','disabled'); 
						var lettre = $('#CArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
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
							 $('#CArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#VArtistes').click(function(){
						 $('#VArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#VArtistes').attr('disabled','disabled'); 
						var lettre = $('#VArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'V' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#VArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#BArtistes').click(function(){
						 $('#BArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#BArtistes').attr('disabled','disabled'); 
						var lettre = $('#BArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'B' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#BArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreur').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#NArtistes').click(function(){
						 $('#NArtistes').removeClass('btn-info').addClass('btn-success'); 
						 $('#NArtistes').attr('disabled','disabled'); 
						var lettre = $('#NArtistes').text();
						var mot = "${motArtistes }";
						var motSecret = $('#valeurMotCacheArtistes').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'N' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#NArtistes').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurArtistes').text();
							 nbE ++;
							 $('#nbErreurArtistes').html(nbE);
						}	
						 $('#valeurMotCacheArtistes').html(motSecret);
						 
						 var image = $('#nbErreurArtistes').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					function chargerImage (image){
						if(image === "1"){
							 $('#imageArtistes').load('imageErreurPendu #image1');
						 }
						 if(image === "2"){
							 $('#imageArtistes').load('imageErreurPendu #image2');
						 }
						 if(image === "3"){
							 $('#imageArtistes').load('imageErreurPendu #image3');
						 }
						 if(image === "4"){
							 $('#imageArtistes').load('imageErreurPendu #image4');
						 }
						 if(image === "5"){
							 $('#imageArtistes').load('imageErreurPendu #image5');
						 }
					}
					function verifieMotEntierOuNombreErreurMax(mot, motSecret){
						 /* si tout le mot est trouve */
						 if(mot === motSecret){
							 /* on envoie la lettre, le mot, le temps,le nombre derreur, on met tous les bouttons non clickables */
							// var motCache = $('#valeurMotCache').text();
							// var param ='nbErreurs='+$('#nbErreur').text()+'&tempsRestant='+$('#time').text();
							 alert("Bravo !!! vous avez trouvé tout le mot");
							// var tempsRestant = $('#time').text();
							 var param ='nbErreursArtistes='+$('#nbErreurArtistes').text()+'&tempsRestant='+$('#timeArtistes').text()+'&motUser='+$('#valeurMotCacheArtistes').text();
							 $('#resultatArtistes').load('resultatPenduArtistes .resultatGagnant', param);
							 $('.communArtistes').attr('disabled','disabled');
							 $('#timeArtistes').remove();
							 $('#infosTempsRestantArtistes').remove();
							 $('#resultatArtistes').show();
						 }
						 /* si le nombre d'erreur est égal à 5, le jeu est fini */
						 var nbErreurs = $('#nbErreurArtistes').text();
						 if(nbErreurs === "5"){
							 var motCache = $('#valeurMotCacheArtistes').text();
							// var param ='nbErreurs='+$('#nbErreurArtistes').text()+'&tempsRestant='+$('#timeArtistes').text()+'&motUser='+$('#valeurMotCacheArtistes').text();
							// var param ='nbErreurs='+$('#nbErreur').text()+'&tempsRestant='+$('#time').text();
						//	 $('#resultatArtistes').load('resultatPendu .resultatCinqErreurs', param);
							var param ='nbErreursArtistes='+$('#nbErreurArtistes').text();
							 $('#resultatArtistes').load('resultatPenduArtistes .resultatCinqErreurs', param);
							 $('.communArtistes').attr('disabled','disabled');
							 $('#infosTempsRestantArtistes').remove();					 
							// $('#resultat').show();
						 }
					}				
				
				});
</script>
</body>
</html>