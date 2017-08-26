<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
</head>
<body>

							<c:choose>
								<c:when test="${moi.nomPhoto == null}">
									<img height="50px" width="50px" src="<%=request.getContextPath()%>/resources/images/user.png" alt=""><br>
									<a style="margin-top: 10px" class="btn btn-warning" href="user_profile">changer de photo</a>
								</c:when>
								<c:otherwise>
									<a href="user_profile"><img src="photoUser?id=${id }" height="80px" width="80px"/></a>
								</c:otherwise>
							</c:choose>
							<div >
								<p style="color: #CCCCFF"><strong>Jouez, Gagnez, Partagez</strong></p>
								<ul class="listeMenuGauche">
				                    <li><a href="userhome">Accueil</a></li>
				  					<li><a href="user_profile">Mon Profil</a></li>
				  					 <li><a href="mesamis">Amis</a></li>
				                    <li><a href="abcSoloHome">ABC Solo</a></li>
				                    <li><a href="abcChallengeHome">ABC Challenge</a></li>
				                    <li><a href="penduSoloDico">Penu Dico Solo</a></li>
				                    <li><a href="penduChallengeDico">Pendu Dico Challenge</a></li>
				                    <li><a href="pendusoloSujets">Pendu Sujets Solo</a></li>
				                    <li><a href="penduChallengeSujets">Pendu Sujets Challenge</a></li>
								</ul>
							</div>
	</body>
	</html>						
							
