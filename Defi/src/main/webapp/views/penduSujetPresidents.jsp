<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
					 
					<div id="resultatPresident"></div>
					<div>
					
						<c:out value="${motPresident }"></c:out><br>
						
						<p> Nombre d'erreurs: &nbsp; <span id="nbErreurPresident">0</span></p>
						<div id="valeurMotCachePresident">${motCacheDepartPresident }</div><br>
						<div id="linge1boutons" class="btn-group">
							<a id="APresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">A</a>
							<a id="ZPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">Z</a>
							<a id="EPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">E</a>
							<a id="RPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">R</a>
							<a id="TPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">T</a>
							<a id="YPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">Y</a>
							<a id="UPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">U</a>
							<a id="IPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">I</a>
							<a id="OPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">O</a>
							<a id="PPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">P</a>
						</div><br>
						<div id="linge2boutons" class="btn-group">
							<a id="QPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">Q</a>
							<a id="SPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">S</a>
							<a id="DPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">D</a>
							<a id="FPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">F</a>
							<a id="GPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">G</a>
							<a id="HPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">H</a>
							<a id="JPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">J</a>
							<a id="KPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">K</a>
							<a id="LPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">L</a>
							<a id="MPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">M</a>
						</div><br>
						<div id="linge3boutons" class="btn-group">
							<a id="WPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">W</a>
							<a id="XPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">X</a>
							<a id="CPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">C</a>
							<a id="VPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">V</a>
							<a id="BPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">B</a>
							<a id="NPresident" class="btn btn-info communPresident" href="#" style="margin: 2px;">N</a>
						</div>
					</div>
					<div >
						<div id ="imagePresident"> </div>
					</div>


