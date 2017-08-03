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
import org.springframework.dao.support.DaoSupport;
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
public class PenduChallengeDicoControlleur {

	@Autowired
	private PenduDao penduDao;
	@Autowired
	private ChallengeMetier metier;
	
	@RequestMapping(value="envoyerChallengeDico", method=RequestMethod.GET)
	public String envoyerChallengeDico(Model model, HttpServletRequest req, PenduModel penduModel, Word word ){
		HttpSession session = req.getSession();
		Long id =  1L;
		Long ami = 2L;
		
		penduDao.sendChallengeDico(id, ami);
		
		List<Friend> mesEnvoyes = penduDao.mesChallengesDicoEnvoyes(id);
		for (Friend friend : mesEnvoyes) {
			System.out.println("le nom de l'ami "+friend.getNom());
		}		
		return "envoyerChallengeDico";
	}
	
	@RequestMapping(value="penduChallengeDico", method=RequestMethod.GET)
	public String penduChallengDico(Model model, HttpServletRequest req, PenduModel penduModel, Word word ){
		word.initWord(req);		
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);	
		penduModel.setMesChallengesDicoRecus(penduDao.mesChallengesDicoRecus(id));
		penduModel.setMesChallengesDico(penduDao.mesDicoChallenges(id));
		penduModel.setMesChallengesDicoEnvoyes(penduDao.mesChallengesDicoEnvoyes(id));
		penduModel.setMesChallengesDicoEnAttentes(penduDao.mesChallengesDicoAttentes(id));

		if(id != null){
			System.out.println("l'id n'est pas null");
			
			model.addAttribute("moi", moi);
		    model.addAttribute("penduModel", penduModel);
		return "penduChallengeDico";
		}
		
		List<PenduDicoChallenge> mesChallengesJoues = penduDao.mesDicoChallenges(id);
//		mesChallengesJoues.addAll(penduDao.mesDicoChallenges(id));
//		creation d'une map qui aura comme cl�f le code d'identificaion et comme valeur l'id de l'ami
		Map<String, Long> codeAmi = new HashMap<String, Long>();
//		pour les id des amis avec qui j'ai jou�
//		List<Long> idAmisJoues = new ArrayList<Long>();
//		pour les codes d'identificaions
//		List<String> codesInd = new ArrayList<String>();
		
//		les challenges de mes amis
		List<PenduDicoChallenge> challengesAmis = new ArrayList<PenduDicoChallenge>();
		PenduDicoChallenge challenge = new PenduDicoChallenge();
		Map<Friend, String> attentesAmi = new HashMap<Friend, String>();

		
		
