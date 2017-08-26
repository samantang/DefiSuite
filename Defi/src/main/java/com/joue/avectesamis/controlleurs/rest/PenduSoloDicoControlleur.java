package com.joue.avectesamis.controlleurs.rest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.joue.avectesamis.dao.PenduDao;
import com.joue.avectesamis.dao.repositories.FriendRepository;
import com.joue.avectesamis.entites.AbcChallenge;
import com.joue.avectesamis.entites.AbcSolo;
import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.Post;
import com.joue.avectesamis.entites.TypePost;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoSolo;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsSolo;
import com.joue.avectesamis.metier.ChallengeMetier;
import com.joue.avectesamis.models.GameModel;
import com.joue.avectesamis.models.PenduModel;
import com.joue.avectesamis.models.SocialModel;
import com.joue.avectesamis.models.Word;

@Controller
public class PenduSoloDicoControlleur {
	
	@Autowired
	private PenduDao penduDao;
	@Autowired
	private ChallengeMetier metier;
	
	@RequestMapping(value="penduSoloDico", method=RequestMethod.GET)
	public String soloDico(Model model, HttpServletRequest req, PenduModel penduModel, Word word ){
		word.initWord(req);
				
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
		
		penduModel.setMesDicoSolo(penduDao.mesDicoSolos(id));
	    model.addAttribute("penduModel", penduModel);
	    model.addAttribute("moi", moi);

		return "penduSoloDico";
		
	} 
//	Methode qui permet de mixer deux ArrayList
	public List<PenduDicoChallenge> mixageList(List<PenduDicoChallenge> mesChallengesJoues, List<PenduDicoChallenge> challengeAmisOrdreCoupe ){
		List<PenduDicoChallenge> resultat = new ArrayList<PenduDicoChallenge>();
		int size = Math.max(mesChallengesJoues.size(), challengeAmisOrdreCoupe.size());
		
		for (int i = 0; i < size; i++) {
	        if (i < mesChallengesJoues.size()) resultat.add(mesChallengesJoues.get(i));
	        if (i < challengeAmisOrdreCoupe.size()) resultat.add(challengeAmisOrdreCoupe.get(i));
	    }

		
		return resultat;
		
	}
	
	
	@RequestMapping(value="penduSoloDicoJeu", method=RequestMethod.GET)
	public String AbcSoloDicoJeu(Model model, PenduModel penduModel, HttpServletRequest request, Word word){
		word = new Word(request);
		
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("id"); 
		Friend moi = metier.getFriend(id);
//		à partir du mot tiré au sort, on choisit une lettre qui sera affichée pour guider le joueur
		String motComplet = word.getWord();
		int longueurMot = motComplet.length();
		int indexLettre = longueurMot/2;
		char lettreDevoilee = motComplet.charAt(indexLettre);
		String lettreString = String.valueOf(lettreDevoilee);
		
		session.setAttribute("motComplet", motComplet);
		session.setAttribute("lettreString", lettreString);
		session.setAttribute("lettreString", lettreString);
							
					model.addAttribute("longueurMot", longueurMot);
					model.addAttribute("lettreDevoilee", lettreDevoilee);
					model.addAttribute("penduModel", penduModel);
					model.addAttribute("word", word);
					model.addAttribute("moi", moi);
		
		return "penduSoloDicoJeu";
		
	}
	@RequestMapping(value="penduSoloDicoCorrection", method=RequestMethod.GET)
	public Map<String, Object> penduChallengeCorrection(PenduModel penduModel, HttpServletRequest request, Word word){
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
//		recuperation du mot, nombre de coups, nombre d'erreurs, temps restant, points gagnés, pointsMax
		String mot ="";
		int nbCoups =0;
		int nbErreurs =0;
		int score =0;
		int scoreMax = 0;
		int temps =0;
		int tempsRestants = 10;
		int nbAide = 0;
		boolean aide = false;
		Collection<Character> lesChoix =null;
		
		HttpSession session = request.getSession();
		Long id =  1L;
//				(Long) session.getAttribute("id");
//		le temps en fonction du nombre de r�sultats possibles
		
//		recup�raiton de l'ami
		Long idAmi= 2L;
//				(long) Integer.parseInt(request.getParameter("idAmi"));
		session.setAttribute("idAmi", idAmi);
		Friend ami= metier.getFriend(idAmi);
		
//		moi
		Friend moi = metier.getFriend(id);
		
//		PenduDicoSolo solo = new PenduDicoSolo(new Date(), null, 0, false, null, 0, false, 0, null, 0, true, 0);
//		penduDao.savePenduDicoChallenge(challenge, id, idAmi);
		
//		map.put("solo", solo);
		
		return map;
	}
	
