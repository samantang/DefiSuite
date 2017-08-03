package com.joue.avectesamis.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.joue.avectesamis.entites.AbcChallenge;
import com.joue.avectesamis.entites.AbcSolo;
import com.joue.avectesamis.entites.AbcSoloJeux;
import com.joue.avectesamis.entites.Album;
import com.joue.avectesamis.entites.Comment;
import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.Message;
import com.joue.avectesamis.entites.Post;
import com.joue.avectesamis.entites.jeux.APresident;
import com.joue.avectesamis.entites.jeux.Agglo;
import com.joue.avectesamis.entites.jeux.Animaux;
import com.joue.avectesamis.entites.jeux.Artistes;
import com.joue.avectesamis.entites.jeux.Nobels;
import com.joue.avectesamis.entites.jeux.Pays_Capitale;
import com.joue.avectesamis.entites.jeux.President;
import com.joue.avectesamis.entites.jeux.VilleFrance;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoChallenge;

@Transactional
@Repository
public class ChallengeDaoImpl implements ChallengeDao {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Friend monProfil(Long m) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		return moi;

	}
	

	/**
	 * 
	 */
	public ChallengeDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}


	/**
	 * @return the em
	 */
	public EntityManager getEm() {
		return em;
	}


	/**
	 * @param em the em to set
	 */
	public void setEm(EntityManager em) {
		this.em = em;
	}


	@Override
	public Friend getFriend(Long id) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, id);
		return moi;
	}

	@Override
	public void enregistreFriend(Friend f) {
		// TODO Auto-generated method stub
		em.persist(f);
		
	}

	@Override
	public List<Friend> listeToutLeMonde() {
		// TODO Auto-generated method stub
		Friend f = new Friend();
		Query req = em.createQuery("select f from Friend f");
		return req.getResultList();
	}

	@Override
	public void envoyerDemandeAmi(Long m, Long a) {
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		
		
		moi.getEnvoyees().add(ami);
		ami.getRecues().add(moi);
		
		
		em.persist(moi);
		em.persist(ami);

	}
	@Override
	public boolean estAmiAvec(Long m, Long a){
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		if (moi.getFriends().contains(ami)) {
			return true;
		}
		return false;
		
	}

	@Override
	public void accepterAmi(Long m, Long a) {
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		moi.getRecues().remove(ami);
		moi.getEnvoyees().remove(ami);
		moi.getFriends().add(ami);
		
		ami.getEnvoyees().remove(moi);
		ami.getRecues().remove(moi);
		ami.getFriends().add(moi);
		
		em.persist(moi);
		em.persist(ami);

	}

	@Override
	public void supprimerAmi(Long m, Long a) {
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		moi.getFriends().remove(ami);
		ami.getFriends().remove(moi);

	}

	@Override
	public void rejeterAmi(Long m, Long a) {

		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		moi.getRecues().remove(ami);
		ami.getEnvoyees().remove(moi);

	}

	@Override
	public int nombreDemandeAmiRecues(Long m) {
		Friend moi = em.find(Friend.class, m);
		return moi.getRecues().size();
	}

	@Override
	public List<Friend> demandesRecues(Long m) {
		Friend moi = em.find(Friend.class, m);
		return (List<Friend>) moi.getFriends();
	}

	@Override
	public List<Friend> mesAmis(Long moi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void posterPost(Long m, String messagePost, Post p) {
		
		Friend moi = em.find(Friend.class, m);
		 em.persist(p);
		 moi.getPosts().add(p);
		 p.setFriendpost(moi);
		 em.persist(p);
		 em.persist(moi);

	}

	@Override
	@Transactional
	public void commenterPost(Long m, Long idPost, String com) {
		// TODO Auto-generated method stub
		Post post = em.find(Post.class, idPost);
		Friend moi = em.find(Friend.class, m);
		Comment comment = new Comment(com, new Date());
		
		em.persist(comment);
		
		comment.setPost(post);
//		comment.getFriends().add(moi);
		post.getComments().add(comment);
//		post.setFriendpost(moi);
		moi.getComments().add(comment);		
		
		
		
		em.merge(post);
		em.persist(comment);
		em.persist(moi);

	}

	@Override
	@Transactional
	public void aimerPost(Long m, Long idPost) {
		// TODO Auto-generated method stub
//		Likes l = new Likes();
		Friend moi = em.find(Friend.class, m);
		Post p = em.find(Post.class, idPost);
		
//		si je n'ai pas encore aimer ce poste
		if(!moi.getPosts().contains(p)){
			System.out.println(" je n'ai pas encore aim� ce post -----");
			p.setNbLikesPost(p.getNbLikesPost()+1);
			p.setFriendpost(moi);
			moi.getPosts().add(p);
//			em.persist(l);
			
//			p.getLikes().add(l);
//			l.getFriends().add(moi);
			
			em.merge(moi);
			em.merge(p);
//			em.merge(l);
			
		}
		
		
	}

	@Override
	@Transactional
	public void neplusAimerPost(Long m, Long idPost) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
//		Likes l = em.find(Likes.class, idLike);
		Post p = em.find(Post.class, idPost);
		
//		si j'avais dej� aime ce poste
		if(moi.getPosts().contains(p)){
		p.setNbLikesPost(p.getNbLikesPost()-1);
		moi.getPosts().remove(p);
		p.setFriendpost(null);
		
//		p.getLikes().remove(l);
//		l.getFriends().remove(moi);
//		em.remove(l);
		em.merge(moi);
		em.merge(p);
		
		}
	}

	@Override
	public void supprimerPost(Long m, Long idPost) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		Post p = em.find(Post.class, idPost);
		moi.getPosts().remove(p);
		em.remove(p);

	}

	@Override
	public int compterNBlikePost(Long idPost) {
		// TODO Auto-generated method stub
		Post p = em.find(Post.class, idPost);
		return p.getLikes().size();
	}

	@Override
	public void envoyerMessage(Long m, Long a, String mes) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		Message message = new Message(mes);
		
		ami.getMessages().add(message);
		
		System.out.println("pas encore fini cette methode");

	}

	@Override
	public List<Message> messagesEnvoyes(Long m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> messagesRecus(Long m) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public List<Friend> demandesChallengesRecus(Long m) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		return (List<Friend>) moi.getChallengerecus();
	}