		if (mesChallengesJoues!=null) {
			for (PenduDicoChallenge c : mesChallengesJoues) {
				System.out.println("les elements du challengeJoue: "
						+ c.getCodeIndentification() + " "
						+ c.getMonFriend().getId());
				//			recup�ration de l'id de l'ami associc� au jeu et du code d'identification pour les stocker dans une map
				//			ensuite pour chaque id on recup�re l'ami correspondant 
				//			
				codeAmi.put(c.getCodeIndentification(), c.getMonFriend()
						.getId());
			}
			//		recup�ration des ids dans la map pour cr�er les friends, puis comparer le code d'identification de la map avec les codes d'identifcation qui se trouvent 
			//		dans les jeux d�j� jou�s de l'ami: s'il s'y trouvent alors l'ami a jou� donc r�cup�ration du jeu: si non alors il n'a pas encore jou�
		}
		Friend ami= null;
		Set<Entry<String, Long>> setAmi = codeAmi.entrySet();
		Iterator<Entry<String, Long>> it = setAmi.iterator();
		while(it.hasNext()){
			Entry<String, Long> e = it.next();
//			recup�ration de l'ami par rappport � l'id
			 ami = new Friend();
			ami=metier.getFriend(e.getValue());
			System.out.println("l'id de l'ami pour qui j'ai jou� le challenge ..."+ami.getId());
//			les challenges jou�s de l'ami
			List<PenduDicoChallenge> challengesAmi= ami.getMesChallengesJouesPenduDico();
//			parcourt des challenges jou�s par l'ami
			for(PenduDicoChallenge c:challengesAmi){
//				si on trouve un code d'identification dans ses challenges jou�s qui �quivaut au mien, recup�ration de tout le jeu de l'ami en rapport avec ce code
				System.out.println("le code indentification ami=="+c.getCodeIndentification()+" le getKey de chez moi== "+e.getKey());
				if(c.getCodeIndentification().equals(e.getKey())){
//					l'ami a d�j� jou� => recup�ration du jeu en question
					challenge = new PenduDicoChallenge(null, null, 0, true, null, 0, true, 0, null, 0, true, 0, null, null, null);
//							(c.getId(),c.getCodeIndentification(), c.getEmail(), c.getScore(), c.getDate(), c.getLettre(), c.getTime(), c.getHelp(), c.getAgglo(), c.getaPresident(), c.getPresident(), c.getAnimal(), c.getArtiste(), c.getCapitale(), c.getPays(), c.getNobel(), c.getVille(), c.getTimeOut(), c.getMonFriend(), c.getFriend());
					challengesAmis.add(challenge);
				}
				else{
//					parcourt des jeux en attente chez l'ami, si on retrouve le code d'indtification dans les jeux en attentes alors il n'a pas encore jou�
//					
					attentesAmi=ami.getChallengeEnAttentes();
					Set<Entry<Friend, String>> setAttenteAmi = attentesAmi.entrySet();
					Iterator<Entry<Friend, String>> itAttenteAmi = setAttenteAmi.iterator();
					while(itAttenteAmi.hasNext()){
						Entry<Friend, String> entryAmi = itAttenteAmi.next();
						System.out.println("e.getKey() dans attente == "+e.getKey());
						System.out.println("code d'identification attente ===="+entryAmi.getValue());
						if(e.getKey().equals(entryAmi.getValue())){
							challenge = new PenduDicoChallenge(null, null, 0, false, null, 0, true, 0, null, 0, true, 0, null, null, null);
							challengesAmis.add(challenge);
							System.out.println("l'ami n'a pas encore jou� ---------------");
						}
					}
				}
			}
		}
		
		
		System.out.println("\n");
//		comme l'affichage de des challenges jou�s par les amis ne se fait pas dans l'ordre souhait� (pour �a on PEUT utlitiser l'interface QUEUE), mais ici
//		on parcourt mes challenges jou�s et on recup�re le code d'identification qu'on compare � celui des jeux de mes amis
//		on remplit une autre liste de challengesAmisOrdre dans laquelle on insere � l'indice correspondant � celui de mes jeux (par rapport au code d'indentification)
//		comme �a dans les deux listes (mes jeux et les jeux de mes amis), les jeux qui ont le meme code d'indentification ont le le m�me index, ce qui facilite l'affichage
//		En fin on va couper la nouvelle liste qui aura la m�me longuer que la liste de mes jeux car tous mes jeux qui ont aussi �t� jou�s par un amis sont d�j� dans la nouvelle
//		liste en fonction de l'index
//		Deque<AbcChallenge> challengeAmiQueue = new ArrayDeque<AbcChallenge>();
		List<PenduDicoChallenge> challengeAmisOrdre = new ArrayList<PenduDicoChallenge>();
		PenduDicoChallenge challengea = null;
		List<String> listeCodeAmi = new ArrayList<String>();
		if (mesChallengesJoues!=null) {
			for (PenduDicoChallenge abcMoi : mesChallengesJoues) {
				for (PenduDicoChallenge abcAmi : challengesAmis) {
					listeCodeAmi.add(abcAmi.getCodeIndentification());
					if (abcMoi.getCodeIndentification().equals(
							abcAmi.getCodeIndentification())) {
						//					challengeAmiQueue.offerLast(abcAmi);
						challengeAmisOrdre.add(
								mesChallengesJoues.indexOf(abcMoi), abcAmi);

					} else {
						challengea = new PenduDicoChallenge(null, null, 0,
								true, null, 0, true, 0, null, 0, true, 0, null,
								null, null);
						//					challengeAmiQueue.offerLast(challengea);
						challengeAmisOrdre.add(challengea);

					}
				}
			}
		}
		//		la taille de mes jeux
		int taille=0;
		if (mesChallengesJoues!=null) {
			taille = mesChallengesJoues.size();
			System.out.println("la taille de mes jeux est "+taille);
		}
		List<PenduDicoChallenge> challengeAmisOrdreCoupe = null;
		if (taille ==0) {
//			alors la personne n'a pas encore joue, donc la taille est 0
			 challengeAmisOrdreCoupe=challengeAmisOrdre.subList(0, taille);
		} else {
//			pour eviter d'avoir un depassement de la taille de liste
			challengeAmisOrdreCoupe=challengeAmisOrdre.subList(0, taille-1);
		}		
//		Mixage des deux listes pour faciliter l'affichage des duels dans le detail des challenges
		List<PenduDicoChallenge> mixChallenge = new ArrayList<PenduDicoChallenge>();
		if (mesChallengesJoues!=null) {
			mixChallenge = mixageList(mesChallengesJoues,challengeAmisOrdreCoupe);
		}
		//		mise du mixchallenge en session pour l'affichage des details des duels
		session.setAttribute("mixChallenge", mixChallenge);
		
