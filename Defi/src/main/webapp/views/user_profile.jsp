<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<html>
<head>
 <!-- Bootstrap CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/resources/css/basic-template.css" rel="stylesheet" /> 
	<!-- BootstrapValidator CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrapValidator.min.css" rel="stylesheet"/>
    
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>userhome</title>
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
	 table.bottomBorder { 
    border-collapse: collapse; 
  }
  table.bottomBorder td, 
  table.bottomBorder th { 
    border-bottom: 1px solid yellowgreen; 
    padding: 10px; 
    text-align: left;
  }
	
</style>
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
							<a href="userhome"><img src="photoUser?id=${id }" height="80px" width="80px"/></a>
						</c:otherwise>
				</c:choose>
				<div>
					<div class="menuGauche">
						<c:import url="menuGauche.jsp"></c:import>
					</div>	
				</div>	
			</div>
			<div class="col-md-6 col-lg-6">
				<div align="center">
					<h3><strong> ${model.moi.nom} &nbsp; ${model.moi.prenom}</strong></h3><br>
					<div class="panel panel-default">
							<div class="panel-heading"><strong>CHANGEMENT DE LA PHOTO</strong></div>
								<div class="panel-body">
									<p style="color: green;">les types de photos acceptés: .jpg .jpeg .png</p>
									<img src="photoUser?id=${id }" height="100" width="100" />
									<div>
										<p>taille maximale du fichier:  </p>
										<f:form action="changerPhoto" method="POST" enctype="multipart/form-data" modelAttribute="sm">
											<input type="file" accept="image/*" name="file" onchange="loadFile(event)"><br>
											<img id="output" ><br><br>
											<input type="submit" value="Valider" id="validationImage" disabled="disabled">
										</f:form>
									</div>
								</div>
					</div><hr>
						<div class="panel panel-default">
							<div class="panel-heading"><strong>CHANGEMENT DE MOT DE PASSE</strong></div>
								<div class="panel-body">
										<f:form id="registration-form" class="form-vertical"  method="post" modelAttribute="sm" action="validationReglageMdp">
											<div style="color: green;"><c:out value="${mdpChange }"/> </div>
											<div class="form-group">
												<div style="color: red;"><c:out value="${mdpInexistant }"/></div>
												<label class=" control-label" for="mdp">Ancien mot de passe</label>
												<div class="">
													<f:input  path="mdp"  type="text" class="form-control" id="mdp" name="mdp" placeholder="Votre ancien mot de passe"/>
												</div>
											</div>
											<div style="color: red;"><c:out value="${mdpDifferents }"/></div>
											<div class="form-group">
												<label class=" control-label" for="mdpnouveau">Nouveau mot de passe</label>
												<div class="">
													<f:input  path="mdpnouveau"  type="password" class="form-control" id="mdpnouveau" name="mdpnouveau" placeholder="Nouveau mot de passe"/>
												</div>
											</div>
											<div class="form-group">
												<label class=" control-label" for="mdpnouveauconfirme">Confirmation nouveau mot de passe</label>
												<div class="">
													<f:input  path="mdpnouveauconfirme"  type="password" class="form-control" id="mdpnouveauconfirme" name="mdpnouveauconfirme" placeholder="Votre Confirmez nouveau mot de passe"/>
												</div>
											</div>
											<div class="form-group">
												<div class=" ">
													<button type="submit" class="btn btn-success" disabled="disabled">Changer</button>
												</div>
											</div>
										</f:form>
									</div>
								</div><hr>
									
					<%-- <f:form method="post" modelAttribute="sm" action="validationReglageMdp">
						<table align="center" border="0">
							<tr>
								<td style="color: blue;">Actuel mot de passe</td>
								<td><f:input path="mdp"/></td>
							</tr>
							<tr>
								<td style="color: green;">Nouveau mot de passe</td>
								<td><f:input path="mdpnouveau"/></td>
							</tr>
							<tr>
								<td style="color: green;">Confirmation Nouveau MDP </td>
								<td><f:input path="mdpnouveauconfirme"/></td>
							</tr>
						</table><br>
						<input type="submit" value="valider" align="center"/>
				</f:form><br><hr> --%>
						<div class="panel panel-default">
							<div class="panel-heading"><strong>VISIBILITE DE VOS INFORMATIONS</strong></div>
								<div class="panel-body">
							<f:form method="post" modelAttribute="sm" action="validationReglageVisibilite" >
							    <table  class="bottomBorder" >
				                  <tr>
				                    <td ><div align="right" class="style11">Qui peut voir votre Email</div>
				                    </td>
				                    <td >
					                   <f:radiobutton path="remail" value="tous" class="${emailTous }"/>
					                    Tout le mode<br />
					                    <f:radiobutton path="remail" value="amis" class="${emailAmis }"/>
					                    Amis<br />
					                    <f:radiobutton path="remail" value="moi" class="${emailMoi }"/>
					                    Moi seul
				                    </td>
				                  </tr>
				                  <tr>
				                    <td><div align="right" class="style11">Qui peut voir votre <br />
				                    Numéro mobile </div></td>
				                    <td>
					                    <f:radiobutton path="rmobile" value="tous" class="${mobileTous}"/>
					                    tout le monde<br />
					                    <f:radiobutton path="rmobile" value="amis" class="${mobileAmis}"/>
					                    amis<br />
					                    <f:radiobutton path="rmobile" value="moi" class="${mobileMoi}"/>
				                    	moi seul        
				                    </td>
				                  </tr>
				                  <tr>
					                 <td><div align="right" class="style11">Qui peut voir vos Photos</div>
					                 </td>
					                 <td>
					                    <f:radiobutton path="rphotos" value="tous" class="${photoTous}"/>
					                    tout le monde<br />
					                    <f:radiobutton path="rphotos" value="amis" class="${photoAmis}"/>
					                    amis<br />
					                    <f:radiobutton path="rphotos" value="moi" class="${photoMoi}"/>
					                    moi seul
				                  	</td>
				                  </tr> 
				              </table><br>  
			               		<input type="submit" value="valider" align="center"/>
			     		</f:form>
			     	</div>
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
		/* apercu de l'image qui doit ête uploadé  */
		var loadFile = function(event) {
	    var output = document.getElementById('output');
	    output.src = URL.createObjectURL(event.target.files[0]);
	    document.getElementById('output').style.height = "100px";
	    document.getElementById('output').style.width = "100px";
	    document.getElementById('validationImage').disabled = false;
	  };
     	$(function(){
     		
     		$('.true').attr("checked", true);
     	});