//	@Override
//	public void enregistrerChallenge(Long m, Long a, Abc_Challenge c) {
//		// TODO Auto-generated method stub
//		Friend moi = em.find(Friend.class, m);
//		Friend ami = em.find(Friend.class, a);
//
//	}

	

	@Override
	public int nbChallengeRecus(Long m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void creerAlbum(Long m) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Album> mesAlbums(Long m) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Friend metAJour(Friend moi) {
		// TODO Auto-generated method stub
		return em.merge(moi);
	}


	@Override
	public List<Post> getPosts() {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select p from Post p order by p.date desc");
		return req.getResultList();
	}


	@Override
	public List<Comment> getComments() {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from Comment c order by c.date desc");
		return req.getResultList();
	}


	@Override
	public void saveAbcSolo(Long m, AbcSolo abc, AbcSoloJeux abcjeu) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		
		em.persist(abcjeu);
		em.flush();
		Long idAbcjeu = abcjeu.getId();
		AbcSoloJeux solojeu = em.find(AbcSoloJeux.class, idAbcjeu);
		System.out.println("l'id de l'element qui vient d'etre ins�rer abcjeu "+abcjeu.getId());
		
		
		
		abc.setAbcsolojeux(solojeu);
		em.persist(abc);
		em.flush();
		System.out.println("l'id de l'element qui vient d'etre ins�rer abc: "+abc.getId());
		Long idAbc = abc.getId();
		AbcSolo solo = em.find(AbcSolo.class, idAbc);
		
		
		
		
//		AbcSolo solo = em.find(AbcSolo.class, abc);
//		AbcSoloJeux solojeu = em.find(AbcSoloJeux.class, abcjeu);
		moi.getAbcsolo().add(solo);
		solo.setAbcsolojeux(solojeu);
		solo.setFriend(moi);
		
		em.merge(solojeu);
		em.merge(solo);
		em.merge(moi);
		
		
		
	}


	@Override
	public List<AbcSolo> getMesSolos(Long m) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		List<AbcSolo>mesSolos=(List<AbcSolo>) moi.getAbcsolo();