		for(PenduDicoChallenge c: mixChallenge){
			System.out.println("LES CODE D'IDENTIFICATIONS DANS LE MIXCHALLENGE SONT "+c.getCodeIndentification());
		}
		
		penduModel.setChallengeAmisOrdreCoupe(challengeAmisOrdreCoupe);
		penduModel.setMesChallengesDicoJoues(mesChallengesJoues);
//	    recup�ration des derniers jeux
	   List<AbcChallenge> mesChallenges= metier.mesDerniersChallenges(id);
	    List<AbcSolo> mesSolos =  metier.getMesSolos(id);
	    
	    model.addAttribute("challengeAmisOrdreCoupe", challengeAmisOrdreCoupe);	  	    
	    
	    model.addAttribute("mesChallenges", mesChallenges);
	    model.addAttribute("mesSolos", mesSolos);
		
//		System.out.println("mes challengesJou�s:la taille "+mesChallengesJoues.size());
//		System.out.println("les challengesJou�sAmis: la taille "+challengesAmis.size());
		penduModel.setMesChallengesDicoJoues(mesChallengesJoues);
	    model.addAttribute("mesSolos", mesSolos);
		penduModel.setChallengesDicoAmis(challengesAmis);
	    model.addAttribute("mesSolos", mesSolos);
		session.setAttribute("mesChallengesJoues", mesChallengesJoues);
		model.addAttribute("mesChallengesJoues", mesChallengesJoues);
		session.setAttribute("challengesAmis", challengesAmis);
		model.addAttribute("penduModel", penduModel);
		model.addAttribute("mesChallengesJoues", mesChallengesJoues);
		model.addAttribute("challengesAmis", challengesAmis);
		model.addAttribute("moi", moi);
	    model.addAttribute("word", word);
	    model.addAttribute("penduModel", penduModel);
		
		return "penduChallengeDico";
		
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
	
