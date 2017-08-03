package com.joue.avectesamis.controlleurs;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joue.avectesamis.entites.AbcChallenge;
import com.joue.avectesamis.entites.AbcSolo;
import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.Post;
import com.joue.avectesamis.entites.TypePost;
import com.joue.avectesamis.entites.jeux.APresident;
import com.joue.avectesamis.entites.jeux.Agglo;
import com.joue.avectesamis.entites.jeux.Animaux;
import com.joue.avectesamis.entites.jeux.Artistes;
import com.joue.avectesamis.entites.jeux.Nobels;
import com.joue.avectesamis.entites.jeux.Pays_Capitale;
import com.joue.avectesamis.entites.jeux.President;
import com.joue.avectesamis.entites.jeux.VilleFrance;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoChallenge;
import com.joue.avectesamis.metier.ChallengeMetier;
import com.joue.avectesamis.models.GameModel;
import com.joue.avectesamis.models.PenduModel;
import com.joue.avectesamis.models.SocialModel;
import com.joue.avectesamis.models.Word;



@Controller
public class ChallengeAbcController {

	@Autowired
	private ChallengeMetier metier;
	
	@RequestMapping(value="/indexjsp")
	public String index (){
		
		return "index";
	}
	
	@RequestMapping(value="abcChallengeHome")
	public String abcChallengeHome(Model model, GameModel gm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
		
		gm.setMesChallengesRecus(metier.mesChallengesRecus(id));
		gm.setMesChallengesEnvoyes(metier.mesChallengesEnvoyes(id));
		gm.setMesChallengesEnAttentes(metier.mesChallengesEnAttentes(id));
		List<AbcChallenge> mesChallengesJoues = new ArrayList<AbcChallenge>();
		mesChallengesJoues.addAll(metier.mesChallengesJoues(id));
		gm.setMesChallengesJoues(metier.mesChallengesJoues(id));
		model.addAttribute("gm", gm);
		return "abcChallengeHome";		
	}
//	Methode qui permet de mixer deux ArrayList
	public List<AbcChallenge> mixageList(List<AbcChallenge> a, List<AbcChallenge>b ){
		List<AbcChallenge> resultat = new ArrayList<AbcChallenge>();
		int size = Math.max(a.size(), b.size());
		
		for (int i = 0; i < size; i++) {
	        if (i < a.size()) resultat.add(a.get(i));
	        if (i < b.size()) resultat.add(b.get(i));
	    }	
		return resultat;
		
	}
	@RequestMapping(value="accepteChallenge")
	public String accepteChallenge(Model model, GameModel gm, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		
//		recup�raiton de l'ami
		Long idAmi= (long) Integer.parseInt(request.getParameter("idAmi"));
		
		metier.accepterChallenge(id, idAmi);
		
		gm.setMesChallengesRecus(metier.mesChallengesRecus(id));
		gm.setMesChallengesEnvoyes(metier.mesChallengesEnvoyes(id));
		gm.setMesChallengesEnAttentes(metier.mesChallengesEnAttentes(id));		
		
		model.addAttribute("gm", gm);
		
		return "abcChallengeHome";
		
	}
		
