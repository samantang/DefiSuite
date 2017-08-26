package com.joue.avectesamis.metier;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joue.avectesamis.dao.ChallengeDao;
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



@Transactional
@Service
public class ChallengeMetierImpl implements ChallengeMetier{
//	@Autowired
	@Autowired
	private ChallengeDao dao;
	
	
	

	/**
	 * 
	 */
	public ChallengeMetierImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public Friend monProfil(Long moi) {
		// TODO Auto-generated method stub
		System.out.println("l'id en session dans le metier  ======================="+moi);
		return dao.monProfil(moi);
	}

	@Override
	public Friend getFriend(Long id) {
		// TODO Auto-generated method stub
		return dao.getFriend(id);
	}

	@Override
	public void enregistreFriend(Friend f) {
		// TODO Auto-generated method stub
		dao.enregistreFriend(f);
		
	}

	@Override
	public List<Friend> listeToutLeMonde() {
		// TODO Auto-generated method stub
		return dao.listeToutLeMonde();
	}

	@Override
	public void envoyerDemandeAmi(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.envoyerDemandeAmi(moi, ami);
	}

	@Override
	public void accepterAmi(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.accepterAmi(moi, ami);
		
	}

	@Override
	public void supprimerAmi(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.supprimerAmi(moi, ami);
		
	}

	@Override
	public void rejeterAmi(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.rejeterAmi(moi, ami);
		
	}

	@Override
	public int nombreDemandeAmiRecues(Long moi) {
		// TODO Auto-generated method stub
		return dao.nombreDemandeAmiRecues(moi);
	}

	@Override
	public List<Friend> demandesRecues(Long moi) {
		// TODO Auto-generated method stub
		return dao.demandesRecues(moi);
	}

	@Override
	public List<Friend> mesAmis(Long moi) {
		// TODO Auto-generated method stub
		return dao.mesAmis(moi);
	}

	@Override
	public void posterPost(Long moi, String messagePost) {
		// TODO Auto-generated method stub
		dao.posterPost(moi, messagePost);
		
	}

	@Override
	public void commenterPost(Long moi, Long p, String commentaire) {
		// TODO Auto-generated method stub
		dao.commenterPost(moi, p, commentaire);
		
	}

	@Override
	public void aimerPost(Long moi, Long idPost) {
		// TODO Auto-generated method stub
		dao.aimerPost(moi, idPost);
	}

	@Override
	public void neplusAimerPost(Long moi, Long idPost) {
		// TODO Auto-generated method stub
		dao.neplusAimerPost(moi, idPost);
		
	}

	@Override
	public void supprimerPost(Long moi, Long idPost) {
		// TODO Auto-generated method stub
		dao.supprimerPost(moi, idPost);
		
	}

	@Override
	public int compterNBlikePost(Long p) {
		// TODO Auto-generated method stub
		return dao.compterNBlikePost(p);
	}

	@Override
	public void envoyerMessage(Long moi, Long m, String mes) {
		// TODO Auto-generated method stub
		dao.envoyerMessage(moi, m, mes);
	}

	@Override
	public List<Message> messagesEnvoyes(Long m) {
		// TODO Auto-generated method stub
		return dao.messagesEnvoyes(m);
	}

	@Override
	public List<Message> messagesRecus(Long m) {
		// TODO Auto-generated method stub
		return dao.messagesRecus(m);
	}

	@Override
	public void envoyerChallenge(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.envoyerChallenge(moi, ami);;
		
	}

	@Override
	public List<Friend> demandesChallengesRecus(Long m) {
		// TODO Auto-generated method stub
		return dao.demandesChallengesRecus(m);
	}

//	@Override
//	public void enregistrerChallenge(Long moi, Long ami, Abc_Challenge c) {
//		// TODO Auto-generated method stub
//		dao.enregistrerChallenge(moi, ami, c);
//		
//	}

	

	@Override
	public int nbChallengeRecus(Long m) {
		// TODO Auto-generated method stub
		return dao.nbChallengeRecus(m);
	}

	@Override
	public void creerAlbum(Long m) {
		// TODO Auto-generated method stub
		dao.creerAlbum(m);
		
	}

