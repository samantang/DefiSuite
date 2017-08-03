<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<!-- =========================================POUR L AIDE DES PAYS=================================================================== -->
	<link href="<%=request.getContextPath()%>/resources/dist/jqvmap.css" media="screen" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/dist/jquery.vmap.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/dist/jquery.vmap.world.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/dist/jquery.vmap.sampledata.js"></script>	
	<!-- ===========================================FIN AIDE PAYS================================================================ -->
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
td, th, tr input {
	text-align: center;
}
.tableAide{
	display: inline-block;
	vertical-align: top;
}

</style>
</head>
<body>
	<%-- <jsp:include page="entete.jsp"></jsp:include> --%>
	 <jsp:include page="entete1.jsp"></jsp:include> 
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
								<a href="userhome"><img src="photoUser?id=${id }" height="80px" width="80px"/></a>
							</c:otherwise>
						</c:choose>
					<div class="menuGauche">
						<c:import url="menuGauche.jsp"></c:import>
					</div>
				</div>
				<div id="partieCentrale" class="col-md-9 col-lg-9 partieCentrale">
	
						<div id="rempli"> 
							<h2 style="text-align: center; color: navy; text-shadow: 2px 2px 4px #000000;  ">JEU ABC SOLO</h2>
							<h3 style="text-align: center; color: menu; text-shadow: 2px 2px 4px #000000; ">la lettre avec laquelle vous jouez est: &nbsp;<strong><span style="color: green;">${sessionScope.lettreMajuscule }</span> </strong></h3><br>
							<h4 style="text-align: center;">Votre temps restant est de <strong><span id="time"></span></strong>  minutes!</h4><br>
							<% int varJava = 10; %>
							
							<button class="btn btn-info" id="aidePays">Demander de l'aide</button>&nbsp;<button class="btn btn-success" id="AnAidePays">Fermer l'Aide</button><br /><br />
							 <div id="vmap" style="width: 600px; height: 400px;"></div><br />
							
							<f:form modelAttribute="gm"  action="abcChallengeCorrection" >
									 <!-- <div class="container"> --> 
									 	<input id="tempsRestant" type="hidden" value="00" name="tempsRestant">
										<input id="valeuraidepays" type="hidden" value="non" name="valeuraidepays">
								 		<c:if test="${not empty listPays }"> 
								 			<!-- <div class="panel panel-default" style=" width: auto;">
												<div class="panel-heading"><strong>LES PAYS CORRESPONDANTS</strong></div>
													<div class="panel-body"> -->
									 		 <div class="row">
									 			<div class="col-md-6">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">LES PAYS ${sessionScope.lettreMajuscule } ...</th>
										 				</tr>
										 				<c:forEach items="${listPays}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;" ><input  name="pays" value="pays"/></td>
											 				</tr>
										 				</c:forEach>
										 			</table>
									 			</div>
									 			<div class="col-md-6">
									 			<!-- si on demande de l'aide => on cree un nouveau tableau avec les capitales -->
									 				 <div class="tableAide">
									 					<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th >CAPITALES DES PAYS</th>
											 				</tr>
											 				<c:forEach items="${listPays}" var="e">
												 				<tr>
												 					<td ><input style="color: green;" disabled="disabled" name="paysAideCapitale" value="${e.capitale }"/></td>
												 				</tr>
											 				</c:forEach>
										 				</table>
									 				 </div>
									 				 <div class="tableVideAide">
									 					<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;" >AIDE</th>
											 				</tr>
											 				<c:forEach items="${listPays}" var="e">
												 				<tr>
												 					<td style="border: 1px solid black;" ><input disabled="disabled" name="paysAideCapitale" value="XXX"/></td>
												 				</tr>
											 				</c:forEach>
										 				</table>
									 				 </div>  
									 			</div>
									 		</div>
									 		<!-- </div></div> -->
								 		</c:if>
								 		<c:if test="${not empty listeCapitales }"> 
								 			<div class="row">
									 			<div class="col-md-6">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">CAPITALES ${sessionScope.lettreMajuscule } ...</th>
										 				</tr>
										 					<c:forEach items="${listeCapitales}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input  name="capitale" value="capitale"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>
									 			</div>
									 			<div class="col-md-6">
									 				<div class="tableAide">	
											 			<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th>PAYS</th>
											 				</tr>
											 					<c:forEach items="${listeCapitales}" var="e">
											 				<tr>
											 					<td style="color: green;"><input disabled="disabled"  name="capitaleAidePays" value="${e.pays }"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
											 		</div>
											 		<div class="tableVideAide">
									 					<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="text-align: center;" >AIDE</th>
											 				</tr>
											 				<c:forEach items="${listeCapitales}" var="e">
												 				<tr>
												 					<td style="text-align: center;" ><input disabled="disabled"  value="XXX"/></td>
												 				</tr>
											 				</c:forEach>
										 				</table>
									 				 </div>	
									 			</div>
									 		</div>	
								 		</c:if>
								 		<c:if test="${not empty listePresidentsA }"> 
								 			<div class="row">
									 			<div class="col-md-6">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">Prési ou Chef de Gouv Actu ${sessionScope.lettreMajuscule } ...</th>
										 				</tr>
										 					<c:forEach items="${listePresidentsA}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input  name="president" value="president"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>
									 			</div>
									 			<div class="col-md-6">
									 				<div class="tableAide">
											 			<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;">Pays du président</th>
											 				</tr>
											 					<c:forEach items="${listePresidentsA}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;"><input style="color: green;" disabled="disabled"   name="presidentAidePays" value="${e.pays }"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
											 		</div>
											 		<div class="tableVideAide">
									 					<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;" >AIDE</th>
											 				</tr>
											 				<c:forEach items="${listePresidentsA}" var="e">
												 				<tr>
												 					<td style="border: 1px solid black;" ><input disabled="disabled" name="paysAideCapitale" value="XXX"/></td>
												 				</tr>
											 				</c:forEach>
										 				</table>
									 				 </div>	
									 			</div>	
									 		</div>	
								 		</c:if>
								 		<c:if test="${not empty listeAPresidents }"> 
								 			<div class="row">
									 			<div class="col-md-6">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">Anciens Prési... ${sessionScope.lettreMajuscule } ...</th>
										 				</tr>
										 					<c:forEach items="${listeAPresidents}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input  name="ancienP" value="ancienP"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>
									 			</div>
									 			<div class="col-md-6">
									 				<div class="tableAide">
											 			<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;">Pays</th>
											 				</tr>
											 					<c:forEach items="${listeAPresidents}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;"><input style="color: green;" disabled="disabled"   name="ancienPresiAidePays" value="${e.pays }"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
											 		</div>
											 		<div class="tableVideAide">
									 					<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;" >AIDE</th>
											 				</tr>
											 				<c:forEach items="${listeAPresidents}" var="e">
												 				<tr>
												 					<td style="border: 1px solid black;" ><input disabled="disabled" name="paysAideCapitale" value="XXX"/></td>
												 				</tr>
											 				</c:forEach>
										 				</table>
									 				 </div>	
									 			</div>
									 			<!-- <div class="col-md-3"> -->
									 				<div class="tableAide">
											 			<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;">Période</th>
											 				</tr>
											 					<c:forEach items="${listeAPresidents}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;"><input style="color: green;" name="ancienPresiAidePeriode" value="${e.periode }"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
											 		</div>	
									 			<!-- </div> -->	
									 		</div>	
								 		</c:if>
								 		<c:if test="${not empty listeAnimaux }"> 
								 			<div class="row">
										 		<div class="col-md-6">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">ANIMAUX ${sessionScope.lettreMajuscule } ...</th>
										 				</tr>
										 					<c:forEach items="${listeAnimaux}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input  name="animaux" value="animaux"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>	
										 		</div>
										 		<div class="col-md-6">
										 			<div class="tableAide">
											 			<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;">Pays</th>
											 				</tr>
											 					<c:forEach items="${listeAnimaux}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;"><input style="color: green;" disabled="disabled"   name="animauxAidePays" value="${e.pays }"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
										 			</div>
										 			<div class="tableVideAide">
									 					<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;" >AIDE</th>
											 				</tr>
											 				<c:forEach items="${listeAnimaux}" var="e">
												 				<tr>
												 					<td style="border: 1px solid black;" ><input disabled="disabled" name="paysAideCapitale" value="XXX"/></td>
												 				</tr>
											 				</c:forEach>
										 				</table>
									 				 </div>	
										 		</div>
										 	</div>	
								 		</c:if>
								 		<c:if test="${not empty listeAglo }"> 
								 			<div class="row">
									 			<div class="col-md-6">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">Agglos Mondiales ${sessionScope.lettreMajuscule } ...</th>
										 				</tr>
										 					<c:forEach items="${listeAglo}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input  name="agglo" value="agglo"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>
									 			</div>
									 			<div class="col-md-6">
									 				<div class="tableAide">
											 			<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;">Pays de l'agglo</th>
											 				</tr>
											 					<c:forEach items="${listeAglo}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;"><input style="color: green;" disabled="disabled"   name="aggloAidePays" value="${e.pays }"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
											 		</div>
											 		<div class="tableVideAide">
									 					<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;" >AIDE</th>
											 				</tr>
											 				<c:forEach items="${listeAgglo}" var="e">
												 				<tr>
												 					<td style="border: 1px solid black;" ><input disabled="disabled" name="paysAideCapitale" value="XXX"/></td>
												 				</tr>
											 				</c:forEach>
										 				</table>
									 				 </div>	
									 			</div>	
									 		</div>	
								 		</c:if>
								 		<c:if test="${not empty listeChanteurs }"> 
								 			<div class="row">
									 			<div class="col-md-4">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">Chanteurs 50M ${sessionScope.lettreMajuscule } ...</th>
										 				</tr>
										 					<c:forEach items="${listeChanteurs}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input  name="artiste" value="artiste"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>
									 			</div>
										 		<div class="col-md-8">
										 			<div class="tableAide">
											 			<table class="table table-bordered table-striped table-condensed" style="width: auto; height: auto;">
											 				<tr>
											 					<th style="border: 1px solid black;">pays</th>
											 				</tr>
											 					<c:forEach items="${listeChanteurs}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;"><input style="color: green;" disabled="disabled"   name="artisteAidePays" value="${e.pays }"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
										 			</div>
										 		<!-- </div>	
										 		<div class="col-md-3"> -->
										 			<div class="tableAide" >
											 			<table class="table table-bordered table-striped table-condensed" style="width: auto; height: auto;">
											 				<tr>
											 					<th style="border: 1px solid black;">Premières Lettres</th>
											 				</tr>
											 					<c:forEach items="${lettresArtistes}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;"><input style="color: green;" disabled="disabled"   name="artisteAideLettre" value="${e}"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
											 		</div>
											 		<div class="tableVideAide">
									 					<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;" >AIDE</th>
											 				</tr>
											 				<c:forEach items="${listeChanteurs}" var="e">
												 				<tr>
												 					<td style="border: 1px solid black;" ><input disabled="disabled" name="paysAideCapitale" value="XXX"/></td>
												 				</tr>
											 				</c:forEach>
										 				</table>
									 				 </div>	
										 		</div>
								 			</div>
								 		</c:if>
								 		<c:if test="${not empty listeNobels }"> 
								 			<div class="row">
									 			<div class="col-md-4">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">Nobels depuis 2 000 ${sessionScope.lettreMajuscule } ...</th>
										 				</tr>
										 				<c:forEach items="${listeNobels}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input  name="nobel" value="nobel"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>
									 			</div>
										 		<div class="col-md-8">
										 			<div class="tableAide">
											 			<table class="table table-bordered table-striped table-condensed" >
											 				<tr>
											 					<th style="border: 1px solid black;">Domaine</th>
											 				</tr>
											 				<c:forEach items="${listeNobels}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;"><input style="color: green;" disabled="disabled"  name="nobelAideDomaine" value="${e.domaine }"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
											 		</div>	
										 		<!-- </div>
										 		<div class="col-md-3"> -->
										 			<div class="tableAide">
											 			<table class="table table-bordered table-striped table-condensed" >
											 				<tr>
											 					<th style="border: 1px solid black;">Année</th>
											 				</tr>
											 				<c:forEach items="${listeNobels}" var="e">
											 				<tr>
											 					<td style="border: 1px solid black;"><input style="color: green;" disabled="disabled"  name="nobelAideAnnee" value="${e.annee }"/></td>
											 				</tr>
											 				</c:forEach>
											 			</table>
											 		</div>	
											 		<div class="tableVideAide">
									 					<table class="table table-bordered table-striped table-condensed">
											 				<tr>
											 					<th style="border: 1px solid black;" >AIDE</th>
											 				</tr>
											 				<c:forEach items="${listeNobels}" var="e">
												 				<tr>
												 					<td style="border: 1px solid black;" ><input disabled="disabled" name="paysAideCapitale" value="XXX"/></td>
												 				</tr>
											 				</c:forEach>
										 				</table>
									 				 </div>
										 		</div>
								 			</div>	
								 		</c:if>
								 		<c:if test="${not empty listeVillesFrance }"> 
								 			<div class="row">
									 			<div class="col-md-6">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">Villes France</th>
										 				</tr>
										 				<c:forEach items="${listeVillesFrance}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input  name="ville" value="ville"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>	
									 			</div>
									 			<div class="col-md-6">
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">Région</th>
										 				</tr>
										 				<c:forEach items="${listeVillesFrance}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input disabled="disabled"  name="villeAideRegion" value="${e.region }"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>	
									 			<!-- </div>
									 			<div class="col-md-3"> -->
										 			<table class="table table-bordered table-striped table-condensed">
										 				<tr>
										 					<th style="border: 1px solid black;">Premières Lettres</th>
										 				</tr>
										 				<c:forEach items="${listeVillesFrance}" var="e">
										 				<tr>
										 					<td style="border: 1px solid black;"><input disabled="disabled"  name="villeAideLettre" value="${e.lettre }"/></td>
										 				</tr>
										 				</c:forEach>
										 			</table>	
									 			</div>
									 		</div>	
								 		</c:if>								 	  
								 		<input id="submitId" style="width: 80; height: 50;" class="btn btn-success" type="submit" value="Valider">
									</f:form>
								</div>
					</div>	
				 <%-- <div id="partieDroite" class="col-md-3 col-lg-3 partieDroite">
					<div>
						<jsp:include page="menuDroit.jsp"></jsp:include>
					</div>
				</div>	  --%>		
			</div>
		</div>	
	</div>	
	<script>
	/* recupération du temps restant après avoir validé les reponses et mise dans un input pour l'envoi en parametre */
	$(document).ready(function() {
	    $('#submitId').click(function() {
	    	var valeurTime = $('#time').text();
	      	$('#tempsRestant').val(valeurTime);
	    });
	});
					
	
			      function startTimer(duration, display) {
				      $('#redirect').hide();
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
				        	 $('#rempli').hide();
				        	 $('#redirect').show();
				        	 window.location = "http://localhost:8080/abcSoloHome";
				        	 
				            // add one second so that the count down starts at the full duration
				            // example 05:00 not 04:59
				            start = Date.now() + 1000;
				        }
				    
			    };
			    // we don't want to wait a full second before the timer starts
			    timer();
			    setInterval(timer, 1000);
			}
			
			window.onload = function () {
				var jav = <%=varJava %>;
				var corrects = "${temps}";
			    var fiveMinutes = 60 * 0.3 * corrects,
			        display = document.querySelector('#time');
			    startTimer(fiveMinutes, display);
			    
			};
			// si on demande de l'aide, alors on l'enregistre dans une variable pour indiquer que l'utiilisateur à demandé de l'aide pour trouver les reponses
			$(function(){
				$('#aidePays').click(function(){
					var text ="oui";
					$('#valeuraidepays').val(text);
					
				});
			});
    </script>	
    <!-- pour l'affichage et la disparition de l'aide ====================================================================  -->
	      <script>
			$(function(){
				$('#vmap').hide();
				$('#AnAidePays').hide();
				/* $('#tableAidePays').hide(); */
				$('div[class=tableAide]').hide();
				$('#aidePays').click(function(){
					$('#vmap').fadeIn(500);
					$('#AnAidePays').show();
					/* $('#tableAidePays').show(); */
					$('div[class=tableAide]').show();
					$('#aidePaysNo').attr('input', 'oui');
					/* $('#partieCentrale').removeClass('col-md-6 col-lg-6').addClass('col-md-9 col-lg-9');
					$('.partieDroite').remove(); */
					$('.tableVideAide').hide();
				});
				$('#AnAidePays').click(function(){
					$('#vmap').hide();
					/* $('#tableAidePays').hide(); */
					$('#AnAidePays').hide();
					$('div[class=tableAide]').hide();
					/* $('#partieCentrale').removeClass('col-md-9 col-lg-9').addClass('col-md-6 col-lg-6');
					$('#partieDroite').addClass('col-md-3 col-lg-3'); */
					$('.tableVideAide').show();
					
				});
			});
		</script>
	    <script>
	      jQuery(document).ready(function () {
	        jQuery('#vmap').vectorMap({
	          map: 'world_en',
	          backgroundColor: '#333333',
	          color: '#ffffff',
	          hoverOpacity: 0.7,
	          selectedColor: '#666666',
	          enableZoom: true,
	          showTooltip: true,
	          scaleColors: ['#C8EEFF', '#006491'],
	          values: sample_data,
	          normalizeFunction: 'polynomial'
	        });
	      });
   		 </script>
    
    
</body>
</html>