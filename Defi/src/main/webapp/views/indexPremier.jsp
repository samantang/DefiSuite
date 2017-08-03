<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>INDEX</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/fichierjs.js"></script> 
</head>
	<body data-spy="scroll" data-target=".navbar">

<div class="container-fluid">
	<c:import url="entete.jsp"></c:import>
	 <%-- <%@include file="fomulaireInscription.jsp" %> --%>
	 <c:import url="fomulaireInscription.jsp"></c:import>	
  <div class="jumbotron premierJumbotron" id="accueil">
    <div class="container">
        <h1 class="well">Bienvenue dans notre espace !</h1>  
        <a href="accueil">Accueil</a>
      <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
      </p>
    </div>
  </div>
  <div class="jumbotron" id="produits">
    <div class="container">
      <h1 class="well">Nos produits attractifs !</h1>
      <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
      </p>
      <hr>
      <div class="row">
        <div class="well">
          <div class="row">
            <div class="col-sm-4">
              <button type="button" class="btn btn-primary btn-lg btn-block">
                <span class="glyphicon glyphicon-wrench"></span><br>Outillage
              </button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-primary btn-lg btn-block">
              <span class="glyphicon glyphicon-fire"></span><br>Incendie
              </button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-primary btn-lg btn-block">
              <span class="glyphicon glyphicon-home"></span><br>Habitation
              </button>
            </div>
          </div>
        </div>
      </div>     
      <hr>
    </div>
  </div>

  <div class="jumbotron" id="nouvelles">
    <div class="container">
      <h1 class="well">Les nouvelles de nos activités !</h1>
      <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
      </p>
      <hr>
      <div class="row">
        <div class="well">
          <div class="row">
            <div class="col-sm-4">
              <button type="button" class="btn btn-info btn-lg btn-block">
                <span class="glyphicon glyphicon-wrench"></span><br>Outillage
              </button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-info btn-lg btn-block">
              <span class="glyphicon glyphicon-fire"></span><br>Incendie
              </button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-info btn-lg btn-block">
              <span class="glyphicon glyphicon-home"></span><br>Habitation
              </button>
            </div>
          </div>
        </div>
      </div>     
      <hr>
    </div>
  </div>

  <div class="jumbotron" id="localisation">
    <div class="container">
      <h1 class="well">L'emplacement de nos boutiques !</h1>
      <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
      </p>
      <hr>
      <div class="row">
        <div class="well">
          <div class="row">
            <div class="col-sm-4">
              <button type="button" class="btn btn-warning btn-lg btn-block">
                <span class="glyphicon glyphicon-wrench"></span><br>Outillage
              </button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-warning btn-lg btn-block">
              <span class="glyphicon glyphicon-fire"></span><br>Incendie
              </button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="btn btn-warning btn-lg btn-block">
              <span class="glyphicon glyphicon-home"></span><br>Habitation
              </button>
            </div>
          </div>
        </div>
      </div>     
      <hr>
    </div>
  </div>

</div>

</body>
</html>                                		