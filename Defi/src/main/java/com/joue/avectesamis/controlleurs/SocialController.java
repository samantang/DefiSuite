package com.joue.avectesamis.controlleurs;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.net.AprEndpoint.SendfileData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.joue.avectesamis.connexion.DbConnection;
import com.joue.avectesamis.dao.PenduDao;
import com.joue.avectesamis.entites.AbcChallenge;
import com.joue.avectesamis.entites.AbcSolo;
import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.Post;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoSolo;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsSolo;
import com.joue.avectesamis.metier.ChallengeMetier;
import com.joue.avectesamis.models.Inscription;
import com.joue.avectesamis.models.MesAmisJeuxModel;
import com.joue.avectesamis.models.SocialModel;


@Controller
//@SessionAttributes({"formClient", "nom", "id", "points", "random", "client","idUser", "nbCatChoisis"})
public class SocialController {
	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	static SecureRandom rnd = new SecureRandom();

	@Autowired
	private ChallengeMetier metier;
	@Autowired
	private PenduDao penduDao;
	
	
	@RequestMapping(value="/index")
	public String index (){
		
		return "index";	
	}
	
	@RequestMapping(value="/accueil")
	public String accueil (){
		
		return "accueil";
		
	}

	@RequestMapping(value="/userhome")
	public String userhome (Model model, SocialModel sm, HttpServletRequest request){
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
		
		sm.setMoi(moi);
		sm.setPosts(metier.getPosts());
	    sm.setComments(metier.getComments());
	    
	    
//	    recup�ration des derniers jeux
	    List<AbcChallenge> mesChallenges= metier.mesDerniersChallenges(id);
	    List<AbcSolo> mesSolos =  metier.getMesSolos(id);
	    
	    Collection<PenduDicoSolo> mesDicoSolos = penduDao.mesDicoSolos(id);
	    Collection<PenduSujetsSolo> mesSujetsSolos = penduDao.mesSujetsSolos(id);
	    
	    
	    
	    model.addAttribute("mesDicoSolos", mesDicoSolos);
	    model.addAttribute("mesSujetsSolos", mesSujetsSolos);
	    
	    model.addAttribute("mesChallenges", mesChallenges);
	    model.addAttribute("mesSolos", mesSolos);
	    model.addAttribute("sm", sm);
	    model.addAttribute("id", id);
	    model.addAttribute("moi", moi);
	    
		
		return "userhome";
		
	}
	
