<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reglages</title>
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
						<img src="photoUser?id=${id }" height="80px" width="80px" />
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
				<f:form method="post" modelAttribute="sm" action="validationReglageMdp">
						<table align="center" border="0">
							<tr>
								<td>Actuel mot de passe</td>
								<td><f:input path="mdp"/></td>
							</tr>
							<tr>
								<td>Nouveau mot de passe</td>
								<td><f:input path="mdpnouveau"/></td>
							</tr>
							<tr>
								<td>Confirmer Nouveau mot de passe</td>
								<td><f:input path="mdpnouveauconfirme"/></td>
							</tr>
						</table><br>
						<input type="submit" value="valider" align="center"/>
				</f:form>
				<f:form method="post" modelAttribute="sm" action="validationReglageVisibilite" >
				    <table  border="0" align="center" >
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
		                 <td><div align="right" class="style11">qui peut voir vos Photos</div>
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
			<div class="col-md-3 col-lg-3">
				<div>
					<jsp:include page="menuDroit.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>
     <script type="text/javascript">
     	$(function(){
     		$('.true').attr("checked", true);
     	});
     </script>

</body>
</html>