	@Override
	public List<Album> mesAlbums(Long m) {
		// TODO Auto-generated method stub
		return dao.mesAlbums(m);
	}

	/**
	 * @return the dao
	 */
	public ChallengeDao getDao() {
		return dao;
	}

	/**
	 * @param dao the dao to set
	 */
	
	public void setDao(ChallengeDao dao) {
		this.dao = dao;
	}

	@Override
	public Friend metAJour(Friend moi) {
		// TODO Auto-generated method stub
		return dao.metAJour(moi);
	}

	@Override
	public List<Post> getPosts() {
		// TODO Auto-generated method stub
		return dao.getPosts();
	}

	@Override
	public List<Comment> getComments() {
		// TODO Auto-generated method stub
		return dao.getComments();
	}

	@Override
	public void saveAbcSolo(Long m, AbcSolo abc, AbcSoloJeux abcjeu) {
		// TODO Auto-generated method stub
		dao.saveAbcSolo(m, abc, abcjeu);
	}

	@Override
	public List<AbcSolo> getMesSolos(Long m) {
		// TODO Auto-generated method stub
		return dao.getMesSolos(m);
		
	}

	@Override
	public List<President> getPresidents(char lettre) {
		// TODO Auto-generated method stub
		return dao.getPresidents(lettre);
	}

	@Override
	public List<Pays_Capitale> getPays(char lettre) {
		// TODO Auto-generated method stub
		return dao.getPays(lettre);
	}

	@Override
	public List<Pays_Capitale> getCapitales(char lettre) {
		// TODO Auto-generated method stub
		return dao.getCapitales(lettre);
	}

	@Override
	public List<Agglo> getAgglos(char lettre) {
		// TODO Auto-generated method stub
		return dao.getAgglos(lettre);
	}

	@Override
	public List<Animaux> getAnimaux(char lettre) {
		// TODO Auto-generated method stub
		return dao.getAnimaux(lettre);
	}

	@Override
	public List<APresident> getAPresidents(char lettre) {
		// TODO Auto-generated method stub
		return dao.getAPresidents(lettre);
	}

	@Override
	public List<Nobels> getNobels(char lettre) {
		// TODO Auto-generated method stub
		return dao.getNobels(lettre);
	}

	@Override
	public List<VilleFrance> getVillesFrance(char lettre) {
		// TODO Auto-generated method stub
		return dao.getVillesFrance(lettre);
	}

	@Override
	public List<Artistes> getArtistes(char lettre) {
		// TODO Auto-generated method stub
		return dao.getArtistes(lettre);
	}

