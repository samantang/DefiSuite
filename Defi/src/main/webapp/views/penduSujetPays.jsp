<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
					 
					<div id="resultatPays"></div>
					<div>
					
						<c:out value="${motPays }"></c:out><br>
						
						<p> Nombre d'erreurs: &nbsp; <span id="nbErreurPays">0</span></p>
						<div id="valeurMotCachePays">${motCacheDepartPays }</div><br>
						<div id="linge1boutons" class="btn-group">
							<a id="APays" class="btn btn-info communPays" href="#" style="margin: 2px;">A</a>
							<a id="ZPays" class="btn btn-info communPays" href="#" style="margin: 2px;">Z</a>
							<a id="EPays" class="btn btn-info communPays" href="#" style="margin: 2px;">E</a>
							<a id="RPays" class="btn btn-info communPays" href="#" style="margin: 2px;">R</a>
							<a id="TPays" class="btn btn-info communPays" href="#" style="margin: 2px;">T</a>
							<a id="YPays" class="btn btn-info communPays" href="#" style="margin: 2px;">Y</a>
							<a id="UPays" class="btn btn-info communPays" href="#" style="margin: 2px;">U</a>
							<a id="IPays" class="btn btn-info communPays" href="#" style="margin: 2px;">I</a>
							<a id="OPays" class="btn btn-info communPays" href="#" style="margin: 2px;">O</a>
							<a id="PPays" class="btn btn-info communPays" href="#" style="margin: 2px;">P</a>
						</div><br>
						<div id="linge2boutons" class="btn-group">
							<a id="QPays" class="btn btn-info communPays" href="#" style="margin: 2px;">Q</a>
							<a id="SPays" class="btn btn-info communPays" href="#" style="margin: 2px;">S</a>
							<a id="DPays" class="btn btn-info communPays" href="#" style="margin: 2px;">D</a>
							<a id="FPays" class="btn btn-info communPays" href="#" style="margin: 2px;">F</a>
							<a id="GPays" class="btn btn-info communPays" href="#" style="margin: 2px;">G</a>
							<a id="HPays" class="btn btn-info communPays" href="#" style="margin: 2px;">H</a>
							<a id="JPays" class="btn btn-info communPays" href="#" style="margin: 2px;">J</a>
							<a id="KPays" class="btn btn-info communPays" href="#" style="margin: 2px;">K</a>
							<a id="LPays" class="btn btn-info communPays" href="#" style="margin: 2px;">L</a>
							<a id="MPays" class="btn btn-info communPays" href="#" style="margin: 2px;">M</a>
						</div><br>
						<div id="linge3boutons" class="btn-group">
							<a id="WPays" class="btn btn-info communPays" href="#" style="margin: 2px;">W</a>
							<a id="XPays" class="btn btn-info communPays" href="#" style="margin: 2px;">X</a>
							<a id="CPays" class="btn btn-info communPays" href="#" style="margin: 2px;">C</a>
							<a id="VPays" class="btn btn-info communPays" href="#" style="margin: 2px;">V</a>
							<a id="BPays" class="btn btn-info communPays" href="#" style="margin: 2px;">B</a>
							<a id="NPays" class="btn btn-info communPays" href="#" style="margin: 2px;">N</a>
						</div>
					</div>
					<div >
						<div id ="imagePays"> </div>
					</div>