//		AbcSolo solo =new AbcSolo();
//		System.out.println("avant le for =======================================");
//		for(int i=0; i<mesSolos.size(); i++){
//			solo = mesSolos.get(i);
//			System.out.println("l'index de mon solo est ====================================================== "+solo.getId());
//		}
		return mesSolos;
		
		
	}


	@Override
	public List<President> getPresidents(char lettre) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from President c where c.nom like'"+lettre+"%'" );
//		req.setParameter("x", ""+ lettre+"%");
		return req.getResultList();
	}


	@Override
	public List<Pays_Capitale> getPays(char lettre) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from Pays_Capitale c where c.pays like'"+lettre+"%' ");
		return req.getResultList();
	}


	@Override
	public List<Pays_Capitale> getCapitales(char lettre) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from Pays_Capitale c where c.capitale like'"+lettre+"%' ");
		return req.getResultList();
	}


	@Override
	public List<Agglo> getAgglos(char lettre) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from Agglo c where c.nom like'"+lettre+"%'");
		return req.getResultList();
	}


	@Override
	public List<Animaux> getAnimaux(char lettre) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from Animaux c where c.nom like'"+lettre+"%' ");
		return req.getResultList();
	}


	@Override
	public List<APresident> getAPresidents(char lettre) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from APresident c where c.nom like'"+lettre+"%'");
		return req.getResultList();
	}


	@Override
	public List<Nobels> getNobels(char lettre) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from Nobels c where c.nom like'"+lettre+"%' ");
		return req.getResultList();
	}


	@Override
	public List<VilleFrance> getVillesFrance(char lettre) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from VilleFrance c where c.nom like'"+lettre+"%' ");
		return req.getResultList();
	}


	@Override
	public List<Artistes> getArtistes(char lettre) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select c from Artistes c where c.nom like'"+lettre+"%' ");
		return req.getResultList();
	}


	@Override
	public Friend getFriendByEmail(String email) {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select f from Friend f where f.email='"+email+"' ");
		return (Friend) req;
	}
	
	@Override
	public void envoyerChallenge(Long m, Long a) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
//		pour le code qui indentifiera cette demande
		Integer random =  (int) (Math.random()*(1-100000)+1);
		String nom = moi.getNom();
		String randomString = random.toString();
		String code = nom+randomString;
		System.out.println("le code est ========== "+code);
		
		moi.getChallengesEnvoyes().put(ami, code);
		ami.getChallengesRecus().put(moi, code);
