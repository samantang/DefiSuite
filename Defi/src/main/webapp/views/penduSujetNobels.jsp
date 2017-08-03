<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
					 
					<div id="resultatNobels"></div>
					<div>
					
						<c:out value="${motNobels }"></c:out><br>
						<p> Nombre d'erreurs: &nbsp; <span id="nbErreurNobels">0</span></p>
						<div id="valeurMotCacheNobels">${motCacheDepartNobels }</div><br>
						<div id="linge1boutons" class="btn-group">
							<a id="ANobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">A</a>
							<a id="ZNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">Z</a>
							<a id="ENobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">E</a>
							<a id="RNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">R</a>
							<a id="TNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">T</a>
							<a id="YNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">Y</a>
							<a id="UNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">U</a>
							<a id="INobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">I</a>
							<a id="ONobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">O</a>
							<a id="PNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">P</a>
						</div><br>
						<div id="linge2boutons" class="btn-group">
							<a id="QNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">Q</a>
							<a id="SNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">S</a>
							<a id="DNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">D</a>
							<a id="FNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">F</a>
							<a id="GNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">G</a>
							<a id="HNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">H</a>
							<a id="JNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">J</a>
							<a id="KNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">K</a>
							<a id="LNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">L</a>
							<a id="MNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">M</a>
						</div><br>
						<div id="linge3boutons" class="btn-group">
							<a id="WNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">W</a>
							<a id="XNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">X</a>
							<a id="CNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">C</a>
							<a id="VNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">V</a>
							<a id="BNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">B</a>
							<a id="NNobels" class="btn btn-info communNobels" href="#" style="margin: 2px;">N</a>
						</div>
					</div>
					<div >
						<div id ="imageNobels"> </div>
					</div>


