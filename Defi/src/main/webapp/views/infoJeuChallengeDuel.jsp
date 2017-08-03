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
    height: 250px;
    overflow-y: auto;
    overflow-x: auto;
}
</style>
</head>
<body>
		<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h1>Les Détails de vos duels</h1>
  
</div>
<div class="modal-body">
  					<div>
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th>Date</th>
									<th>Lettre</th>
									<th>Aide</th>
									<th>Temps</th>
									<th>Score</th>
									<th>Publier</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${mesChallengesJoues }" var="solo">
									<tr>
										<td>${solo.date }</td>
										<td>${solo.lettre }</td>
										<td>${solo.help }</td>
										<td>${solo.time }</td>
										<td>${solo.score }</td>
										<td><a href="publierSolo?id=${solo.id}">pub</a></td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th>Date</th>
									<th>Lettre</th>
									<th>Aide</th>
									<th>Temps</th>
									<th>Score</th>
									<!-- <th>Publier</th> -->
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${challengesAmis }" var="solo">
									<tr>
										<c:choose>
											<c:when test="${solo.lettre == '' }"> 
												<td>il n'a pas joué encore</td>
											</c:when>
											<c:otherwise>
												<td>${solo.date }</td>
												<td>${solo.lettre }</td>
												<td>${solo.help }</td>
												<td>${solo.time }</td>
												<td>${solo.score }</td>
												<%-- <td><a href="publierSolo?id=${solo.id}">pub</a></td> --%>
											</c:otherwise>	
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
</div>
</body>
</html>