	@RequestMapping(value="loginUser")
	public String login (Model model, SocialModel sm, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		Connection con = DbConnection.getConnect();
	    Statement st = con.createStatement();
	    String status="";
	    String userid = request.getParameter("userid");
	    String password = request.getParameter("password");
	    Friend moi = new Friend();
	    
	    Long idUser = null;
	    Long id = null;

//		pour le cryptage du mdp
		String passCript = (String) request.getParameter("password");

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(passCript.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        System.out.println("Digest(in hex format):: " + sb.toString());
	    
	    // POUR LA CONNEXON JUSTE POUR L ESSAI, A FAIRE PAR LA SUITE AVEC SPRING SECURITY
	    ResultSet rs =st.executeQuery("select * from friend where email='"+userid+"' and mdp='"+sb.toString()+"'");
	    if(rs.next()) {
	    	id = rs.getLong("id");
	    	idUser = id;
	    	String nom = rs.getString("nom");
	    	
	    	session.setAttribute("id", id);
	    	session.setAttribute("nom", nom);
	    	moi = metier.getFriend(id);
	    		
		}
//		les amis pour lesquels Annuler la demande
		List<Friend> amisAnnulerDemande = metier.amisAnnulerDemande(idUser);
//		les amis pour lesquels Accepter la demande
		List<Friend> amisAccepterDemande = metier.amisAccepterDemande(idUser);
//		les amis pour lesquels Envoyer une demande
		List<Friend> amisEnvoyerDemande = metier.amisEnvoyerDemande(idUser);
//		les amis avec lesquels Jouer
		List<Friend> amisJouerAvec = metier.amisJouerAvec(idUser);
		
		int nbNotificationsDico = penduDao.mesChallengesDicoAttentes(idUser).size()+
				penduDao.mesChallengesDicoRecus(idUser).size();
		int nbNotificationsSujets = penduDao.mesChallengesSujetsAttentes(idUser).size()+
				penduDao.mesChallengesSujetsRecus(idUser).size();
		int nbNotificationsAbc = amisJouerAvec.size()+amisAccepterDemande.size();
		
		
//		en session le nombre de notifications par jeu
		session.setAttribute("nbNotificationsDico", nbNotificationsDico);
		session.setAttribute("nbNotificationsSujets", nbNotificationsSujets);
		session.setAttribute("nbNotificationsAbc", nbNotificationsAbc);
	
	    
//	    ajout du prenom de l'utilisateur en cours dans la session pour l'affichage dans la vue
	    session.setAttribute("prenomUser", moi.getPrenom());
//	    recup�ration des derniers jeux
	    List<AbcChallenge> mesChallenges= metier.mesDerniersChallenges(idUser);
	    List<AbcSolo> mesSolos =  metier.getMesSolos(idUser);
	    Collection<PenduDicoSolo> mesDicoSolos = penduDao.mesDicoSolos(idUser);
	    Collection<PenduSujetsSolo> mesSujetsSolos = penduDao.mesSujetsSolos(idUser);
	    
	    session.setAttribute("mesSolos", mesSolos);
	    session.setAttribute("mesDicoSolos", mesDicoSolos);
	    session.setAttribute("mesSujetsSolos", mesSujetsSolos);
	    
	    model.addAttribute("mesDicoSolos", mesDicoSolos);
	    model.addAttribute("mesSujetsSolos", mesSujetsSolos);
	    
	    // recup�ration de tous les posts et des commentaires
	    sm.setPosts(metier.getPosts());
	    sm.setComments(metier.getComments());
	    
	    List<Post> posts = new ArrayList<Post>();
	    posts = metier.getPosts();
	    String message = "";
	    
	    for (Post p: posts) {
			message = message + p.getMessage();
		};
		session.setAttribute("message", message);	    
	    
	    model.addAttribute("moi", moi);
	    model.addAttribute("mesChallenges", mesChallenges);
	    model.addAttribute("mesSolos", mesSolos);
	    model.addAttribute("sm", sm);
	    model.addAttribute("id", id);
	    
		return "userhome";
			
		}
	
	@RequestMapping(value="deconnexion")
	public String deconnexion(Model model , HttpServletRequest req){
		HttpSession session = req.getSession();
		
		session.invalidate();
		
		return "index";
		
	}
	
	@RequestMapping(value="/user_profile")
	public String user_profile (Model model, SocialModel sm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
		 sm.setMoi(metier.monProfil(id));
//		    recup�ration des derniers jeux
		   List<AbcChallenge> mesChallenges= metier.mesDerniersChallenges(id);
		    List<AbcSolo> mesSolos =  metier.getMesSolos(id);
		    
		    int tailleSolos = mesSolos.size();
		    int tailleChallenges = mesChallenges.size();		    
		    
		    model.addAttribute("tailleSolos", tailleSolos);
		    model.addAttribute("tailleChallenges", tailleChallenges);
		    
		    model.addAttribute("mesChallenges", mesChallenges);
		    model.addAttribute("mesSolos", mesSolos);
		
		model.addAttribute("model", sm);
		model.addAttribute("id", id);
		model.addAttribute("moi", moi);
		
//		ajout des traitements pour les reglages -------------------------------------------------------------
		
		sm.setMoi(metier.monProfil(id));
		// si des checks avaient dejà été  cochés au par avant pour la visibilité des infos, alors il va falloir les cocher à nouveau
		 boolean emailTous = false, emailAmis=false, emailMoi=false, mobileTous=false, mobileAmis=false, mobileMoi=false, photoTous=false, photoAmis=false, photoMoi=false ;
		 String emailCoche=null, mobileCoche=null, photoCoche=null;
//		 Friend moi = metier.getFriend(id);
		  emailCoche = moi.getEmailVisible();
		  mobileCoche = moi.getMobileVisible();
		  photoCoche = moi.getPhotoVisible();
		 if(emailCoche !=null){
			 if(emailCoche.equals("tous")) emailTous = true;
			 if(emailCoche.equals("amis")) emailAmis= true;
			 if(emailCoche.equals("moi")) emailMoi = true;		 
		 }
		 if(mobileCoche != null){
			 if(mobileCoche.equals("tous")) mobileTous = true;
			 if(mobileCoche.equals("amis")) mobileAmis = true;
			 if(mobileCoche.equals("moi")) mobileMoi = true;
		 }
		 if(photoCoche != null){
			 if(photoCoche.equals("tous")) photoTous = true;
			 if(photoCoche.equals("amis")) photoAmis = true;
			 if(photoCoche.equals("moi")) photoMoi = true;			 
		 }
//		    recupération des derniers jeux
//		   List<AbcChallenge> mesChallenges= metier.mesDerniersChallenges(id);
//		   List<AbcSolo> mesSolos =  metier.getMesSolos(id);
		    
		    model.addAttribute("mesChallenges", mesChallenges);
		    model.addAttribute("mesSolos", mesSolos);
		 
		 model.addAttribute("emailTous", emailTous);
		 model.addAttribute("emailAmis", emailAmis);
		 model.addAttribute("emailMoi", emailMoi);
		 
		 model.addAttribute("mobileTous", mobileTous);
		 model.addAttribute("mobileAmis", mobileAmis);
		 model.addAttribute("mobileMoi", mobileMoi);
		 
		 model.addAttribute("photoTous", photoTous);
		 model.addAttribute("photoAmis", photoAmis);
		 model.addAttribute("photoMoi", photoMoi);
	
		 model.addAttribute("moi", moi);
		 model.addAttribute("emailAmis", emailAmis);
		 model.addAttribute("mobileCoche", mobileCoche);
		 model.addAttribute("emailCoche", emailCoche);
		model.addAttribute("sm", sm);
		
		return "user_profile";
		
	}
	@RequestMapping(value="photoUser", produces = {MediaType.IMAGE_PNG_VALUE, MediaType.IMAGE_GIF_VALUE, MediaType.IMAGE_JPEG_VALUE})
	@ResponseBody
	public byte [] photoUser( Long id, HttpServletRequest req) throws IOException{
		HttpSession session = req.getSession();
//		Long id =  (Long) session.getAttribute("id");
		System.out.println("dans la methode photoUser ======");
		Friend f = metier.getFriend(id);
		System.out.println("la photo est ================= "+f.getPhoto());
		System.out.println("son nom est ================= "+f.getNom());
		
		String message = (String) session.getAttribute("message");
		
		System.out.println("les messages sont : "+message);
		
		return IOUtils.toByteArray(new ByteArrayInputStream(f.getPhoto()));
	}
	@RequestMapping(value="/reglages", method=RequestMethod.GET)
	public String reglages (Model model, SocialModel sm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		 sm.setMoi(metier.monProfil(id));
		// si des checks avaient dejà été  cochés au par avant pour la visibilité des infos, alors il va falloir les cocher à nouveau
		 boolean emailTous = false, emailAmis=false, emailMoi=false, mobileTous=false, mobileAmis=false, mobileMoi=false, photoTous=false, photoAmis=false, photoMoi=false ;
		 String emailCoche=null, mobileCoche=null, photoCoche=null;
		 Friend moi = metier.getFriend(id);
		  emailCoche = moi.getEmailVisible();
		  mobileCoche = moi.getMobileVisible();
		  photoCoche = moi.getPhotoVisible();
		 if(emailCoche !=null){
			 if(emailCoche.equals("tous")) emailTous = true;
			 if(emailCoche.equals("amis")) emailAmis= true;
			 if(emailCoche.equals("moi")) emailMoi = true;		 
		 }
		 if(mobileCoche != null){
			 if(mobileCoche.equals("tous")) mobileTous = true;
			 if(mobileCoche.equals("amis")) mobileAmis = true;
			 if(mobileCoche.equals("moi")) mobileMoi = true;
		 }
		 if(photoCoche != null){
			 if(photoCoche.equals("tous")) photoTous = true;
			 if(photoCoche.equals("amis")) photoAmis = true;
			 if(photoCoche.equals("moi")) photoMoi = true;			 
		 }
//		    recupération des derniers jeux
		   List<AbcChallenge> mesChallenges= metier.mesDerniersChallenges(id);
		   List<AbcSolo> mesSolos =  metier.getMesSolos(id);
		    
		    model.addAttribute("mesChallenges", mesChallenges);
		    model.addAttribute("mesSolos", mesSolos);
		 
		 model.addAttribute("emailTous", emailTous);
		 model.addAttribute("emailAmis", emailAmis);
		 model.addAttribute("emailMoi", emailMoi);
		 
		 model.addAttribute("mobileTous", mobileTous);
		 model.addAttribute("mobileAmis", mobileAmis);
		 model.addAttribute("mobileMoi", mobileMoi);
		 
		 model.addAttribute("photoTous", photoTous);
		 model.addAttribute("photoAmis", photoAmis);
		 model.addAttribute("photoMoi", photoMoi);
	
		 model.addAttribute("moi", moi);
		 model.addAttribute("emailAmis", emailAmis);
		 model.addAttribute("mobileCoche", mobileCoche);
		 model.addAttribute("emailCoche", emailCoche);
		model.addAttribute("sm", sm);
		return "reglages";
		
	}
	
	@RequestMapping(value="/validationReglageMdp")
	public String validationReglageMdp (Model model, SocialModel sm, HttpServletRequest req) throws Exception{
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
//		vérifier si l'ancien mdp est réellement le mdp de l'utilisateur
		String ancienMdp = sm.getMdp();
		if (ancienMdp != null ) {
			Friend friend = friendExisteChangementMdp(id, ancienMdp);
			if (friend ==null) {
//				le mdp n'existe pas
				model.addAttribute("mdpInexistant", "le mot de passe que vous avez fourni n'est pas le bon, si vous "
						+ "l'avez oublié, vous pouvez le changer.");
				model.addAttribute("sm", sm);
				user_profile(model, sm, req);
				return "user_profile";
			}
		}
//		vérifier que le nouveau mdp et la confirmation sont les mêmes
		if (!sm.getMdpnouveau().equals(sm.getMdpnouveauconfirme())) {
			model.addAttribute("mdpDifferents", "les deux mots de passe ne sont pas identiques");
			user_profile(model, sm, req);
			return "user_profile";
		}
//		changer l'ancien mot de passe ==============================
		
//		pour le cryptage du mdp 
		String passCript = sm.getMdp();

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(passCript.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        System.out.println("Digest(in hex format):: " + sb.toString());
//        on change le mdp de l'utilisateur dans la BDD en faisant une requete par rapport à son email
        Friend friend = metier.getFriend(id);
        String email = friend.getEmail();
        metier.changerMdp(email, sb.toString());
		
		model.addAttribute("mdpChange", "votre mot de passe a été changé avec succès");
		user_profile(model, sm, req);
		model.addAttribute("sm", sm);
		return "user_profile";
		
	}
	private Friend friendExisteChangementMdp(Long id, String ancienMdp) throws Exception {
		Connection con = DbConnection.getConnect();
	    Statement st = con.createStatement();    
	    Friend friend = null;
//		pour le cryptage du mdp
		String passCript = ancienMdp;

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(passCript.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        System.out.println("Digest(in hex format):: " + sb.toString());
	    
	    // POUR LA CONNEXON JUSTE POUR L ESSAI, A FAIRE PAR LA SUITE AVEC SPRING SECURITY
	    ResultSet rs =st.executeQuery("select * from friend where id='"+id+"' and mdp='"+sb.toString()+"'");
	    if(rs.next()) {
	    friend = new Friend();	
	    return 	friend;
		}
		return friend;
	}

	@RequestMapping(value="/validationReglageVisibilite")
	public String validationReglageVisibilite (Model model, SocialModel sm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		Friend moi = new Friend();
		moi=metier.monProfil(id);
		moi.setEmailVisible(sm.getRemail());
		moi.setPhotoVisible(sm.getRphotos());
		moi.setMobileVisible(sm.getRmobile());
		
		metier.metAJour(moi);
		
//		========================================le meme code que dans la methode reglage un peu plus haut====================================================================
		
		boolean emailTous = false, emailAmis=false, emailMoi=false, mobileTous=false, mobileAmis=false, mobileMoi=false, photoTous=false, photoAmis=false, photoMoi=false ;
		 String emailCoche=null, mobileCoche=null, photoCoche=null;
		  emailCoche = moi.getEmailVisible();
		  mobileCoche = moi.getMobileVisible();
		  photoCoche = moi.getPhotoVisible();
		 
		 if(emailCoche !=null){
			 if(emailCoche.equals("tous")) emailTous = true;
			 if(emailCoche.equals("amis")) emailAmis= true;
			 if(emailCoche.equals("moi")) emailMoi = true;		 
		 }
		 if(mobileCoche != null){
			 if(mobileCoche.equals("tous")) mobileTous = true;
			 if(mobileCoche.equals("amis")) mobileAmis = true;
			 if(mobileCoche.equals("moi")) mobileMoi = true;
		 }
		 if(photoCoche != null){
			 if(photoCoche.equals("tous")) photoTous = true;
			 if(photoCoche.equals("amis")) photoAmis = true;
			 if(photoCoche.equals("moi")) photoMoi = true;			 
		 }
		 
		 model.addAttribute("emailTous", emailTous);
		 model.addAttribute("emailAmis", emailAmis);
		 model.addAttribute("emailMoi", emailMoi);
		 
		 model.addAttribute("mobileTous", mobileTous);
		 model.addAttribute("mobileAmis", mobileAmis);
		 model.addAttribute("mobileMoi", mobileMoi);
		 
		 model.addAttribute("photoTous", photoTous);
		 model.addAttribute("photoAmis", photoAmis);
		 model.addAttribute("photoMoi", photoMoi);
		 
		 
		 model.addAttribute("emailAmis", emailAmis);
		 model.addAttribute("mobileCoche", mobileCoche);
		 model.addAttribute("emailCoche", emailCoche);
		 
//		===============================================================================fin du code ========================================================
		
		model.addAttribute("sm", sm);
		return "user_profile";
		
	}
	
	@RequestMapping(value="mesamis")
	public String mesamis (Model model, SocialModel sm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
		sm.setMesAmis((List<Friend>) moi.getFriends());
		
		/**
		 * si les paramettres de l'action de ne sont pas nulles, alors l'utilisateur a surment cliquer sur action dans 'mesamis'
		 * alors on recupere l'action concernée et agir en fonction (challenger, annuler, accepter, ...)
		 * si tel est le cas alors on appelera la page de chargement de la table à la fin de la methode, juste avant la methode
		 * qui renvoie à la page 'mesamis'
		 */
		if (req.getParameter("action")!=null) {
			Long idAmi = Long.valueOf(req.getParameter("idAmi"));
			
			switch (req.getParameter("action")) {
//			pour les envois de challenges
			case "challengeABC":
				metier.envoyerChallenge(id, idAmi);
				break;
			case "challengeDICO":
				penduDao.sendChallengeDico(id, idAmi);
				break;
			case "challengeSUJETS":
				penduDao.sedChallengeSujets(id, idAmi);
				break;
//				pour les annulations de challenges
			case "annulerEnvoiABC":
				metier.annulerEnvoiChallenge(id, idAmi);
				break;
			case "annulerEnvoiDICO":
				penduDao.annulerEnvoiChallengeDico(id, idAmi);
				break;
			case "annulerEnvoiSUJETS":
				penduDao.annulerEnvoiChallengeSujets(id, idAmi);
				break;
//				pour les acceptations de challenges
			case "accepterABC":
				metier.accepterChallenge(id, idAmi);
				break;
			case "accepterDICO":
				penduDao.acceptChallengeDico(id, idAmi);
				break;
			case "accepterSUJETS":
				penduDao.acceptChallengeSujets(id, idAmi);
				break;
//				pour les refus de challenges 
			case "refuserABC":
				metier.refuserChallenge(id, idAmi);
				break;
			case "refuserDICO":
				penduDao.refuserChallengeDico(id, idAmi);
				break;
			case "refuserSUJETS":
				penduDao.refuserChallengeSujets(id, idAmi);
				break;
			default:
				break;
			}
		}
		
		
//		recuperation des mes amis
		Collection<Friend> mesAmis = moi.getFriends();
		
//		creation de l'objet (le model) qui representera le tableau à afficher dans la vue: la liste de mes amis 
//		et les actions à faire par raport aux jeux
		List<MesAmisJeuxModel> amisJeuxModel = new ArrayList<MesAmisJeuxModel>();
		MesAmisJeuxModel ami ;
		for (Friend friend : mesAmis) {
			ami= new MesAmisJeuxModel();
			ami.setId(friend.getId());
			ami.setNom(" "+friend.getNom()+" ");
			ami.setPrenom(friend.getPrenom()+" ");
//			Pour le jeu ABC
			if (moi.getChallengesEnvoyes().containsKey(friend)) {
				ami.setAbcAnnuler(true);
			}else if (moi.getChallengesRecus().containsKey(friend)) {
				ami.setAbcRefuser(true);
			}else if (moi.getChallengeEnAttentes().containsKey(friend)) {
				ami.setAbcAttente(true);
			}else {
				ami.setAbcChallenger(true);
			}
//			pour le jeu DICO
			if (moi.getChallengesEnvoyesPenduDico().containsKey(friend)) {
				ami.setDicoAnnuler(true);
			}else if (moi.getChallengesRecusPenduDico().containsKey(friend)) {
				ami.setDicoRefuser(true);
			}else if (moi.getChallengeEnAttentesPenduDico().containsKey(friend)) {
				ami.setDicoAttente(true);
			}else {
				ami.setDicoChallenger(true);
			}
//			Pour le jeu SUJETS
			if (moi.getChallengesEnvoyesPenduSujets().containsKey(friend)) {
				ami.setSujetsAnnuler(true);
			}else if (moi.getChallengesRecusPenduSujets().containsKey(friend)) {
				ami.setSujetsRefuser(true);
			}else if (moi.getChallengeEnAttentesPenduSujets().containsKey(friend)) {
				ami.setSujetsAttente(true);
			}else {
				ami.setSujetsChallenger(true);
			}
			amisJeuxModel.add(ami);

		}

		model.addAttribute("amisJeuxModel", amisJeuxModel);
		
//		les amis pour lesquels Annuler la demande
		List<Friend> amisAnnulerDemande = metier.amisAnnulerDemande(id);
//		les amis pour lesquels Accepter la demande
		List<Friend> amisAccepterDemande = metier.amisAccepterDemande(id);
//		les amis avec lesquels Jouer
		List<Friend> amisJouerAvec = metier.amisJouerAvec(id);
//		les amis pour lesquels Envoyer une demande
		List<Friend> amisEnvoyerDemande = metier.amisEnvoyerDemande(id);
		
//		toutes les personnes
		List<Friend> tousLesInscrits = new ArrayList<Friend>();
		tousLesInscrits = metier.tousLesInscrits();
//		les personnes a qui je peux envoyer une demande
//		verification dans la liste de tousLesInscrits, suppression de la liste des personnes avec qui j'ai d�j� commenc� une procedure de jeu
//		suppression de liste de moi, car je ne dois pas m'envoyer � moi une demande
		
		for (int i = 0; i < tousLesInscrits.size(); i++) {
			Iterator<Friend> amisIterator = amisJouerAvec.iterator();
			while (amisIterator.hasNext()) {
				Friend friend = (Friend) amisIterator.next();
				if (friend.getId().equals(tousLesInscrits.get(i).getId()) ) {
					tousLesInscrits.remove(i);
				}
			}
		}
		for (int i = 0; i < tousLesInscrits.size(); i++) {
			Iterator<Friend> amisIterator = amisAccepterDemande.iterator();
			while (amisIterator.hasNext()) {
				Friend friend = (Friend) amisIterator.next();
				if (friend.getId().equals(tousLesInscrits.get(i).getId()) ) {
					tousLesInscrits.remove(i);
				}
			}
		}
		for (int i = 0; i < tousLesInscrits.size(); i++) {
			Iterator<Friend> amisIterator = amisAnnulerDemande.iterator();
			while (amisIterator.hasNext()) {
				Friend friend = (Friend) amisIterator.next();
				if (friend.getId().equals(tousLesInscrits.get(i).getId()) ) {
					tousLesInscrits.remove(i);
				}
			}
		}
		
		
		tousLesInscrits.removeAll(amisJouerAvec);
		tousLesInscrits.removeAll(amisAccepterDemande);
		tousLesInscrits.removeAll(amisAnnulerDemande);
			
		
//		en session le nombre de demande d'amis et de jeu
		session.setAttribute("nbAmisJoueAvec", amisJouerAvec.size());
		session.setAttribute("nbAmisAccepterDemande", amisAccepterDemande.size());
		
		for(Friend f:amisAccepterDemande)System.out.println(" les amisAnnulerDemande "+f);
		for(Friend f:amisAccepterDemande)System.out.println(" les amisAccepterDemande "+f);
//	    recup�ration des derniers jeux
	    List<AbcChallenge> mesChallenges= metier.mesDerniersChallenges(id);
	    List<AbcSolo> mesSolos =  metier.getMesSolos(id);
	    
	    
	    
	    model.addAttribute("mesChallenges", mesChallenges);
	    model.addAttribute("mesSolos", mesSolos);
		
	    model.addAttribute("tousLesInscrits", tousLesInscrits);
		model.addAttribute("amisJouerAvec", amisJouerAvec);
		model.addAttribute("amisAccepterDemande", amisAccepterDemande);
		model.addAttribute("amisAnnulerDemande", amisAnnulerDemande);
		model.addAttribute("amisEnvoyerDemande", amisEnvoyerDemande);
		model.addAttribute("moi", moi);
		model.addAttribute("id", id);
		
		model.addAttribute("sm", sm);
//		si le parametre n'est pas null, alors on surement cliquer sur un boutton de la page messamis alors il faut recharger
//		juste la table
		if (req.getParameter("rechargerTable")!=null) {
			return "rechargerTableAmis";
		}
		
		
		return "mesamis";
		
	}
	// ================================================================debut des methodes pour les posts ======================================
	
	@RequestMapping(value="posterPost")
	public String posterPost(Model model, SocialModel sm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
//		Long idPost = Long.parseLong(req.getParameter("id"));
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Friend moi = metier.getFriend(id);
		
		metier.posterPost(id, req.getParameter("messagePost"));
		
		sm.setPosts(metier.getPosts());
	    sm.setComments(metier.getComments());
	    sm.setMessagePost(null);
	    
	    
	    model.addAttribute("moi", moi);
	    model.addAttribute("id", id);
	    model.addAttribute("sm", sm);
	    
		
		return "userhome";
		
	}
	
	@RequestMapping(value="aimerPost")
	public String aimerPost(Model model, SocialModel sm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		Long idPost = Long.parseLong(req.getParameter("id"));
		Friend moi = metier.getFriend(id);
		System.out.println("l'id du post est "+idPost);
		
		metier.aimerPost(id, idPost);
		
		sm.setPosts(metier.getPosts());
	    sm.setComments(metier.getComments());
	    
	    model.addAttribute("sm", sm);
	    model.addAttribute("id", id);
	    model.addAttribute("moi", moi);
		
		return "userhome";
		
	}
	@RequestMapping(value="neplusAimerPost")
	public String neplusAimerPost(Model model, SocialModel sm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		Long idPost = Long.parseLong(req.getParameter("id"));
		Friend moi = metier.getFriend(id);
		
		System.out.println("l'id du post est "+idPost);
		
		metier.neplusAimerPost(id, idPost);
		
		sm.setPosts(metier.getPosts());
	    sm.setComments(metier.getComments());
	    
	    model.addAttribute("sm", sm);
	    model.addAttribute("id", id);
	    model.addAttribute("moi", moi);
		
		return "userhome";
		
	}
	@RequestMapping(value="commenterPost")
	public String commenterPost(Model model, SocialModel sm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
//		Long idPost = Long.parseLong(req.getParameter("id"));
		Long idPost = sm.getIdPost();
		String commentaire = sm.getCommentaire();
		
		metier.commenterPost(id, idPost, commentaire);
		
		sm.setPosts(metier.getPosts());
	    sm.setComments(metier.getComments());
	    
//	    sm.setCommentaire(null);
	    
	    model.addAttribute("sm", sm);
	    model.addAttribute("id", id);
	    model.addAttribute("moi", moi);
		
		return "userhome";
		
	}
	@RequestMapping(value="annulerChallenge")
	public String annulerChallenge (Model model, SocialModel sm, HttpServletRequest req){
		
		return "annulerChallenge";
		
	}
	@RequestMapping(value="challengesAaccepter")
	public String challengesAaccepter(Model model, SocialModel sm, HttpServletRequest req){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
		sm.setMesAmis((List<Friend>) moi.getFriends());
		
//		TEST POUR METHODES
		metier.annulerEnvoiChallenge(1L, 2L);		
		
//		les amis pour lesquels Annuler la demande
		List<Friend> amisAnnulerDemande = metier.amisAnnulerDemande(id);
//		les amis pour lesquels Accepter la demande
		List<Friend> amisAccepterDemande = metier.amisAccepterDemande(id);
//		les amis pour lesquels Envoyer une demande
		List<Friend> amisEnvoyerDemande = metier.amisEnvoyerDemande(id);
//		les amis avec lesquels Jouer
		List<Friend> amisJouerAvec = metier.amisJouerAvec(id);

		model.addAttribute("amisAccepterDemande", amisAccepterDemande);
		model.addAttribute("amisJouerAvec", amisJouerAvec);
		return "challengesAaccepter";
		
	}
	@RequestMapping(value="inscription")
	public String inscription (Model model ,HttpServletRequest request, @Valid Inscription inscription, BindingResult bindingResult, SocialModel sm)throws Exception{
		HttpSession session = request.getSession();
		
		if(inscription.getNom() == null){			
			return "inscription";
		}
//		if (bindingResult.hasErrors()) {
//			System.out.println(bindingResult.getAllErrors());
//			return "inscription";
//		}
		
		String sexe = (String) request.getParameter("sex");
		String nom = (String) request.getParameter("nom");
		String prenom = (String) request.getParameter("prenom");
		String email = (String) request.getParameter("email");
		String pseudo = (String) request.getParameter("login");
		String pass = (String) request.getParameter("password");
		String pass2 = (String) request.getParameter("pwd2");
		
		validationEmail(email);
		
		
//		pour le cryptage du mdp
		String passCript = (String) request.getParameter("password");

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(passCript.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        System.out.println("Digest(in hex format):: " + sb.toString());
		
		
		
		String photo =  new File("/resources/images/user.png)").getAbsolutePath();
		
		metier.enregistreFriend(new Friend(nom, prenom, email, sexe, sb.toString(), pseudo, new Date(),  photo.getBytes()));
			
//		=======================================CONNEXION MAIS A FAIRE AVEC SPRING SECURITY=================================================
		Connection con = DbConnection.getConnect();
	    Statement st = con.createStatement();
	    Long idUser = null;
	    
	    // POUR LA CONNEXON JUSTE POUR L ESSAI, A FAIRE PAR LA SUITE AVEC SPRING SECURITY
	    ResultSet rs =st.executeQuery("select * from friend where email='"+email+"' and mdp='"+sb.toString()+"'");
	    if(rs.next())
	    {
	    	Long id = rs.getLong("id");
	    	idUser = id;
	    	String nomMoi = rs.getString("nom");
	    	
	    	session.setAttribute("id", id);
	    	session.setAttribute("nom", nomMoi);
	    	
		}
//	    recup�ration des derniers jeux
	    List<AbcChallenge> mesChallenges= metier.mesDerniersChallenges(idUser);
	    List<AbcSolo> mesSolos =  metier.getMesSolos(idUser);
	    
	    // recup�ration de tous les posts et des commentaires
	    sm.setPosts(metier.getPosts());
	    sm.setComments(metier.getComments());
	    
	    
	    model.addAttribute("mesChallenges", mesChallenges);
	    model.addAttribute("mesSolos", mesSolos);
	    model.addAttribute("sm", sm);
	
		
		return "userhome";
		
	}
	/**
     * Valide l'adresse email saisie.
     */
    private void validationEmail( String email ) throws Exception {
        if ( email != null && !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            throw new Exception( "Merci de saisir une adresse mail valide." );
        }
    }

	@RequestMapping(value="/challengeAaccepter")
	public String challengeAaccepter(Model model ,HttpServletRequest request, SocialModel sm){
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		System.out.println("NOUS SOMMES DANS LA METHODE challengeAaccepter");
		
//		les amis pour lesquels Annuler la demande
//		List<Friend> amisAnnulerDemande = metier.amisAnnulerDemande(id);
//		les amis pour lesquels Accepter la demande
		List<Friend> amisAccepterDemande = metier.amisAccepterDemande(id);
//		les amis pour lesquels Envoyer une demande
//		List<Friend> amisEnvoyerDemande = metier.amisEnvoyerDemande(id);
//		les amis avec lesquels Jouer
//		List<Friend> amisJouerAvec = metier.amisJouerAvec(id);
		
//		le nombre de demandes � accepter
		int nDemadesAacceter = amisAccepterDemande.size();
		
		
//		model.addAttribute("amisAnnulerDemande", amisAnnulerDemande);
		model.addAttribute("amisAccepterDemande", amisAccepterDemande);
//		model.addAttribute("amisEnvoyerDemande", amisEnvoyerDemande);
//		model.addAttribute("amisJouerAvec", amisJouerAvec);
		model.addAttribute("nDemadesAacceter", nDemadesAacceter);
		
		return "challengeAaccepter";
		
	}
	@RequestMapping(value="/challengesAJouer")
	public String challengesAJouer(Model model ,HttpServletRequest request, SocialModel sm){
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		System.out.println("NOUS SOMMES DANS LA METHODE challengesAJouer");
		
//		les amis pour lesquels Annuler la demande
//		List<Friend> amisAnnulerDemande = metier.amisAnnulerDemande(id);
//		les amis pour lesquels Accepter la demande
//		List<Friend> amisAccepterDemande = metier.amisAccepterDemande(id);
//		les amis pour lesquels Envoyer une demande
//		List<Friend> amisEnvoyerDemande = metier.amisEnvoyerDemande(id);
//		les amis avec lesquels Jouer
		List<Friend> amisJouerAvec = metier.amisJouerAvec(id);
		
//		le nombre de demandes � accepter
		int nAmisJouerAvec = amisJouerAvec.size();
		
		System.out.println("la taille de mes amis avec qui je doit jouer est : "+nAmisJouerAvec);
		
		
//		model.addAttribute("amisAnnulerDemande", amisAnnulerDemande);
		model.addAttribute("amisJouerAvec", amisJouerAvec);
//		model.addAttribute("amisEnvoyerDemande", amisEnvoyerDemande);
//		model.addAttribute("amisJouerAvec", amisJouerAvec);
		model.addAttribute("sm", sm);
		model.addAttribute("nAmisJouerAvec", nAmisJouerAvec);
		
		return "challengesAJouer";
		
	}
	@RequestMapping(value="/changerPhoto")
	public String changerPhoto(Model model ,HttpServletRequest request, SocialModel sm, MultipartFile file)throws IOException{
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		if(!file.isEmpty()){
//			pour savoir si c'est une image
			BufferedImage bi = ImageIO.read(file.getInputStream());
			
		
			sm.setPhoto(file.getBytes());
			sm.setNomPhoto(file.getOriginalFilename());
		}
		metier.ajouterPhot(id, sm.getPhoto(), sm.getNomPhoto());
		
		model.addAttribute("id", id);
		model.addAttribute("sm", sm);
		return "user_profile";
		
	}
	@RequestMapping(value="/challengerInscrit")
	public String challengerAmi(Model model ,HttpServletRequest request, SocialModel sm){
		String idAmiS = request.getParameter("id");
		Long idAmi = (long) Integer.parseInt(idAmiS);
		
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		metier.challengerChallenge(id, idAmi);
		model.addAttribute("sm", sm);
		return "mesAmis";
		
	}
	@RequestMapping(value="rechecheAutoComplete")
	public String rechecheAutoComplete(Model model ,HttpServletRequest request, SocialModel sm){
		System.out.println("la valeur ecrite est "+request.getParameter("elem"));
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		List<Friend> mesAmisLike = metier.mesAmisLike(id, request.getParameter("elem"));
		
		for (Friend friend : mesAmisLike) {
			System.out.println("le prenom de l'ami est "+friend.getPrenom());
		}
		
		model.addAttribute("mesAmisLike", mesAmisLike);
		model.addAttribute("nbAmis", mesAmisLike.size());
		return "rechecheAutoComplete";
		
	}
	@RequestMapping(value="amiProfile")
	public String amiProfile(Model model ,HttpServletRequest request, SocialModel sm){
		Long idAmi = Long.valueOf(request.getParameter("id"));
		
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		Friend ami = metier.getFriend(idAmi);
		Friend moi = metier.getFriend(id);
		boolean estAmi = false;
		if(moi.getFriends().contains(ami)){
			estAmi = true;
		}
		int nbAmisAmi = ami.getFriends().size();
		int nbChallengesAmi = ami.getMesChallengesJoues().size()+ ami.getMesChallengesJouesPenduDico().size()+ ami.getMesChallengesJouesPenduSujets().size();
		int nbSolosAmi = ami.getAbcsolo().size()+ ami.getPenduDicoSolos().size() + ami.getPenduSujetsSolos().size();
		
		model.addAttribute("estAmi", estAmi);
		model.addAttribute("nbAmisAmi", nbAmisAmi);
		model.addAttribute("nbChallengesAmi", nbChallengesAmi);
		model.addAttribute("nbSolosAmi", nbSolosAmi);
		model.addAttribute("moi", moi);
		model.addAttribute("ami", ami);
		model.addAttribute("idAmi", idAmi);
		return "amiProfile";
		
	}
	@RequestMapping(value="mdpOublie")
	public String mdpOblie(Model model ,HttpServletRequest request, SocialModel sm, Inscription inscription, SendEmail sendEmail) throws NoSuchAlgorithmException{
		String email = request.getParameter("email");
		String mdpTemporaire = null;
		String mdpTemporaireCrypte = null;
		
		if (email != null) {
//			savoir si l'email n'existe pas en BDD, on informe à l'utilisateur
			Friend friendExiste = 
					metier.emailExiste(email);
			if (friendExiste == null) {
				model.addAttribute("emailInexistant", "désolé, cet email n'existe pas dans note base de données");
				return "mdpOublie";
			}
				
//				création d'un mot de passe temporaire pour l'utilisateur, on le crypte, on change celui qui existe ne BDD
//				et on l'envoie à l'utilisateur =========================================================================================================================================
				
				 mdpTemporaire = randomString(7 );
//				pour le cryptage du mdp temporaire
				String passCript = mdpTemporaire;

		        MessageDigest md = MessageDigest.getInstance("MD5");
		        md.update(passCript.getBytes());

		        byte byteData[] = md.digest();

		        //convert the byte to hex format method 
		        StringBuffer sb = new StringBuffer();
		        for (int i = 0; i < byteData.length; i++) {
		         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		        }

		        System.out.println("Digest(in hex format):: " + sb.toString());
		        mdpTemporaireCrypte = sb.toString();
//		        on change le mdp de l'utilisateur dans la BDD en faisant une requete par rapport à son email
		        metier.changerMdp(email, sb.toString());
				
//		        envoi du mot de passe temporaire à l'utilisateur
		        sendEmail = new SendEmail();
				sendEmail.setCode(mdpTemporaire);
				sendEmail.setEmail(email);
				sendEmail.sendEmail();
		        
				model.addAttribute("emailEnvoye", "Nous venons de vous envoyer un mail avec un mot de passe temporaire"
						+ "que nous vous invitons à changer après votre connexion sur le site.");
		}else {
			return "mdpOublie";
		}
		
		return "index";
		
	}
	private String randomString(int len) {
		StringBuilder sb = new StringBuilder( len );
		   for( int i = 0; i < len; i++ ) 
		      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
		   return sb.toString();
	}

	@RequestMapping(value="contactezNous")
	public String contactezNous(Model model ,HttpServletRequest request, SocialModel sm, Inscription inscription){
//		recupération des infos saisies pas l'utilisateur
		String nom = request.getParameter("name");
		String email = request.getParameter("Email");
		String sujet = request.getParameter("subject");
		String message = request.getParameter("message");
		
//		envoi du message à l'administrateur
		metier.sendMessageConact(1L, message, sujet, email, nom, true);
		
		return "index";
		
	}
}