<script type="text/javascript">
/* fonction pour dévoiler la lettre choisie au hasard dans le mot */
				$( document ).ready(function() {
				    var lettre ="${lettreNobels}";
				    $('#${idBoutonNobels}').removeClass('btn-info').addClass('btn-warning'); 
					$('#${idBoutonNobels}').attr('disabled','disabled'); 
				    var mot = "${motNobels }";
					var motSecret = "${motCacheDepartNobels }";
					var motContientLettre = 0;
					for(var i=0; i<mot.length; i++){
						 if(mot[i]===lettre){
							 var index = i;
							 motSecret = motSecret.substr(0, index) + lettre + motSecret.substr(index + 1);
						 }
						 if(lettre === 'A' || lettre === 'À' || lettre === 'Â' || lettre === 'Ä'){
							 $('#ANobels').removeClass('btn-info').addClass('btn-warning'); 
							 $('#ANobels').attr('disabled','disabled');
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
							 $('#ENobels').removeClass('btn-info').addClass('btn-warning'); 
							 $('#ENobels').attr('disabled','disabled');
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
							 $('#UNobels').removeClass('btn-info').addClass('btn-warning'); 
							 $('#UNobels').attr('disabled','disabled');
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
							 $('#INobels').removeClass('btn-info').addClass('btn-warning'); 
							$('#INobels').attr('disabled','disabled');
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
							 $('#ONobels').removeClass('btn-info').addClass('btn-warning'); 
							 $('#ONobels').attr('disabled','disabled');
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
							 $('#CNobels').removeClass('btn-info').addClass('btn-warning'); 
							 $('#CNobels').attr('disabled','disabled');
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
					$('#valeurMotCacheNobels').html(motSecret);
				});
				/* ======================================================================================================================== */
				/* commencent ici les methodes concernant les lettres (il faudra les factoriser)  */
				$(function(){
					 $('#ANobels').click(function(){
						 $('#ANobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#ANobels').attr('disabled','disabled'); 
						var lettre = $('#ANobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
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
							 $('#ANobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#ZNobels').click(function(){
						 $('#ZNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#ZNobels').attr('disabled','disabled'); 
						var lettre = $('#ZNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var motContientLettre = 0;
						for(var i=0; i<mot.length; i++){
								if(mot[i]===lettre){
									 motContientLettre ++;
									 var index = i;
									 motSecret = motSecret.substr(0, index) + 'Z' + motSecret.substr(index + 1);
								}
						}
						if(motContientLettre === 0) {
							 $('#ZNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}				
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#ENobels').click(function(){
						 $('#ENobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#ENobels').attr('disabled','disabled'); 
						var lettre = $('#ENobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
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
							 $('#ENobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#RNobels').click(function(){
						 $('#RNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#RNobels').attr('disabled','disabled'); 
						var lettre = $('#RNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'R' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#RNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#TNobels').click(function(){
						 $('#TNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#TNobels').attr('disabled','disabled'); 
						var lettre = $('#TNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'T' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#TNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					});
					 
					 $('#YNobels').click(function(){
						 $('#YNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#YNobels').attr('disabled','disabled'); 
						var lettre = $('#YNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Y' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#YNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#UNobels').click(function(){
						 $('#UNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#UNobels').attr('disabled','disabled'); 
						var lettre = $('#UNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
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
							 $('#UNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#INobels').click(function(){
						 $('#INobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#INobels').attr('disabled','disabled'); 
						var lettre = $('#INobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
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
							 $('#INobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#ONobels').click(function(){
						 $('#ONobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#ONobels').attr('disabled','disabled'); 
						var lettre = $('#ONobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
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
							 $('#ONobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#PNobels').click(function(){
						 $('#PNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#PNobels').attr('disabled','disabled'); 
						var lettre = $('#PNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'P' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#PNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#QNobels').click(function(){
						 $('#QNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#QNobels').attr('disabled','disabled'); 
						var lettre = $('#QNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Q' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#QNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#SNobels').click(function(){
						 $('#SNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#SNobels').attr('disabled','disabled'); 
						var lettre = $('#SNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'S' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#SNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#DNobels').click(function(){
						 $('#DNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#DNobels').attr('disabled','disabled'); 
						var lettre = $('#DNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'D' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#DNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#FNobels').click(function(){
						 $('#FNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#FNobels').attr('disabled','disabled'); 
						var lettre = $('#FNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'F' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#FNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#GNobels').click(function(){
						 $('#GNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#GNobels').attr('disabled','disabled'); 
						var lettre = $('#GNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'G' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#GNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreuNobelsr').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#HNobels').click(function(){
						 $('#HNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#HNobels').attr('disabled','disabled'); 
						var lettre = $('#HNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'H' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#HNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#JNobels').click(function(){
						 $('#JNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#JNobels').attr('disabled','disabled'); 
						var lettre = $('#JNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'J' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#JNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#KNobels').click(function(){
						 $('#KNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#KNobels').attr('disabled','disabled'); 
						var lettre = $('#KNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'K' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#KNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#LNobels').click(function(){
						 $('#LNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#LNobels').attr('disabled','disabled'); 
						var lettre = $('#LNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'L' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#LNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#MNobels').click(function(){
						 $('#MNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#MNobels').attr('disabled','disabled'); 
						var lettre = $('#MNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'M' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#MNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#WNobels').click(function(){
						 $('#WNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#WNobels').attr('disabled','disabled'); 
						var lettre = $('#WNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'W' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#WNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#XNobels').click(function(){
						 $('#XNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#XNobels').attr('disabled','disabled'); 
						var lettre = $('#XNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'X' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#XNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#CNobels').click(function(){
						 $('#CNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#CNobels').attr('disabled','disabled'); 
						var lettre = $('#CNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
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
							 $('#CNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#VNobels').click(function(){
						 $('#VNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#VNobels').attr('disabled','disabled'); 
						var lettre = $('#VNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'V' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#VNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#BNobels').click(function(){
						 $('#BNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#BNobels').attr('disabled','disabled'); 
						var lettre = $('#BNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'B' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#BNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreur').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#NNobels').click(function(){
						 $('#NNobels').removeClass('btn-info').addClass('btn-success'); 
						 $('#NNobels').attr('disabled','disabled'); 
						var lettre = $('#NNobels').text();
						var mot = "${motNobels }";
						var motSecret = $('#valeurMotCacheNobels').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'N' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#NNobels').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurNobels').text();
							 nbE ++;
							 $('#nbErreurNobels').html(nbE);
						}	
						 $('#valeurMotCacheNobels').html(motSecret);
						 
						 var image = $('#nbErreurNobels').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					function chargerImage (image){
						if(image === "1"){
							 $('#imageNobels').load('imageErreurPendu #image1');
						 }
						 if(image === "2"){
							 $('#imageNobels').load('imageErreurPendu #image2');
						 }
						 if(image === "3"){
							 $('#imageNobels').load('imageErreurPendu #image3');
						 }
						 if(image === "4"){
							 $('#imageNobels').load('imageErreurPendu #image4');
						 }
						 if(image === "5"){
							 $('#imageNobels').load('imageErreurPendu #image5');
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
							 var param ='nbErreursNobels='+$('#nbErreurNobels').text()+'&tempsRestant='+$('#timeNobels').text()+'&motUser='+$('#valeurMotCacheNobels').text();
							 $('#resultatNobels').load('resultatPenduNobels .resultatGagnant', param);
							 $('.communNobels').attr('disabled','disabled');
							 $('#timeNobels').remove();
							 $('#infosTempsRestantNobels').remove();
							 $('#resultatNobels').show();
						 }
						 /* si le nombre d'erreur est égal à 5, le jeu est fini */
						 var nbErreurs = $('#nbErreurNobels').text();
						 if(nbErreurs === "5"){
							 var motCache = $('#valeurMotCacheNobels').text();
							// var param ='nbErreurs='+$('#nbErreurNobels').text()+'&tempsRestant='+$('#timeNobels').text()+'&motUser='+$('#valeurMotCacheNobels').text();
							// var param ='nbErreurs='+$('#nbErreur').text()+'&tempsRestant='+$('#time').text();
						//	 $('#resultatNobels').load('resultatPendu .resultatCinqErreurs', param);
							 var param ='nbErreursNobels='+$('#nbErreurNobels').text();
							 $('#resultatNobels').load('resultatPenduNobels .resultatCinqErreurs', param);
							 $('.communNobels').attr('disabled','disabled');
							 $('#infosTempsRestantNobels').remove();					 
							// $('#resultat').show();
						 }
					}
					
					
				
				
				});
</script>
</body>
</html>