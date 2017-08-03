<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
					<div class="resultatGagnant">Bravo à vous, vous avez trouvez tout le mot ${motComplet} et obtenu un score de ${points}/${pointsMax}. vous avez perdu ${pointsPerdus} avec <c:out value="${nbErreurs}"></c:out> erreurs,
						
						 </div>
						
					<div class="resultatTempsFini">AIII !!! le temps est fini alors que vous n'avez pas trouvé tout le mot
						${motComplet}, pour ce jeu vous avez gagné ${score } points sur ${scoreMax } possibles </div>
						
					<div class="resultatCinqErreurs">AIII !!! vous avez fait cinq erreurs avant de trouver le mot
						${motComplet}, et par conséquent le jeu est fini et vous n'avez pas gagné de points. </div>
</body>
</html>