<script type="text/javascript">
/* fonction pour dévoiler la lettre choisie au hasard dans le mot */
				$( document ).ready(function() {
				    var lettre ="${lettrePays}";
				    $('#${idBoutonPays}').removeClass('btn-info').addClass('btn-warning'); 
					$('#${idBoutonPays}').attr('disabled','disabled'); 
				    var mot = "${motPays }";
					var motSecret = "${motCacheDepartPays }";
					var motContientLettre = 0;
					for(var i=0; i<mot.length; i++){
						 if(mot[i]===lettre){
							 var index = i;
							 motSecret = motSecret.substr(0, index) + lettre + motSecret.substr(index + 1);
						 }
						 if(lettre === 'A' || lettre === 'À' || lettre === 'Â' || lettre === 'Ä'){
							 $('#APays').removeClass('btn-info').addClass('btn-warning'); 
							 $('#APays').attr('disabled','disabled');
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
							 $('#EPays').removeClass('btn-info').addClass('btn-warning'); 
							 $('#EPays').attr('disabled','disabled');
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
							 $('#UPays').removeClass('btn-info').addClass('btn-warning'); 
							 $('#UPays').attr('disabled','disabled');
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
							 $('#IPays').removeClass('btn-info').addClass('btn-warning'); 
							$('#IPays').attr('disabled','disabled');
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
							 $('#OPays').removeClass('btn-info').addClass('btn-warning'); 
							 $('#OPays').attr('disabled','disabled');
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
							 $('#CPays').removeClass('btn-info').addClass('btn-warning'); 
							 $('#CPays').attr('disabled','disabled');
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
					$('#valeurMotCachePays').html(motSecret);
				});
				/* ======================================================================================================================== */
				/* commencent ici les methodes concernant les lettres (il faudra les factoriser)  */
				$(function(){
					 $('#APays').click(function(){
						 $('#APays').removeClass('btn-info').addClass('btn-success'); 
						 $('#APays').attr('disabled','disabled'); 
						var lettre = $('#APays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
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
							 $('#APays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#ZPays').click(function(){
						 $('#ZPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#ZPays').attr('disabled','disabled'); 
						var lettre = $('#ZPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var motContientLettre = 0;
						for(var i=0; i<mot.length; i++){
								if(mot[i]===lettre){
									 motContientLettre ++;
									 var index = i;
									 motSecret = motSecret.substr(0, index) + 'Z' + motSecret.substr(index + 1);
								}
						}
						if(motContientLettre === 0) {
							 $('#ZPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}				
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
						
					}); 
					 $('#EPays').click(function(){
						 $('#EPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#EPays').attr('disabled','disabled'); 
						var lettre = $('#EPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
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
							 $('#EPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#RPays').click(function(){
						 $('#RPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#RPays').attr('disabled','disabled'); 
						var lettre = $('#RPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'R' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#RPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#TPays').click(function(){
						 $('#TPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#TPays').attr('disabled','disabled'); 
						var lettre = $('#TPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'T' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#TPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					});
					 
					 $('#YPays').click(function(){
						 $('#YPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#YPays').attr('disabled','disabled'); 
						var lettre = $('#YPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Y' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#YPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#UPays').click(function(){
						 $('#UPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#UPays').attr('disabled','disabled'); 
						var lettre = $('#UPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
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
							 $('#UPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#IPays').click(function(){
						 $('#IPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#IPays').attr('disabled','disabled'); 
						var lettre = $('#IPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
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
							 $('#IPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#OPays').click(function(){
						 $('#OPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#OPays').attr('disabled','disabled'); 
						var lettre = $('#OPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
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
							 $('#OPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#PPays').click(function(){
						 $('#PPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#PPays').attr('disabled','disabled'); 
						var lettre = $('#PPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'P' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#PPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#QPays').click(function(){
						 $('#QPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#QPays').attr('disabled','disabled'); 
						var lettre = $('#QPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'Q' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#QPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#SPays').click(function(){
						 $('#SPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#SPays').attr('disabled','disabled'); 
						var lettre = $('#SPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'S' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#SPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#DPays').click(function(){
						 $('#DPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#DPays').attr('disabled','disabled'); 
						var lettre = $('#DPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'D' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#DPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#FPays').click(function(){
						 $('#FPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#FPays').attr('disabled','disabled'); 
						var lettre = $('#FPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'F' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#FPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#GPays').click(function(){
						 $('#GPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#GPays').attr('disabled','disabled'); 
						var lettre = $('#GPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'G' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#GPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreuPaysr').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#HPays').click(function(){
						 $('#HPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#HPays').attr('disabled','disabled'); 
						var lettre = $('#HPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'H' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#HPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#JPays').click(function(){
						 $('#JPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#JPays').attr('disabled','disabled'); 
						var lettre = $('#JPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'J' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#JPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#KPays').click(function(){
						 $('#KPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#KPays').attr('disabled','disabled'); 
						var lettre = $('#KPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'K' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#KPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#LPays').click(function(){
						 $('#LPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#LPays').attr('disabled','disabled'); 
						var lettre = $('#LPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'L' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#LPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#MPays').click(function(){
						 $('#MPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#MPays').attr('disabled','disabled'); 
						var lettre = $('#MPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'M' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#MPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#WPays').click(function(){
						 $('#WPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#WPays').attr('disabled','disabled'); 
						var lettre = $('#WPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'W' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#WPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#XPays').click(function(){
						 $('#XPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#XPays').attr('disabled','disabled'); 
						var lettre = $('#XPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'X' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#XPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#CPays').click(function(){
						 $('#CPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#CPays').attr('disabled','disabled'); 
						var lettre = $('#CPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
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
							 $('#CPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#VPays').click(function(){
						 $('#VPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#VPays').attr('disabled','disabled'); 
						var lettre = $('#VPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'V' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#VPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#BPays').click(function(){
						 $('#BPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#BPays').attr('disabled','disabled'); 
						var lettre = $('#BPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'B' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#BPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreur').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					 $('#NPays').click(function(){
						 $('#NPays').removeClass('btn-info').addClass('btn-success'); 
						 $('#NPays').attr('disabled','disabled'); 
						var lettre = $('#NPays').text();
						var mot = "${motPays }";
						var motSecret = $('#valeurMotCachePays').text();
						var  motContientLettre =0;
						for(var i=0; i<mot.length; i++){
							 if(mot[i]===lettre){
								 motContientLettre ++;
								 var index = i;
								 motSecret = motSecret.substr(0, index) + 'N' + motSecret.substr(index + 1);
							 }
						}
						if(motContientLettre === 0) {
							 $('#NPays').removeClass('btn-info').addClass('btn-danger');
							 var nbE = $('#nbErreurPays').text();
							 nbE ++;
							 $('#nbErreurPays').html(nbE);
						}	
						 $('#valeurMotCachePays').html(motSecret);
						 
						 var image = $('#nbErreurPays').text();
						 chargerImage(image);
						 verifieMotEntierOuNombreErreurMax(mot, motSecret);
					}); 
					function chargerImage (image){
						if(image === "1"){
							 $('#imagePays').load('imageErreurPendu #image1');
						 }
						 if(image === "2"){
							 $('#imagePays').load('imageErreurPendu #image2');
						 }
						 if(image === "3"){
							 $('#imagePays').load('imageErreurPendu #image3');
						 }
						 if(image === "4"){
							 $('#imagePays').load('imageErreurPendu #image4');
						 }
						 if(image === "5"){
							 $('#imagePays').load('imageErreurPendu #image5');
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
							 var param ='nbErreursPays='+$('#nbErreurPays').text()+'&tempsRestant='+$('#timePays').text()+'&motUser='+$('#valeurMotCachePays').text();
							 $('#resultatPays').load('resultatPenduPays .resultatGagnant', param);
							 $('.communPays').attr('disabled','disabled');
							 $('#timePays').remove();
							 $('#infosTempsRestantPays').remove();
							 $('#resultatPays').show();
						 }
						 /* si le nombre d'erreur est égal à 5, le jeu est fini */
						 var nbErreurs = $('#nbErreurPays').text();
						 if(nbErreurs === "5"){
							 var motCache = $('#valeurMotCachePays').text();
							 var param ='nbErreursPays='+$('#nbErreurPays').text();
							 $('#resultatPays').load('resultatPenduPays .resultatCinqErreurs', param);
							 $('.communPays').attr('disabled','disabled');
							 $('#infosTempsRestantPays').remove();					 
							// $('#resultat').show();
						 }
					}
					
					
				
				
				});
</script>
</body>
</html>