	@RequestMapping(value="AbcChallengeJeu")
	public String AbcChallengeJeu(Model model, GameModel gm, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
//		le temps en fonction du nombre de resultats possibles
		int temps =0;
		
//		recup�raiton de l'ami
		Long idAmi= (long) Integer.parseInt(request.getParameter("idAmi"));
		session.setAttribute("idAmi", idAmi);
		Friend ami= metier.getFriend(idAmi);
		
//		moi
		Friend moi = metier.getFriend(id);
		
		Random r = new Random();
		char lettre = 'x';
//		le code du jeu chez moi
		String codeAttenteMoi= metier.getCodeAttenteMoiAmi(id, idAmi);
//		le code chez mon ami s'il n'a pas encore jou�
		String codeAttenteAmi=metier.getCodeAttenteAmiMoi(id, idAmi);
//		le code chez mon ami s'il a d�j� jou�
		String codeJoueAmi = metier.getCodeJoueAmiMoi(id, idAmi);
		
//			- si mon code en attente correspond � celui de mon ami en attente (c'est qu'il na pas encore jou�, alors il faut g�n�rer une lettre random que lui aussi doit
//		utiliser apr�s quand il jouera car nous tous devons utiliser la m�me lettre pour jouer
//		sinon �a veut dire qu'il a d�j� jou�, alors il faut r�cup�rer la lettre avec laquelle il a jou�
		
		if(codeAttenteMoi.equals(codeAttenteAmi)){
			lettre = (char) (r.nextInt(26)+'a');
			System.out.println("il n'a pas encore joue");
			System.out.println("la lettre tiree au sort est: "+lettre);
		}else{
			System.out.println("oui, il l'a deja fait");
			for(AbcChallenge c:ami.getMesChallengesJoues()){
				if(c.getCodeIndentification().equals(codeAttenteMoi))
					lettre = c.getLettre();
			}
		}
				
		// liste des checksboxs coch�s pour les intitul�s
				List<String> checkList = new ArrayList<String>();
				
				// listes pour les diff�rents checkboxs pour la contruction des tableaux
				// on les remplit pour savoir combien de lignes il faut pr�voir
				List<Pays_Capitale>listPays = new ArrayList<Pays_Capitale>();
				List<Pays_Capitale>listeCapitales = new ArrayList<Pays_Capitale>();
				List<VilleFrance>listeVillesFrance = new ArrayList<VilleFrance>();
				List<President>listePresidentsA = new ArrayList<President>();
				List<APresident>listeAPresidents = new ArrayList<APresident>();
				List<Animaux>listeAnimaux = new ArrayList<Animaux>();
				List<Agglo>listeAglo = new ArrayList<Agglo>();
				List<Artistes>listeChanteurs = new ArrayList<Artistes>();
				List<Nobels>listeNobels = new ArrayList<Nobels>();
				
//				la lettre a joue avec en majuscule pour l'affichage a la vue
				String lettreString = String.valueOf(lettre);
				String lettreMajuscule = lettreString.toUpperCase();
				session.setAttribute("lettreMajuscule", lettreMajuscule);
				
//				recup�ration dans la base de donn�es des informations concernant les intitul�s en fonction de la lettre avec laquelles on va jouer
					listPays.addAll(metier.getPays(lettre));
					checkList.add("pays");
					
					listePresidentsA.addAll(metier.getPresidents(lettre));
					checkList.add("presidents");
					
					listeAPresidents.addAll(metier.getAPresidents(lettre));
					checkList.add("ancienPresidents");
	
					listeNobels.addAll(metier.getNobels(lettre));
					checkList.add("nobels");
					
					listeAglo.addAll(metier.getAgglos(lettre));
					checkList.add("aglomerations");
				
					listeChanteurs.addAll(metier.getArtistes(lettre));
					checkList.add("chanteurs");
					
//					pour les premières lettres des nobels en cas de demande d'aide
					List<String> lettresArtistes = new ArrayList<String>();
					for (Artistes astiste : listeChanteurs) {
						lettresArtistes.add(astiste.getNom().substring(0, 3));
					}
					
					model.addAttribute("lettresArtistes", lettresArtistes);
					
				
					listeAnimaux.addAll(metier.getAnimaux(lettre));
					checkList.add("animaux");
					
					
					// �������������������������������������������������������������������������������������
					int taillePays = listPays.size();
					int tailleCapitale = listeCapitales.size();
					int tailleVilles= listeVillesFrance.size();
					int tailleNobel = listeNobels.size();
					int tailleAnimaux = listeAnimaux.size();
					int taillePresidents = listePresidentsA.size();
					int tailleAPresidents = listeAPresidents.size();
					int tailleAgglo = listeAglo.size();
					int tailleChanteurs = listeChanteurs.size();
					temps = taillePays+tailleCapitale+tailleVilles+tailleNobel+tailleAnimaux+taillePresidents+tailleAPresidents+tailleAgglo+tailleChanteurs;
					
					
					session.setAttribute("listPays", listPays);
					session.setAttribute("listeCapitales", listeCapitales);
					session.setAttribute("listeVillesFrance", listeVillesFrance);
					session.setAttribute("listeNobels", listeNobels);
					session.setAttribute("listeAnimaux", listeAnimaux);
					session.setAttribute("listePresidentsA", listePresidentsA);
					session.setAttribute("listeAPresidents", listeAPresidents);
					session.setAttribute("listeAglo", listeAglo);
					session.setAttribute("listeChanteurs", listeChanteurs);
					request.setAttribute("temps", temps);
					session.setAttribute("lettre", lettre);
					session.setAttribute("checkList", checkList);
					
					model.addAttribute("listPays", listPays);
					model.addAttribute("listeCapitales", listeCapitales);
					model.addAttribute("listeVillesFrance", listeVillesFrance);
					model.addAttribute("listeNobels", listeNobels);
					model.addAttribute("listeAnimaux", listeAnimaux);
					model.addAttribute("listePresidentsA", listePresidentsA);
					model.addAttribute("listeAPresidents", listeAPresidents);
					model.addAttribute("listeAglo", listeAglo);
					model.addAttribute("listeChanteurs", listeChanteurs);
					model.addAttribute("taillePays", taillePays);
					model.addAttribute("gm", gm);
				
		
		return "AbcChallengeJeu";
		
	}
	
