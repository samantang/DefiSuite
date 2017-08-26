<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Abc Solo</title>
<style type="text/css">
.modal-dialog {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.modal-content {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}
.modal-body{
    height: 450px;
    overflow-y: auto;
    overflow-x: auto;
}
</style>
</head>
<body>
		<div class="modal-header">
  <button type="button" class="close quitterInfosDicoSolo" data-dismiss="modal">&times;</button>
    <h2 style="text-align: center; color: navy; text-shadow: 2px 2px 4px #000000;  ">DETAILS DE VOTRE JEU ABC SOLO</h2>
  	<button class="btn-success quitterInfosDicoSolo">QUITTER</button>
  	<div id=infoPublicationSolo style="text-align: center;"></div>
</div>
<div class="modal-body">
  <div>
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr class="success">
									<th>Date</th>
									<th>Lettre</th>
									<th>Aide</th>
									<th>Temps</th>
									<th>Score</th>
									<th>Publier</th>
									<th>Supprimer</th>
									<th>Agglos</th>
									<th>Pays</th>
									<th>Capitales</th>
									<th>Nobels</th>
									<th>Artistes</th>
									<th>Prési</th>
									<th>Ancien Prési</th>
									<th>Villes</th>
								</tr>
							</thead>
							<tbody>
								<%-- <c:forEach items="${gm.mesS }" var="solo"> --%>
									<tr>
										<td>
											<%-- <c:forEach items="${gm.solo.abcsolojeux}" var="solojeu"> --%>
												${solo.abcsolojeux.datestring}<br>
											<%-- </c:forEach> --%>
										</td>
										<td>
											<%-- <c:forEach items="${solo.abcsolojeux}" var="agglo"> --%>
												${solo.abcsolojeux.lettrechar}<br>
											<%-- </c:forEach> --%>
										</td>
										<td>
											<%-- <c:forEach items="${solo.abcsolojeux}" var="agglo"> --%>
												${solo.abcsolojeux.help}<br>
											<%-- </c:forEach> --%>
										</td>
										<td>${solo.abcsolojeux.tempsRestant }</td>
										<td>
											<%-- <c:forEach items="${solo.abcsolojeux}" var="agglo"> --%>
												${solo.abcsolojeux.score}/${solo.abcsolojeux.scoreMax}<br>
											<%-- </c:forEach> --%>
										</td>
										<td>
											<c:choose>
												<c:when test="${solo.abcsolojeux.publie == true}">
													<button class="btn btn-danger" >
											        	<span class="glyphicon glyphicon-ban-circle"></span>
											     	</button>
												</c:when>
												<c:otherwise>
													<button  onclick="publierSolo(this,${solo.id} )" class="btn btn-primary" >
											        	<span class="glyphicon glyphicon-share"></span>
											     	</button>
												</c:otherwise>
											</c:choose>
										</td>
										<td>---</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.agglo}" var="agglo">
												${agglo}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.pays}" var="pays">
												${pays}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.capitale}" var="capitale">
												${capitale}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.nobel}" var="nobel">
												${nobel}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.artiste}" var="artiste">
												${artiste}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.president}" var="president">
												${president}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.aPresident}" var="apresident">
												${apresident}<br>
											</c:forEach>
										</td>
										<td>
											<c:forEach items="${solo.abcsolojeux.ville}" var="ville">
												${ville}<br>
											</c:forEach>
										</td>
										
									</tr>
								<%-- </c:forEach> --%>
							</tbody>
						</table>
					</div>
				</div>
				<script type="text/javascript">
				$(function (){
					$('.quitterInfosDicoSolo').click(function(){
						location = 'http://localhost:8080/abcSoloHome';
					})
				}); 
				function publierSolo(lui, id){
					lui.disabled='true';
					var param = 'idSolo='+id+'';
					$("#infoPublicationSolo").load("publierSolo", param);
					lui.removeClass('btn-primary').addClass('btn-danger');
				}

				</script>
</body>
</html>