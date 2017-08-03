<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
</head>
<body>
		<table id="tableauDataTable" class="table table-bordered table-striped table-condensed" >
									<thead>
										<tr class="success">
											<th style="text-align: center;">AMIS</th>
											<th>ABC Challenge</th>
											<th>DICO Challenge</th>
											<th>SUJETS Challenge</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${amisJeuxModel }" var="ami">
											<tr>
												<td><a href="voirAmi?id=${ami.id }"><c:out value="${ami.nom }" /> &nbsp; <c:out value="${ami.prenom }" /></a></td>
												<td>
													<c:choose>
														<c:when test="${ami.abcChallenger ==true }">
															<button onclick="challengerABC(this, ${ami.id})" class="btn btn-primary" data-toggle="tooltip" title="envoyez lui une demande">challenger</button>
														</c:when>
														<c:when test="${ami.abcRefuser ==true }">
															<button onclick="accepterABC(this, ${ami.id})" class="btn btn-success btn-xs" data-toggle="tooltip" title="accepter la demande">Accepter</button>
															<button onclick="refuserABC(this, ${ami.id})" class="btn btn-danger btn-xs" data-toggle="tooltip" title="refuser la demande">Refuser</button>
														</c:when>
														<c:when test="${ami.abcAnnuler ==true }">
															<button onclick="annulerEnvoiABC(this, ${ami.id})" class="btn btn-warning" data-toggle="tooltip" title="annulez la demande envoyée">Annuler</button>
														</c:when>
														<c:otherwise>
															<button onclick="jouerABC(this, ${ami.id})" class="btn btn-info" data-toggle="tooltip" title="aller au duel contre lui">jouer</button>
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${ami.dicoChallenger ==true }">
															<button onclick="challengerDICO(this, ${ami.id})" class="btn btn-primary" data-toggle="tooltip" title="envoyez lui une demande">challenger</button>
														</c:when>
														<c:when test="${ami.dicoRefuser ==true }">
															<button onclick="accepterDICO(this, ${ami.id})" class="btn btn-success btn-xs" data-toggle="tooltip" title="accepter la demande">Accepter</button>
															<button onclick="refuserDICO(this, ${ami.id})" class="btn btn-danger btn-xs" data-toggle="tooltip" title="refuser la demande">Refuser</button>
														</c:when>
														<c:when test="${ami.dicoAnnuler ==true }">
															<button onclick="annulerEnvoiDICO(this, ${ami.id})" class="btn btn-warning" data-toggle="tooltip" title="annuler la demande envoyée">Annuler</button>
														</c:when>
														<c:otherwise>
															<button onclick="jouerDICO(this, ${ami.id})" class="btn btn-info" data-toggle="tooltip" title="aller au duel contre lui">jouer</button>
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${ami.sujetsChallenger ==true }">
															<button onclick="challengerSUJETS(this, ${ami.id})" class="btn btn-primary" data-toggle="tooltip" title="envoyez lui une demande">challenger</button>
														</c:when>
														<c:when test="${ami.sujetsRefuser ==true }">
															<button onclick="accepterSUJETS(this, ${ami.id})" class="btn btn-success btn-xs" data-toggle="tooltip" title="accepter la demande">Accepter</button>
															<button onclick="refuserSUJETS(this, ${ami.id})" class="btn btn-danger btn-xs" data-toggle="tooltip" title="refuser la demande">Refuser</button>
														</c:when>
														<c:when test="${ami.sujetsAnnuler ==true }">
															<button onclick="annulerEnvoiSUJETS(this, ${ami.id})" class="btn btn-warning" data-toggle="tooltip" title="annuler la demande envoyée">Annuler</button>
														</c:when>
														<c:otherwise>
															<button onclick="jouerSUJETS(this, ${ami.id})" class="btn btn-info" data-toggle="tooltip" title="aller au duel contre lui">jouer</button>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								