	@RequestMapping(value="abcChallengeCorrection")
	public String abcChallengeCorrection(Model model, GameModel gm, HttpServletRequest request){
		
		gm = new GameModel();
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);	
		
		// recup�ration des objets en session
		String email = (String) session.getAttribute("email");
		char lettre =  (Character) session.getAttribute("lettre");
		int time =0; // le temps qu'a dur� le jeux
		String help = "no"; // si l'utlisateur a demand� de l'aide
		int score = 0;
		DateFormat df = new SimpleDateFormat("dd/MM/yy");
		Date now = new Date();
		String dateString = df.format(now);
		/*
		 * POUR LE PAYS =====================================================================================================================================
		 */
		// liste de tous les pays concern�s 
		List<String> listePays = (List<String>) session.getAttribute("listPays");
		// liste des choix faits par l'utilisateur 
		Set <String> choixPays = new HashSet<String>();
		// liste des pays restants (s'il en reste)
		List<String> paysRestants = new ArrayList<String>();
		// recup�ration des contenus dans les input
		String [] reponses = null;
		if(request.getParameterValues("pays")!=null){
			reponses = request.getParameterValues("pays");
			for(String s: reponses){
				if(!s.equals("pays")) choixPays.add(s);
			}
		}
		// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
		// donc il gagne des points
		if(choixPays.containsAll(listePays)){
			score = score +listePays.size();
		}else {
			if (choixPays!=null) {
				score = score + choixPays.size();
			}
		}
		paysRestants.addAll(listePays);		
		paysRestants.removeAll(choixPays);
		 
		 /*
			 * POUR LES CAPITALES =====================================================================================================================================
			 */
		// liste de tous les pays concern�s 
			List<String> listeCapitales = (List<String>) session.getAttribute("listeCapitales");
			// liste des choix faits par l'utilisateur 
			Set <String> choixCapitales = new HashSet<String>();
			// liste des pays restants (s'il en reste)
			List<String> capitalesRestantes = new ArrayList<String>();
		 if(request.getParameter("capitale")!=null){
				
				
				String [] reponsesCapitales = request.getParameterValues("capitale");
				for(String s: reponsesCapitales){
					if(!s.equals("capitale")) choixCapitales.add(s);
				}
				// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
				// donc il gagne des points
				if(choixCapitales.containsAll(listeCapitales)){
					score = score +listeCapitales.size();
				}else {
					if (choixCapitales!=null) {
						score = score+choixCapitales.size();
					}
				}
				capitalesRestantes.addAll(listeCapitales);		
				capitalesRestantes.removeAll(choixCapitales);							 
			 }
			 
