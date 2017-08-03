package com.joue.avectesamis.models;

import java.util.ArrayList;
import java.util.List;

import com.joue.avectesamis.entites.Comment;
import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.Message;
import com.joue.avectesamis.entites.Post;


public class SocialModel {

	
//	infos utilisateur
	private Long id;
	private String nom;
	private String prenom;
	private String email;
	private int phone;
	private String genre;
	private String naissance;
	private String inscription;
	private String adresse;
	private String profession;
	private String statut;
	private String interets;
	private String pays;
	private String enLigne;
	private String dateInscription;
	private String etude;
	private String paysOrigine;
	private String paysActuel;
	private String villeOrigine;
	private String villeActuelle;
	private String interet;
	private String remail;
	private String rmobile;
	private String rphotos;
	private String mdp;
	private String mdpnouveau;
	private String mdpnouveauconfirme;
	private String messagePost;
	private int nombreLikePost;
	public String commentaire;
	public String commentaireCache;
	public Long idPost;
	private byte [] photo;
	private String nomPhoto;
	
	private Long idAmisOnline;
//	private List<Abc_Solo> abcSolos = new ArrayList<Abc_Solo>();
//	private List<Abc_Challenge> abcChallenges = new ArrayList<Abc_Challenge>();
	private List<Message> messages = new ArrayList<Message>();
	private List<Friend> mesAmis = new ArrayList<Friend>();
	private Friend moi = new Friend();
	private List<Post> posts= new ArrayList<Post>();
	private List<Comment> comments = new ArrayList<Comment>();
	
	
	
	
	
	
	