//		moi.getChallengeenvoiyes().add(ami);
//		ami.getChallengerecus().add(moi);
		em.merge(moi);
		em.merge(ami);

	}

	@Override
	public void accepterChallenge(Long m, Long a) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		String code = moi.getChallengesRecus().get(ami);
		moi.getChallengeEnAttentes().put(ami, code);
		ami.getChallengeEnAttentes().put(moi, code);
		
		moi.getChallengesRecus().remove(ami);
		ami.getChallengesEnvoyes().remove(moi);
		
		em.merge(moi);
		em.merge(ami);
		
	}

	@Override
	public void saveChallenge(Long m, Long a, AbcChallenge challenge) {
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		String code = moi.getChallengeEnAttentes().get(ami);		
		
//		si l'ami a dejà joué, alors on recupère les informations de son jeu pour les rajouter dans le jeu qui me concerne
//		puis on rajoute les informations de mon jeu dans son jeu
		
		String codeAttenteMoiAmi = moi.getChallengeEnAttentes().get(ami);
		String codeAttenteAmiMoi = ami.getChallengeEnAttentes().get(moi);
		if (codeAttenteMoiAmi.equals(codeAttenteAmiMoi)) {
//			alors il n'a pas encore joue
			challenge.setCodeIndentification(code);
			challenge.setFriend(moi);
			challenge.setMonFriend(ami);
			em.persist(challenge);
			
			moi.getMesChallengesJoues().add(challenge);
			moi.getChallengeEnAttentes().remove(ami);
			
			moi.getChallengeEnJoues().put(ami, code);
			em.merge(moi);
			
		} else {
//			alors il a deja joue
			AbcChallenge challengeAmi;
			Set<String> elements;
//			on fait une requete pour recuperer le challenge à partir du code d'identification ( mis a jour)
			Query req = em.createQuery("select p from AbcChallenge p  where p.codeIndentification='"+codeAttenteMoiAmi+"'");
			challengeAmi = (AbcChallenge) req.getSingleResult();
//			ajout des informations de mon jeu dans le jeu de mon ami ===================================================
			challengeAmi.setScoreAmi(challenge.getScore());
			challengeAmi.setTimeOutAmi(challenge.isTimeOutMoi());
			challengeAmi.setTempsRestantAmi(challenge.getTempsRestant());
			challengeAmi.setDateStringAmi(challenge.getDateString());
			challengeAmi.setAideAmi(challenge.isAide());
			challengeAmi.setAmiJoue(true);
			
			if (!challenge.getPays().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challenge.getPays());
				challengeAmi.setPaysAmi(elements);
//				challengeAmi.getPaysAmi().addAll(challenge.getPays());
			}
			if (!challenge.getCapitale().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challenge.getCapitale());
				challengeAmi.setCapitaleAmi(elements);
//				challengeAmi.getCapitaleAmi().addAll(challenge.getCapitale());
			}
			if (!challenge.getNobel().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challenge.getNobel());
				challengeAmi.setNobelAmi(elements);
//				challengeAmi.getNobelAmi().addAll(challenge.getNobel());
			}
			if (!challenge.getPresident().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challenge.getPresident());
				challengeAmi.setPresidentAmi(elements);
//				challengeAmi.getPresidentAmi().addAll(challenge.getPresident());
			}
			if (!challenge.getArtiste().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challenge.getArtiste());
				challengeAmi.setArtisteAmi(elements);
//				challengeAmi.getArtisteAmi().addAll(challenge.getArtiste());
			}
			if (!challenge.getAgglo().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challenge.getAgglo());
				challengeAmi.setAggloAmi(elements);
//				challengeAmi.getAggloAmi().addAll(challenge.getAgglo());
			}
			if (!challenge.getAnimal().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challenge.getAnimal());
				challengeAmi.setAnimalAmi(elements);
			}
			
//			enregistrement du challenge de l'ami
			em.merge(challengeAmi);
			
//			ajout des informations du jeu de mon ami dans mon jeu =========================================================
			challenge.setScoreAmi(challengeAmi.getScore());
			challenge.setTimeOutAmi(challengeAmi.isTimeOutMoi());
			challenge.setTempsRestantAmi(challengeAmi.getTempsRestant());
			challenge.setDateStringAmi(challengeAmi.getDateString());
			challenge.setAideAmi(challengeAmi.isAide());
			challenge.setAmiJoue(true);
			
			
			if (!challengeAmi.getPays().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challengeAmi.getPays());
//				challenge.getPaysAmi().addAll(challengeAmi.getPays());
				challenge.setPaysAmi(elements);
			}
			if (!challengeAmi.getCapitale().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challengeAmi.getCapitale());
//				challenge.getCapitaleAmi().addAll(challengeAmi.getCapitale());
				challenge.setCapitaleAmi(elements);
			}
			if (!challengeAmi.getNobel().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challengeAmi.getPays());
//				challenge.getNobelAmi().addAll(challengeAmi.getNobel());
				challenge.setNobelAmi(elements);
			}
			if (!challengeAmi.getPresident().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challengeAmi.getPresident());