			 /*
				 * POUR LES VILLES DE FRANCE =====================================================================================================================================
				 */
		// liste de tous les pays concern�s 
			List<String> listeVillesFrance = (List<String>) session.getAttribute("listeVillesFrance");
			// liste des choix faits par l'utilisateur 
			Set <String> choixVilles = new HashSet<String>();
			// liste des pays restants (s'il en reste)
			List<String> villesRestantes = new ArrayList<String>();
			 if(request.getParameter("ville")!=null){				
				String [] reponsesVilles = request.getParameterValues("ville");
				for(String s: reponsesVilles){
					if(!s.equals("ville")) choixVilles.add(s);
				}
				// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
				// donc il gagne des points
				if(choixVilles.containsAll(listeVillesFrance)){
					score = score +listeVillesFrance.size();
				}else {
					if (choixVilles!=null) {
						score= score+choixVilles.size();
					}
				}
				villesRestantes.addAll(listeVillesFrance);		
				villesRestantes.removeAll(choixVilles);				
				 }
				 
				 /*
					 * POUR LES PRIX NOBELS =====================================================================================================================================
					 */
			// liste de tous les pays concern�s 
				List<String> listeNobels = (List<String>) session.getAttribute("listeNobels");
				// liste des choix faits par l'utilisateur 
				Set <String> choixNobels= new HashSet<String>();
				// liste des pays restants (s'il en reste)
				List<String> nobelsRestants = new ArrayList<String>();
				 if(request.getParameter("nobel")!=null){
					
					
					String [] reponsesNobels = request.getParameterValues("nobel");
					for(String s: reponsesNobels){
						if(!s.equals("nobel")) choixNobels.add(s);
					}
					// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
					// donc il gagne des points
					if(choixNobels.containsAll(listeNobels)){
						score = score +listeNobels.size();
					}else {
						if (choixNobels!=null) {
							score = score+choixNobels.size();
						}
					}
					nobelsRestants.addAll(listeNobels);		
					nobelsRestants.removeAll(choixNobels);
									 
					 }
				 
				 /*
					 * POUR LES ANIMAUX =====================================================================================================================================
					 */
				// liste de tous les pays concern�s 
					List<String> listeAnimaux = (List<String>) session.getAttribute("listeAnimaux");
					// liste des choix faits par l'utilisateur 
					Set <String> choixAnimaux = new HashSet<String>();
					// liste des pays restants (s'il en reste)
					List<String> animauxRestants = new ArrayList<String>();
				 if(request.getParameter("animaux")!=null){
						
						String [] reponsesAnimaux = request.getParameterValues("animaux");
						for(String s: reponsesAnimaux){
							if(!s.equals("animaux")) choixAnimaux.add(s);
						}
						// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
						// donc il gagne des points
						if(choixAnimaux.containsAll(listeAnimaux)){
							score = score +listeAnimaux.size();
						}else {
							if (choixAnimaux!=null) {
								score = score+choixAnimaux.size();
							}
						}
						animauxRestants.addAll(listeAnimaux);		
						animauxRestants.removeAll(choixAnimaux);						 
					 }
				 /*
					 * POUR LES PRESIDENTS =====================================================================================================================================
					 */
				// liste de tous les pays concern�s 
					List<String> listePresidentsA = (List<String>) session.getAttribute("listePresidentsA");
					// liste des choix faits par l'utilisateur 
					Set <String> choixPresidents = new HashSet<String>();
					// liste des pays restants (s'il en reste)
					List<String> presidentsRestants = new ArrayList<String>();

				 if(request.getParameter("president")!=null){
												
						String [] reponsesPresidents = request.getParameterValues("president");
						for(String s: reponsesPresidents){
							if(!s.equals("president")) choixPresidents.add(s);
						}
						// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
						// donc il gagne des points
						if(choixPresidents.containsAll(listePresidentsA)){
							score = score +listePresidentsA.size();
						}else {
							if (choixPresidents!=null) {
								score=score+choixPresidents.size();
							}
						}
						presidentsRestants.addAll(listePresidentsA);		
						presidentsRestants.removeAll(choixPresidents);						 
					 }
				 
