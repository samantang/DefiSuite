<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<title>Correction Solo</title>
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
td, th, input {
	text-align: center;
}
/* .panel-body {
background:#D3D3D3;} */
</style>
</head>

<body>
				
	<jsp:include page="entete.jsp"></jsp:include>
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
			<div class="col-md-1 col-lg-1"></div>
			<div class="col-md-6 col-lg-6">
				<h2 style="text-align: center; color: navy; text-shadow: 2px 2px 4px #000000;  ">RESULTAT DE VOTRE JEU ABC SOLO</h2>
				<h3 style="text-align: center; color: menu; text-shadow: 2px 2px 4px #000000; ">vous avez obtenu un score de <span style="color: green;"><strong>${score}</strong></span>  sur <span style="color: green;"><strong>${scorePossible}</strong></span> possible</h3>
	
					<form  action="abcGame" method="post">
						 		<div class="row">
								 	<c:if test="${not empty listePays }">
								 		<c:if test="${empty paysTest}"><h3 style="text-align: center; color: menu; text-shadow: 2px 2px 4px #000000; " >vous n'avez pas essayé de trouver les pays</h3></c:if><br />
								 		<c:if test="${not empty paysTest }"> 
								 			<div class="row">
								 				<div class="panel panel-default">
												<div class="panel-heading"><strong>RESULTATS DES PAYS</strong></div>
													<div class="panel-body">
													 		<div class="col-md-6 col-lg-6">
														 			<table class="table table-bordered table-striped table-condensed">
														 				<caption><h5>Vos Propositions</h5></caption>
														 				<tr>
														 					<th style="border: 1px solid black;">PAYS</th>
														 				</tr>
														 					<c:forEach items="${paysTest}" var="e">
														 				<tr>
														 					<c:if test="${not empty e }">
														 						<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
														 					</c:if>
														 				</tr>
														 				</c:forEach>
														 			</table>
													 		</div>	
													 		<div class="col-md-6 col-lg-6">	
													 			<c:if test="${not empty paysRestants}">
													 			<table class="table table-bordered table-striped table-condensed">
													 				<caption><h5>Les Pays Restants</h5></caption>
													 				<tr>
													 					<th style="border: 1px solid black;">PAYS</th>
													 				</tr>
													 					<c:forEach items="${paysRestants}" var="e">
															 				<tr>
															 					<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
															 				</tr>
													 					</c:forEach>
													 			</table>
													 			</c:if>
													 		</div>	
													 		<c:if test="${empty paysRestants }">
													 				<div class="col-md-12">
													 					<h2 style="text-align: center; color:green text-shadow: 2px 2px 4px #000000; "> Bravo !!!! vous avez trouvez tous les pays  </h2>
													 				</div>
													 	   </c:if>
													  </div>
												</div>
								 			</div>
								 		</c:if>
								 		<c:if test="${not empty form.getPays}">
								 				<p><strong>les pays </strong></p>
								 				<p>vous pouvez mieux apprendre sur les pays avec les liens ci-desous
								 			<table>
								 				<tr>
								 					<th style="border: 1px solid black;">PAYS</th>
								 				</tr>
								 					<c:forEach items="${form.getPays}" var="e">
								 				<tr>
								 					<td style="border: 1px solid black;"><a href="${e.lien}"><c:out value="${e}"></c:out></a></td>
								 				</tr>
								 					</c:forEach>
								 			</table>
								 		</c:if>
								 	</c:if>	
								<!-- ----------------------------------------------capitales------------------------------------------------------------------------------- -->	
								 	<c:if test="${not empty listeCapitales }">
								 		<c:if test="${empty choixCapitales}"> <h3 style="text-align: center; color: menu; text-shadow: 2px 2px 4px #000000; " >vous n'avez pas essayé de trouver les Capitales</h3></c:if><br />
								 		<c:if test="${not empty choixCapitales }">
								 			<div class="row">
								 				<div class="panel panel-default">
												<div class="panel-heading"><strong>RESULTATS DES CAPITALES</strong></div>
													<div class="panel-body">
													 			<div class="col-md-6 col-lg-6"> 
														 			<table class="table table-bordered table-striped table-condensed">
														 				<caption><h5>Vos Propostions</h5></caption>
														 				<tr>
														 					<th style="border: 1px solid black;">CAPITALES</th>
														 				</tr>
														 					<c:forEach items="${choixCapitales}" var="e">
														 				<tr>
														 					<c:if test="${not empty e }">
														 						<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
														 					</c:if>
														 				</tr>
														 				</c:forEach>
														 			</table>
													 			</div>
													 			<div class="col-md-6 col-lg-6"> 
														 			<c:if test="${not empty capitalesRestantes}">
															 			<table class="table table-bordered table-striped table-condensed">
															 				<caption><h5>Les Capitales Restantes</h5></caption>
															 				<tr>
															 					<th style="border: 1px solid black;">CAPITALES</th>
															 				</tr>
															 					<c:forEach items="${capitalesRestantes}" var="e">
															 				<tr>
															 					<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
															 				</tr>
															 					</c:forEach>
															 			</table>
														 			</c:if>
													 			</div>
													 			<c:if test="${empty capitalesRestantes}">
													 					<div class="col-md-12 col-lg-12">
													 				<h2 style="text-align: center; color:green text-shadow: 2px 2px 4px #000000; "> Bravo !!!! vous avez trouvez toutes les Capitales  </h2>
													 				</div>
													 			</c:if>
													 </div>
												</div>
											</div>
								 		</c:if>
								 		<c:if test="${not empty form.getCapitale}">
								 				<p>les capitales </p>
									 			<table>
									 				<tr>
									 					<th style="border: 1px solid black;">CAPITALES</th>
									 				</tr>
									 					<c:forEach items="${form.getCapitale}" var="e">
									 				<tr>
									 					<td style="border: 1px solid black;"><a href="${e.lien}"><c:out value="${e.nomCapitale}"></c:out></a></td>
									 				</tr>
									 					</c:forEach>
									 			</table>
								 			</c:if>
								 	</c:if>	
								<!-- -----------------------------------------------VILLES------------------------------------------------------------------------------ -->
								 	<c:if test="${not empty listeVillesFrance }">
								 		<c:if test="${empty choixVilles}"> vous n'avez pas choisit de villes</c:if><br />
								 		<c:if test="${not empty choixVilles }"> 
								 		<div class="col-md-3 col-lg-3"> 
								 			<table class="table table-bordered table-striped table-condensed">
								 				<caption><h3>Vos propositions de Villes</h3></caption>
								 				<tr>
								 					<th style="border: 1px solid black;">VILLES</th>
								 				</tr>
								 					<c:forEach items="${choixVilles}" var="e">
								 				<tr>
								 					<c:if test="${not empty e }">
								 						<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
								 					</c:if>
								 				</tr>
								 				</c:forEach>
								 			</table>
								 		</div>
								 			
								 		<div class="col-md-3 col-lg-3"> 	
								 			<c:if test="${not empty villesRestantes}">
								 			<table class="table table-bordered table-striped table-condensed">
								 				<caption><h3>Les Villes Restantes</h3></caption>
								 				<tr>
								 					<th style="border: 1px solid black;">VILLES</th>
								 				</tr>
								 					<c:forEach items="${villesRestantes}" var="e">
								 				<tr>
								 					<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
								 				</tr>
								 					</c:forEach>
								 			</table>
								 			</c:if>
								 		</div>	
								 			
								 			<c:if test="${empty villesRestantes}">
								 				<div class="col-md-6">
								 					<p>Bravo!!! Vous avez trouvé toutes les villes</p>
								 				</div>
								 			</c:if>
								 		</c:if>
								 		<c:if test="${not empty form.getVilleFrance}">
								 				<p>les villes </p>
									 			<table>
									 				<tr>
									 					<th style="border: 1px solid black;">VILLES</th>
									 				</tr>
									 					<c:forEach items="${form.getVilleFrance}" var="e">
									 				<tr>
									 					<td style="border: 1px solid black;"><a href="${e.lien}"><c:out value="${e.nomVilleFrance}"></c:out></a></td>
									 				</tr>
									 					</c:forEach>
									 			</table>
								 			</c:if>
								 	</c:if>	
								<!-- --------------------------------------------------------NOBELS--------------------------------------------------------------------- -->
								 	<c:if test="${not empty listeNobels }">
								 		<c:if test="${empty choixNobels}"> <h3 style="text-align: center; color: menu; text-shadow: 2px 2px 4px #000000; " >vous n'avez pas choisit de prix nobels</h3> </c:if><br />
								 		<c:if test="${not empty choixNobels }"> 
								 			<div class="row">
								 				<div class="panel panel-default">
												<div class="panel-heading"><strong>RESULTATS DES NOBELS</strong></div>
													<div class="panel-body">
													 		<div class="col-md-6 col-lg-6">
													 			<table class="table table-bordered table-striped table-condensed">
													 				<caption><h5>Vos Propositions</h5></caption>
													 				<tr>
													 					<th style="border: 1px solid black;"> Nobels</th>
													 				</tr>
													 					<c:forEach items="${choixNobels}" var="e">
													 				<tr>
													 					<c:if test="${not empty e }">
													 						<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
													 					</c:if>
													 				</tr>
													 				</c:forEach>
													 			</table>
													 		</div>
													 		
													 		<div class="col-md-6 col-lg-6">
													 			<c:if test="${not empty nobelsRestants}">
													 			<table class="table table-bordered table-striped table-condensed">
													 				<caption><h5>Les Nobels Restants</h5></caption>
													 				<tr>
													 					<th style="border: 1px solid black;">NOBELS</th>
													 				</tr>
													 					<c:forEach items="${nobelsRestants}" var="e">
													 				<tr>
													 					<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
													 				</tr>
													 					</c:forEach>
													 			</table>
													 			</c:if>
													 		</div>	
													 		<c:if test="${empty nobelsRestants}">
													 				<div class="col-md-12 col-lg-12">
													 					<h2 style="text-align: center; color:green text-shadow: 2px 2px 4px #000000; ">Bravo!!! vous avez trouvé tous les Nobels</h2>
													 				</div>
													 		</c:if>
													 </div>
												 </div>
											</div>
								 		</c:if>
								 		<c:if test="${not empty form.getNobel}">
								 				<p>les Nobels </p>
								 			<table>
								 				<tr>
								 					<th style="border: 1px solid black;">NOBEL</th>
								 				</tr>
								 					<c:forEach items="${form.getNobel}" var="e">
								 				<tr>
								 					<td style="border: 1px solid black;"><a href="${e.lien}"><c:out value="${e.nomNobel}"></c:out></a></td>
								 				</tr>
								 					</c:forEach>
								 			</table>
								 			</c:if>
								 	</c:if>	
								<!-- -----------------------------------------------------PRESIDENTS------------------------------------------------------------------------ -->
								 	<c:if test="${not empty listePresidentsA }">
								 		<c:if test="${empty choixPresidents}"> <h3 style="text-align: center; color: menu; text-shadow: 2px 2px 4px #00000;">vous n'avez pas choisit de prix Présidents</h3> </c:if><br />
								 		<c:if test="${not empty choixPresidents }"> 
								 			<div class="row">
								 				<div class="panel panel-default">
												<div class="panel-heading"><strong>RESULTATS DES PRESIDENTS</strong></div>
													<div class="panel-body">
													 	<div class="col-md-6 col-lg-6">
												 			<table class="table table-bordered table-striped table-condensed">
												 				<caption><h5>Vos propositions</h5></caption>
												 				<tr>
												 					<th style="border: 1px solid black;">PRESIDENTS</th>
												 				</tr>
												 					<c:forEach items="${choixPresidents}" var="e">
												 				<tr>
												 					<c:if test="${not empty e }">
												 						<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
												 					</c:if>
												 				</tr>
												 				</c:forEach>
												 			</table>
												 		</div>	
												 		<div class="col-md-6 col-lg-6">	
												 			<c:if test="${not empty presidentsRestants}">
												 				<p>les presidents restants</p>
												 			<table class="table table-bordered table-striped table-condensed">
												 				<caption><h5>Les Présidents Restants</h5></caption>
												 				<tr>
												 					<th style="border: 1px solid black;">PRESIDENTS</th>
												 				</tr>
												 					<c:forEach items="${presidentsRestants}" var="e">
												 				<tr>
												 					<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
												 				</tr>
												 					</c:forEach>
												 			</table>
												 			</c:if>
												 		</div>
												 			
												 			<c:if test="${empty presidentsRestants}">
												 				<div class="col-md-12 col-lg-12">
												 					<h2 style="text-align: center; color:green text-shadow: 2px 2px 4px #000000; ">Bravo!!! vous avez trouvé tous les Président</h2>
												 				</div>
												 			</c:if>
												 		</div>
												 	</div>
												 </div>			
								 		</c:if>
								 		<c:if test="${not empty form.getPays}">
								 				<p>les presidents </p>
									 			<table>
									 				<tr>
									 					<th style="border: 1px solid black;">PRESIDENTS</th>
									 				</tr>
									 					<c:forEach items="${form.getPresident}" var="e">
									 				<tr>
									 					<td style="border: 1px solid black;"><a href="${e.lien}"><c:out value="${e.nomPresident}"></c:out></a></td>
									 				</tr>
									 					</c:forEach>
									 			</table>
								 			</c:if>
								 	</c:if>	
								<!-- --------------------------------------------------------ANCIENS P--------------------------------------------------------------------- -->
								 	<c:if test="${not empty listeAPresidents }">
								 		<c:if test="${empty choixAPresidents}"> <h3 style="text-align: center; color: menu; text-shadow: 2px 2px 4px #00000;">vous n'avez pas choisit de prix Présidents</h3> </c:if><br />
								 		<c:if test="${not empty choixAPresidents }"> 
								 			<div class="row">
								 				<div class="panel panel-default">
												<div class="panel-heading"><strong>RESULTATS DES PRESIDENTS</strong></div>
													<div class="panel-body">
													 		<div class="col-md-6 col-lg-6">
													 			<table class="table table-bordered table-striped table-condensed">
													 				<caption><h5>Vos propositions</h5></caption>
													 				<tr>
													 					<th style="border: 1px solid black;">Ancien</th>
													 				</tr>
													 					<c:forEach items="${choixAPresidents}" var="e">
													 				<tr>
													 					<c:if test="${not empty e }">
													 						<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
													 					</c:if>
													 				</tr>
													 				</c:forEach>
													 			</table>
													 		</div>
													 		
													 		<div class="col-md-6 col-lg-6">	
													 			<c:if test="${not empty ApresidentsRestants}">
													 			<table class="table table-bordered table-striped table-condensed">
													 				<caption><h5>Les A Présidents Restants</h5></caption>
													 				<tr>
													 					<th style="border: 1px solid black;">ANCIENS P</th>
													 				</tr>
													 					<c:forEach items="${ApresidentsRestants}" var="e">
													 				<tr>
													 					<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
													 				</tr>
													 					</c:forEach>
													 			</table>
													 		</c:if>
													 		</div>
													 		
													 			<c:if test="${empty ApresidentsRestants}">
													 				<div class="col-md-12 col-lg-12">
													 					<h2 style="text-align: center; color:green text-shadow: 2px 2px 4px #000000; ">Bravo!!! vous avez trouvé tous les anciens Président</h2>
													 				</div>	
													 			</c:if>
												 		</div>
												 	</div>
												</div>			
								 		</c:if>
								 		<c:if test="${not empty form.getanciensP}">
								 				<p>les anciens P </p>
									 			<table>
									 				<tr>
									 					<th style="border: 1px solid black;">anciens P</th>
									 				</tr>
									 					<c:forEach items="${form.getanciensP}" var="e">
									 				<tr>
									 					<td style="border: 1px solid black;"><a href="${e.lien}"><c:out value="${e.nomAncienPresident}"></c:out></a></td>
									 				</tr>
									 					</c:forEach>
									 			</table>
								 			</c:if>
								 	</c:if>	
								<!-- --------------------------------------------------------------ANIMAUX--------------------------------------------------------------- -->
								 	<c:if test="${not empty listeAnimaux }">
								 		<c:if test="${empty choixAnimaux}"> vous n'avez pas choisit d'animal</c:if><br />
								 		<c:if test="${not empty choixAnimaux }"> 
								 		<div class="col-md-3 col-lg-3">
								 			<table class="table table-bordered table-striped table-condensed">
								 				<caption><h3>Vos propositions d'animaux</h3></caption>
								 				<tr>
								 					<th style="border: 1px solid black;">ANIMAUX</th>
								 				</tr>
								 					<c:forEach items="${choixAnimaux}" var="e">
								 				<tr>
								 					<c:if test="${not empty e }">
								 						<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
								 					</c:if>
								 				</tr>
								 				</c:forEach>
								 			</table>
								 		</div>	
								 		
								 		<div class="col-md-3 col-lg-3">	
								 			<c:if test="${not empty animauxRestants}">
								 			<table class="table table-bordered table-striped table-condensed">
								 				<caption><h3>Les Animaux Restants</h3></caption>
								 				<tr>
								 					<th style="border: 1px solid black;">ANIMAUX</th>
								 				</tr>
								 					<c:forEach items="${animauxRestants}" var="e">
								 				<tr>
								 					<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
								 				</tr>
								 					</c:forEach>
								 			</table>
								 			</c:if>
								 		</div>	
								 			
								 			<c:if test="${empty animauxRestants}">
								 				<div class="col-md-6">
								 					<p>Bravo!!! vous avez trouvé tous les animaux</p>
								 				</div>
								 			</c:if>
								 		</c:if>
								 		<c:if test="${not empty form.getAnimaux}">
								 				<p>les pays </p>
									 			<table>
									 				<tr>
									 					<th style="border: 1px solid black;">ANIMAUX</th>
									 				</tr>
									 					<c:forEach items="${form.getAnimaux}" var="e">
									 				<tr>
									 					<td style="border: 1px solid black;"><a href="${e.lien}"><c:out value="${e.nomAnimaux}"></c:out></a></td>
									 				</tr>
									 					</c:forEach>
									 			</table>
								 			</c:if>
								 	</c:if>	
								<!-- -------------------------------------------------------AGGLOMERATIONS---------------------------------------------------------------------- -->
								 	<c:if test="${not empty listeAglo }">
								 		<c:if test="${empty choixAgglo}"> vous n'avez pas choisit d'agglomeration</c:if><br />
								 		<c:if test="${not empty choixAgglo }"> 
								 		<div class="col-md-3 col-lg-3">
								 			<table class="table table-bordered table-striped table-condensed">
								 				<caption><h3>Vos propositions d'agglos</h3></caption>
								 				<tr>
								 					<th style="border: 1px solid black;">AGGLO</th>
								 				</tr>
								 					<c:forEach items="${choixAgglo}" var="e">
								 				<tr>
								 					<c:if test="${not empty e }">
								 						<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
								 					</c:if>
								 				</tr>
								 				</c:forEach>
								 			</table>
								 		</div>	
								 		
								 		<div class="col-md-3 col-lg-3">	
								 			<c:if test="${not empty AggloRestantes}">
								 			<table class="table table-bordered table-striped table-condensed">
								 				<caption><h3>Les Agglos Restantes</h3></caption>
								 				<tr>
								 					<th style="border: 1px solid black;">AGGLO</th>
								 				</tr>
								 					<c:forEach items="${AggloRestantes}" var="e">
								 				<tr>
								 					<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
								 				</tr>
								 					</c:forEach>
								 			</table>
								 			</c:if>
								 		</div>	
								 			
								 			<c:if test="${empty AggloRestantes}">
								 				<div class="col-md-6">
								 					<p>Bravo!!! vous avez trouvé toutes les aggolomérations</p>
								 				</div>
								 			</c:if>
								 		</c:if>
								 		<c:if test="${not empty form.getAgglo}">
								 				<p>les agglo </p>
									 			<table>
									 				<tr>
									 					<th style="border: 1px solid black;">AGGLO</th>
									 				</tr>
									 					<c:forEach items="${form.getAgglo}" var="e">
									 				<tr>
									 					<td style="border: 1px solid black;"><a href="${e.lien}"><c:out value="${e.nomAglo}"></c:out></a></td>
									 				</tr>
									 					</c:forEach>
									 			</table>
								 			</c:if>
								 	</c:if>	
								<!-- --------------------------------------------------------------ARTISTES--------------------------------------------------------------- -->
								 <div class="paysCorrection">
								 	<c:if test="${not empty listeChanteurs }">
								 		<c:if test="${empty choixArtistes}"> <h3 style="text-align: center; color: menu; text-shadow: 2px 2px 4px #000000; " >vous n'avez pas essayé de trouver les artistes</h3></c:if><br />
								 		<c:if test="${not empty choixArtistes }"> 
								 			<div class="row">
								 				<div class="panel panel-default">
												<div class="panel-heading"><strong>RESULTATS DES ARTISTES</strong></div>
													<div class="panel-body">
													 		<div class="col-md-6 col-lg-6">
													 			<table class="table table-bordered table-striped table-condensed">
													 				<caption><h5>Vos propositions d'artistes</h5></caption>
													 				<tr>
													 					<th style="border: 1px solid black;">ARTISTES</th>
													 				</tr>
													 					<c:forEach items="${choixArtistes}" var="e">
													 				<tr>
													 					<c:if test="${not empty e }">
													 						<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
													 					</c:if>
													 				</tr>
													 				</c:forEach>
													 			</table>
													 		</div>
													 			
													 		<div class="col-md-6 col-lg-6">	
													 			<c:if test="${not empty ArtistesRestants}">
													 			<table class="table table-bordered table-striped table-condensed">
													 				<caption><h5>Les Artistes Restants</h5></caption>
													 				<tr>
													 					<th style="border: 1px solid black;">ARTISTES</th>
													 				</tr>
													 					<c:forEach items="${ArtistesRestants}" var="e">
													 				<tr>
													 					<td style="border: 1px solid black;"><c:out value="${e}"></c:out></td>
													 				</tr>
													 					</c:forEach>
													 			</table>
													 			</c:if>
													 		</div>	
													 			
													 			<c:if test="${empty ArtistesRestants}">
													 				<div class="col-md-12 col-lg-12">
													 					<h2 style="text-align: center; color:green text-shadow: 2px 2px 4px #000000; "> Bravo !!!! vous avez trouvez tous les Artistes  </h2>
													 				</div>
													 			</c:if>
													 	</div>
													 </div>
												</div>	 	
								 		</c:if>
								 		<c:if test="${not empty form.getArtistes}">
								 				<p>les artistes </p>
									 			<table>
									 				<tr>
									 					<th style="border: 1px solid black;">ARTISTES</th>
									 				</tr>
									 					<c:forEach items="${form.getArtiste}" var="e">
									 				<tr>
									 					<td style="border: 1px solid black;"><a href="${e.lien}"><c:out value="${e.nomArtiste}"></c:out></a></td>
									 				</tr>
									 					</c:forEach>
									 			</table>
								 			</c:if>
								 	</c:if>	
								</div>
							</div>	
						</form>
					</div>		
		</div>
	</div>
</div>
</body>
</html>