	@RequestMapping(value="infosPenduDicoSolo")
	public String infosPenduDicoSolo(Model model, SocialModel sm, HttpServletRequest req, GameModel gm, PenduModel penduModel){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		
		penduDao.mesDicoSolos(id);
		penduModel.setMesDicoSolo(penduDao.mesDicoSolos(id));;
		
		model.addAttribute("sm", sm);
		model.addAttribute("gm", gm);
		model.addAttribute("penduModel", penduModel);
		return "infosPenduDicoSolo";
	}
	@RequestMapping(value="imageErreurPendu")
	public String imageErreurPendu(Model model, SocialModel sm, HttpServletRequest req, GameModel gm, PenduModel penduModel){

		model.addAttribute("penduModel", penduModel);
		return "imageErreurPendu";
	}
	@RequestMapping(value="resultatPendu")
	public String resultatPendu (Model model, SocialModel sm, HttpServletRequest req, GameModel gm, PenduModel penduModel){
		HttpSession session = req.getSession();
		
		
		Long id = (Long) session.getAttribute("id");
		
		String motComplet = (String) session.getAttribute("motComplet");
		String nbErreurs = req.getParameter("nbErreurs");
		int nbErreursInt = Integer.parseInt(nbErreurs);
		String tempsRestant = 	req.getParameter("tempsRestant");
		
		String lettreDevoilee = (String) session.getAttribute("lettreString");
		char lettreChar = lettreDevoilee.charAt(0);
		
		String motUser = req.getParameter("motUser");
		int points =0;
		int nbFoisLettreDansMot =0;
		int pointsMax =0;
		if(motUser!="null"){
			for(int i =0; i<motComplet.length(); i++){
				if(motComplet.charAt(i)==lettreChar){
					nbFoisLettreDansMot = nbFoisLettreDansMot + 10;
				}
				if(motComplet.charAt(i)== motUser.charAt(i)){
					System.out.println("motComplet.charAt(i) = "+motComplet.charAt(i)+" motUser.charAt(i)"+motUser.charAt(i));
					points = points + 10;
				}
				pointsMax = points;
				System.out.println("le nombre de points Total "+points);
			}
			motUser = null;
		}	
//		pointsMax = pointsMax - nbFoisLettreDansMot;
//		si les points gagnes sont superieurs aux perdu alors
		if(points>nbFoisLettreDansMot){
			points = points - nbFoisLettreDansMot;
		}else {
			points = 0;
		}
//		je peux inserer les données dans la base que si "motUser = null"
		DateFormat df = new SimpleDateFormat("dd/MM/yyy hh:mm", Locale.FRANCE);
//		DtateFormat formater = new SimpleDateFormat(pattern, locale)
		Date now = new Date();
		String dateString = df.format(now);
//		savoir si le temps est fini avant de trouver tout le mot, dans ce cas mettre le timeOut à true
		String timeOut = req.getParameter("timeOut");
		System.out.println("le timeout est : "+timeOut);
		if(timeOut=="oui"){
			PenduDicoSolo solo = new PenduDicoSolo(true);
			penduDao.savePenduDicoSolo(solo, id);
		}
		else if(nbErreursInt == 5){
			System.out.println("le nombre d'erreurs est de cinq ==============");
			PenduDicoSolo solo = new PenduDicoSolo(now, dateString, lettreDevoilee, true, motComplet , nbErreursInt, points, pointsMax);
			penduDao.savePenduDicoSolo(solo, id);
		}else {
			PenduDicoSolo penduDicoSolo = new PenduDicoSolo(now, dateString, lettreDevoilee, null, tempsRestant, motComplet, null, nbErreursInt, points, pointsMax);
			penduDao.savePenduDicoSolo(penduDicoSolo, id);
		}
		
//		Pour les points: chaque lettre rapporte 10 points
//		quand on trouve tout le mot avant la fin, chaque 10 secondes rapportent 5 points de BONUS
		
				
		model.addAttribute("points", points);
		model.addAttribute("pointsMax", pointsMax);
		model.addAttribute("nbErreurs", nbErreurs);
		model.addAttribute("tempsRestant", tempsRestant);
		model.addAttribute("motComplet", motComplet);
		model.addAttribute("penduModel", penduModel);
		return "resultatPendu";
	}
	@RequestMapping(value="publierSoloDico")
	public String publierSoloDico(Model model, SocialModel sm, HttpServletRequest req, GameModel gm, PenduModel penduModel){
		HttpSession session = req.getSession();
		Long id = 2L;
//				(Long) session.getAttribute("id");
		//		recupération des infos du solo
		Long idSolo = Long.parseLong(req.getParameter("id"));
		PenduDicoSolo dicoSolo = penduDao.getDicoSolo(idSolo);
		String messagePost = ""+dicoSolo.getDateString()+" j'ai joué un soloDico avec le mot "+dicoSolo.getMot()+", j'ai eu "+dicoSolo.getScore()+"/"+dicoSolo.getScoreMax()+" Points";
		
		Post post = new Post(new Date(), messagePost, true, TypePost.PENDUDICOSOLO);
		
		System.out.println("le message du Post "+post.getMessage());
		System.out.println("le type du Post "+post.getTypePost());
		
		return "penduSoloDico";
		
	}
	@RequestMapping(value="infoPublicationSolo")
	public String infoPublicationSolo (Model model, SocialModel sm, HttpServletRequest req, GameModel gm, PenduModel penduModel){
		HttpSession session = req.getSession();
		Long id =(Long) session.getAttribute("id");
		//		recupération des infos du solo
		String idSoloStr = req.getParameter("idSolo");
		
		Long idSolo = Long.valueOf(idSoloStr);
		PenduDicoSolo dicoSolo = penduDao.getDicoSolo(idSolo);
//		le message du post
		String messagePost = ""+dicoSolo.getDateString()+" a joué un soloDico avec le mot "+dicoSolo.getMot()+" j'ai eu "+dicoSolo.getScore()+"/"+dicoSolo.getScoreMax()+" Points";		
//		comme le jeu ne doit etre publie qu'une seule fois, s'il n'est pas publie on le publie 
//		sinon on informe à l'utilisateur qu'il est déjà pubie
		if(dicoSolo.isPublie()){
			return "infoPubSoloDejaPublie";
		}
		
		Post post = new Post(new Date(), messagePost, true, TypePost.PENDUDICOSOLO);		
		System.out.println("le message du Post "+post.getMessage());
		System.out.println("le type du Post "+post.getTypePost());
		
		metier.posterPost(id, messagePost);
		
		penduDao.mettreAjourDicoSolo(idSolo);
		
		return "infoPublicationSolo";
		
	}
	
	
}