				 /*
					 * POUR LES ANCIENS PRESIDENTS =====================================================================================================================================
					 */
					List<String> listeAPresidents = (List<String>) session.getAttribute("listeAPresidents");
					// liste des choix faits par l'utilisateur 
					Set <String> choixAPresidents = new HashSet<String>();
					// liste des pays restants (s'il en reste)
					List<String> ApresidentsRestants = new ArrayList<String>();
				 if(request.getParameter("ancienP")!=null){
						
						
						String [] reponsesAPresidents = request.getParameterValues("ancienP");
						for(String s: reponsesAPresidents){
							if(!s.equals("ancienP")) choixAPresidents.add(s);
						}
						// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
						// donc il gagne des points
						if(choixAPresidents.containsAll(listeAPresidents)){
							score = score +listeAPresidents.size();
						}else {
							if (choixAPresidents!=null) {
								score = score+choixAPresidents.size();
							}
						}
						ApresidentsRestants.addAll(listeAPresidents);		
						ApresidentsRestants.removeAll(choixAPresidents);						 
					 }
				 /*
					 * POUR LES AGGOLOMERATIONS =====================================================================================================================================
					 */
				// liste de tous les pays concern�s 
					List<String> listeAglo = (List<String>) session.getAttribute("listeAglo");
					// liste des choix faits par l'utilisateur 
					Set <String> choixAgglo = new HashSet<String>();
					// liste des pays restants (s'il en reste)
					List<String> AggloRestantes = new ArrayList<String>();

					if(request.getParameter("agglo")!=null){
												
						String [] reponsesAgglo = request.getParameterValues("agglo");
						for(String s: reponsesAgglo){
							if(!s.equals("agglo")) choixAgglo.add(s);
						}
						// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
						// donc il gagne des points
						if(choixAgglo.containsAll(listeAglo)){
							score = score + listeAglo.size();
						}else {
							if (choixAgglo!=null) {
								score = score + choixAgglo.size();
							}
						}
						AggloRestantes.addAll(listeAglo);		
						AggloRestantes.removeAll(choixAgglo);						 
					 }
				 /*
					 * POUR LES ARSTISTES CHANTEURS =====================================================================================================================================
					 */
				// liste de tous les pays concern�s 
					List<String> listeChanteurs = (List<String>) session.getAttribute("listeChanteurs");
					// liste des choix faits par l'utilisateur 
					Set <String> choixArtistes = new HashSet<String>();
					// liste des pays restants (s'il en reste)
					List<String> ArtistesRestants = new ArrayList<String>();
					if(request.getParameter("artiste")!=null){						
						String [] reponsesArtistes= request.getParameterValues("artiste");
						for(String s: reponsesArtistes){
							if(!s.equals("artiste")) choixArtistes.add(s);
						}
						// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
						// donc il gagne des points
						if(choixArtistes.containsAll(listeChanteurs)){
							score = score +listeChanteurs.size();
						}else {
							if (choixArtistes!=null) {
								score = score + choixArtistes.size();
							}
						}
						ArtistesRestants.addAll(listeChanteurs);		
						ArtistesRestants.removeAll(choixArtistes);					
					 }
//			recupération des inputs hidden pour le tempsRestant et la valeur de l'aide sur le jeu	 			
			String tempsRestant = request.getParameter("tempsRestant");
			String demandeAide = request.getParameter("valeuraidepays");
			boolean aide = false;
			if (demandeAide.equals("oui")) {
				aide = true;
			} 
			int scoreMax = listeAglo.size()+listeAnimaux.size()+listeAPresidents.size()+listeCapitales.size()+listeChanteurs.size()+
					listeNobels.size()+listePays.size()+listePresidentsA.size()+listePresidentsA.size();
			
//			creation de l'objet jeu qui sera enregistré
			AbcChallenge challenge = new AbcChallenge(score, new Date(), lettre, scoreMax, choixAgglo, choixAPresidents, choixPresidents, choixAnimaux, choixArtistes, choixCapitales, choixPays, choixNobels, choixVilles, dateString, aide, tempsRestant);
			
//			recuperation de l'id de l'utilisateur puis enregistrement dans la BDD
			Long idAmi=(Long) session.getAttribute("idAmi");
			metier.saveChallenge(id, idAmi, challenge);
						