	@RequestMapping(value="accepterDicoChallenge", method=RequestMethod.GET)
	public String accepterDicoChallenge(Model model, PenduModel penduModel, HttpServletRequest request){		
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		Long idAmi= (long) Integer.parseInt(request.getParameter("idAmi"));
		penduDao.acceptChallengeDico(id, idAmi);
		
		penduModel.setMesChallengesDico(penduDao.mesDicoChallenges(id));
		penduModel.setMesChallengesDicoEnvoyes(penduDao.mesChallengesDicoEnvoyes(id));
		penduModel.setMesChallengesDicoEnAttentes(penduDao.mesChallengesDicoAttentes(id));
				
		model.addAttribute("penduModel", penduModel);		
		return "accepterDicoChallenge";
		
	}
	@RequestMapping(value="penduChallengeDicoJeu", method=RequestMethod.GET)
	public String penduChallengeDicoJeu(Model model, PenduModel penduModel, HttpServletRequest request, Word word, Long amiId){
		word = new Word(request);
				
		HttpSession session = request.getSession();
		Long id =(Long) session.getAttribute("id");
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
		String codeAttenteMoiDico= penduDao.getCodeAttenteMoiAmiDico(id, idAmi);
//		le code chez mon ami s'il n'a pas encore jou�
		String codeAttenteAmiDico=penduDao.getCodeAttenteAmiMoiDico(id, idAmi);
//		le code chez mon ami s'il a d�j� jou�
		String codeJoueAmiDico = penduDao.getCodeJoueAmiMoiDico(id, idAmi);
		
//		si mon code en attente est egale au code en attete de l'ami, ça veut dire qu'il n'ap pas encore joué, alors
//		il faut tirer un mot dans le dico, sinon recuperer le mot avec lequel il a joue
		if(codeAttenteMoiDico.equals(codeAttenteAmiDico)){
//			recupération d'un mot au hasard dans le DICO
			word.initWord(request);
			mot = word.getWord();
			System.out.println("le mot est : "+mot);
//			à partir du mot tiré au sort, on choisit une lettre qui sera affichée pour guider le joueur
			String motComplet = word.getWord();
			int longueurMot = motComplet.length();
			int indexLettre = longueurMot/2;
			char lettreDevoilee = motComplet.charAt(indexLettre);
			String lettreString = String.valueOf(lettreDevoilee);
			
			session.setAttribute("motComplet", motComplet);
			session.setAttribute("lettreString", lettreString);
			session.setAttribute("lettreChar", lettreDevoilee);
			session.setAttribute("motSecret", word.getSecretWord());
						
						model.addAttribute("longueurMot", longueurMot);
						model.addAttribute("lettreDevoilee", lettreDevoilee);
						model.addAttribute("penduModel", penduModel);
						model.addAttribute("word", word);
						model.addAttribute("motComplet", motComplet);
						model.addAttribute("motSecret", word.getSecretWord());
						System.out.println("il n'a pas encore joué");
		}else{
			for(PenduDicoChallenge c:ami.getMesChallengesJouesPenduDico()){
				if(c.getCodeIndentification().equals(codeAttenteMoiDico)){
					System.out.println("il a déjà joué");
//					recuperer egalement le mot caché de la BDD, qui doit être enregiste
					String motSecret = c.getMotSecret().toUpperCase();
					String motComplet = c.getMot().toUpperCase();
					System.out.println("le mot est : "+c.getMot());
					int longueurMot = motComplet.length();
					int indexLettre = longueurMot/2;
					char lettreDevoilee = motComplet.charAt(indexLettre);
					String lettreString = String.valueOf(lettreDevoilee);
					
					System.out.println("le mot complet : "+motComplet);
					System.out.println("le mot secret : "+motSecret);
					
					word.setSecretWord(motSecret);
					word.setWord(motComplet);
					System.out.println("le mot complet dans word est : "+word.getSecretWord());
					System.out.println("le mot secret dans word est : "+word.getSecretWord());
					
					session.setAttribute("motComplet", motComplet);
					session.setAttribute("motSecret", motSecret);
					session.setAttribute("lettreString", lettreString);
					session.setAttribute("lettreChar", lettreDevoilee);
								
								model.addAttribute("longueurMot", longueurMot);
								model.addAttribute("lettreDevoilee", lettreDevoilee);
								model.addAttribute("penduModel", penduModel);
								model.addAttribute("motSecret", motSecret);
								model.addAttribute("motComplet", motComplet);
								model.addAttribute("word", word);
				}					
			}
		}
		return "penduChallengeDicoJeu";
	}