</script>
<script type="text/javascript">
/* pour la vadiation du formulaire de changement de mot de passe  */
	$(document).ready(function () {
		var validator = $("#registration-form").bootstrapValidator({
			feedbackIcons: {
				valid: "glyphicon glyphicon-ok",
				invalid: "glyphicon glyphicon-remove", 
				validating: "glyphicon glyphicon-refresh"
			}, 
			fields : {
				mdp : {
					validators: {
						notEmpty : {
							message : "un mot de passe est nécessaire"
						},
						stringLength : {
							min: 8,
							message: "votre mot de passe contient sûrement entre 6 et 12 caractères"
						}
					}
				}, 
				mdpnouveau : {
					validators: {
						notEmpty : {
							message : "un mot de passe est nécessaire"
						},
						stringLength : {
							min: 6,
							message: "un mot de passe doit avoir au moins 8 caractères"
						}, 
						different : {
							field : "email", 
							message: "l'adresse email et le mot de passe ne peuvent pas etre similaires"
						}
					}
				}, 
				mdpnouveauconfirme : {
					validators: {
						notEmpty : {
							message: "Confirmation du mot de passe"
						}, 
						identical : {
							field: "mdpnouveau", 
							message : "les mots de passe doivent être les mêmes"
						}
					}
				}
			}
		});
	});
	
</script>

 <!-- jQuery and Bootstrap JS -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js" type="text/javascript"></script>
		
	<!-- BootstrapValidator -->
    <script src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js" type="text/javascript"></script> 

</body>
</html>