<script type="text/javascript">
	$(document).ready(function() {
	    $('#tableauDataTable').DataTable({
	    	"language": {
	    		"sProcessing": "Traitement en cours...",
	    		"sSearch": "Rechercher&nbsp;:",
	    		"sLengthMenu": "Afficher _MENU_ &eacute;l&eacute;ments",
	    		"sInfo": "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
	    		"sInfoEmpty": "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
	    		"sInfoFiltered": "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
	    		"sInfoPostFix": "",
	    		"sLoadingRecords": "Chargement en cours...",
	    		"sZeroRecords": "Aucun &eacute;l&eacute;ment &agrave; afficher",
	    		"sEmptyTable": "Aucune donn&eacute;e disponible dans le tableau",
	    		"oPaginate": {
	    		"sFirst": "Premier",
	    		"sPrevious": "Pr&eacute;c&eacute;dent",
	    		"sNext": "Suivant",
	    		"sLast": "Dernier"
	    		},
	    		"oAria": {
	    		"sSortAscending": ": activer pour trier la colonne par ordre croissant",
	    		"sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
	    		}
	    		}
	    });
	    
	} );
	/* pour les methodes d'envoi de challenge  --------------------------------------------------------------------------------------------------------------------------------------------------------------------  */
		function challengerABC(lui, id){
				
			 ConfirmDialog('Voulez vous vraiment envoyer la demande de ABCchallenge');

			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Envoie de Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='challengeABC';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'challengeABC'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		
		};
		function challengerDICO(lui, id){
			ConfirmDialog('Voulez vous vraiment envoyer la demande de DICOchallenge');

			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Envoie de Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='challengeDICO';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'challengeDICO'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		function challengerSUJETS(lui, id){
			ConfirmDialog('Voulez vous vraiment envoyer la demande de SUJETSchallenge');

			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Envoie de Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='challengeSUJETS';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'challengeSUJETS'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		/* pour les methodes d'annulation de challenge  --------------------------------------------------------------------------------------------------------------------------------------------------------------------  */
		
		function annulerEnvoiABC(lui, id){
			ConfirmDialog('Voulez vous vraiment annuler ce challenge ');

			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Annuler Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='annulerEnvoiABC';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'annulerEnvoiABC'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		function annulerEnvoiDICO(lui, id){
			ConfirmDialog('Voulez vous vraiment annuler ce challenge ');

			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Annuler Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='annulerEnvoiDICO';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'annulerEnvoiDICO'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		function annulerEnvoiSUJETS(lui, id){
			ConfirmDialog('Voulez vous vraiment annuler ce challenge ');
			alert("annuler l'envoi");
			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Annuler Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='annulerEnvoiSUJETS';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'annulerEnvoiSUJETS'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		/* pour les methodes d'acceptation de challenge  --------------------------------------------------------------------------------------------------------------------------------------------------------------------  */
		function accepterABC(lui, id){
			ConfirmDialog('Voulez vous vraiment accepter ce challenge ');

			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Accepter de Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='accepterABC';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'accepterABC'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		function accepterDICO(lui, id){
			ConfirmDialog('Voulez vous vraiment accepter ce challenge ');

			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Accepter de Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='accepterDICO';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'accepterDICO'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		function accepterSUJETS(lui, id){
			ConfirmDialog('Voulez vous vraiment accepter ce challenge ');
			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Accepter de Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='accepterSUJETS';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'accepterSUJETS'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		/* pour les methodes de refu de challenge  --------------------------------------------------------------------------------------------------------------------------------------------------------------------  */
		function refuserDICO(lui, id){
			ConfirmDialog('Voulez vous vraiment refuser ce challenge ');
			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Refuser le Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='refuserDICO';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'refuserDICO'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		function refuserABC(lui, id){
			ConfirmDialog('Voulez vous vraiment refuser ce challenge ');
			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Refuser le Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='refuserABC';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'refuserABC'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		function refuserSUJETS(lui, id){
			ConfirmDialog('Voulez vous vraiment refuser ce challenge ');
			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'Refuser le Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 lui.disabled='true';
			                            	 var challenge ='refuserSUJETS';
			                            	 var paramId = 'idAmi='+id+'';
			                            	 var param = 'rechargerTable='+id+' & action='+challenge+'';
			                            	 /* ici il faut utiliser un objet pour pouvoir convertir l'id en Long dans le controlleur */
			                            	 var vari = {idAmi: id, rechargerTable: param, action: 'refuserSUJETS'};
			                            	 $('#leTableau').empty();
			                     			 $('#leTableau').load('mesamis', vari);			                                 
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		/* pour les methodes pour jouer un challenge  --------------------------------------------------------------------------------------------------------------------------------------------------------------------  */
		function jouerABC(lui, id){
			ConfirmDialog('Voulez vous vraiment jouer ce challenge ');
			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'jouer le Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 window.location.href = "http://localhost:8080/AbcChallengeJeu?idAmi="+id+"";
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		function jouerDICO(lui, id){
			ConfirmDialog('Voulez vous vraiment jouer ce challenge ');
			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'jouer le Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 window.location.href = "http://localhost:8080/penduChallengeDicoJeu?idAmi="+id+"";
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
		function jouerSUJETS(lui, id){
			ConfirmDialog('Voulez vous vraiment jouer ce challenge ');
			 function ConfirmDialog(message){
			     $('<div></div>').appendTo('body')
			                     .html('<div><h6>'+message+'?</h6></div>')
			                     .dialog({
			                         modal: true, title: 'jouer le Challenge', zIndex: 10000, autoOpen: true,
			                         width: 'auto', resizable: false,
			                         buttons: {
			                             OUI: function () {
			                            	 window.location.href = "http://localhost:8080/penduChallengeSujetsJeu?idAmi="+id+"";
			                                 $(this).dialog("close");
			                             },
			                             NON: function () { 
			                             
			                                 $(this).dialog("close");
			                             }
			                         },
			                         close: function (event, ui) {
			                             $(this).remove();
			                         }
			                     });
			     };
		};
</script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js" type="text/javascript"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</body>
</html>