			model.addAttribute("moi", moi);
			
			model.addAttribute("listePays", listePays);
			model.addAttribute("paysRestants", paysRestants);
			model.addAttribute("paysTest", choixPays);
			 
			model.addAttribute("listeCapitales", listeCapitales);
			model.addAttribute("capitalesRestantes", capitalesRestantes);
			model.addAttribute("choixCapitales", choixCapitales);
			 
			model.addAttribute("listeVillesFrance", listeVillesFrance);
			model.addAttribute("villesRestantes", villesRestantes);
			model.addAttribute("choixVilles", choixVilles);
			 
			model.addAttribute("listeAglo", listeAglo); 
			model.addAttribute("AggloRestantes", AggloRestantes);
			model.addAttribute("choixAgglo", choixAgglo);
			 
			model.addAttribute("listeAnimaux", listeAnimaux);
			model.addAttribute("animauxRestants", animauxRestants);
			model.addAttribute("choixAnimaux", choixAnimaux);
			 
			model.addAttribute("listeAPresidents", listeAPresidents);
			model.addAttribute("ApresidentsRestants", ApresidentsRestants);
			model.addAttribute("choixAPresidents", choixAPresidents);
			 
			model.addAttribute("listeChanteurs", listeChanteurs);
			model.addAttribute("ArtistesRestants", ArtistesRestants);
			model.addAttribute("choixArtistes", choixArtistes);
			 
			model.addAttribute("listeNobels", listeNobels);
			model.addAttribute("nobelsRestants", nobelsRestants);
			model.addAttribute("choixNobels", choixNobels);
			 
			model.addAttribute("listePresidentsA", listePresidentsA);
			model.addAttribute("presidentsRestants", presidentsRestants);
			model.addAttribute("choixPresidents", choixPresidents);
		
			model.addAttribute("gm", gm);
			model.addAttribute("sm", gm);

