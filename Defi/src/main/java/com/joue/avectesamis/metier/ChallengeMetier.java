package com.joue.avectesamis.metier;

import java.util.Collection;
import java.util.List;

import org.springframework.stereotype.Component;

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



public interface ChallengeMetier {

	public Friend monProfil(Long moi);
	public Friend getFriend(Long id);
	public void enregistreFriend(Friend f);
	public List<Friend> listeToutLeMonde();
	public Friend metAJour(Friend moi);
	public Friend getFriendByEmail(String email);
	public void ajouterPhot(Long id, byte [] photo, String nomPhoto);

	public void envoyerDemandeAmi(Long moi, Long ami);
	public void accepterAmi(Long moi, Long ami);
	public void supprimerAmi(Long moi, Long ami);
	public void rejeterAmi(Long moi, Long ami);
	public int nombreDemandeAmiRecues(Long moi);
	public List<Friend> demandesRecues (Long moi);
	public List<Friend> mesAmis (Long moi);
	
	public void posterPost(Long moi, String messagePost);
	public void posterPost(Post p);
	public void commenterPost(Long moi, Long p, String commentaire);
	public void aimerPost(Long moi, Long idPost);
	public void neplusAimerPost(Long moi, Long idPost);
	public void supprimerPost(Long moi, Long idPost);
	public int compterNBlikePost(Long p);
	public List<Post> getPosts();
	
	public void envoyerMessage(Long moi, Long m, String mes);
	public List<Message> messagesEnvoyes(Long m);
	public List<Message> messagesRecus(Long m);
	public List<AbcSoloJeux> mesDerniersSolo(Long moi);
	
//	public Collection<AbcChallenge> mesChallengesJou�s(Long moi);
	public List<AbcChallenge> mesDerniersChallenges(Long moi);
	public List<AbcChallenge> mesChallengesJoues(Long moi);
	public void envoyerChallenge(Long moi, Long ami);
	public List<Friend> demandesChallengesRecus(Long m);
//	public void enregistrerChallenge(Long moi, Long ami, Abc_Challenge c);
//	public List<Abc_Challenge>	mesChallenges(Long moi);
	public int nbChallengeRecus(Long m);
	public void accepterChallenge(Long moi, Long ami);
	public void saveChallenge(Long m, Long a, AbcChallenge challenge);
	public List<Friend>	mesChallengesRecus(Long moi);
	public List<Friend>	mesChallengesEnvoyes(Long moi);
	public List<Friend>	mesChallengesEnAttentes(Long moi);
	public String getCodeAttenteMoiAmi(Long moi, Long ami);
	public String getCodeAttenteAmiMoi(Long moi, Long ami);
	public String getCodeJoueAmiMoi(Long moi, Long ami);
//	les amis pour lesquels Annuler la demande
	public List<Friend> amisAnnulerDemande(Long moi);
//	les amis pour lesquels Accepter la demande
	public List<Friend> amisAccepterDemande(Long moi);
//	les amis pour lesquels Envoyer une demande
	public List<Friend> amisEnvoyerDemande(Long moi);
//	les amis avec lesquels Jouer
	public List<Friend> tousLesInscrits();
	public List<Friend> amisJouerAvec(Long moi);
	public void annulerEnvoiChallenge (Long moi, Long ami);
	public void refuserChallenge (Long moi, Long ami);
	public void jouerChallenge (Long moi, Long ami);
	public void challengerChallenge (Long moi, Long ami);
	public AbcChallenge getMonChallenge(Long id, Long idJeu);
	
	
	public void creerAlbum(Long m);
	public List<Album> mesAlbums(Long m);
	
	public List<Comment> getComments();
	
	
	public void saveAbcSolo(Long m, AbcSolo abc, AbcSoloJeux abcjeu);
	public List<AbcSolo> getMesSolos(Long m);
	public List<President> getPresidents(char lettre);
	public List<Pays_Capitale> getPays(char lettre);
	public List<Pays_Capitale> getCapitales(char lettre);
	public List<Agglo> getAgglos(char lettre);
	public List<Animaux> getAnimaux(char lettre);
	public List<APresident> getAPresidents(char lettre);
	public List<Nobels> getNobels(char lettre);
	public List<VilleFrance> getVillesFrance(char lettre);
	public List<Artistes> getArtistes(char lettre);
	public void supprimerSolo(Long id);
	public void pubierSolo(Long idjeu, Long m);
	public AbcSolo detailsSolo(Long id);
	public AbcChallenge getAbcChallengeById(Long id);
	public List<Friend> mesAmisLike(Long id, String parameter);
	public void posterPost(Long id, String message, Post post);
	public void publierChallenge(AbcChallenge challenge);
	public void sendMessageConact(long l, String message, String sujet, String email, String nom, boolean b);
	public Friend getMotDePasse(String email);
	public Friend emailExiste(String email);
	public void changerMdp(String email, String string);
	public void annulerEnvoiDemandeAmi(Long id, Long idAmi);
	public void refuserDemandeAmi(Long id, Long idAmi);
	
}
