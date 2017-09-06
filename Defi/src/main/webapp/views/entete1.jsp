<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Entete</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/entete.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">



<style type="text/css">
.premierJumbotron{
	 background-color: #CEFFF8;
      
	}
	
</style>
</head>
	<body data-spy="scroll" data-target=".navbar">

<div class="container-fluid">
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="#" class="navbar-brand"><img class="img-responsive" height="50px" width="100px" src="<%=request.getContextPath()%>/resources/images/logoDefi.PNG" alt="logo"></a>
      </div>
      <c:choose>
      	<c:when test="${empty sessionScope.id }">
	      	<div class="collapse navbar-collapse">
		        <ul class="nav navbar-nav">
		          <li class="active"><a href="#userhome">Accueil</a></li>
		          <li><a href="#produits">Produits</a></li>
		          <li><a href="#nouvelles">Nouvelles</a></li>
		          <li><a href="#localisation">Localisation</a></li>          
		        </ul>
		        <ul class="nav navbar-nav navbar-right">
		        	<!-- <button data-toggle="modal" data-backdrop="false" href="#formulaire" class="btn btn-primary btn-sm">inscription</button>  -->
		        	<li><a href="#formulaire" data-toggle="modal" data-backdrop="false"><span class="glyphicon glyphicon-user inscription"></span> Inscription</a></li>
		        </ul>       
		        	
		         <f:form class="navbar-form navbar-right inline-form" role="form" action="loginUser" modelAttribute="sm" method="post">
		            <div class="form-group">
		              <input type="text" class="input-sm form-control" placeholder="email" name="userid" size="10">
		               <input type="password" class="input-sm form-control" placeholder="mot de passe" name="password" size="8">
		              <input type="submit" class="btn btn-primary btn-sm" value="connexion">	              
		            </div>
		          </f:form>          
		      </div>
      	</c:when>
      	<c:otherwise>
      		<div class="collapse navbar-collapse">
      				<ul class="nav navbar-nav navbar-right">
			        	<li><a id="deconnexion" href="deconnexion" data-target="deconnexion"><span class="glyphicon glyphicon-user"></span> Déconnexion</a></li>
		        	</ul> 
      				<ul class="nav navbar-nav navbar-right">
      					<li  class="active"><a href="userhome">Accueil</a></li>
      					<li><a   title="les challenges ABC" href="javascript:" onclick="notificationsChallengeAbc()" ><span class="glyphicon glyphicon-hourglass"></span> <c:choose><c:when test="${sessionScope.nbNotificationsAbc ==0}">0</c:when><c:otherwise><span style="color: orange;"><c:out value="${sessionScope.nbNotificationsAbc}"/></span></c:otherwise> </c:choose> ABC</a></li>
      					<li><a  title="les challenges DICO" href="javascript:" onclick="notificationsChallengeDico()" ><span class="glyphicon glyphicon-hourglass"></span> <c:choose><c:when test="${sessionScope.nbNotificationsDico ==0}">0</c:when><c:otherwise><span style="color: orange;"><c:out value="${sessionScope.nbNotificationsDico}"/></span></c:otherwise> </c:choose> DICO</a></li>
      					<li><a  title="les challenges SUJETS" href="javascript:" onclick="notificationsChallengeSujets()" ><span class="glyphicon glyphicon-hourglass"></span> <c:choose><c:when test="${sessionScope.nbNotificationsSujets ==0}">0</c:when><c:otherwise><span style="color: orange;"><c:out value="${sessionScope.nbNotificationsSujets}"/></span></c:otherwise> </c:choose> SUJETS</a></li>      					
      					<li><a href=""><c:out value="${sessionScope.prenomUser}"></c:out> </a></li>
      				</ul>
			        	<form class="navbar-form navbar-left" >
						  <div class="input-group">
						    <input name="searchName"  type="text" size="50" id="searchbox" placeholder="Chercher des amis" onkeyup="suggest()"/>
						    <!-- <div class="input-group-btn">
						      <button class="btn btn-default" type="submit">
						        <i class="glyphicon glyphicon-search"></i>
						      </button>
						    </div> -->
						  </div>
						</form>
      		</div>
      	</c:otherwise>
      </c:choose>
    </div>
  </nav> 
  <div class="container">
  	<div class="row">
  		<div class="col-sm-3 col-md-4 "><div style="position: fixed; z-index: 3; margin-top: 55px; margin-left: 100px; " id="suggestion"></div></div>
  		<div class="col-sm-3 col-md-4 "></div>
  		<div class="col-sm-3 col-md-3 ">
  			<div id="challengesAJouer" style="position: fixed; z-index: 1;"></div>
  		</div>
  		<div class="col-sm-3 col-md-1 "></div>
  	</div>
  </div> 
  <div id="challengesAaccepter" style="position: fixed;z-index: 2;"></div>
  
