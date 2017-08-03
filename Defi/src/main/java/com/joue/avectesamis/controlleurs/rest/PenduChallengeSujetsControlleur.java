package com.joue.avectesamis.controlleurs.rest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.joue.avectesamis.dao.PenduDao;
import com.joue.avectesamis.entites.AbcChallenge;
import com.joue.avectesamis.entites.AbcSolo;
import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.Post;
import com.joue.avectesamis.entites.TypePost;
import com.joue.avectesamis.entites.jeux.Artistes;
import com.joue.avectesamis.entites.jeux.Nobels;
import com.joue.avectesamis.entites.jeux.Pays_Capitale;
import com.joue.avectesamis.entites.jeux.President;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsSolo;
import com.joue.avectesamis.metier.ChallengeMetier;
import com.joue.avectesamis.models.PenduModel;
import com.joue.avectesamis.models.Word;

@Controller
public class PenduChallengeSujetsControlleur {
	
	@Autowired
	private PenduDao penduDao;
	@Autowired
	private ChallengeMetier metier;
		
	@RequestMapping(value="penduChallengeSujets", method=RequestMethod.GET)
	public String penduChallengeSujets(Model model, HttpServletRequest req, PenduModel penduModel, Word word ){
		word.initWord(req);
		
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
		penduModel.setMesChallengesSujetsRecus(penduDao.mesChallengesSujetsRecus(id));
		penduModel.setMesChallengesSujetsJoues(penduDao.mesSujetsChallenges(id));
		penduModel.setMesChallengesSujetsEnvoyes(penduDao.mesChallengesSujetsEnvoyes(id));
		penduModel.setMesChallengesSujetsEnAttentes(penduDao.mesChallengesSujetsAttentes(id));
		List<PenduSujetsChallenge> mesChallengesJoues = penduDao.mesSujetsChallenges(id);		
			for (PenduSujetsChallenge challenge : penduModel.getMesChallengesSujetsJoues()) {
				System.out.println("l'artiste du challenge est "+challenge.getArtiste());
			}
			model.addAttribute("moi", moi);
		    model.addAttribute("penduModel", penduModel);
		    
		    return "penduChallengeSujets";
	}
//	Methode qui permet de mixer deux ArrayList
	public List<PenduSujetsChallenge> mixageList(List<PenduSujetsChallenge> mesChallengesJoues, List<PenduSujetsChallenge> challengeAmisOrdreCoupe ){
		List<PenduSujetsChallenge> resultat = new ArrayList<PenduSujetsChallenge>();
		int size = Math.max(mesChallengesJoues.size(), challengeAmisOrdreCoupe.size());
		
		for (int i = 0; i < size; i++) {
	        if (i < mesChallengesJoues.size()) resultat.add(mesChallengesJoues.get(i));
	        if (i < challengeAmisOrdreCoupe.size()) resultat.add(challengeAmisOrdreCoupe.get(i));
	    }
		
		return resultat;
	}
	
