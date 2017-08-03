<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Inscription</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/entete.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/entete.js"></script> 

<script type="text/javascript">
/* $(function(){
	  $("form").submit(function(e) {
	    e.preventDefault();
	    var $form = $(this);
	    $.post($form.attr("action"), $form.serialize())
	    .done(function(data) {
	      $("#html").html(data);
	      $("#formulaire").modal("hide"); 
	    })
	    .fail(function() {
	      alert("des erreurs javascript!!!!!! veillez verifier SVP");
	    });
	  });
	});  */
</script>

</head>
	<body>

 
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

  

</body>
</html>                                		