<!-- <!DOCTYPE html> -->
<%@ page pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.jeuxPublies{
	border: dotted;
	border-color: green;
	margin: 10px;
	padding: 10px;
}
.post{
	margin: 10px;
	padding: 10px;
	border: aqua;
	background-color: #CCCCFF;
}

</style>
</head>
	<body>
		<strong style="margin: 10px; padding: 10px;">Exprimez vous librement</strong><br><br>
					<f:form method="post" modelAttribute="sm" action="posterPost" enctype="UTF-8" acceptCharset="UTF-8">
						<f:textarea rows="4" cols="65"  path="messagePost" name="messagePost"  placeholder="Quoi de nouveau aujourd'hui encore ..., n'hésitez à vous exprimer et de dire tout ce qui peut amuser vos amis "/>
						<input type="submit" value="Publier">
					</f:form ><br>
					<div class="post" style="text-align: left;"><strong>Les posts publiés par les membres</strong></div>
					<div class="jeuxPublies" style="text-align: left;"><strong>Les jeux publiés par les membres</strong></div><br>
					<div> 
						<c:forEach items="${sm.posts }" var="sm">
							<c:choose>
								<c:when test="${sm.jeu == true}">
									<div class="jeuxPublies">
										<p><img alt="" src="photoUser?id=${sm.friendpost.id }" height="30px" width="30px">&nbsp;${sm.friendpost.nom}</p>
										<p> ${sm.message }</p>
										<!-- on affiche le tableau que losrqu'il s'agit des jeux en challenge -->
										<c:if test="${sm.typePost == 'PENDUDICOCHALLENGE' || sm.typePost == 'PENDUSUJETSCHALLENGE' }">
											<table class="table table-bordered table-striped table-condensed">
												<thead>
													<tr>
														<th>Joueur</th>
														<th>Aide</th>
														<th>Temps restant</th>
														<th>Score Total</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>MOI</td>
														<td>
															<c:choose>
																<c:when test="${sm.aideMoi == true }">
																	OUI
																</c:when>
																<c:otherwise>
																	NON
																</c:otherwise>
															</c:choose>
														</td>
														<td><c:out value="${sm.tempsResantMoi }"/></td>
														<td><c:out value="${sm.scoreMoi }"/>/<c:out value="${sm.scoreMax }"/></td>
													</tr>
													<tr>
														<td><a href="voirAmi?id=${sm.ami.id}"><c:out value="${sm.ami.nom }"/></a> </td>
														<td>
															<c:choose>
																<c:when test="${sm.aideAmi == true }">
																	OUI
																</c:when>
																<c:otherwise>
																	NON
																</c:otherwise>
															</c:choose>
														</td>
														<td><c:out value="${sm.tempsRestantAmi }"/></td>
														<td><c:out value="${sm.scoreAmi }"/>/<c:out value="${sm.scoreMax }"/></td>
													</tr>
												</tbody>
											</table>
										</c:if>	
										<p> ${sm.date }</p>
										 <!-- si j'ai pas encore aimé ce poste on affiche "aimer", sinon on affiche "ne plus aimer" -->
											<a href="aimerPost?id=${sm.id }">aimer</a> &nbsp;&nbsp;
											<a href="neplusAimerPost?id=${sm.id }"> ne plus aimer</a><br>
											<a href="quiAimePost?id=${sm.id }">${sm.nbLikesPost} personnes aimment ça</a><br><br>
											<c:forEach items="${sm.comments }" var="com">
													<c:forEach items="${com.friends }" var="fr">
														<p><img alt="" src="photoUser?id=${fr.id }" height="30px" width="30px">  &nbsp; <strong>${fr.nom }&nbsp; ${fr.prenom }</strong></p>
													</c:forEach>
													<p> &nbsp; &nbsp; &nbsp; ${com.commentaire }</p><br>
											</c:forEach>
											<f:form modelAttribute="sm" action="commenterPost">
												<f:textarea path="commentaire"  placeholder=" votre commentaire ..." />
												<f:input path="idPost" type="hidden" value="${sm.id }" />
												<input type="submit" value="commenter">
											</f:form>	
											<p id="idcommentaire"></p><br>
												<c:forEach items="${sm.comments }" var="com">
													<p><strong> ${com.friends }</strong></p>
													<strong>le commentaire: ${com.commentaire }</strong><br><br><hr>
												</c:forEach>
										<!-- si je suis un adminstrateur -->
											<c:if test="${moi.admin == true }">
												<button  onclick="supprimerPost(this,${sm.id} )" class="btn btn-danger" >
											        	Supprimer &nbsp; <span class="glyphicon glyphicon-remove-sign"></span>
											     </button>
											</c:if>	
									</div>
								</c:when>
								<c:otherwise>
									<div class="post">
										<p><img alt="" src="photoUser?id=${sm.friendpost.id }" height="30px" width="30px">&nbsp;<strong>${sm.friendpost.prenom}&nbsp;${sm.friendpost.nom}</strong> </p>
										<p><strong>${sm.message }</strong> </p>
										<p> ${sm.date }</p>
											<a href="aimerPost?id=${sm.id }">aimer</a>&nbsp;&nbsp;
											<a href="neplusAimerPost?id=${sm.id }"> ne plus aimer</a><br>
											<a href="quiAimePost?id=${sm.id }">${sm.nbLikesPost} personnes aimment ça</a><br><hr>
											<c:forEach items="${sm.comments }" var="com">
													<c:forEach items="${com.friends }" var="fr">
														<p><img alt="" src="photoUser?id=${fr.id }" height="30px" width="30px">  &nbsp; <strong>${fr.nom }&nbsp; ${fr.prenom }</strong></p>
													</c:forEach>
													<p> &nbsp; &nbsp; &nbsp; ${com.commentaire }</p><br>
											</c:forEach>
											<f:form modelAttribute="sm" action="commenterPost">
												<f:textarea path="commentaire"  placeholder=" votre commentaire ..." />
												<f:input path="idPost" type="hidden" value="${sm.id }" />
												<input type="submit" value="commenter">
											</f:form>	
											<p id="idcommentaire"></p><br>
											<!-- si je suis un adminstrateur -->
											<c:if test="${moi.admin == true }">
												<button  onclick="supprimerPost(this,${sm.id} )" class="btn btn-danger" >
											        	Supprimer &nbsp; <span class="glyphicon glyphicon-remove-sign"></span>
											     </button>
											</c:if>	
									</div>
									
								</c:otherwise>	
							</c:choose>			
						</c:forEach>
					</div>
						
	</body>
</html>