	@RequestMapping(value="accepterPenduSujetChallenge", method=RequestMethod.GET)
	public String accepterPenduSujetChallenge(Model model, PenduModel penduModel, HttpServletRequest request){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		
//		recup�raiton de l'ami
		Long idAmi= (long) Integer.parseInt(request.getParameter("idAmi"));
//		metier.accepterChallenge(id, idAmi);
		penduDao.acceptChallengeSujets(id, idAmi);
		

		penduModel.setMesChallengesSujetsJoues(penduDao.mesSujetsChallenges(id));
		penduModel.setMesChallengesSujetsEnvoyes(penduDao.mesChallengesSujetsEnvoyes(id));
		penduModel.setMesChallengesDicoEnAttentes(penduDao.mesChallengesDicoAttentes(id));
		penduModel.setMesChallengesSujetsEnAttentes(penduDao.mesChallengesSujetsAttentes(id));
				
		model.addAttribute("penduModel", penduModel);
		map.put("penduModel", penduModel);
		
		return "accepterSujetChallenge";
		
	}
	@RequestMapping(value="penduChallengeSujetsJeu", method=RequestMethod.GET)
	public String penduChallengeSujetsJeu(Model model, PenduModel penduModel, HttpServletRequest request){				
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("id");
//		le temps en fonction du nombre de r�sultats possibles 
		int temps =0;
		
//		recup�raiton de l'ami
		Long idAmi= (long) Integer.parseInt(request.getParameter("idAmi"));
		session.setAttribute("idAmi", idAmi);
		Friend ami= metier.getFriend(idAmi);
		
//		moi
		Friend moi = metier.getFriend(id);
		
//		le mot dans le DICO ou celui avec lequel il a joué (dans le cas ou il a joué avant moi)
		String mot = "";
		
//		le code du jeu chez moi
		String codeAttenteMoiSujets= penduDao.getCodeAttenteMoiAmiSujets(id, idAmi);
		System.out.println("le code en attente chez moi "+codeAttenteMoiSujets);
//		le code chez mon ami s'il n'a pas encore jou�
		String codeAttenteAmiSujets=penduDao.getCodeAttenteAmiMoiSujets(id, idAmi);
		System.out.println("le code en attente chez mon ami "+codeAttenteAmiSujets);
//		le code chez mon ami s'il a d�j� jou�
		String codeJoueAmiSujets = penduDao.getCodeJoueAmiMoiSujets(id, idAmi);
						
//		si mon code en attente est egale au code en attete de l'ami, ça veut dire qu'il n'a pas encore joué, alors
//		il faut tirer un mot dans le dico, sinon recuperer le mot avec lequel il a joue
	
		if (codeAttenteMoiSujets!=null || codeAttenteAmiSujets!=null ) {
			if(codeAttenteMoiSujets.equals(codeAttenteAmiSujets)){
				System.out.println("il n'a pas encore joué .....");				
				chargementDesSujets(model, request);
							
						}else{
//							ajout d'un objet en session qui permettra de savoir lors de la correction si je suis le premier ou second à jouer
							session.setAttribute("second", "second");
//							parcourt des challenges joués chez l'ami, si on trouve un code d'identification équivalent à mon code d'identification en 
//							attente, alors on doit recuper les informations du jeu de mon ami qui serviront de critère pour mon jeu
							for(PenduSujetsChallenge c:ami.getMesChallengesJouesPenduSujets()){
								if(c.getCodeIndentification().equals(codeAttenteMoiSujets)){
									
//									recupéretion dans le jeux de mon ami car moi aussi je dois jouer avec les memes lettres et mots
									
//									LES PAYS
									String motPays = c.getPays();
									char lettrePays = Character.toUpperCase(c.getLettrePays());
									
									int longueurMotPays =0;
									String motCachePays="";
									String motCacheDepartPays="";
									if (motPays!=null) {
										for (int i = 0; i < motPays.length(); i++) {
											motCachePays = new String(
													motCachePays + "*");
											if (motPays.charAt(i) == lettrePays) {
												motCacheDepartPays = new String(
														motCacheDepartPays
																+ lettrePays);
											} else {
												motCacheDepartPays = new String(
														motCacheDepartPays
																+ "*");
											}
										}
										longueurMotPays = motPays.length();
									}
									
									System.out.println("le pays choisit est : "+motPays);
									String idBouton = String.valueOf(lettrePays);
									String lettreStringPays = String.valueOf(lettrePays);
									
									session.setAttribute("lettreStringPays", lettreStringPays);
									session.setAttribute("motPays", motPays);
									session.setAttribute("pointsMaxPays", c.getScoreMaxPays());
									
									model.addAttribute("motCacheDepartPays", motCacheDepartPays);
									model.addAttribute("motCachePays", motCachePays);
									model.addAttribute("motPays", motPays);
									model.addAttribute("lettrePays", lettrePays);
									model.addAttribute("idBoutonPays", idBouton+"Pays");
									model.addAttribute("longueurMotPays", longueurMotPays);
									
									
//									LES CAPITALES 
									String motCapitales = c.getCapitale();
									char lettreCapitales = Character.toUpperCase(c.getLettreCapitale());
									
									int longueurMotCapitales =0;
									String motCacheCapitales="";
									String motCacheDepartCapitales="";
									for (int i = 0; i < motCapitales.length(); i++) {
										motCacheCapitales = new String(motCacheCapitales+"*");
										if (motCapitales.charAt(i)==lettreCapitales) {
											motCacheDepartCapitales = new String(motCacheDepartCapitales+lettreCapitales);
										} else {
											motCacheDepartCapitales = new String(motCacheDepartCapitales+"*");
										}
										longueurMotCapitales = motCapitales.length();
									}
									
									System.out.println("la capitale choisie est: "+motCapitales);
									String idBoutonCaptiale = String.valueOf(lettreCapitales);
									String lettreStringCapitale = String.valueOf(lettrePays);
									
									session.setAttribute("lettreStringCapitales", lettreStringCapitale);
									session.setAttribute("motCapitales", motCapitales);
									session.setAttribute("pointsMaxCapitales", c.getScoreMaxCapitale());
									
									
									model.addAttribute("motCacheDepartCapitales", motCacheDepartCapitales);
									model.addAttribute("motCacheCapitales", motCacheCapitales);
									model.addAttribute("motCapitales", motCapitales);
									model.addAttribute("lettreCapitales", lettreCapitales);
									model.addAttribute("longueurMotCapitales", longueurMotCapitales);
									model.addAttribute("idBoutonCaptiales", idBoutonCaptiale+"Capitales");
									
									
//									LES NOBELS
									String motNobels = c.getNobel();
									char lettreNobels = Character.toUpperCase(c.getLettreNoble());
									
									int longueurMotNobels =0;
									String motCacheNobels="";
									String motCacheDepartNobels ="";
									if (motNobels!=null) {
										for (int i = 0; i < motNobels.length(); i++) {
											motCacheNobels = new String(
													motCacheNobels + "*");
											if (motNobels.charAt(i) == lettreNobels) {
												motCacheDepartNobels = new String(
														motCacheDepartNobels
																+ lettreNobels);
											} else {
												motCacheDepartNobels = new String(
														motCacheDepartNobels
																+ "*");
											}
										}
										longueurMotNobels = motNobels.length();
									}
									
									System.out.println("la Nobel choisie est: "+motNobels);
									String idBoutonNobels = String.valueOf(lettreNobels);
									String lettreStringNobels = String.valueOf(lettreNobels);
									
									session.setAttribute("lettreStringNobels", lettreStringNobels);
									session.setAttribute("motNobels", motNobels);
									
									model.addAttribute("motCacheDepartNobels", motCacheDepartNobels);
									model.addAttribute("motCacheNobels", motCacheNobels);
									model.addAttribute("motNobels", motNobels);
									model.addAttribute("lettreNobels", lettreNobels);
									model.addAttribute("longueurMotNobels", longueurMotNobels);
									model.addAttribute("idBoutonNobels", idBoutonNobels+"Nobels");
									session.setAttribute("pointsMaxNobels", c.getScoreMaxNobel());
									
									
//									LES ARTISTES
									String motArtistes = c.getArtiste();
									char lettreArtistes = Character.toUpperCase(c.getLettreArtiste());
									
									int longueurMotArtistes =0;
									String motCacheArtistes="";
									String motCacheDepartArtistes ="";
									if (motArtistes != null) {
										for (int i = 0; i < motArtistes
												.length(); i++) {
											motCacheArtistes = new String(
													motCacheArtistes + "*");
											if (motArtistes.charAt(i) == lettreArtistes) {
												motCacheDepartArtistes = new String(
														motCacheDepartArtistes
																+ lettreArtistes);
											} else {
												motCacheDepartArtistes = new String(
														motCacheDepartArtistes
																+ "*");
											}
										}
										longueurMotArtistes = motArtistes.length();
									}
									
									System.out.println("lArtiste choisi est: "+motArtistes);
									String idBoutonArtistes = String.valueOf(lettreArtistes);
									String lettreStringArtistes = String.valueOf(lettreArtistes);
									
									session.setAttribute("lettreStringArtistes", lettreStringArtistes);
									session.setAttribute("motArtistes", motArtistes);
									session.setAttribute("pointsMaxArtistes", c.getScoreMaxArtiste());
									
									model.addAttribute("motCacheDepartArtistes", motCacheDepartArtistes);
									model.addAttribute("motCacheArtistes", motCacheArtistes);
									model.addAttribute("motArtistes", motArtistes);
									model.addAttribute("lettreArtistes", lettreArtistes);
									model.addAttribute("longueurMotArtistes", longueurMotArtistes);
									model.addAttribute("idBoutonArtistes", idBoutonArtistes+"Artistes");
									
									
//									LES PRESIDENTS
									String motPresident = c.getPresident();
									char lettrePresident = Character.toUpperCase(c.getLettrePresident());
									
									int longueurMotPresident =0;
									String motCachePresident="";
									String motCacheDepartPresident="";
									if (motPresident!=null) {
										for (int i = 0; i < motPresident
												.length(); i++) {
											motCachePresident = new String(
													motCachePresident + "*");
											if (motPresident.charAt(i) == lettrePresident) {
												motCacheDepartPresident = new String(
														motCacheDepartPresident
																+ lettrePresident);
											} else {
												motCacheDepartPresident = new String(
														motCacheDepartPresident
																+ "*");
											}
										}
										longueurMotPresident = motPresident.length();
									}
									
									System.out.println("le Presi choisi est: "+motPresident);
									String idBoutonPresident = String.valueOf(lettrePresident);
									String lettreStringPresident = String.valueOf(lettrePresident);
									
									session.setAttribute("lettreStringPresident", lettreStringPresident);
									session.setAttribute("motPresident", motPresident);
									session.setAttribute("pointsMaxPresident", c.getScoreMaxPresident());
									
									model.addAttribute("motCacheDepartPresident", motCacheDepartPresident);
									model.addAttribute("motCachePresident", motCachePresident);
									model.addAttribute("motPresident", motPresident);
									model.addAttribute("lettrePresident", lettrePresident);
									model.addAttribute("longueurMotPresident", longueurMotPresident);
									model.addAttribute("idBoutonPresident", idBoutonPresident+"President");
																		
									
									int longueurMot = longueurMotPays+longueurMotCapitales+longueurMotNobels+longueurMotArtistes+longueurMotPresident;
									model.addAttribute("longueurMot", longueurMot);
														
								return "penduChallengeSujetsJeu";
								}					
							}
						}
		}
	
		return "penduChallengeSujetsJeu";
		
	}
	private void chargementDesSujets(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
//		Pays
		Random random = new  Random();
		char lettre = (char) (random.nextInt(26)+'a');
		char lettrePays = Character.toUpperCase(lettre);
		List<String> sujetPays = new ArrayList<String>();
		List<Pays_Capitale> sujetPaysP= penduDao.challengeSujetPays(lettre);
		
		for (Pays_Capitale pays_Capitale : sujetPaysP) {
			sujetPays.add(pays_Capitale.getPays());
		}
		String csPays= sujetPays.get(random.nextInt(sujetPays.size()));
		String motPaysEspace = csPays.toUpperCase();
		
//		pour la suppression des espaces
		String motPays = motPaysEspace.replaceAll("\\s", "");
								
		String motCachePays="";
		String motCacheDepartPays="";
		for (int i = 0; i < motPays.length(); i++) {
			motCachePays = new String(motCachePays+"*");
			if (motPays.charAt(i)==lettrePays) {
				motCacheDepartPays = new String(motCacheDepartPays+lettrePays);
			} else {
				motCacheDepartPays = new String(motCacheDepartPays+"*");
			}
		}
		int longueurMotPays = motPays.length();
		
		System.out.println("le pays choisit est : "+motPays);
		String idBouton = String.valueOf(lettrePays);
		String lettreStringPays = String.valueOf(lettrePays);
		
		session.setAttribute("lettreStringPays", lettreStringPays);
		session.setAttribute("motPays", motPays);
		session.setAttribute("pointsMaxPays", motPays.length()*10); // a modifier car si le user ne joue pas une categorie alors cette valeur sera prise
																		// et elle peut ne pas être vraie si on a une lettre qui se trouve deux fois dans le mot
		
		model.addAttribute("motCacheDepartPays", motCacheDepartPays);
		model.addAttribute("motCachePays", motCachePays);
		model.addAttribute("motPays", motPays);
		model.addAttribute("lettrePays", lettrePays);
		model.addAttribute("idBoutonPays", idBouton+"Pays");
		model.addAttribute("longueurMotPays", longueurMotPays);
		
		
//		Capitales
		lettre = (char) (random.nextInt(26)+'a');
		char lettreCapitales = Character.toUpperCase(lettre);
		
		List<String> sujetCapitales = new ArrayList<String>();
		List<Pays_Capitale> sujetCapitalesP= penduDao.challengeSujetCapitale(lettre);
		for (Pays_Capitale pays_Capitale : sujetCapitalesP) {
			sujetCapitales.add(pays_Capitale.getCapitale());
		}		
		String csCapitales= sujetCapitales.get(random.nextInt(sujetCapitales.size()));
		String motCapitalesEspace = csCapitales.toUpperCase();
		
		String motCapitales = motCapitalesEspace.replaceAll("\\s", "");
								
		String motCacheCapitales="";
		String motCacheDepartCapitales="";
		for (int i = 0; i < motCapitales.length(); i++) {
			motCacheCapitales = new String(motCacheCapitales+"*");
			if (motCapitales.charAt(i)==lettreCapitales) {
				motCacheDepartCapitales = new String(motCacheDepartCapitales+lettreCapitales);
			} else {
				motCacheDepartCapitales = new String(motCacheDepartCapitales+"*");
			}
		}
		int longueurMotCapitales = motCapitales.length();
		
		System.out.println("la capitale choisie est: "+motCapitales);
		String idBoutonCaptiale = String.valueOf(lettreCapitales);
		String lettreStringCapitale = String.valueOf(lettrePays);
		
		session.setAttribute("lettreStringCapitales", lettreStringCapitale);
		session.setAttribute("motCapitales", motCapitales);
		session.setAttribute("pointsMaxCapitales", motCapitales.length()*10);
		
		
		model.addAttribute("motCacheDepartCapitales", motCacheDepartCapitales);
		model.addAttribute("motCacheCapitales", motCacheCapitales);
		model.addAttribute("motCapitales", motCapitales);
		model.addAttribute("lettreCapitales", lettreCapitales);
		model.addAttribute("longueurMotCapitales", longueurMotCapitales);
		model.addAttribute("idBoutonCaptiales", idBoutonCaptiale+"Capitales");
		
		
//		Nobels
		lettre = (char) (random.nextInt(26)+'a');
		char lettreNobels = Character.toUpperCase(lettre);
		
		List<String> sujetNobels= new ArrayList<String>();
		List<Nobels> sujetNobelsN = penduDao.challengeSujetNobel(lettre);
		for (Nobels nobels : sujetNobelsN) {
			sujetNobels.add(nobels.getNom());
		}			
		String csNobels= sujetNobels.get(random.nextInt(sujetNobels.size()));
		String motNobelsEspace = csNobels.toUpperCase();
		
		String motNobels = motNobelsEspace.replaceAll("\\s", "");
								
		String motCacheNobels="";
		String motCacheDepartNobels ="";
		for (int i = 0; i < motNobels.length(); i++) {
			motCacheNobels = new String(motCacheNobels+"*");
			if (motNobels.charAt(i)==lettreNobels) {
				motCacheDepartNobels = new String(motCacheDepartNobels+lettreNobels);
			} else {
				motCacheDepartNobels = new String(motCacheDepartNobels+"*");
			}
		}
		int longueurMotNobels = motNobels.length();
		
		System.out.println("la Nobel choisie est: "+motNobels);
		String idBoutonNobels = String.valueOf(lettreNobels);
		String lettreStringNobels = String.valueOf(lettreNobels);
		
		session.setAttribute("lettreStringNobels", lettreStringNobels);
		session.setAttribute("motNobels", motNobels);
		session.setAttribute("pointsMaxNobels", (motNobels.length()-1)*10);
		
		model.addAttribute("motCacheDepartNobels", motCacheDepartNobels);
		model.addAttribute("motCacheNobels", motCacheNobels);
		model.addAttribute("motNobels", motNobels);
		model.addAttribute("lettreNobels", lettreNobels);
		model.addAttribute("longueurMotNobels", longueurMotNobels);
		model.addAttribute("idBoutonNobels", idBoutonNobels+"Nobels");
		
//		Artistes
		lettre = (char) (random.nextInt(26)+'a');
		char lettreArtistes = Character.toUpperCase(lettre);
		
		List<String> sujetArtistes = new ArrayList<String>();
		List<Artistes> sujetsArtistesAr= penduDao.challengeSujetArtiste(lettre);
		for (Artistes artistes : sujetsArtistesAr) {
			sujetArtistes.add(artistes.getNom());
		}
		
		String csArtistes= sujetArtistes.get(random.nextInt(sujetArtistes.size()));
		String motArtistesEspace = csArtistes.toUpperCase();
								
		String motArtistes = motArtistesEspace.replaceAll("\\s", "");
		
		String motCacheArtistes="";
		String motCacheDepartArtistes ="";
		for (int i = 0; i < motArtistes.length(); i++) {
			motCacheArtistes = new String(motCacheArtistes+"*");
			if (motArtistes.charAt(i)==lettreArtistes) {
				motCacheDepartArtistes = new String(motCacheDepartArtistes+lettreArtistes);
			} else {
				motCacheDepartArtistes = new String(motCacheDepartArtistes+"*");
			}
		}
		int longueurMotArtistes = motArtistes.length();
		
		System.out.println("lArtiste choisi est: "+motArtistes);
		String idBoutonArtistes = String.valueOf(lettreArtistes);
		String lettreStringArtistes = String.valueOf(lettreArtistes);
		
		session.setAttribute("lettreStringArtistes", lettreStringArtistes);
		session.setAttribute("motArtistes", motArtistes);
		session.setAttribute("pointsMaxArtistes", motArtistes.length()*10);
		
		model.addAttribute("motCacheDepartArtistes", motCacheDepartArtistes);
		model.addAttribute("motCacheArtistes", motCacheArtistes);
		model.addAttribute("motArtistes", motArtistes);
		model.addAttribute("lettreArtistes", lettreArtistes);
		model.addAttribute("longueurMotArtistes", longueurMotArtistes);
		model.addAttribute("idBoutonArtistes", idBoutonArtistes+"Artistes");
		
//		President
		lettre = (char) (random.nextInt(26)+'a');
		char lettrePresident = Character.toUpperCase(lettre);
		
		List<String> sujetPresident = new ArrayList<String>();
		List<President> sujetPresidentsP = penduDao.challengeSujetPresi(lettre);
		for (President president : sujetPresidentsP) {
			sujetPresident.add(president.getNom());
		}			
		
		String csPresident= sujetPresident.get(random.nextInt(sujetPresident.size()));
		String motPresidentEspace = csPresident.toUpperCase();
		
//		pour la suppression des espaces
		 String motPresident = motPresidentEspace.replaceAll("\\s", "");		
								
		String motCachePresident="";
		String motCacheDepartPresident="";
		for (int i = 0; i < motPresident.length(); i++) {
			motCachePresident = new String(motCachePresident+"*");
			if (motPresident.charAt(i)==lettrePresident) {
				motCacheDepartPresident = new String(motCacheDepartPresident+lettrePresident);
			} else {
				motCacheDepartPresident = new String(motCacheDepartPresident+"*");
			}
		}
		int longueurMotPresident = motPresident.length();
		
		System.out.println("le Presi choisi est: "+motPresident);
		String idBoutonPresident = String.valueOf(lettrePresident);
		String lettreStringPresident = String.valueOf(lettrePresident);
		
		session.setAttribute("lettreStringPresident", lettreStringPresident);
		session.setAttribute("motPresident", motPresident);
		session.setAttribute("pointsMaxPresident", motPresident.length()*10);
		
		model.addAttribute("motCacheDepartPresident", motCacheDepartPresident);
		model.addAttribute("motCachePresident", motCachePresident);
		model.addAttribute("motPresident", motPresident);
		model.addAttribute("lettrePresident", lettrePresident);
		model.addAttribute("longueurMotPresident", longueurMotPresident);
		model.addAttribute("idBoutonPresident", idBoutonPresident+"President");
		
		int longueurMot = longueurMotPays+longueurMotCapitales+longueurMotNobels+longueurMotArtistes+longueurMotPresident;
		model.addAttribute("longueurMot", longueurMot);
		
	}
	@RequestMapping(value="resultatPenduSujetsChallenge", method=RequestMethod.GET)
	public String resultatPenduSujetsChallenge ( Model model, PenduModel penduModel, HttpServletRequest req, Word word){		
//		recupération pour chaque sujet: le mot, la lettre, les points (gagnés et totals)
//		pour tous les sujets: la longueur
//		le temps restant
		HttpSession session = req.getSession();
		Long moi =(Long) session.getAttribute("id");
		Long ami =(Long) session.getAttribute("idAmi");
		
		PenduSujetsChallenge penduSujets = new PenduSujetsChallenge();
		
		String motCompletPays = (String) session.getAttribute("motPays");
		penduSujets.setPays(motCompletPays);
		String lettreDevoileePays = (String) session.getAttribute("lettreStringPays");
		char lettreCharPays = lettreDevoileePays.charAt(0);
		int pointsMaxPays = (int) session.getAttribute("pointsMaxPays");
		int pointsPays = 0;
		String nbErreursPays = (String)session.getAttribute("nbErreursPays");
		System.out.println("le mot du pays: "+motCompletPays+", la lettre : "+lettreCharPays+", les pointsMax: "+pointsMaxPays);
//		savoir si on dejà a soumis les pays pour correction, dans ce cas on met les données dans les attributs du pendu qui sera ensuite enregiste dans la BDD, sinon on les laisse par defaut
		String soumissionPays = (String) session.getAttribute("soumissionPays");
		if (soumissionPays =="oui") {
			
			pointsPays = (Integer) session.getAttribute("pointsPays");
			penduSujets.setLettreStringPays(lettreDevoileePays);
			penduSujets.setLettrePays(lettreCharPays);
			System.out.println("le nombre d'erreurs dans pays "+nbErreursPays);
			penduSujets.setNbErreursPaysMoi(Integer.parseInt(nbErreursPays));
			penduSujets.setScorePaysMoi(pointsPays);
			penduSujets.setScoreMaxPays(pointsMaxPays);
		}
		String motCompletCapitales = (String) session.getAttribute("motCapitales");
		penduSujets.setCapitale(motCompletCapitales);
		String lettreDevoileeCapitales = (String) session.getAttribute("lettreStringCapitales");
		char lettreCharCapitales = lettreDevoileeCapitales.charAt(0);
		Integer pointsMaxCapitales = (Integer) session.getAttribute("pointsMaxCapitales");
		Integer pointsCapitales = 0;
		String nbErreursCapitales = (String)session.getAttribute("nbErreursCapitales");
		System.out.println("le mot de la  Capitale: "+motCompletCapitales+", la lettre : "+lettreCharCapitales+", les pointsMax: "+pointsMaxCapitales);
		String soumissionCapitale = (String) session.getAttribute("soumissionCapitale");
		if (soumissionCapitale=="oui") {
			
			pointsCapitales = (Integer) session.getAttribute("pointsCapitales");
			penduSujets.setLettreStringCapitale(lettreDevoileeCapitales);
			penduSujets.setLettreCapitale(lettreCharCapitales);
			penduSujets.setNbErreursCapitaleMoi(Integer
					.parseInt(nbErreursCapitales));
			penduSujets.setScoreCapitaleMoi(pointsCapitales);
			penduSujets.setScoreMaxCapitale(pointsMaxCapitales);
		}
		String motCompletNobels = (String) session.getAttribute("motNobels");
		penduSujets.setNobel(motCompletNobels);
		String lettreDevoileeNobels = (String) session.getAttribute("lettreStringNobels");
		char lettreCharNobels = lettreDevoileeNobels.charAt(0);
		int pointsMaxNobels = 0;
		int pointsNobels = 0;
		String nbErreursNobels = (String)session.getAttribute("nbErreursNobels");
		System.out.println("le mot du Nobel: "+motCompletNobels+", la lettre : "+lettreCharNobels+", les pointsMax: "+pointsMaxNobels);
		String soumissionNobel = (String) session.getAttribute("soumissionNobel");
		if (soumissionNobel=="oui") {
			pointsMaxNobels =  (int) session.getAttribute("pointsMaxNobels");
			pointsNobels = (Integer) session.getAttribute("pointsNobels");
			penduSujets.setLettreStringNobel(lettreDevoileeNobels);
			penduSujets.setLettreNoble(lettreCharNobels);
			penduSujets
					.setNbErreursNobelMoi(Integer.parseInt(nbErreursNobels));
			penduSujets.setScoreNobelMoi(pointsNobels);
			penduSujets.setScoreMaxNobel(pointsMaxNobels);
		}
		String motCompletArtistes = (String) session.getAttribute("motArtistes");
		penduSujets.setArtiste(motCompletArtistes);
		String lettreDevoileeArtistes = (String) session.getAttribute("lettreStringArtistes");
		char lettreCharArtistes = lettreDevoileeArtistes.charAt(0);
		int pointsMaxArtistes = (Integer) session.getAttribute("pointsMaxArtistes");
		int pointsArtistes = 0;
		String nbErreursArtistes = (String)session.getAttribute("nbErreursArtistes");
		System.out.println("le mot de l'ARTISTE: "+motCompletArtistes+", la lettre : "+lettreCharArtistes+", les pointsMax: "+pointsMaxArtistes);
		String soumissionArtiste = (String) session.getAttribute("soumissionArtiste");
		if (soumissionArtiste=="oui") {
			
			pointsArtistes = (Integer) session.getAttribute("pointsArtistes");
			penduSujets.setLettreStringArtiste(lettreDevoileeArtistes);
			penduSujets.setLettreArtiste(lettreCharArtistes);
			penduSujets.setNbErreursArtisteMoi(Integer
					.parseInt(nbErreursArtistes));
			penduSujets.setScoreArtisteMoi(pointsArtistes);
			penduSujets.setScoreMaxArtiste(pointsMaxArtistes);
		}
		String motCompletPresidents = (String) session.getAttribute("motPresident");
		penduSujets.setPresident(motCompletPresidents);
		String lettreDevoileePresidents = (String) session.getAttribute("lettreStringPresident");
		char lettreCharPresidents = lettreDevoileePresidents.charAt(0);
		int  pointsMaxPresidents = (int) session.getAttribute("pointsMaxPresident");
		int pointsPresidents = 0;
		String nbErreursPresidents = (String)session.getAttribute("nbErreursPresident");
//		System.out.println("le mot du President: "+motCompletPresidents+", le mot complet : "+motCompletPresidents+", les pointsMax: "+pointsMaxPresidents);
		String soumissionPresident = (String) session.getAttribute("soumissionPresident");
		if (soumissionPresident=="oui") {
			
			pointsPresidents = (Integer) session.getAttribute("pointsPresident");
			penduSujets.setLettreStringPresident(lettreDevoileePresidents);
			penduSujets.setLettrePresident(lettreCharPresidents);
			penduSujets.setNbErreursPresidentMoi(Integer
					.parseInt(nbErreursPresidents));
			penduSujets.setScorePresidentMoi(pointsPresidents);
			penduSujets.setScoreMaxPresident(pointsMaxPresidents);
		}
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date now = new Date();
		String dateString = df.format(now);
		penduSujets.setDate(now);
		penduSujets.setDateStringMoi(dateString); 
		
//		suppression des données en session ..............................................................................
//		session.removeAttribute("motCompletPays");
//		session.removeAttribute("lettreCharPays");
//		session.removeAttribute("pointsMaxPays");
//		session.removeAttribute("pointsPays");
//		session.removeAttribute("nbErreursPays");
//		session.removeAttribute("soumissionPays");
//		
//		session.removeAttribute("motCompletCapitales");
//		session.removeAttribute("lettreCharCapitales");
//		session.removeAttribute("pointsMaxCapitales");
//		session.removeAttribute("pointsCapitales");
//		session.removeAttribute("nbErreursCapitales");
//		session.removeAttribute("soumissionCapitales");
//		
//		session.removeAttribute("motCompletNobels");
//		session.removeAttribute("lettreCharNobels");
//		session.removeAttribute("pointsMaxNobels");
//		session.removeAttribute("pointsNobels");
//		session.removeAttribute("nbErreursNobels");
//		session.removeAttribute("soumissionNobels");
//		
//		session.removeAttribute("motCompletArtistes");
//		session.removeAttribute("lettreCharArtistes");
//		session.removeAttribute("pointsMaxArtistes");
//		session.removeAttribute("pointsArtistes");
//		session.removeAttribute("nbErreursArtistes");
//		session.removeAttribute("soumissionArtistes");
//		
//		session.removeAttribute("motCompletPresidents");
//		session.removeAttribute("lettreCharPresidents");
//		session.removeAttribute("pointsMaxPresidents");
//		session.removeAttribute("pointsPresidents");
//		session.removeAttribute("nbErreursPresidents");
//		session.removeAttribute("soumissionPresidents");
		
		Integer longueurSujets = (Integer)session.getAttribute("longueurMot");
		String tempsRestant = req.getParameter("tempsRestant");
		
//		int longueurDesMots = (int) session.getAttribute("longueurMot");
//		penduSujets.setLongueurDesMots(longueurDesMots);
		
		int totalPoints = pointsPays+pointsCapitales+pointsNobels+pointsArtistes+pointsPresidents;
		int totalPointsMax = pointsMaxArtistes+pointsMaxCapitales+pointsMaxNobels+pointsMaxPays+pointsMaxPresidents;
		
//		penduSujets.setLongueurDesMots(lon);
		
		penduSujets.setScoreTotalMoi(totalPoints);
		penduSujets.setScoreTotalMax(totalPointsMax);
		penduSujets.setTempsRestantMoi(tempsRestant);
		
		System.out.println("AVANT LE SAVE DANS LE CONTROLLEUR ++++++++");
//		Enregistement des données dans la base
		penduDao.savePenduSujetChallenge(penduSujets, moi, ami);
		
		
//		Envoie des resultats à la vue pour affichage
		
		model.addAttribute("motCompletPays", motCompletPays);
		model.addAttribute("lettreCharPays", lettreCharPays);
		model.addAttribute("pointsMaxPays", pointsMaxPays);
		model.addAttribute("pointsPays", pointsPays);
		model.addAttribute("nbErreursPays", nbErreursPays);
		
		model.addAttribute("motCompletCapitales", motCompletCapitales);
		model.addAttribute("lettreCharCapitales", lettreCharCapitales);
		model.addAttribute("pointsMaxCapitales", pointsMaxCapitales);
		model.addAttribute("pointsCapitales", pointsCapitales);
		model.addAttribute("nbErreursCapitales", nbErreursCapitales);
		
		model.addAttribute("motCompletNobels", motCompletNobels);
		model.addAttribute("lettreCharNobels", lettreCharNobels);
		model.addAttribute("pointsMaxNobels", pointsMaxNobels);
		model.addAttribute("pointsNobels", pointsNobels);
		model.addAttribute("nbErreursNobels", nbErreursNobels);
		
		model.addAttribute("motCompletArtistes", motCompletArtistes);
		model.addAttribute("lettreCharArtistes", lettreCharArtistes);
		model.addAttribute("pointsMaxArtistes", pointsMaxArtistes);
		model.addAttribute("pointsArtistes", pointsArtistes);
		model.addAttribute("nbErreursArtistes", nbErreursArtistes);
		
		model.addAttribute("motCompletPresidents", motCompletPresidents);
		model.addAttribute("lettreCharPresidents", lettreCharPresidents);
		model.addAttribute("pointsMaxPresidents", pointsMaxPresidents);
		model.addAttribute("pointsPresidents", pointsPresidents);
		model.addAttribute("nbErreursPresidents", nbErreursPresidents);
		
	
		
		model.addAttribute("totalPoints", totalPoints);
		model.addAttribute("totalPointsMax", totalPointsMax);
		model.addAttribute("longueurSujets", longueurSujets);
		model.addAttribute("tempsRestant", tempsRestant);
		
		return "resultatPenduSujetsChallenge";
	}
	