//				challenge.getPresidentAmi().addAll(challengeAmi.getPresident());
				challenge.setPresidentAmi(elements);
			}
			if (!challengeAmi.getArtiste().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challengeAmi.getArtiste());
//				challenge.getArtisteAmi().addAll(challengeAmi.getArtiste());
				challenge.setArtisteAmi(elements);
			}
			if (!challengeAmi.getAgglo().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challengeAmi.getAgglo());
//				challenge.getAggloAmi().addAll(challengeAmi.getAgglo());
				challenge.setAggloAmi(elements);
			}
			if (!challengeAmi.getAnimal().equals(null)) {
				elements = new HashSet<String>();
				elements.addAll(challengeAmi.getAnimal());
//				challenge.getAnimalAmi().addAll(challengeAmi.getAnimal());
				challenge.setAggloAmi(elements);
			}
			
			challenge.setCodeIndentification(code);
			challenge.setFriend(moi);
			challenge.setMonFriend(ami);
			em.persist(challenge);
			
			moi.getMesChallengesJoues().add(challenge);
			moi.getChallengeEnAttentes().remove(ami);
			
			moi.getChallengeEnJoues().put(ami, code);
			em.merge(moi);
		}
		
//		em.merge(moi);
		
	}
	@Override
	public List<Friend> mesChallengesRecus(Long m) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
//		recup�ration des amis dans la map pour les mettre dans une list
		List<Friend> mesChallenges = new ArrayList<Friend>();
//		List<String> valeurs = new ArrayList<String>();
		Set<Entry<Friend, String>> setF = moi.getChallengesRecus().entrySet();
		Iterator<Entry<Friend, String>> it = setF.iterator();
		while(it.hasNext()){
			Entry<Friend, String> e = it.next();
			mesChallenges.add(e.getKey());
//			valeurs.add(e.getValue());
		}
		
		
		return mesChallenges;
	}


	@Override
	public List<Friend> mesChallengesEnvoyes(Long m) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
//		recup�ration des amis dans la map pour les mettre dans une list
		List<Friend> mesChallenges = new ArrayList<Friend>();
		Set<Entry<Friend, String>> setF = moi.getChallengesEnvoyes().entrySet();
		Iterator<Entry<Friend, String>> it = setF.iterator();
		while(it.hasNext()){
			Entry<Friend, String> e = it.next();
			mesChallenges.add(e.getKey());
		}
		
		
		return mesChallenges;
	}


	@Override
	public List<Friend> mesChallengesEnAttentes(Long m) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
//		recup�ration des amis dans la map pour les mettre dans une list
		List<Friend> mesChallenges = new ArrayList<Friend>();
		Set<Entry<Friend, String>> setF = moi.getChallengeEnAttentes().entrySet();
		Iterator<Entry<Friend, String>> it = setF.iterator();
		while(it.hasNext()){
			Entry<Friend, String> e = it.next();
			mesChallenges.add(e.getKey());
		}
		
		
		return mesChallenges;
	}


	@Override
	public String getCodeAttenteMoiAmi(Long m, Long a) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		
		return  moi.getChallengeEnAttentes().get(ami);
	}


	@Override
	public String getCodeAttenteAmiMoi(Long m, Long a) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		return ami.getChallengeEnAttentes().get(moi);
	}


	@Override
	public String getCodeJoueAmiMoi(Long m, Long a) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		return ami.getChallengeEnJoues().get(moi);
	}


	@Override
	public void supprimerSolo(Long id) {
		// TODO Auto-generated method stub
		AbcSolo solo = em.find(AbcSolo.class, id);
		em.remove(solo);
	
		System.out.println("l'id du solo � suppremer est: "+id);
		System.out.println("apr�s la suppression dans la DAO +++++++");
	}


	@Override
	public void posterPost(Post p) {
		// TODO Auto-generated method stub
		em.persist(p);
	}


	@Override
	public void pubierSolo(Long idjeu, Long m) {
		// TODO Auto-generated method stub
		AbcSoloJeux soloJeu = em.find(AbcSoloJeux.class, idjeu);
//		Date date = new Date();
		String aide = soloJeu.getHelp();
		if(aide.equals("oui")){
			aide = "avec de l'aide";
		}else {
			aide = "sans aide";
		}
		String lettre = soloJeu.getLettre();
		char lettreChar = soloJeu.getLettrechar();
		int score = soloJeu.getScore();
		int scoreMax = soloJeu.getScoreMax();
		
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date now = new Date();
		
		
		String message = " "+sdf.format(now)+", avec la lettre "+lettreChar+" j'ai eu un score de "+score+" sur "+scoreMax+" possible "+aide+"";
		
		
		Post post = new Post(message, now, true);
		Friend moi = em.find(Friend.class, m);
		em.persist(post);
		em.flush();
		Long id = post.getId();
		Post postAgain = em.find(Post.class, id);
		postAgain.setFriendpost(moi);
		moi.getPosts().add(postAgain);
		em.merge(postAgain);
		em.merge(moi);
	}


	@Override
	public List<AbcChallenge> mesChallengesJoues(Long m) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		moi.getMesChallengesJoues();
		
		return moi.getMesChallengesJoues();
	}


	@Override
	public List<AbcSoloJeux> mesDerniersSolo(Long m) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
