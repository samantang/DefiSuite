<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
					 
					<div id="resultatCapitales"></div>
					<div>
						<c:out value="${motCapitales}"></c:out><br>
						<p> Nombre d'erreurs: &nbsp; <span id="nbErreurCapitales">0</span></p>
						<div id="valeurMotCacheCapitales">${motCacheDepartCapitales}</div><br>
						<div id="linge1boutons" class="btn-group">
							<a id="ACapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">A</a>
							<a id="ZCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">Z</a>
							<a id="ECapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">E</a>
							<a id="RCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">R</a>
							<a id="TCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">T</a>
							<a id="YCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">Y</a>
							<a id="UCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">U</a>
							<a id="ICapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">I</a>
							<a id="OCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">O</a>
							<a id="PCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">P</a>
						</div><br>
						<div id="linge2boutons" class="btn-group">
							<a id="QCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">Q</a>
							<a id="SCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">S</a>
							<a id="DCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">D</a>
							<a id="FCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">F</a>
							<a id="GCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">G</a>
							<a id="HCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">H</a>
							<a id="JCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">J</a>
							<a id="KCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">K</a>
							<a id="LCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">L</a>
							<a id="MCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">M</a>
						</div><br>
						<div id="linge3boutons" class="btn-group">
							<a id="WCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">W</a>
							<a id="XCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">X</a>
							<a id="CCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">C</a>
							<a id="VCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">V</a>
							<a id="BCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">B</a>
							<a id="NCapitales" class="btn btn-info communCapitales" href="#" style="margin: 2px;">N</a>
						</div>
					</div>
					<div >
						<div id ="imageCapitales"> </div>
					</div>