		return "abcChallengeCorrection";
		
	}
	@RequestMapping(value="infoJeuChallenge")
	public String infoJeuChallenge(Model model, GameModel gm, HttpServletRequest request){
		HttpSession session = request.getSession();
		List<AbcChallenge> mixChallenge = (List<AbcChallenge>) session.getAttribute("mixChallenge");
		
		model.addAttribute("mixChallenge", mixChallenge);
		model.addAttribute("gm", gm);
		return "infoJeuChallenge";
		
	}
	@RequestMapping(value="infoJeuChallengeDuel")
	public String infoJeuChallengeDuel(Model model, GameModel gm, HttpServletRequest request){
		
		
		model.addAttribute("gm", gm);
		return "infoJeuChallengeDuel";
	}
	@RequestMapping(value="accepterEtInfosChallengesRecus")
	public String accepterEtInfosChallengeSujetsRecus (Model model, GameModel gm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		Long idAmi= (long) Integer.parseInt(req.getParameter("idAmi"));
		String action = req.getParameter("action");
		
		switch (action) {
		case "accepter":
			metier.accepterChallenge(id, idAmi);
			break;
		case "refuser":
			metier.refuserChallenge(id, idAmi);
			break;
		case "allerAuDuel":
			break;
		case "annulerEnvoi":
			metier.annulerEnvoiChallenge(id, idAmi);
			break;

		default:
			 throw new IllegalArgumentException("aucune action n'est défini ");
//			break;
		}
		
		gm.setMesChallengesRecus(metier.mesChallengesRecus(id));
		gm.setMesChallengesEnvoyes(metier.mesChallengesEnvoyes(id));
		gm.setMesChallengesEnAttentes(metier.mesChallengesEnAttentes(id));
		model.addAttribute("penduModel", gm);	
	 
		return "infosActionPenduDicoChallenge";
	}
	@RequestMapping(value="envoyerChallengeAbc")
	public String envoyerChallengeAbc(HttpServletRequest req, Model model, SocialModel sm){
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		Long idAmi= (long) Integer.parseInt(req.getParameter("idAmi"));
		
		metier.envoyerChallenge(id, idAmi);

	return "resultatPendu";
		
	}
	@RequestMapping(value="infosDetailsChallenge")
	public String infosDetailsChallenge (Model model, GameModel gm, HttpServletRequest req, Word word){
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);	
		
		gm.setMesChallengesRecus(metier.mesChallengesRecus(id));
		gm.setMesChallengesEnvoyes(metier.mesChallengesEnvoyes(id));
		gm.setMesChallengesEnAttentes(metier.mesChallengesEnAttentes(id));
		List<AbcChallenge> mesChallengesJoues = new ArrayList<AbcChallenge>();
		mesChallengesJoues.addAll(metier.mesChallengesJoues(id));
		gm.setMesChallengesJoues(metier.mesChallengesJoues(id));
		model.addAttribute("gm", gm);

		return "infosDetailsChallenge";
		
	}
	@RequestMapping(value="infosDetailChallengeId")
	public String infosDetailChallengeId(Model model, GameModel gm, HttpServletRequest req){
		Long id = Long.valueOf(req.getParameter("idChallenge"));
		AbcChallenge challenge = metier.getAbcChallengeById(id);
		
		
		model.addAttribute("gm", gm);
		model.addAttribute("challenge", challenge);
		return "infosDetailChallengeId";
	}
	@RequestMapping(value="infoPublicationSoloAbcChallenge")
	public String infoPublicationSoloAbcChallenge(Model model, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long idJeu = Long.valueOf(req.getParameter("idJeu"));
		Long id = (Long) session.getAttribute("id");
		AbcChallenge challenge = new AbcChallenge();
		challenge = metier.getMonChallenge(id, idJeu);
				
//		si le jeu n'avait été publié au par avant 
		if(!challenge.isPublie()){
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			Date now = new Date();
			String dateString = df.format(now);
			String message = "le "+dateString+", j'ai joué à un ABC-CHALLENGE contre "+challenge.getMonFriend().getNom()+" "
					+ ""+challenge.getMonFriend().getPrenom()+"\n"+", les ressultats de ce duel sont: "+"\n"+""
							+ "SCORE => MOI: "+challenge.getScore()+" LUI: "+challenge.getScoreAmi()+"\n"+""
									+ "LA LETTRE: "+challenge.getLettre()+"\n"
											+ "TEMPS RESTANT => MOI "+challenge.getTempsRestant()+", LUI: "+challenge.getTempsRestantAmi();
			System.out.println(message);
			Post post = new Post(new Date(), message, true, TypePost.ABCCHALLENGE);
//			ajout des information du challenge dans le poste pour faciliter l'affichage
			post.setScoreMax(challenge.getScoreMax());
			post.setScoreMoi(challenge.getScore());
			post.setScoreAmi(challenge.getScoreAmi());
			post.setAideMoi(challenge.isAide());
			post.setAideAmi(challenge.isAideAmi());
			post.setTempsResantMoi(challenge.getTempsRestant());
			post.setTempsRestantAmi(challenge.getTempsRestantAmi());
			Friend moi = metier.getFriend(id);
			Friend ami = challenge.getMonFriend();
			post.setMoi(moi);
			post.setAmi(ami);
			
			challenge.setPublie(true);
			metier.publierChallenge(challenge);
			metier.posterPost(id, message, post);
		}
		return "infoPublicationSoloAbcChallenge";
		
	}
	@RequestMapping(value="notificationsAbc")
	public String notificationsAbc(Model model, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		List<Friend> challengesEnAttentes = metier.mesChallengesEnAttentes(id);
		List<Friend> mesChallengesRecus = metier.mesChallengesRecus(id);
		
		int nbNotificationsDico = challengesEnAttentes.size()+mesChallengesRecus.size();
		model.addAttribute("nbNotificationsAbc", nbNotificationsDico);
		
		model.addAttribute("challengesEnAttentes", challengesEnAttentes);
		model.addAttribute("mesChallengesRecus", mesChallengesRecus);
		return "notificationsAbc";
	}
	
}