	/**
	 * @return the photo
	 */
	public byte[] getPhoto() {
		return photo;
	}
	/**
	 * @param photo the photo to set
	 */
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	/**
	 * @return the nomPhoto
	 */
	public String getNomPhoto() {
		return nomPhoto;
	}
	/**
	 * @param nomPhoto the nomPhoto to set
	 */
	public void setNomPhoto(String nomPhoto) {
		this.nomPhoto = nomPhoto;
	}
	/**
	 * @return the idPost
	 */
	public Long getIdPost() {
		return idPost;
	}
	/**
	 * @param idPost the idPost to set
	 */
	public void setIdPost(Long idPost) {
		this.idPost = idPost;
	}
	/**
	 * @return the commentaire
	 */
	public String getCommentaire() {
		return commentaire;
	}
	/**
	 * @param commentaire the commentaire to set
	 */
	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}
	/**
	 * @return the commentaireCache
	 */
	public String getCommentaireCache() {
		return commentaireCache;
	}
	/**
	 * @param commentaireCache the commentaireCache to set
	 */
	public void setCommentaireCache(String commentaireCache) {
		this.commentaireCache = commentaireCache;
	}
	/**
	 * @return the nombreLikePost
	 */
	public int getNombreLikePost() {
		return nombreLikePost;
	}
	/**
	 * @param nombreLikePost the nombreLikePost to set
	 */
	public void setNombreLikePost(int nombreLikePost) {
		this.nombreLikePost = nombreLikePost;
	}
	/**
	 * @return the comments
	 */
	public List<Comment> getComments() {
		return comments;
	}
	/**
	 * @param comments the comments to set
	 */
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	/**
	 * @return the posts
	 */
	public List<Post> getPosts() {
		return posts;
	}
	/**
	 * @param posts the posts to set
	 */
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	/**
	 * @return the messagePost
	 */
	public String getMessagePost() {
		return messagePost;
	}
	/**
	 * @param messagePost the messagePost to set
	 */
	public void setMessagePost(String messagePost) {
		this.messagePost = messagePost;
	}
	/**
	 * @return the mdpnouveauconfirme
	 */
	public String getMdpnouveauconfirme() {
		return mdpnouveauconfirme;
	}
	/**
	 * @param mdpnouveauconfirme the mdpnouveauconfirme to set
	 */
	public void setMdpnouveauconfirme(String mdpnouveauconfirme) {
		this.mdpnouveauconfirme = mdpnouveauconfirme;
	}
	/**
	 * @return the mdp
	 */
	public String getMdp() {
		return mdp;
	}
	/**
	 * @param mdp the mdp to set
	 */
	public void setMdp(String mdp) {
		this.mdp = mdp;
	}
	/**
	 * @return the mdpnouveau
	 */
	public String getMdpnouveau() {
		return mdpnouveau;
	}
	/**
	 * @param mdpnouveau the mdpnouveau to set
	 */
	public void setMdpnouveau(String mdpnouveau) {
		this.mdpnouveau = mdpnouveau;
	}
	/**
	 * @return the rmobile
	 */
	public String getRmobile() {
		return rmobile;
	}
	/**
	 * @param rmobile the rmobile to set
	 */
	public void setRmobile(String rmobile) {
		this.rmobile = rmobile;
	}
	/**
	 * @return the rphotos
	 */
	public String getRphotos() {
		return rphotos;
	}
	/**
	 * @param rphotos the rphotos to set
	 */
	public void setRphotos(String rphotos) {
		this.rphotos = rphotos;
	}
	/**
	 * @return the remail
	 */
	public String getRemail() {
		return remail;
	}
	/**
	 * @param remail the remail to set
	 */
	public void setRemail(String remail) {
		this.remail = remail;
	}
	/**
	 * @return the moi
	 */
	public Friend getMoi() {
		return moi;
	}
	/**
	 * @param moi the moi to set
	 */
	public void setMoi(Friend moi) {
		this.moi = moi;
	}
	/**
	 * @return the enLigne
	 */
	public String getEnLigne() {
		return enLigne;
	}
	/**
	 * @param enLigne the enLigne to set
	 */
	public void setEnLigne(String enLigne) {
		this.enLigne = enLigne;
	}
	/**
	 * @return the dateInscription
	 */
	public String getDateInscription() {
		return dateInscription;
	}
	/**
	 * @param dateInscription the dateInscription to set
	 */
	public void setDateInscription(String dateInscription) {
		this.dateInscription = dateInscription;
	}
	/**
	 * @return the etude
	 */
	public String getEtude() {
		return etude;
	}
	/**
	 * @param etude the etude to set
	 */
	public void setEtude(String etude) {
		this.etude = etude;
	}
	/**
	 * @return the paysOrigine
	 */
	public String getPaysOrigine() {
		return paysOrigine;
	}
	/**
	 * @param paysOrigine the paysOrigine to set
	 */
	public void setPaysOrigine(String paysOrigine) {
		this.paysOrigine = paysOrigine;
	}
	/**
	 * @return the paysActuel
	 */
	public String getPaysActuel() {
		return paysActuel;
	}
	/**
	 * @param paysActuel the paysActuel to set
	 */
	public void setPaysActuel(String paysActuel) {
		this.paysActuel = paysActuel;
	}
	/**
	 * @return the villeOrigine
	 */
	public String getVilleOrigine() {
		return villeOrigine;
	}
	/**
	 * @param villeOrigine the villeOrigine to set
	 */
	public void setVilleOrigine(String villeOrigine) {
		this.villeOrigine = villeOrigine;
	}
	/**
	 * @return the villeActuelle
	 */
	public String getVilleActuelle() {
		return villeActuelle;
	}
	/**
	 * @param villeActuelle the villeActuelle to set
	 */
	public void setVilleActuelle(String villeActuelle) {
		this.villeActuelle = villeActuelle;
	}
	/**
	 * @return the interet
	 */
	public String getInteret() {
		return interet;
	}
	/**
	 * @param interet the interet to set
	 */
	public void setInteret(String interet) {
		this.interet = interet;
	}
	/**
	 * @return the mesAmis
	 */
	public List<Friend> getMesAmis() {
		return mesAmis;
	}
	/**
	 * @param mesAmis the mesAmis to set
	 */
	public void setMesAmis(List<Friend> mesAmis) {
		this.mesAmis = mesAmis;
	}
	
	/**
	 * 
	 */
	public SocialModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return the nom
	 */
	public String getNom() {
		return nom;
	}
	/**
	 * @param nom the nom to set
	 */
	public void setNom(String nom) {
		this.nom = nom;
	}
	/**
	 * @return the prenom
	 */
	public String getPrenom() {
		return prenom;
	}
	/**
	 * @param prenom the prenom to set
	 */
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the phone
	 */
	public int getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(int phone) {
		this.phone = phone;
	}
	/**
	 * @return the genre
	 */
	public String getGenre() {
		return genre;
	}
	/**
	 * @param genre the genre to set
	 */
	public void setGenre(String genre) {
		this.genre = genre;
	}
	/**
	 * @return the naissance
	 */
	public String getNaissance() {
		return naissance;
	}
	/**
	 * @param naissance the naissance to set
	 */
	public void setNaissance(String naissance) {
		this.naissance = naissance;
	}
	/**
	 * @return the inscription
	 */
	public String getInscription() {
		return inscription;
	}
	/**
	 * @param inscription the inscription to set
	 */
	public void setInscription(String inscription) {
		this.inscription = inscription;
	}
	/**
	 * @return the adresse
	 */
	public String getAdresse() {
		return adresse;
	}
	/**
	 * @param adresse the adresse to set
	 */
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	/**
	 * @return the profession
	 */
	public String getProfession() {
		return profession;
	}
	/**
	 * @param profession the profession to set
	 */
	public void setProfession(String profession) {
		this.profession = profession;
	}
	/**
	 * @return the statut
	 */
	public String getStatut() {
		return statut;
	}
	/**
	 * @param statut the statut to set
	 */
	public void setStatut(String statut) {
		this.statut = statut;
	}
	/**
	 * @return the interets
	 */
	public String getInterets() {
		return interets;
	}
	/**
	 * @param interets the interets to set
	 */
	public void setInterets(String interets) {
		this.interets = interets;
	}
	/**
	 * @return the pays
	 */
	public String getPays() {
		return pays;
	}
	/**
	 * @param pays the pays to set
	 */
	public void setPays(String pays) {
		this.pays = pays;
	}
	/**
	 * @return the idAmisOnline
	 */
	public Long getIdAmisOnline() {
		return idAmisOnline;
	}
	/**
	 * @param idAmisOnline the idAmisOnline to set
	 */
	public void setIdAmisOnline(Long idAmisOnline) {
		this.idAmisOnline = idAmisOnline;
	}
	
	/**
	 * @return the messages
	 */
	public List<Message> getMessages() {
		return messages;
	}
	/**
	 * @param messages the messages to set
	 */
	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
}