<script type="text/javascript">
/* fonction pour dévoiler la lettre choisie au hasard dans le mot */
				$( document ).ready(function() {
				    var lettre ="${lettrePresident}";
				    $('#${idBoutonPresident}').removeClass('btn-info').addClass('btn-warning'); 
					$('#${idBoutonPresident}').attr('disabled','disabled'); 
				    var mot = "${motPresident }";
					var motSecret = "${motCacheDepartPresident }";
					var motContientLettre = 0;
					for(var i=0; i<mot.length; i++){
						 if(mot[i]===lettre){
							 var index = i;
							 motSecret = motSecret.substr(0, index) + lettre + motSecret.substr(index + 1);
						 }
						 if(lettre === 'A' || lettre === 'À' || lettre === 'Â' || lettre === 'Ä'){
							 $('#APresident').removeClass('btn-info').addClass('btn-warning'); 
							 $('#APresident').attr('disabled','disabled');
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
							 $('#EPresident').removeClass('btn-info').addClass('btn-warning'); 
							 $('#EPresident').attr('disabled','disabled');
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
							 $('#UPresident').removeClass('btn-info').addClass('btn-warning'); 
							 $('#UPresident').attr('disabled','disabled');
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
							 $('#IPresident').removeClass('btn-info').addClass('btn-warning'); 
							$('#IPresident').attr('disabled','disabled');
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
							 $('#OPresident').removeClass('btn-info').addClass('btn-warning'); 
							 $('#OPresident').attr('disabled','disabled');
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
							 $('#CPresident').removeClass('btn-info').addClass('btn-warning'); 
							 $('#CPresident').attr('disabled','disabled');
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
					$('#valeurMotCachePresident').html(motSecret);
				});
				/* ======================================================================================================================== */
				/* commencent ici les methodes concernant les lettres (il faudra les factoriser)  */
				$(function(){
					 $('#APresident').click(function(){
						 $('#APresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#APresident').attr('disabled','disabled'); 
						var lettre = $('#APresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
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
							 $('#APresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#ZPresident').click(function(){
						 $('#ZPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#ZPresident').attr('disabled','disabled'); 
						var lettre = $('#ZPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var motContientLettre = 0;
						for(var i=0; i<mot.length; i++){
								if(mot[i]===lettre){
									 motContientLettre ++;
									 var index = i;
									 motSecret = motSecret.substr(0, index) + 'Z' + motSecret.substr(index + 1);
								}
						}
						if(motContientLettre === 0) {
							 $('#ZPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}				
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#EPresident').click(function(){
						 $('#EPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#EPresident').attr('disabled','disabled'); 
						var lettre = $('#EPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
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
							 $('#EPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#RPresident').click(function(){
						 $('#RPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#RPresident').attr('disabled','disabled'); 
						var lettre = $('#RPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'R' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#RPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#TPresident').click(function(){
						 $('#TPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#TPresident').attr('disabled','disabled'); 
						var lettre = $('#TPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'T' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#TPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					});
					 
					 $('#YPresident').click(function(){
						 $('#YPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#YPresident').attr('disabled','disabled'); 
						var lettre = $('#YPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Y' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#YPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#UPresident').click(function(){
						 $('#UPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#UPresident').attr('disabled','disabled'); 
						var lettre = $('#UPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
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
							 $('#UPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#IPresident').click(function(){
						 $('#IPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#IPresident').attr('disabled','disabled'); 
						var lettre = $('#IPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
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
							 $('#IPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#OPresident').click(function(){
						 $('#OPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#OPresident').attr('disabled','disabled'); 
						var lettre = $('#OPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
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
							 $('#OPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#PPresident').click(function(){
						 $('#PPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#PPresident').attr('disabled','disabled'); 
						var lettre = $('#PPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'P' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#PPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#QPresident').click(function(){
						 $('#QPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#QPresident').attr('disabled','disabled'); 
						var lettre = $('#QPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Q' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#QPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#SPresident').click(function(){
						 $('#SPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#SPresident').attr('disabled','disabled'); 
						var lettre = $('#SPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'S' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#SPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#DPresident').click(function(){
						 $('#DPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#DPresident').attr('disabled','disabled'); 
						var lettre = $('#DPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'D' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#DPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#FPresident').click(function(){
						 $('#FPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#FPresident').attr('disabled','disabled'); 
						var lettre = $('#FPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'F' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#FPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#GPresident').click(function(){
						 $('#GPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#GPresident').attr('disabled','disabled'); 
						var lettre = $('#GPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'G' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#GPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreuPresidentr').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#HPresident').click(function(){
						 $('#HPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#HPresident').attr('disabled','disabled'); 
						var lettre = $('#HPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'H' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#HPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#JPresident').click(function(){
						 $('#JPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#JPresident').attr('disabled','disabled'); 
						var lettre = $('#JPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'J' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#JPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#KPresident').click(function(){
						 $('#KPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#KPresident').attr('disabled','disabled'); 
						var lettre = $('#KPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'K' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#KPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#LPresident').click(function(){
						 $('#LPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#LPresident').attr('disabled','disabled'); 
						var lettre = $('#LPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'L' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#LPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#MPresident').click(function(){
						 $('#MPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#MPresident').attr('disabled','disabled'); 
						var lettre = $('#MPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'M' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#MPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#WPresident').click(function(){
						 $('#WPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#WPresident').attr('disabled','disabled'); 
						var lettre = $('#WPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'W' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#WPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#XPresident').click(function(){
						 $('#XPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#XPresident').attr('disabled','disabled'); 
						var lettre = $('#XPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'X' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#XPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#CPresident').click(function(){
						 $('#CPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#CPresident').attr('disabled','disabled'); 
						var lettre = $('#CPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
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
							 $('#CPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#VPresident').click(function(){
						 $('#VPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#VPresident').attr('disabled','disabled'); 
						var lettre = $('#VPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'V' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#VPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#BPresident').click(function(){
						 $('#BPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#BPresident').attr('disabled','disabled'); 
						var lettre = $('#BPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'B' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#BPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreur').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#NPresident').click(function(){
						 $('#NPresident').removeClass('btn-info').addClass('btn-success'); 
						 $('#NPresident').attr('disabled','disabled'); 
						var lettre = $('#NPresident').text();
						var mot = "${motPresident }";
						var motSecret = $('#valeurMotCachePresident').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'N' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#NPresident').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPresident').text();
							 nbE ++;
							 $('#nbErreurPresident').html(nbE);
						}	
						 $('#valeurMotCachePresident').html(motSecret);
						 
						 var image = $('#nbErreurPresident').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					function chargerImage (image){
						if(image === "1"){
							 $('#imagePresident').load('imageErreurPendu #image1');
						 }
						 if(image === "2"){
							 $('#imagePresident').load('imageErreurPendu #image2');
						 }
						 if(image === "3"){
							 $('#imagePresident').load('imageErreurPendu #image3');
						 }
						 if(image === "4"){
							 $('#imagePresident').load('imageErreurPendu #image4');
						 }
						 if(image === "5"){
							 $('#imagePresident').load('imageErreurPendu #image5');
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
							 var param ='nbErreursPresident='+$('#nbErreurPresident').text()+'&tempsRestant='+$('#timePresident').text()+'&motUser='+$('#valeurMotCachePresident').text();
							 $('#resultatPresident').load('resultatPenduPresident .resultatGagnant', param);
							 $('.communPresident').attr('disabled','disabled');
							 $('#timePresident').remove();
							 $('#infosTempsRestantPresident').remove();
							 $('#resultatPresident').show();
						 }
						 /* si le nombre d'erreur est égal à 5, le jeu est fini */
						 var nbErreurs = $('#nbErreurPresident').text();
						 if(nbErreurs === "5"){
							 var motCache = $('#valeurMotCachePresident').text();
							// var param ='nbErreurs='+$('#nbErreurPresident').text()+'&tempsRestant='+$('#timePresident').text()+'&motUser='+$('#valeurMotCachePresident').text();
							// var param ='nbErreurs='+$('#nbErreur').text()+'&tempsRestant='+$('#time').text();
						//	 $('#resultatPresident').load('resultatPendu .resultatCinqErreurs', param);
							var param ='nbErreursPresident='+$('#nbErreurPresident').text();
							 $('#resultatPresident').load('resultatPenduPresident .resultatCinqErreurs', param);
							 $('.communPresident').attr('disabled','disabled');
							 $('#infosTempsRestantPresident').remove();					 
							// $('#resultat').show();
						 }
					}
					
					
				
				
				});
</script>
</body>
</html>