	@Override
	public Friend getFriendByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.getFriendByEmail(email);
	}

	@Override
	public void accepterChallenge(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.accepterChallenge(moi, ami);
		
	}

	@Override
	public void saveChallenge(Long m, Long a, AbcChallenge challenge) {
		// TODO Auto-generated method stub
		dao.saveChallenge(m, a, challenge);
		
	}

	@Override
	public List<Friend> mesChallengesRecus(Long moi) {
		// TODO Auto-generated method stub
		return dao.mesChallengesRecus(moi);
	}

	@Override
	public List<Friend> mesChallengesEnvoyes(Long moi) {
		// TODO Auto-generated method stub
		return dao.mesChallengesEnvoyes(moi);
	}

	@Override
	public List<Friend> mesChallengesEnAttentes(Long moi) {
		// TODO Auto-generated method stub
		return dao.mesChallengesEnAttentes(moi);
	}

	@Override
	public String getCodeAttenteMoiAmi(Long moi, Long ami) {
		// TODO Auto-generated method stub
		return dao.getCodeAttenteMoiAmi(moi, ami);
	}

	@Override
	public String getCodeAttenteAmiMoi(Long moi, Long ami) {
		// TODO Auto-generated method stub
		return dao.getCodeAttenteAmiMoi(moi, ami);
	}

	@Override
	public String getCodeJoueAmiMoi(Long moi, Long ami) {
		// TODO Auto-generated method stub
		return dao.getCodeJoueAmiMoi(moi, ami);
	}

	@Override
	public void supprimerSolo(Long id) {
		// TODO Auto-generated method stub
		dao.supprimerSolo(id);
	}

	@Override
	public void posterPost(Post p) {
		// TODO Auto-generated method stub
		dao.posterPost(p);
	}

	@Override
	public void pubierSolo(Long idjeu, Long m) {
		// TODO Auto-generated method stub
		dao.pubierSolo(idjeu, m);
	}

	@Override
	public List<AbcChallenge> mesChallengesJoues(Long moi) {
		// TODO Auto-generated method stub
		return dao.mesChallengesJoues(moi);
	}

	@Override
	public List<AbcSoloJeux> mesDerniersSolo(Long moi) {
		// TODO Auto-generated method stub
		return dao.mesDerniersSolo(moi);
	}

	@Override
	public List<AbcChallenge> mesDerniersChallenges(Long moi) {
		// TODO Auto-generated method stub
		return dao.mesDerniersChallenges(moi);
	}

	@Override
	public List<Friend> amisAnnulerDemande(Long moi) {
		// TODO Auto-generated method stub
		return dao.amisAnnulerDemande(moi);
	}

	@Override
	public List<Friend> amisAccepterDemande(Long moi) {
		// TODO Auto-generated method stub
		return dao.amisAccepterDemande(moi);
	}

	@Override
	public List<Friend> amisEnvoyerDemande(Long moi) {
		// TODO Auto-generated method stub
		return dao.amisEnvoyerDemande(moi);
	}

	@Override
	public List<Friend> amisJouerAvec(Long moi) {
		// TODO Auto-generated method stub
		return dao.amisJouerAvec(moi);
	}

	@Override
	public void annulerEnvoiChallenge(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.annulerEnvoiChallenge(moi, ami);
	}

	@Override
	public void refuserChallenge(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.refuserChallenge(moi, ami);
		
	}

	@Override
	public void jouerChallenge(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.jouerChallenge(moi, ami);
		
	}

	@Override
	public void challengerChallenge(Long moi, Long ami) {
		// TODO Auto-generated method stub
		dao.challengerChallenge(moi, ami);
		
	}

	@Override
	public AbcSolo detailsSolo(Long id) {
		// TODO Auto-generated method stub
		return dao.detailsSolo(id);
	}

	@Override
	public void ajouterPhot(Long id, byte[] photo, String nomPhoto) {
		// TODO Auto-generated method stub
		dao.ajouterPhot(id, photo, nomPhoto);
		
	}

	@Override
	public List<Friend> tousLesInscrits() {
		// TODO Auto-generated method stub
		return dao.tousLesInscrits();
	}

	@Override
	public AbcChallenge getAbcChallengeById(Long id) {
		// TODO Auto-generated method stub
		return dao.getAbcChallengeById(id);
	}

	@Override
	public AbcChallenge getMonChallenge(Long id, Long idJeu) {
		// TODO Auto-generated method stub
		return dao.getMonChallenge(id, idJeu);
	}

	@Override
	public List<Friend> mesAmisLike(Long id, String parameter) {
		// TODO Auto-generated method stub
		return dao.mesAmisLike(id, parameter);
	}

	@Override
	public void posterPost(Long id, String message, Post post) {
		// TODO Auto-generated method stub
		dao.posterPost(id, message, post);
	}

	@Override
	public void publierChallenge(AbcChallenge challenge) {
		dao.publierChallenge(challenge);
	}

	@Override
	public void sendMessageConact(long l, String message, String sujet, String email, String nom, boolean b) {
		dao.sendMessageConact( l,  message,  sujet,  email,  nom,  b);
		
	}

	@Override
	public Friend getMotDePasse(String email) {
		// TODO Auto-generated method stub
		return dao.getMotDePasse(email);
	}

	@Override
	public Friend emailExiste(String email) {
		// TODO Auto-generated method stub
		return dao.mailExiste(email);
	}

	@Override
	public void changerMdp(String email, String string) {
		// TODO Auto-generated method stub
		dao.changerMdp(email, string);
	}

	@Override
	public void annulerEnvoiDemandeAmi(Long id, Long idAmi) {
		dao.annulerEnvoiDemandeAmi(id, idAmi);
		
	}

	@Override
	public void refuserDemandeAmi(Long id, Long idAmi) {
		dao.refuserDemandeAmi(id, idAmi);
		
	}

	
	

}
