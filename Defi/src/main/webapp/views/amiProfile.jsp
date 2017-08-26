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
				<div>
					<div class="menuGauche">
						<c:import url="menuGauche.jsp"></c:import>
					</div>	
				</div>	
			</div>
			<div class="col-md-6 col-lg-6">
				<div align="center">
					<div class="panel panel-default">
								<div class="panel-heading"><strong><c:out value="${ami.nom}"/>&nbsp; <c:out value="${ami.prenom}"/></strong>
								</div>
								<div class="panel-body">
									<img src="photoUser?id=${idAmi }" height="100" width="100" /><br><br>
									<div class="envoiDemande"></div>
									<div>
										<c:choose>
											<c:when test="${estAmi == true }">
												<button class="btn btn-success"> VOUS ETES AMIS</button>
											</c:when>
											<c:otherwise>
												<button onclick="envoyerDemande(this, ${ami.id})" class="btn btn-success">Envoyez une demande d'ami</button>
											</c:otherwise>
										</c:choose>
									</div><br>
									<div>
										<strong>NOMBRE DE SOLOS JOUES: &nbsp; <c:out value="${nbSolosAmi }"/></strong><br>
										<strong>NOMBRE DE CHALLENGES JOUES: &nbsp; <c:out value="${nbChallengesAmi }"/></strong>
									</div>
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
     	function envoyerDemande(lui, id){
     		var param = 'idAmi='+id+'';
     		lui.disabled='true';
     		$('.envoiDemande').load('envoiDemandeAmi .envoiDemandeAmi', param);     		
     	};
</script>
<script type="text/javascript">
/* pour la vadiation du formulaire de changement de mot de passe  */
	$(document).ready(function () {
		
	});
	
</script>

 <!-- jQuery and Bootstrap JS -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js" type="text/javascript"></script>
		
	<!-- BootstrapValidator -->
    <script src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js" type="text/javascript"></script> 

</body>
</html>