	@RequestMapping(value="penduChallengeDicoCorrection", method=RequestMethod.GET)
	public String penduChallengeDicoCorrection(Model model, PenduModel penduModel, HttpServletRequest request, Word word){
		HttpSession session = request.getSession();
				
//		recuperation du mot, nombre de coups, nombre d'erreurs, temps restant, points gagnés, pointsMax, du mot cache
		String motComplet = (String) session.getAttribute("motComplet");
		String motSecet = (String) session.getAttribute("motSecret");
		System.out.println("le mot secret est ================== "+motSecet);
		String lettreString = (String) session.getAttribute("lettreString");
		char lettreChar = (char) session.getAttribute("lettreChar");
		String nbErreursString = request.getParameter("nbErreurs");
		int nbErreurs = Integer.parseInt(nbErreursString);
		String tempsRestantString =request.getParameter("tempsRestant");
//		int tempsRestant = Integer.parseInt(tempsRestantString);
		
		
		String motUser = request.getParameter("motUser");
		int points =0;
		int nbFoisLettreDansMot =0;
		int pointsMax =0;
		if(motUser!=null){
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
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date now = new Date();
		String dateString = df.format(now);		
		
		int nbCoups =0;
		int score =0;
		int scoreMax = 0;
		int temps =0;
		int nbAide = 0;
		boolean aide = false;
		Collection<Character> lesChoix =null;
		
		Long id =  (Long) session.getAttribute("id");
		
//		recup�raiton de l'ami
		Long idAmi = (Long) session.getAttribute("idAmi");
		session.setAttribute("idAmi", idAmi);
		Friend ami= metier.getFriend(idAmi);
		
//		moi
		Friend moi = metier.getFriend(id);
		PenduDicoChallenge challenge = new PenduDicoChallenge(new Date(), dateString, nbErreurs, tempsRestantString, false, motComplet, nbErreurs, points, pointsMax, lettreString, motSecet);
		penduDao.savePenduDicoChallenge(challenge, id, idAmi);
		
		model.addAttribute("challenge", challenge);
				
		model.addAttribute("motComplet", motComplet);
		model.addAttribute("nbErreurs", nbErreursString);
		model.addAttribute("lettreChar", lettreChar);
		model.addAttribute("points", points);
		model.addAttribute("pointsMax", pointsMax);
		model.addAttribute("tempsRestantString", tempsRestantString);
		model.addAttribute("motSecet", motSecet);
		
		return "penduChallengeDicoCorrection";
	}
	
	@RequestMapping(value="penduChallengeDicoCorrectionCinqsErreurs", method=RequestMethod.GET)
	public String penduChallengeDicoCorrectionCinqsErreurs(Model model, PenduModel penduModel, HttpServletRequest request, Word word){
		HttpSession session = request.getSession();		
		
		Long id =  (Long) session.getAttribute("id");
		
//		recup�raiton de l'ami
		Long idAmi = (Long) session.getAttribute("idAmi");
		session.setAttribute("idAmi", idAmi);
		Friend ami= metier.getFriend(idAmi);
		
//		recuperation du mot, nombre de coups, nombre d'erreurs, temps restant, points gagnés, pointsMax, du mot cache
		int pointsMax =  (int) session.getAttribute("pointsMax");
		String motUser = request.getParameter("motUser");
		String motComplet = (String) session.getAttribute("motComplet");
		String motSecet = (String) session.getAttribute("motSecret");
		String lettreString = (String) session.getAttribute("lettreString");
//		char lettreChar = (char) session.getAttribute("lettreChar");
		String nbErreursString = request.getParameter("nbErreurs");
		int nbErreurs = Integer.parseInt(nbErreursString);
		String tempsRestantString =request.getParameter("tempsRestant");	
		if(tempsRestantString.equals("0")){
			System.out.println("le temps est fini ================= INSERTION DES DONNEES EN FONCTION ...");
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			Date now = new Date();
			String dateString = df.format(now);
			PenduDicoChallenge challenge = new PenduDicoChallenge(new Date(), dateString, 5, tempsRestantString, false, motComplet, nbErreurs, 0, pointsMax, lettreString, motSecet);
			penduDao.savePenduDicoChallenge(challenge, id, idAmi);
			
			return "penduChallengeDicoCorrection";
		}
					
		model.addAttribute("motComplet", motComplet);
		model.addAttribute("nbErreurs", nbErreursString);
//		model.addAttribute("lettreChar", lettreChar);
		model.addAttribute("pointsMax", pointsMax);


		int longueurMot = 10000000;
		model.addAttribute("longueurMot", longueurMot);
		
		return "penduChallengeDicoCorrection";
	}
	@RequestMapping(value="infosPenduDicoChallenge")
	public String infosPenduDicoChallenge (Model model, PenduModel penduModel, HttpServletRequest req, Word word){
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);	
		
		penduModel.setMesChallengesDicoRecus(penduDao.mesChallengesDicoRecus(id));
		penduModel.setMesChallengesDico(penduDao.mesDicoChallenges(id));
		penduModel.setMesChallengesDicoEnvoyes(penduDao.mesChallengesDicoEnvoyes(id));
		penduModel.setMesChallengesDicoEnAttentes(penduDao.mesChallengesDicoAttentes(id));

		
		model.addAttribute("moi", moi);
		return "infosPenduDicoChallenge";
		
	}
	@RequestMapping(value="infosPenduDicoChallengeId")
	public String infosPenduDicoChallengeId(Model model, PenduModel penduModel, HttpServletRequest req, Word word){
		Long id = Long.parseLong(req.getParameter("idChallenge"));
		PenduDicoChallenge challenge = penduDao.getDicoChallengeById(id);
		
		
		model.addAttribute("penduModel", penduModel);
		model.addAttribute("challenge", challenge);
		return "infosPenduDicoChallengeId";
		
	}
	@RequestMapping(value="accepterEtInfosChallengeDicoRecus")
	public String accepterEtInfosChallengeDicoRecus (Model model, PenduModel penduModel, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		Long idAmi= (long) Integer.parseInt(req.getParameter("idAmi"));
		String action = req.getParameter("action");
		
		switch (action) {
		case "accepter":
			penduDao.acceptChallengeDico(id, idAmi);
			System.out.println("action est acceptée");
			break;
		case "refuser":
			penduDao.refuserChallengeDico(id, idAmi);
			System.out.println("action est refusée");
			break;
		case "allerAuDuel":
//			penduChallengeDicoJeu(model, penduModel, req, null, idAmi);
			System.out.println("ON VA AU DUELLLL");
			break;
		case "annulerEnvoi":
			penduDao.annulerEnvoiChallengeDico(id, idAmi);
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
	@RequestMapping(value="publierDicoChallengeEtInfos")
	public String publierDicoChallengeEtInfos (Model model, PenduModel penduModel, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		Long idJeu = (long) Integer.parseInt(req.getParameter("idChallenge"));
		PenduDicoChallenge challenge = penduDao.getDicoChallengeById(idJeu);
//		si le jeu n'avait été publié au par avant 
		if(!challenge.isPublie()){
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			Date now = new Date();
			String dateString = df.format(now);
			String message = "le "+dateString+", j'ai joué à un PENUDICOCHALLENGE contre "+challenge.getMonFriend().getNom()+" "
					+ ""+challenge.getMonFriend().getPrenom()+"\n"+", les ressultats sont de ce duel sont: "+"\n"+""
							+ "POINTS: moi: "+challenge.getScore()+" lui: "+challenge.getScoreAmi()+"\n"+""
									+ "LE MOT: "+challenge.getMot()+"\n"
											+ "Temps Restant: moi "+challenge.getTempsRestantMoi()+" lui: "+challenge.getTempsRestantAmi();
			Post post = new Post(new Date(), message, true, TypePost.PENDUDICOCHALLENGE);
//			ajout des information du challenge dans le poste pour faciliter l'affichage
			post.setScoreMax(challenge.getScoreMax());
			post.setScoreMoi(challenge.getScore());
			post.setScoreAmi(challenge.getScoreAmi());
			post.setAideMoi(challenge.isAide());
			post.setAideAmi(challenge.isAideAmi());
			post.setTempsResantMoi(challenge.getTempsRestantMoi());
			post.setTempsRestantAmi(challenge.getTempsRestantAmi());
			Friend moi = metier.getFriend(id);
			Friend ami = challenge.getMonFriend();
			post.setMoi(moi);
			post.setAmi(ami);
			
			challenge.setPublie(true);
			
			metier.posterPost(id, message, post);
			penduDao.publierChallengeDico(idJeu);
			
			return "publierDicoChallengeEtInfos";
		}
		
		return "publierDicoChallengeEtInfos";
		
	}
	@RequestMapping(value="notificationsDico")
	public String notificationsDico(Model model, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id = (Long) session.getAttribute("id");
		List<Friend> challengesEnAttentes = penduDao.mesChallengesDicoAttentes(id);
		List<Friend> mesChallengesRecus = penduDao.mesChallengesDicoRecus(id);
		
		int nbNotificationsDico = challengesEnAttentes.size()+mesChallengesRecus.size();
		model.addAttribute("nbNotificationsDico", nbNotificationsDico);
		
		model.addAttribute("challengesEnAttentes", challengesEnAttentes);
		model.addAttribute("mesChallengesRecus", mesChallengesRecus);
		return "notificationsDico";
	}
}