	@RequestMapping(value="accepterEtInfosChallengeSujetsRecus")
	public String accepterEtInfosChallengeSujetsRecus (Model model, PenduModel penduModel, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		Long idAmi= (long) Integer.parseInt(req.getParameter("idAmi"));
		String action = req.getParameter("action");
		
//		penduDao.acceptChallengeDico(id, idAmi);
		switch (action) {
		case "accepter":
			penduDao.acceptChallengeSujets(id, idAmi);
			System.out.println("action est acceptée");
			break;
		case "refuser":
			penduDao.refuserChallengeSujets(id, idAmi);
			System.out.println("action est refusée");
			break;
		case "allerAuDuel":
//			penduChallengeDicoJeu(model, penduModel, req, null, idAmi);
			System.out.println("ON VA AU DUELLLL");
			break;
		case "annulerEnvoi":
			penduDao.annulerEnvoiChallengeSujets(id, idAmi);
			break;

		default:
			 throw new IllegalArgumentException("aucune action n'est défini ");
//			break;
		}
		
		penduModel.setMesChallengesDico(penduDao.mesDicoChallenges(id));
		penduModel.setMesChallengesDicoEnvoyes(penduDao.mesChallengesDicoEnvoyes(id));
		penduModel.setMesChallengesDicoEnAttentes(penduDao.mesChallengesDicoAttentes(id));
		model.addAttribute("penduModel", penduModel);	
	
		return "infosActionPenduDicoChallenge";
		
	}
	@RequestMapping(value="infosPenduSujetsChallenge")
	public String infosPenduSujetsChallenge (Model model, PenduModel penduModel, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		List<PenduSujetsChallenge> challenges = penduDao.mesSujetsChallenges(id);
		
		model.addAttribute("pendus", challenges);
		model.addAttribute("penduModel", penduModel);
		return "infosPenduSujetsChallenge";
		
	}
	@RequestMapping(value="infosPenduSujetsChallengeId")
	public String infosPenduSujetsChallengeId (Model model, PenduModel penduModel, HttpServletRequest req){
		Long idChallenge = Long.parseLong(req.getParameter("idChallenge"));
		PenduSujetsChallenge pendu = penduDao.getSujetChallenge(idChallenge);
		
		model.addAttribute("pendu", pendu);
		model.addAttribute("penduModel", penduModel);
		return "infosPenduSujetsChallengeId";
		
	}
	@RequestMapping(value="infoPublicationChallengeSujet")
	public String infoPublicationChallengeSujet(Model model, PenduModel penduModel, HttpServletRequest req){
		Long idChallenge = Long.parseLong(req.getParameter("idChallenge"));
		PenduSujetsChallenge challenge = penduDao.getSujetChallenge(idChallenge);
		
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		
//		si le jeu n'avait été publié au par avant 
		if(!challenge.isPublie()){
			String message = "le "+challenge.getDateStringMoi()+", j'ai joué à un PENU.SUJET.CHALLENGE contre "+challenge.getMonFriend().getNom()+" "
					+ ""+challenge.getMonFriend().getPrenom()+"\n"+", les ressultats sont de ce duel sont: "+"\n"+""
							+ "POINTS TOTAUX: MOI: "+challenge.getScoreTotalMoi()+" => LUI: "+challenge.getScoreTotalAmi()+"\n"+""
									+ "LES SUJETS: PAYS "+challenge.getPays()+": MOI "+challenge.getScorePaysMoi()+", LUI "+challenge.getPays()+"\n"
									+ " CAPITALE: "+challenge.getCapitale()+": MOI "+challenge.getScoreCapitaleMoi()+", LUI "+challenge.getScoreCapitaleAmi()+"\n"
									+ " NOBEL: "+challenge.getNobel()+": MOI "+challenge.getScoreNobelMoi()+", LUI "+challenge.getScoreNobelAmi()+"\n"
									+ " ARTISTE: "+challenge.getArtiste()+": MOI "+challenge.getScoreArtisteMoi()+", LUI "+challenge.getScoreArtisteAmi()+"\n"
									+ "PRESIDENT "+challenge.getPresident()+": MOI "+challenge.getScorePresidentMoi()+", LUI "+challenge.getScorePresidentAmi()+"\n"
											+ "TEMPS RESTANT: MOI "+challenge.getTempsRestantMoi()+" => LUI: "+challenge.getTempsRestantAmi();
			System.out.println(message);
			Post post = new Post(new Date(), message, true, TypePost.PENDUSUJETCHALLENGE);
//			ajout des information du challenge dans le poste pour faciliter l'affichage
			post.setScoreMax(challenge.getScoreTotalMax());
			post.setScoreMoi(challenge.getScoreTotalMoi());
			post.setScoreAmi(challenge.getScoreTotalAmi());
			post.setAideMoi(challenge.isAideMoi());
			post.setAideAmi(challenge.isAideAmi());
			post.setTempsResantMoi(challenge.getTempsRestantMoi());
			post.setTempsRestantAmi(challenge.getTempsRestantAmi());
			Friend moi = metier.getFriend(id);
			Friend ami = challenge.getMonFriend();
			post.setMoi(moi);
			post.setAmi(ami);
			
			challenge.setPublie(true);
			
			metier.posterPost(id, message, post);
			penduDao.publierChallengeSujets(idChallenge);
			
			return "publierDicoChallengeEtInfos";
		}
		
		
		model.addAttribute("pendu", challenge);
		model.addAttribute("penduModel", penduModel);
		return "publierDicoChallengeEtInfos";
	}
	@RequestMapping(value="notificationsSujets")
	public String notificationsSujets(Model model, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		List<Friend> challengesEnAttentes = penduDao.mesChallengesSujetsAttentes(id);
		List<Friend> mesChallengesRecus = penduDao.mesChallengesSujetsRecus(id);
		
		int nbNotificationsDico = challengesEnAttentes.size()+mesChallengesRecus.size();
		model.addAttribute("nbNotificationsDico", nbNotificationsDico);
		
		model.addAttribute("challengesEnAttentes", challengesEnAttentes);
		model.addAttribute("mesChallengesRecus", mesChallengesRecus);
		return "notificationsSujets";
	}
}