<!-- iscription -----------------------------------------------------------------------------------------------------------------------------------------------------  -->

		<div class="modal fade" id="formulaire">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal">x</button>
	              <h4 class="modal-title">Votre Inscription </h4>
	            </div>
	            <div class="modal-body">
	              <f:form  modelAttribute="Inscription" action="userhome" id="myForm">
	              
	              	<span class="form_col">Sexe :</span>
			        <label><input name="sex" type="radio" value="H" />Homme</label>
			        <label><input name="sex" type="radio" value="F" />Femme</label>
			        <span class="tooltip">Vous devez sélectionnez votre sexe</span>
			        <br /><br />
			
			        <label class="form_col" for="lastName">Nom :</label>
			        <input name="lastName" id="lastName" type="text" />
			        <span class="tooltip">Un nom ne peut pas faire moins de 2 caractères</span>
			        <br /><br />
			
			        <label class="form_col" for="firstName">Prénom :</label>
			        <input name="firstName" id="firstName" type="text" />
			
			        <span class="tooltip">Un prénom ne peut pas faire moins de 2 caractères</span>
			        <br /><br />
			
			        <label class="form_col" for="email">email :</label>
			        <input name="email" id="email" type="text" />
			        <span class="tooltip">L'email doit etre de type abc@def.gh</span>
			        <br /><br />
			
			        <label class="form_col" for="login">Pseudo :</label>
			        <input name="login" id="login" type="text" />
			        <span class="tooltip">Le pseudo ne peut pas faire moins de 4 caractères</span>
			        <br /><br />
			
			        <label class="form_col" for="pwd1">Mot de passe :</label>
			        <input name="pwd1" id="pwd1" type="password" />
			        <span class="tooltip">Le mot de passe ne doit pas faire moins de 6 caractères</span>
			        <br /><br />
			
			        <label class="form_col" for="pwd2">MDP (confirmation) :</label>
			        <input name="pwd2" id="pwd2" type="password" />
			        <span class="tooltip">Le mot de passe de confirmation doit être identique à celui d'origine</span>
			        <br /><br />
					
					<button type="submit" class="btn btn-default">S'inscrire</button>
       				 <button type="reset" class="btn btn-default" value="Réinitialiser le formulaire" >Réinitialiser le formulaire</button>
	              </f:form>
	            </div>
	            <div class="modal-footer">
	              <button class="btn btn-info" data-dismiss="modal">Annuler</button>
	            </div>
	          </div>
	        </div>
        </div>

<!-- fin inscription------------------------------------------------------------------------------------------------------------------------------------------------------------ -->
<script type="text/javascript">
 $(document).ready(function() {
	 /* pour cacher les notification quand on click ailleur */
	document.body.addEventListener('click', function(){
		$('#challengesAaccepter').hide();
		$('#challengesAJouer').hide();
		$('#suggestion').hide();
	});
}); 
/*  $('#rechecheAutoComplete').on('change paste keyup', function() {
	 	var v = $(this).val();
	   var valeur = 'valeur='+v+'';
	   $('#afficheAutoComplete').load('rechecheAutoComplete', valeur);
	   
	}); */
	function suggest()
	{
	        var xmlhttp;
	        var elem = document.getElementById("searchbox").value;
	        if(elem.length >= 2){	        
		        if(window.XMLHttpRequest)
		        {
		                xmlhttp = new XMLHttpRequest();
		        }
		        else if(window.ActiveXObject)
		        {
		                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		        }
		        xmlhttp.open("GET","rechecheAutoComplete?elem="+elem,true);
		        xmlhttp.send();
		        xmlhttp.onreadystatechange=function()
		        {
		                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
		                    {
		                            var data = xmlhttp.responseText;
		                            if(data.trim()=="no")
		                            {
		                                document.getElementById('suggestion').style.backgroundColor="";
		                                document.getElementById('suggestion').style.border="";
		                                document.getElementById('suggestion').innerHTML="";
		                            }
		                            else
		                            {
		    
		                                //document.getElementById('suggestion').style="border:2px solid black";
		                                document.getElementById('suggestion').style.backgroundColor="#B0C4DE";
		                                document.getElementById('suggestion').style.border="1px solid grey";
		                                document.getElementById('suggestion').style.borderTop="none";
		                                document.getElementById('suggestion').style.borderRadius="6px";
		                                document.getElementById('suggestion').style.display="inline";
		                                document.getElementById('suggestion').style.textDecoration="none";
		                                document.getElementById('suggestion').innerHTML=data;
		                            }
		                }
		            }
	        }
	}
</script>
  
</div>
<script src="<%=request.getContextPath()%>/resources/js/entete.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<%-- <script src="<%=request.getContextPath()%>/resources/js/entete.js"></script>  --%>
</body>
</html>                                		