//		List<AbcSoloJeux> mesSolos = moi.get
//		Query req = em.createQuery("select s from AbcSoloJeux where s.solo.friend.id="+m+" limit 10 ");
		return null;
	}


	@Override
	public List<AbcChallenge> mesDerniersChallenges(Long m) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		List<AbcChallenge> mesChallenges= moi.getMesChallengesJoues();
//		Query req = em.createQuery("select c from AbcChallenge where c.friend.id="+m+" limit 10 ");
		return mesChallenges;
	}
	
	@Override
	public List<Friend> tousLesInscrits() {
		// TODO Auto-generated method stub
		Query req = em.createQuery("select f from Friend f");
		return req.getResultList();
	}

	@Override
	public List<Friend> amisAnnulerDemande(Long m) {		
		
		Friend moi = em.find(Friend.class, m);
//		recup�ration des amis dans la map pour les mettre dans une list
		List<Friend> mesChallenges = new ArrayList<Friend>();
//		List<String> valeurs = new ArrayList<String>();
		Set<Entry<Friend, String>> setF = moi.getChallengesEnvoyes().entrySet();
		Iterator<Entry<Friend, String>> it = setF.iterator();
		while(it.hasNext()){
			Entry<Friend, String> e = it.next();
			mesChallenges.add(e.getKey());
//			valeurs.add(e.getValue());
		}
		
		return mesChallenges;
	}


	@Override
	public List<Friend> amisAccepterDemande(Long m) {
		Friend moi = em.find(Friend.class, m);
//		recup�ration des amis dans la map pour les mettre dans une list
		List<Friend> mesChallenges = new ArrayList<Friend>();
//		List<String> valeurs = new ArrayList<String>();
		Set<Entry<Friend, String>> setF = moi.getChallengesRecus().entrySet();
		Iterator<Entry<Friend, String>> it = setF.iterator();
		while(it.hasNext()){
			Entry<Friend, String> e = it.next();
			mesChallenges.add(e.getKey());
//			valeurs.add(e.getValue());
		}
		
		return mesChallenges;
	}


	

	@Override
	public List<Friend> amisJouerAvec(Long m) {
		Friend moi = em.find(Friend.class, m);
//		recup�ration des amis dans la map pour les mettre dans une list
		List<Friend> mesChallenges = new ArrayList<Friend>();
		Set<Entry<Friend, String>> setF = moi.getChallengeEnAttentes().entrySet();
		Iterator<Entry<Friend, String>> it = setF.iterator();
		while(it.hasNext()){
			Entry<Friend, String> e = it.next();
			mesChallenges.add(e.getKey());
		}
		
		
		return mesChallenges;
	}

	@Override
	public List<Friend> amisEnvoyerDemande(Long m) {
		Friend moi = em.find(Friend.class, m);
//		recup�ration de toutes les autres cat�gories d'amis, puis les soustraires de la liste compl�te des mes amis: il restera les amis � qui je peux envoyer une demande pour jouer
		List<Friend> mesAmisJouerAvec = amisJouerAvec(m);
		List<Friend> mesAmisAccepterDemande = amisAccepterDemande(m);
		List<Friend> mesAmisAnnulerDemande = amisAnnulerDemande(m);
		
//		liste de tous mes amis
		List<Friend> mesAmis= (List<Friend>) moi.getFriends();
//		mesAmis.removeAll(mesAmisJouerAvec);
//		mesAmis.removeAll(mesAmisAccepterDemande);
//		mesAmis.removeAll(mesAmisAnnulerDemande);
		
		return mesAmis;
	}


	@Override
	public void annulerEnvoiChallenge(Long m, Long a) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		moi.getChallengesEnvoyes().remove(ami);
		ami.getChallengesRecus().remove(moi);
		
		em.merge(moi);
		em.merge(ami);
	}


	@Override
	public void refuserChallenge(Long m, Long a) {
		Friend moi = em.find(Friend.class, m);
		Friend ami = em.find(Friend.class, a);
		
		moi.getChallengesRecus().remove(ami);
		ami.getChallengesEnvoyes().remove(moi);
		
		em.merge(moi);
		em.merge(ami);
	}
		

	@Override
	public void jouerChallenge(Long m, Long a) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void challengerChallenge(Long m, Long a) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public AbcSolo detailsSolo(Long id) {
		AbcSolo solo = em.find(AbcSolo.class, id);
		return solo;
	}


	@Override
	public void ajouterPhot(Long id, byte[] photo, String nomPhoto) {
		// TODO Auto-generated method stub
		Friend moi = em.find(Friend.class, id);
//		em.remove(moi.getPhoto());
		moi.setPhoto(photo);
		moi.setNomPhoto(nomPhoto);
		em.merge(moi);
	}


	@Override
	public AbcChallenge getAbcChallengeById(Long id) {
		// TODO Auto-generated method stub
		return em.find(AbcChallenge.class, id);
	}


	@Override
	public AbcChallenge getMonChallenge(Long id, Long idJeu) {
		// TODO Auto-generated method stub
		AbcChallenge challenge = em.find(AbcChallenge.class, idJeu);
		return challenge;
	}


	@Override
	public List<Friend> mesAmisLike(Long id, String parameter) {
		Query query = em.createQuery("select f from Friend f where f.prenom like"+"'"+parameter+"%'");
		return query.getResultList();
	}


	@Override
	public void posterPost(Long moi, String messagePost) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void publierChallenge(AbcChallenge challenge) {
		challenge.setPublie(true);
		em.merge(challenge);
	}


	@Override
	public void sendMessageConact(long l, String message, String sujet, String email, String nom, boolean b) {
		Friend admin = em.find(Friend.class, l);
		Message me = new  Message();
		me.setMessage(nom);
		me.setSujet(sujet);
		me.setContactezNous(true);
		me.setEmail(email);
		me.setNom(nom);
		
		admin.getMessages().add(me);
		me.setFriendpost(admin);
		
		em.persist(message);
		em.merge(me);
	}


	@Override
	public Friend getMotDePasse(String email) {
		Query query = em.createQuery("select f from Friend f where f.email = "+"'"+email+"%'");
		return (Friend) query.getSingleResult();
	}


	@Override
	public Friend mailExiste(String email) {
		Query query = em.createQuery("select f from Friend f where f.email = "+"'"+email+"%'");
		try {
			return  (Friend) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}


	@Override
	public void changerMdp(String email, String string) {
		System.out.println("l'email est ============ "+email);
		// TODO Auto-generated method stub
		Query req = em.createQuery("select f from Friend f where f.email='"+email+"' ");
		Friend friend = (Friend) req.getSingleResult();
		friend.setMdp(string);
		em.merge(friend);
	}

}