<script type="text/javascript">
/* fonction pour dévoiler la lettre choisie au hasard dans le mot */
				$( document ).ready(function() {
				    var lettre ="${lettreCapitales}";
				    $('#${idBoutonCapitales}').removeClass('btn-info').addClass('btn-warning'); 
					$('#${idBoutonCapitales}').attr('disabled','disabled'); 
				    var mot = "${motCapitales }";
					var motSecret = "${motCacheDepartCapitales }";
					var motContientLettre = 0;
					for(var i=0; i<mot.length; i++){
						 if(mot[i]===lettre){
							 var index = i;
							 motSecret = motSecret.substr(0, index) + lettre + motSecret.substr(index + 1);
						 }
						 if(lettre === 'A' || lettre === 'À' || lettre === 'Â' || lettre === 'Ä'){
							 $('#ACapitales').removeClass('btn-info').addClass('btn-warning'); 
							 $('#ACapitales').attr('disabled','disabled');
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
							 $('#ECapitales').removeClass('btn-info').addClass('btn-warning'); 
							 $('#ECapitales').attr('disabled','disabled');
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
							 $('#UCapitales').removeClass('btn-info').addClass('btn-warning'); 
							 $('#UCapitales').attr('disabled','disabled');
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
							 $('#ICapitales').removeClass('btn-info').addClass('btn-warning'); 
							$('#ICapitales').attr('disabled','disabled');
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
							 $('#OCapitales').removeClass('btn-info').addClass('btn-warning'); 
							 $('#OCapitales').attr('disabled','disabled');
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
							 $('#CCapitales').removeClass('btn-info').addClass('btn-warning'); 
							 $('#CCapitales').attr('disabled','disabled');
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
					$('#valeurMotCacheCapitales').html(motSecret);
				});
				/* ======================================================================================================================== */
				/* commencent ici les methodes concernant les lettres (il faudra les factoriser)  */
				$(function(){
					 $('#ACapitales').click(function(){
						 $('#ACapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#ACapitales').attr('disabled','disabled'); 
						var lettre = $('#ACapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
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
							 $('#ACapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#ZCapitales').click(function(){
						 $('#ZCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#ZCapitales').attr('disabled','disabled'); 
						var lettre = $('#ZCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var motContientLettre = 0;
						for(var i=0; i<mot.length; i++){
								if(mot[i]===lettre){
									 motContientLettre ++;
									 var index = i;
									 motSecret = motSecret.substr(0, index) + 'Z' + motSecret.substr(index + 1);
								}
						}
						if(motContientLettre === 0) {
							 $('#ZCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}				
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#ECapitales').click(function(){
						 $('#ECapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#ECapitales').attr('disabled','disabled'); 
						var lettre = $('#ECapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
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
							 $('#ECapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#RCapitales').click(function(){
						 $('#RCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#RCapitales').attr('disabled','disabled'); 
						var lettre = $('#RCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'R' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#RCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#TCapitales').click(function(){
						 $('#TCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#TCapitales').attr('disabled','disabled'); 
						var lettre = $('#TCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'T' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#TCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					});
					 
					 $('#YCapitales').click(function(){
						 $('#YCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#YCapitales').attr('disabled','disabled'); 
						var lettre = $('#YCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Y' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#YCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#UCapitales').click(function(){
						 $('#UCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#UCapitales').attr('disabled','disabled'); 
						var lettre = $('#UCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
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
							 $('#UCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#ICapitales').click(function(){
						 $('#ICapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#ICapitales').attr('disabled','disabled'); 
						var lettre = $('#ICapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
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
							 $('#ICapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#OCapitales').click(function(){
						 $('#OCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#OCapitales').attr('disabled','disabled'); 
						var lettre = $('#OCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
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
							 $('#OCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#PCapitales').click(function(){
						 $('#PCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#PCapitales').attr('disabled','disabled'); 
						var lettre = $('#PCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'P' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#PCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#QCapitales').click(function(){
						 $('#QCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#QCapitales').attr('disabled','disabled'); 
						var lettre = $('#QCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Q' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#QCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#SCapitales').click(function(){
						 $('#SCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#SCapitales').attr('disabled','disabled'); 
						var lettre = $('#SCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'S' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#SCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#DCapitales').click(function(){
						 $('#DCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#DCapitales').attr('disabled','disabled'); 
						var lettre = $('#DCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'D' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#DCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#FCapitales').click(function(){
						 $('#FCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#FCapitales').attr('disabled','disabled'); 
						var lettre = $('#FCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'F' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#FCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#GCapitales').click(function(){
						 $('#GCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#GCapitales').attr('disabled','disabled'); 
						var lettre = $('#GCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'G' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#GCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreuCapitalesr').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#HCapitales').click(function(){
						 $('#HCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#HCapitales').attr('disabled','disabled'); 
						var lettre = $('#HCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'H' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#HCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#JCapitales').click(function(){
						 $('#JCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#JCapitales').attr('disabled','disabled'); 
						var lettre = $('#JCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'J' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#JCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#KCapitales').click(function(){
						 $('#KCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#KCapitales').attr('disabled','disabled'); 
						var lettre = $('#KCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'K' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#KCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#LCapitales').click(function(){
						 $('#LCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#LCapitales').attr('disabled','disabled'); 
						var lettre = $('#LCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'L' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#LCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#MCapitales').click(function(){
						 $('#MCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#MCapitales').attr('disabled','disabled'); 
						var lettre = $('#MCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'M' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#MCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#WCapitales').click(function(){
						 $('#WCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#WCapitales').attr('disabled','disabled'); 
						var lettre = $('#WCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'W' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#WCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#XCapitales').click(function(){
						 $('#XCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#XCapitales').attr('disabled','disabled'); 
						var lettre = $('#XCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'X' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#XCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#CCapitales').click(function(){
						 $('#CCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#CCapitales').attr('disabled','disabled'); 
						var lettre = $('#CCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
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
							 $('#CCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#VCapitales').click(function(){
						 $('#VCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#VCapitales').attr('disabled','disabled'); 
						var lettre = $('#VCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'V' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#VCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#BCapitales').click(function(){
						 $('#BCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#BCapitales').attr('disabled','disabled'); 
						var lettre = $('#BCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'B' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#BCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreur').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#NCapitales').click(function(){
						 $('#NCapitales').removeClass('btn-info').addClass('btn-success'); 
						 $('#NCapitales').attr('disabled','disabled'); 
						var lettre = $('#NCapitales').text();
						var mot = "${motCapitales }";
						var motSecret = $('#valeurMotCacheCapitales').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'N' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#NCapitales').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurCapitales').text();
							 nbE ++;
							 $('#nbErreurCapitales').html(nbE);
						}	
						 $('#valeurMotCacheCapitales').html(motSecret);
						 
						 var image = $('#nbErreurCapitales').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					function chargerImage (image){
						if(image === "1"){
							 $('#imageCapitales').load('imageErreurPendu #image1');
						 }
						 if(image === "2"){
							 $('#imageCapitales').load('imageErreurPendu #image2');
						 }
						 if(image === "3"){
							 $('#imageCapitales').load('imageErreurPendu #image3');
						 }
						 if(image === "4"){
							 $('#imageCapitales').load('imageErreurPendu #image4');
						 }
						 if(image === "5"){
							 $('#imageCapitales').load('imageErreurPendu #image5');
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
							 var param ='nbErreursCapitales='+$('#nbErreurCapitales').text()+'&tempsRestant='+$('#timeCapitales').text()+'&motUser='+$('#valeurMotCacheCapitales').text();
							 $('#resultatCapitales').load('resultatPenduCapitales .resultatGagnant', param);
							 $('.communCapitales').attr('disabled','disabled');
							 $('#timeCapitales').remove();
							 $('#infosTempsRestantCapitales').remove();
							 $('#resultatCapitales').show();
						 }
						 /* si le nombre d'erreur est égal à 5, le jeu est fini */
						 var nbErreurs = $('#nbErreurCapitales').text();
						 if(nbErreurs === "5"){
							 var motCache = $('#valeurMotCacheCapitales').text();
							// var param ='nbErreurs='+$('#nbErreurCapitales').text()+'&tempsRestant='+$('#timeCapitales').text()+'&motUser='+$('#valeurMotCacheCapitales').text();
							// var param ='nbErreurs='+$('#nbErreur').text()+'&tempsRestant='+$('#time').text();
						//	 $('#resultatCapitales').load('resultatPendu .resultatCinqErreurs', param);
							var param ='nbErreursCapitales='+$('#nbErreurCapitales').text();
							 $('#resultatCapitales').load('resultatPenduCapitales .resultatCinqErreurs', param);
							 $('.communCapitales').attr('disabled','disabled');
							 $('#infosTempsRestantCapitales').remove();					 
							// $('#resultat').show();
						 }
					}
					
					
				
				
				});
</script>
</body>
</html>