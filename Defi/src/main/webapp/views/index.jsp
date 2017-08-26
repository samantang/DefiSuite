<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>DEFI - Accueil | DEFI</title>
  
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
  
  <link href="<%=request.getContextPath()%>/resources/css/basic-template.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/css/animate.min.css" rel="stylesheet"> 
  <link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/css/lightbox.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet">
  <link id="css-preset" href="<%=request.getContextPath()%>/resources/css/presets/preset1.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/css/responsive.css" rel="stylesheet">
 <%--  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/entete.css" > --%>
 
 <!-- BootstrapValidator CSS -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrapValidator.min.css" rel="stylesheet"/>
  
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
  <![endif]-->
  
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico">
</head>
<style type="text/css">
    .modal-content iframe{
        margin: 0 auto;
        display: block;
    }
</style>
<script type="text/javascript">
$(document).ready(function(){
    /* Get iframe src attribute value i.e. YouTube video url
    and store it in a variable */
    var url = $("#cartoonVideo").attr('src');
    
    /* Assign empty url value to the iframe src attribute when
    modal hide, which stop the video playing */
    $("#myModal").on('hide.bs.modal', function(){
        $("#cartoonVideo").attr('src', '');
    });
    
    /* Assign the initially stored url back to the iframe src
    attribute when modal is displayed again */
    $("#myModal").on('show.bs.modal', function(){
        $("#cartoonVideo").attr('src', url);
    });
});
</script>
<body>

	 <!--.preloader-->
  <!-- <div class="preloader"> <i class="fa fa-circle-o-notch fa-spin"></i></div> -->
  <!--/.preloader-->

  <header id="home">
    <div id="home-slider" class="carousel slide carousel-fade" data-ride="carousel"">
      <div class="carousel-inner">
        <div class="item active" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider/image1.jpg)">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">Bienvenue sur <span>Defi</span></h1>
            <p class="animated fadeInRightBig">Jeux - Partage - Defi - Culture générale</p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" href="#services">Commencer</a>
          </div>
        </div>
        <div class="item"  style="background-image: url(<%=request.getContextPath()%>/resources/images/slider/image3.jpg)">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">cultivez-vous <span>Defiez vos amis</span></h1>
            <p class="animated fadeInRightBig">Jeux - Partage - Defi - Culture générale</p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" href="#services">Commencer</a>
          </div>
        </div>
        <div class="item" style="background-image: url(<%=request.getContextPath()%>/resources/images/slider/image3.jpg)">
          <div class="caption">
            <h1 class="animated fadeInLeftBig">Partagez <span>avec vos amis</span></h1>
            <p class="animated fadeInRightBig">Jeux - Partage - Defi - Culture générale</p>
            <a data-scroll class="btn btn-start animated fadeInUpBig" href="#services">Commencer</a>
          </div>
        </div>
      </div>
      <a class="left-control" href="#home-slider" data-slide="prev"><i class="fa fa-angle-left"></i></a>
      <a class="right-control" href="#home-slider" data-slide="next"><i class="fa fa-angle-right"></i></a>

      <a id="tohash" href="#services"><i class="fa fa-angle-down"></i></a>

    </div><!--/#home-slider-->
    <div class="main-nav">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span> 
          </button>
          <a class="navbar-brand" href="index">
            <h1><img class="img-responsive" height="50px" width="100px" src="<%=request.getContextPath()%>/resources/images/logoDefi.PNG" alt="logo"></h1>
          </a>                    
        </div>
        <div class="collapse navbar-collapse">
          <f:form class="navbar-form navbar-right inline-form" role="form" action="loginUser" modelAttribute="sm" method="post">
		            <div class="form-group">
		              <input type="text" class="input-sm form-control" placeholder="email" name="userid" size="5">
		               <input type="password" class="input-sm form-control" placeholder="mot de passe" name="password" size="5">
		              <input type="submit" class="btn btn-primary btn-sm" value="Longin" style="font-weight: bold; font-size: medium;">	              
		            </div>
		   </f:form>		
          <ul class="nav navbar-nav navbar-right">                 
            <li class="scroll active"><a href="#home">Home</a></li>
            <li class="scroll"><a href="#services">Les jeux</a></li> 
            <li class="scroll"><a href="#portfolio">Comment ça marche</a></li>
            <li class="scroll"><a href="#contact">Contact</a></li> 
            <li class="scroll"><a href="inscription">Inscription</a></li>       
            <li><a style="font-size: xx-small;" href="mdpOublie">MDP oublié</a></li> 
          </ul>
          
          	
        </div>
        
      </div>
    </div><!--/#main-nav-->
  </header><!--/#home-->
  <section id="services">
    <div class="container">
      <div class="heading wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
        <div class="row">
          <div class="text-center col-sm-8 col-sm-offset-2">
            <h2>NOS JEUX DISPONIBLES</h2>
            <p>Vous pouvez jouer à tous nos jeux soit en solo, ou en challenge avec vos amis, vous pouvez également partager vos résultats avec vos amis</p>
          </div>
        </div> 
      </div>
      <div class="text-center our-services">
        <div class="row">
          <div class="col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
            <div class="service-icon">
              <i class="fa fa-sort-alpha-asc"></i>
            </div>
            <div class="service-info">
              <h3>ABC SOLO</h3>
              <p>jouer avec une lettre tirée au sort, en fonction de vos choix parmi les intitulés, vous devez trouvez tous les mots commençant par la lettre</p>
            </div>
          </div>
          <div class="col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="450ms">
            <div class="service-icon">
              <i class="fa fa-user-times"></i>
            </div>
            <div class="service-info">
              <h3>Pendu Dico SOLO</h3>
              <p>Jouez avec plus de 36 000 mots du dictionnaire, trouvez le mot à l'aide d'un indice: une lettre tiréé au sort qui vous ai dévoilée</p>
            </div>
          </div>
          <div class="col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="550ms">
            <div class="service-icon">
              <i class="fa fa-cubes"></i>
            </div>
            <div class="service-info">
              <h3>Pendu Sujets SOLO</h3>
              <p>Vous avez aimé le DicoSolo !!! Vous allez adorez le SujetsSolo car c'est tout simplement ce dernier mais avec des sujets que vous aurez choisit</p>
            </div>
          </div>
          <div class="col-sm-4 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="650ms">
            <div class="service-icon">
              <i class="fa fa-users"></i>
              <i class="fa fa-sort-alpha-asc"></i>
            </div>
            <div class="service-info">
              <h3>ABC CHALLENGE</h3>
              <p>Ce jeux avec le même principe que celui du ABC-SOLO, mais contre un de vos amis, vous jouez avec les même intitulés et les mêmes mots que lui et ... PARTAGEZ vos résultats</p>
            </div>
          </div>
          <div class="col-sm-4 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="750ms">
            <div class="service-icon">
              <i class="fa fa-users"></i>
              <i class="fa fa-user-times"></i>
            </div>
            <div class="service-info">
              <h3>PENDU DICO CHALLENGE</h3>
              <p>Même principe que celui du PENDU-DICO-SOLO, mais contre un de vos amis, vous jouez avec le même mot que lui et ... PARTAGEZ vos résultats</p>
            </div>
          </div>
          <div class="col-sm-4 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="850ms">
            <div class="service-icon">
              <!-- <i class="fa fa-users"></i> -->
              <i class="fa fa-cubes"></i>
            </div>
            <div class="service-info">
              <h3>PENDU SUJETS CHALLENGE</h3>
              <p>Le principe de base de ce jeu est le même que celui du PENDU-SUJETS-SOLO, mais contre un de vos amis, vous jouez avec les même intitulés et les mêmes mots que lui et ... PARTAGEZ vos résultats</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!--/#services-->
  <section id="about-us" class="parallax">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <div class="about-info wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
            <h2>A propos du concepteur du site</h2>
            <h3><a href="tech-clever.com">Tech clever</a></h3>
            <p>Tech clever est une entreprise du numérique qui crée des applications web et et client lourd ou améliore des fonctionalités déjà existantes pour les entreprises, organisations et particuliers. </p>
            <p>Pour se faire, elle utilise les principales technologies du web, de ses expériences et surtout de son savoir faire avec ses développeurs qui utilisent au quotidient les principales technologies du momment: Java, JavaScript, Node JS, PHP, WordPress, ...</p>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="our-skills wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
            <div class="single-skill wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
              <p class="lead"> Java/Java EE - Spring/Hibernate</p>
              <div class="progress">
                <div class="progress-bar progress-bar-primary six-sec-ease-in-out" role="progressbar"  aria-valuetransitiongoal="100">100%</div>
              </div>
            </div>
            <div class="single-skill wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="400ms">
              <p class="lead">JavaScript - Angular JS, PHP, Node JS</p>
              <div class="progress">
                <div class="progress-bar progress-bar-primary six-sec-ease-in-out" role="progressbar"  aria-valuetransitiongoal="95">95%</div>
              </div>
            </div>
            <div class="single-skill wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="500ms">
              <p class="lead">CMS WordPress</p>
              <div class="progress">
                <div class="progress-bar progress-bar-primary six-sec-ease-in-out" role="progressbar"  aria-valuetransitiongoal="90">90%</div>
              </div>
            </div>
            <div class="single-skill wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
              <p class="lead">Android</p>
              <div class="progress">
                <div class="progress-bar progress-bar-primary six-sec-ease-in-out" role="progressbar"  aria-valuetransitiongoal="90">90%</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!--/#about-us-->
  

  <section id="portfolio">
    <div class="container">
      <div class="row">
        <div class="heading text-center col-sm-8 col-sm-offset-2 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
          <h2>Comment ça marche</h2>
          <p>Le fonctionnement du site est simple, l'objetif étant s'amuser tout en apprenant, vous pouvez jouer à tous les jeux soit seul ou avec des amis </p>
        </div>
      </div> 
    </div>
    <!-- -----------------------------------pour la vidéo du fonctionnement en pup up---------------------------------------------- -->
          	<div class="bs-example" style="margin: 0 auto; width: 200px;">
			    <!-- Button HTML (to Trigger Modal) -->
			    <a href="#myModal" class="btn btn-lg btn-primary"  data-toggle="modal">Voir la video</a>
			    
			    <!-- Modal HTML -->
			    <div id="myModal" class="modal fade">
			        <div class="modal-dialog">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                    <h4 class="modal-title">fonctionnement du Site</h4>
			                </div>
			                <div class="modal-body">
			                    <iframe id="cartoonVideo" width="560" height="315" src="//www.youtube.com/embed/YE7VzlLtp-4" frameborder="0" allowfullscreen></iframe>
			                </div>
			            </div>
			        </div>
			    </div>
			</div><br><br>
          <!-- ----------------------------------------------fin pour la vidéo------------------------------------------------------------ -->
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3">
          <div class="folio-item wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="300ms">
            <div class="folio-image">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/portfolio/1.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>ABC JEU</h3>
                    <p>Solo, Challenge</p>
                  </div>
                  <div class="folio-overview">
                    <!-- <span class="folio-link"><a class="folio-read-more" href="#" data-single_url="portfolio-single.html" ><i class="fa fa-link"></i></a></span> -->
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/abc-solo.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/abc-challenge.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/abc-solo-jeu.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInLeftBig" data-wow-duration="1000ms" data-wow-delay="400ms">
            <div class="folio-image">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/portfolio/2.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>PENDU DICO</h3>
                    <p>Solo, Challenge</p>
                  </div>
                  <div class="folio-overview">
                    <!-- <span class="folio-link"><a class="folio-read-more" href="#" data-single_url="portfolio-single.html" ><i class="fa fa-link"></i></a></span> -->
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/pendu-dico-solo.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/pendu-dico-challenge.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/pendu-solo-dico-details.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="500ms">
            <div class="folio-image">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/portfolio/3.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>PENDU SUJETS</h3>
                    <p>Solo, Challenge</p>
                  </div>
                  <div class="folio-overview">
                    <!-- <span class="folio-link"><a class="folio-read-more" href="#" data-single_url="portfolio-single.html" ><i class="fa fa-link"></i></a></span> -->
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/pendu-sujet-solo-jeu.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/pendu-sujets-solo.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/pendu-sujets-challenge-details.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInLeftBig" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="folio-image">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/portfolio/4.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>Le Site</h3>
                    <p>Autres Fonctionalités</p>
                  </div>
                  <div class="folio-overview">
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/user-home.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/mes-amis.PNG" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                    <span class="folio-link"><a class="folio-read-more" href="#" data-single_url="portfolio-single.html" id="dialog" ><i class="fa fa-link"></i></a></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <%-- <div class="col-sm-3">
          <div class="folio-item wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="700ms">
            <div class="folio-image">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/portfolio/5.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>Time Hours</h3>
                    <p>Design, Photography</p>
                  </div>
                  <div class="folio-overview">
                    <span class="folio-link"><a class="folio-read-more" href="#" data-single_url="portfolio-single.html" ><i class="fa fa-link"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/portfolio-details.jpg" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInLeftBig" data-wow-duration="1000ms" data-wow-delay="800ms">
            <div class="folio-image">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/portfolio/6.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>Time Hours</h3>
                    <p>Design, Photography</p>
                  </div>
                  <div class="folio-overview">
                    <span class="folio-link"><a class="folio-read-more" href="#" data-single_url="portfolio-single.html" ><i class="fa fa-link"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/portfolio-details.jpg" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInRightBig" data-wow-duration="1000ms" data-wow-delay="900ms">
            <div class="folio-image">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/portfolio/7.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>Time Hours</h3>
                    <p>Design, Photography</p>
                  </div>
                  <div class="folio-overview">
                    <span class="folio-link"><a class="folio-read-more" href="#" data-single_url="portfolio-single.html" ><i class="fa fa-link"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/portfolio-details.jpg" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-3">
          <div class="folio-item wow fadeInLeftBig" data-wow-duration="1000ms" data-wow-delay="1000ms">
            <div class="folio-image">
              <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/portfolio/8.jpg" alt="">
            </div>
            <div class="overlay">
              <div class="overlay-content">
                <div class="overlay-text">
                  <div class="folio-info">
                    <h3>Time Hours</h3>
                    <p>Design, Photography</p>
                  </div>
                  <div class="folio-overview">
                    <span class="folio-link"><a class="folio-read-more" href="#" data-single_url="portfolio-single.html" ><i class="fa fa-link"></i></a></span>
                    <span class="folio-expand"><a href="<%=request.getContextPath()%>/resources/images/portfolio/portfolio-details.jpg" data-lightbox="portfolio"><i class="fa fa-search-plus"></i></a></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div> --%>
      </div>
    </div>
    <div id="portfolio-single-wrap">
      <div id="portfolio-single">
      </div>
    </div><!-- /#portfolio-single-wrap -->
  </section><!--/#portfolio-->

  <%-- <section id="team">
    <div class="container">
      <div class="row">
        <div class="heading text-center col-sm-8 col-sm-offset-2 wow fadeInUp" data-wow-duration="1200ms" data-wow-delay="300ms">
          <h2>l'équipe</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam</p>
        </div>
      </div>
      <div class="team-members">
        <div class="row">
          <div class="col-sm-3">
            <div class="team-member wow flipInY" data-wow-duration="1000ms" data-wow-delay="300ms">
              <div class="member-image">
                <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/team/1.jpg" alt="">
              </div>
              <div class="member-info">
                <h3>Marian Dixon</h3>
                <h4>CEO &amp; Founder</h4>
                <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
              </div>
              <div class="social-icons">
                <ul>
                  <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                  <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                  <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                  <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                  <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member wow flipInY" data-wow-duration="1000ms" data-wow-delay="500ms">
              <div class="member-image">
                <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/team/2.jpg" alt="">
              </div>
              <div class="member-info">
                <h3>Lawrence Lane</h3>
                <h4>UI/UX Designer</h4>
                <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
              </div>
              <div class="social-icons">
                <ul>
                  <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                  <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                  <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                  <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                  <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member wow flipInY" data-wow-duration="1000ms" data-wow-delay="800ms">
              <div class="member-image">
                <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/team/3.jpg" alt="">
              </div>
              <div class="member-info">
                <h3>Lois Clark</h3>
                <h4>Developer</h4>
                <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
              </div>
              <div class="social-icons">
                <ul>
                  <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                  <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                  <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                  <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                  <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-3">
            <div class="team-member wow flipInY" data-wow-duration="1000ms" data-wow-delay="1100ms">
              <div class="member-image">
                <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/team/4.jpg" alt="">
              </div>
              <div class="member-info">
                <h3>Marian Dixon</h3>
                <h4>Support Manager</h4>
                <p>Consectetur adipisicing elit, sed do eiusmod tempor incididunt</p>
              </div>
              <div class="social-icons">
                <ul>
                  <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                  <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                  <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                  <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                  <li><a class="rss" href="#"><i class="fa fa-rss"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>            
    </div>
  </section> --%> <!--/#team-->

  <section id="contact">
    <div id="google-map" class="wow fadeIn" data-latitude="47.38094210000001" data-longitude="0.6992113000000018" data-wow-duration="1000ms" data-wow-delay="400ms"></div>
    <div id="contact-us" class="parallax">
      <div class="container">
        <div class="row">
          <div class="heading text-center col-sm-8 col-sm-offset-2 wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
            <h2>Contactez Nous</h2>
            <p>Pour toute questions ou information, merci de conctacter, nous allons tout faire pour vous repondre dans les plus brefs delais</p>
          </div>
        </div>
        <div class="contact-form wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
          <div class="row">
            <div class="col-sm-6">
              <form id="main-contact-form" name="contact-form" method="post" action="contactezNous">
                <div class="row  wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <input type="text" name="name" id="name" class="form-control" placeholder="Nom" required="required">
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-group">
                      <input type="email" name="Email" id="Email" class="form-control" placeholder="Email" required="required">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" name="subject" class="form-control" placeholder="Objet" required="required">
                </div>
                <div class="form-group">
                  <textarea name="message" id="message" class="form-control" rows="4" placeholder="Votre message" required="required"></textarea>
                </div>                        
                <div class="form-group">
                  <button type="submit" class="btn-submit">Envoyer</button>
                </div>
              </form>   
            </div>
            <div class="col-sm-6">
              <div class="contact-info wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
                <p>N'hésitez pas à nous conctacter pour nous donner vos impessions, suggestions, nous prendrons en compte vos recommandations pour une meilleure expérience.</p>
                <ul class="address">
                  <li><i class="fa fa-map-marker"></i> <span> Address:</span> 18 Avenue du Général de Gaulle</li>
                  <li><i class="fa fa-phone"></i> <span> Phone:</span> +33 652 48 95 95  </li>
                  <li><i class="fa fa-envelope"></i> <span> Email:</span><a href="mailto:info@tech-clever.com"> info@tech-clever.com</a></li>
                  <li><i class="fa fa-globe"></i> <span> Site-Web:</span> <a href="#">tech-clever.com</a></li>
                </ul>
              </div>                            
            </div>
          </div>
        </div>
      </div>
    </div>        
  </section><!--/#contact-->
  <footer id="footer">
    <div class="footer-top wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="300ms">
      <div class="container text-center">
        <div class="footer-logo">
          <a href="index"><img class="img-responsive" height="50px" width="100px" src="<%=request.getContextPath()%>/resources/images/logoDefi.PNG" alt="logo"></a>
        </div>
        <div class="social-icons">
          <ul>
            <!-- <li><a class="envelope" href="#"><i class="fa fa-envelope"></i></a></li>
            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li> 
            <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li> -->
            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
            <!-- <li><a class="tumblr" href="#"><i class="fa fa-tumblr-square"></i></a></li> -->
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <p>&copy; 2017 Défi</p>
          </div>
          <div class="col-sm-6">
            <p class="pull-right">Powered by <a href="tech-clever.com">tech-clever</a></p>
          </div>
        </div>
      </div>
    </div>
  </footer>
  
  <script type="text/javascript">
	$(document).ready(function () {
		var validator = $("#main-contact-form").bootstrapValidator({
			feedbackIcons: {
				valid: "glyphicon glyphicon-ok",
				invalid: "glyphicon glyphicon-remove", 
				validating: "glyphicon glyphicon-refresh"
			}, 
			fields : {
				Email :{
					message : "Une adresse email est nécessaire",
					validators : {
						notEmpty : {
							message : "SVP Entrez une adresse email"
						}, 
						stringLength: {
							min : 6, 
							max: 35,
							message: "Une addresse email doit avoir entre 6 et 35 caractères "
						},
						emailAddress: {
							message: "Elle doit etre valide, de type: abc@def.gh"
						}
					}
				}, 
				password : {
					validators: {
						notEmpty : {
							message : "un mot de passe est nécessaire"
						},
						stringLength : {
							min: 8,
							message: "un mot de passe doit avoir au moins 8 caractères"
						}, 
						different : {
							field : "email", 
							message: "l'adresse email et le mot de passe ne peuvent pas etre similaires"
						}
					}
				}, 
				confirmpassword : {
					validators: {
						notEmpty : {
							message: "Confirmation du mot de passe"
						}, 
						identical : {
							field: "password", 
							message : "les mots de passe doivent être les mêmes"
						}
					}
				}, 
				subject : {
					message : "Un nom est nécessaire",
					validators : {
						notEmpty :{
							message : "un prenom est nécessaire"
						},
						stringLength : {
							min : 3,
							message : "le prenom doit avoir au moins trois caractères"
						}
					}
				},
				name : {
					message : "Un Nom est nécessaire",
					validators : {
						notEmpty :{
							message : "un nom est nécessaire"
						},
						stringLength : {
							min : 3,
							message : "le nom doit avoir au moins trois caractères"
						}
					}
				}
			}
		});
		
	});
</script>

   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script> 
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.inview.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wow.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/mousescroll.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/smoothscroll.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.countTo.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/lightbox.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main.js"></script>
  <%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/html5shiv.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/respond.min.js"></script> --%> 
  <%-- <script src="<%=request.getContextPath()%>/resources/js/entete.js"></script> --%>
  
  <!-- BootstrapValidator -->
    <script src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js" type="text/javascript"></script>
  
</body>

</html>