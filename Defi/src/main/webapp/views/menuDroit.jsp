<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%-- <%@ page language="java" contentType="text/html;  pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
</head>
	<body>
		<div class="menuDroit">
			<h3 style="text-align: center; color: white; text-shadow: 2px 2px 4px #000000;  "> VOS DERNIERS JEUX </h3>
			<div class="panel panel-default " style="margin-top: 15px;"> 
				<div class="panel-heading" style="text-align: center;">
			    	<a href="#solo" data-toggle="collapse">Vos ABC SOLO</a><br>
			                	les 10 derniers
			    </div>
			       <div id="solo" class="panel-collapse collapse">
			         <div class="panel-body">
							<table class="table table-bordered table-striped table-condensed ">
								<!-- <thead> -->
									<tr>
										<th>Date</th>
									
										<th>Score</th>
									
										<th>Lettre</th>
									
										<th>Aide</th>
									</tr>
								
									<c:forEach items="${sessionScope.mesSolos}" var="solo" begin="0" end="9">
										<tr>
											<td><c:out value="${solo.abcsolojeux.datestring}"></c:out></td>
										
											<td><c:out value="${solo.abcsolojeux.score}"></c:out>/<c:out value="${solo.abcsolojeux.scoreMax}"></c:out></td>
										
											<td><c:out value="${solo.abcsolojeux.lettrechar}"></c:out></td>
										
											<td><c:out value="${solo.abcsolojeux.help}"></c:out></td>
										</tr>
									</c:forEach>
							</table>
					</div>
				</div>
			</div>
			<div class="panel panel-default " style="margin-top: 15px;"> 
				<div class="panel-heading" style="text-align: center;">
			    	<a href="#dico" data-toggle="collapse">VOS DICOS SOLO</a><br>
			                	les 10 derniers
			    </div>
			       <div id="dico" class="panel-collapse collapse">
			         <div class="panel-body">
							<table class="table table-bordered table-striped table-condensed ">
								<!-- <thead> -->
									<tr>
										<th>Date</th>
									
										<th>Score</th>
									
									</tr>
								
									<c:forEach items="${sessionScope.mesDicoSolos}" var="dico" begin="0" end="10">
										<tr>
											<td><c:out value="${dico.dateString}"></c:out></td>
										
											<td><c:out value="${dico.score}"></c:out>/<c:out value="${dico.scoreMax}"></c:out></td>
				
										</tr>
									</c:forEach>
							</table>
					</div>
				</div>
			</div>
			<div class="panel panel-default " style="margin-top: 15px;"> 
				<div class="panel-heading" style="text-align: center;">
			    	<a href="#sujet" data-toggle="collapse">VOS SUJETS SOLO</a><br>
			                	les 10 derniers
			    </div>
			       <div id="sujet" class="panel-collapse collapse">
			         <div class="panel-body">
							<table class="table table-bordered table-striped table-condensed ">
								<!-- <thead> -->
									<tr>
										<th>Date</th>
									
										<th>Score</th>
									
									</tr>
								
									<c:forEach items="${sessionScope.mesSujetsSolos}" var="sujet" begin="0" end="10">
										<tr>
											<td><c:out value="${sujet.dateString}"></c:out></td>
										
											<td><c:out value="${sujet.score}"></c:out>/<c:out value="${sujet.scoreMax}"></c:out></td>
				
										</tr>
									</c:forEach>
							</table>
					</div>
				</div>
			</div>		
		</div>
			
					
	</body>				
</html>