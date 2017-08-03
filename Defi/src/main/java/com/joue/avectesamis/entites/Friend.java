package com.joue.avectesamis.entites;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.IndexColumn;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoSolo;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsSolo;


@Entity
//@DiscriminatorValue("friend")
public class Friend implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private boolean admin;
//	@JsonIgnore
	@OneToMany(mappedBy="friend", fetch=FetchType.LAZY)
	private Collection<Album> albums;
//	@JsonIgnore
	@OneToMany(mappedBy="friendpost", fetch=FetchType.LAZY)
	private Collection<Post> posts;
//	@JsonIgnore
	@OneToMany(mappedBy="friendpost", fetch=FetchType.LAZY)
	private Collection<Message> messages;
//	@JsonIgnore
	@OneToOne
	private Reglages reglage;
	
	@OneToMany(mappedBy="friend", fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@Fetch(FetchMode.SUBSELECT)
	private Collection<AbcSolo> abcsolo;
	@JsonIgnore
	@ManyToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	@JoinTable(name="mesamis")
	private Collection<Friend> friends;
	@JsonIgnore
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="envoyee")                       
	private Set<Friend> envoyees;
	@JsonIgnore
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="recue")
	private Set<Friend> recues;
	@JsonIgnore
	@ManyToMany
	@JoinTable(name="meschallengesevoi")
	private Collection<Friend> challengeenvoiyes;
//	@JsonIgnore
	@ManyToMany
	@JoinTable(name="meschallengesrecus")
	private Collection<Friend> challengerecus;
//	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="nro_like")
	private Likes like;
//	@JsonIgnore
	@ManyToMany
	private Collection<Comment> comments;
//	@JsonIgnore
	@ManyToMany
	@JoinTable(name="mesjeux")
	private Collection<Game> games;
	private String nom;
	private String prenom;
	private String email;
	private String adresse;
	private String sexe;
	private Integer age;
	private Integer phone;
	private Date friendDate;
	private Date dateDerniereConnexion;
	private String mdp;
	private String genre;
	private String enLigne;
	private boolean online;
	private String dateInscription;
	private Date dateInscriptionMoi;
	private String etude;
	private String paysOrigine;
	private String paysActuel;
	private String villeOrigine;
	private String villeActuelle;
	private String statut;
	private String interet;
	private String emailVisible;
	private String mobileVisible;
	private String photoVisible;
	private String amisVisible;
	@ElementCollection
	private Map<Friend, String> challengesRecus;
	@ElementCollection
	private Map<Friend, String> challengesEnvoyes;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Map<Friend, String> challengeEnAttentes;
	@ElementCollection
	private Map<Friend, String> challengeEnJoues;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<AbcChallenge> mesChallengesJoues;
	private String pseudo;
	private byte [] photo;
	private String nomPhoto;

//	POUR LA PARTIE DES SERVICES REST, LES JEUX DU PENDU
//	@JsonIgnore
	@OneToMany(mappedBy="friend", fetch=FetchType.EAGER, cascade=CascadeType.ALL)
//	@IndexColumn(name="IDEX_COL")
	@Fetch(FetchMode.SUBSELECT)
	private Collection<PenduDicoSolo> penduDicoSolos;
//	@JsonIgnore
	@OneToMany(mappedBy="friend", fetch=FetchType.EAGER, cascade=CascadeType.ALL)
//	@IndexColumn(name="IDEX_COL")
	@Fetch(FetchMode.SUBSELECT)
	private Collection<PenduSujetsSolo> penduSujetsSolos;
	
	@ElementCollection
//	@JsonIgnore
	private Map<Friend, String> challengesRecusPenduDico;
//	@JsonIgnore
	@ElementCollection
	private Map<Friend, String> challengesEnvoyesPenduDico;
//	@JsonIgnore
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Map<Friend, String> challengeEnAttentesPenduDico;
//	@JsonIgnore
	@ElementCollection
	private Map<Friend, String> challengeEnJouesPenduDico;
//	@JsonIgnore
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<PenduDicoChallenge> mesChallengesJouesPenduDico;
//	@JsonIgnore
	@ElementCollection
	private Map<Friend, String> challengesRecusPenduSujets;
//	@JsonIgnore
	@ElementCollection
	private Map<Friend, String> challengesEnvoyesPenduSujets;
//	@JsonIgnore
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Map<Friend, String> challengeEnAttentesPenduSujets;
//	@JsonIgnore
	@ElementCollection
	private Map<Friend, String> challengeEnJouesPenduSujets;
//	@JsonIgnore
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<PenduSujetsChallenge> mesChallengesJouesPenduSujets;
	
	
	


	
	
	
	/**
	 * @return the challengesRecusPenduDico
	 */
	public Map<Friend, String> getChallengesRecusPenduDico() {
		return challengesRecusPenduDico;
	}



	/**
	 * @param challengesRecusPenduDico the challengesRecusPenduDico to set
	 */
	public void setChallengesRecusPenduDico(
			Map<Friend, String> challengesRecusPenduDico) {
		this.challengesRecusPenduDico = challengesRecusPenduDico;
	}



	/**
	 * @return the challengesEnvoyesPenduDico
	 */
	public Map<Friend, String> getChallengesEnvoyesPenduDico() {
		return challengesEnvoyesPenduDico;
	}



	/**
	 * @param challengesEnvoyesPenduDico the challengesEnvoyesPenduDico to set
	 */
	public void setChallengesEnvoyesPenduDico(
			Map<Friend, String> challengesEnvoyesPenduDico) {
		this.challengesEnvoyesPenduDico = challengesEnvoyesPenduDico;
	}



	/**
	 * @return the challengeEnAttentesPenduDico
	 */
	public Map<Friend, String> getChallengeEnAttentesPenduDico() {
		return challengeEnAttentesPenduDico;
	}



	/**
	 * @param challengeEnAttentesPenduDico the challengeEnAttentesPenduDico to set
	 */
	public void setChallengeEnAttentesPenduDico(
			Map<Friend, String> challengeEnAttentesPenduDico) {
		this.challengeEnAttentesPenduDico = challengeEnAttentesPenduDico;
	}



	/**
	 * @return the challengeEnJouesPenduDico
	 */
	public Map<Friend, String> getChallengeEnJouesPenduDico() {
		return challengeEnJouesPenduDico;
	}



	/**
	 * @param challengeEnJouesPenduDico the challengeEnJouesPenduDico to set
	 */
	public void setChallengeEnJouesPenduDico(
			Map<Friend, String> challengeEnJouesPenduDico) {
		this.challengeEnJouesPenduDico = challengeEnJouesPenduDico;
	}



	



	/**
	 * @return the challengesRecusPenduSujets
	 */
	public Map<Friend, String> getChallengesRecusPenduSujets() {
		return challengesRecusPenduSujets;
	}



	/**
	 * @param challengesRecusPenduSujets the challengesRecusPenduSujets to set
	 */
	public void setChallengesRecusPenduSujets(
			Map<Friend, String> challengesRecusPenduSujets) {
		this.challengesRecusPenduSujets = challengesRecusPenduSujets;
	}



	/**
	 * @return the challengesEnvoyesPenduSujets
	 */
	public Map<Friend, String> getChallengesEnvoyesPenduSujets() {
		return challengesEnvoyesPenduSujets;
	}



	/**
	 * @param challengesEnvoyesPenduSujets the challengesEnvoyesPenduSujets to set
	 */
	public void setChallengesEnvoyesPenduSujets(
			Map<Friend, String> challengesEnvoyesPenduSujets) {
		this.challengesEnvoyesPenduSujets = challengesEnvoyesPenduSujets;
	}



	/**
	 * @return the challengeEnAttentesPenduSujets
	 */
	public Map<Friend, String> getChallengeEnAttentesPenduSujets() {
		return challengeEnAttentesPenduSujets;
	}



	/**
	 * @param challengeEnAttentesPenduSujets the challengeEnAttentesPenduSujets to set
	 */
	public void setChallengeEnAttentesPenduSujets(
			Map<Friend, String> challengeEnAttentesPenduSujets) {
		this.challengeEnAttentesPenduSujets = challengeEnAttentesPenduSujets;
	}



	/**
	 * @return the challengeEnJouesPenduSujets
	 */
	public Map<Friend, String> getChallengeEnJouesPenduSujets() {
		return challengeEnJouesPenduSujets;
	}



	/**
	 * @param challengeEnJouesPenduSujets the challengeEnJouesPenduSujets to set
	 */
	public void setChallengeEnJouesPenduSujets(
			Map<Friend, String> challengeEnJouesPenduSujets) {
		this.challengeEnJouesPenduSujets = challengeEnJouesPenduSujets;
	}



	/**
	 * @return the mesChallengesJouesPenduDico
	 */
	public List<PenduDicoChallenge> getMesChallengesJouesPenduDico() {
		return mesChallengesJouesPenduDico;
	}



	/**
	 * @param mesChallengesJouesPenduDico the mesChallengesJouesPenduDico to set
	 */
	public void setMesChallengesJouesPenduDico(
			List<PenduDicoChallenge> mesChallengesJouesPenduDico) {
		this.mesChallengesJouesPenduDico = mesChallengesJouesPenduDico;
	}



	/**
	 * @return the mesChallengesJouesPenduSujets
	 */
	public List<PenduSujetsChallenge> getMesChallengesJouesPenduSujets() {
		return mesChallengesJouesPenduSujets;
	}



	/**
	 * @param mesChallengesJouesPenduSujets the mesChallengesJouesPenduSujets to set
	 */
	public void setMesChallengesJouesPenduSujets(
			List<PenduSujetsChallenge> mesChallengesJouesPenduSujets) {
		this.mesChallengesJouesPenduSujets = mesChallengesJouesPenduSujets;
	}



	/**
	 * @return the penduDicoSolos
	 */
	public Collection<PenduDicoSolo> getPenduDicoSolos() {
		return penduDicoSolos;
	}



	/**
	 * @param penduDicoSolos the penduDicoSolos to set
	 */
	public void setPenduDicoSolos(Collection<PenduDicoSolo> penduDicoSolos) {
		this.penduDicoSolos = penduDicoSolos;
	}



	/**
	 * @return the penduSujetsSolos
	 */
	public Collection<PenduSujetsSolo> getPenduSujetsSolos() {
		return penduSujetsSolos;
	}



	/**
	 * @param penduSujetsSolos the penduSujetsSolos to set
	 */
	public void setPenduSujetsSolos(Collection<PenduSujetsSolo> penduSujetsSolos) {
		this.penduSujetsSolos = penduSujetsSolos;
	}



	/**
	 * @return the online
	 */
	public boolean isOnline() {
		return online;
	}



	/**
	 * @param online the online to set
	 */
	public void setOnline(boolean online) {
		this.online = online;
	}



	/**
	 * @return the admin
	 */
	public boolean isAdmin() {
		return admin;
	}



	/**
	 * @param admin the admin to set
	 */
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}



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
	 * @return the dateInscriptionMoi
	 */
	public Date getDateInscriptionMoi() {
		return dateInscriptionMoi;
	}



	/**
	 * @param dateInscriptionMoi the dateInscriptionMoi to set
	 */
	public void setDateInscriptionMoi(Date dateInscriptionMoi) {
		this.dateInscriptionMoi = dateInscriptionMoi;
	}



	/**
	 * @return the pseudo
	 */
	public String getPseudo() {
		return pseudo;
	}



	/**
	 * @param pseudo the pseudo to set
	 */
	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}



	/**
	 * @return the challengeEnJoues
	 */
	public Map<Friend, String> getChallengeEnJoues() {
		return challengeEnJoues;
	}



	/**
	 * @param challengeEnJoues the challengeEnJoues to set
	 */
	public void setChallengeEnJoues(Map<Friend, String> challengeEnJoues) {
		this.challengeEnJoues = challengeEnJoues;
	}



	/**
	 * @return the challengesRecus
	 */
	public Map<Friend, String> getChallengesRecus() {
		return challengesRecus;
	}



	/**
	 * @param challengesRecus the challengesRecus to set
	 */
	public void setChallengesRecus(Map<Friend, String> challengesRecus) {
		this.challengesRecus = challengesRecus;
	}



	/**
	 * @return the challengesEnvoyes
	 */
	public Map<Friend, String> getChallengesEnvoyes() {
		return challengesEnvoyes;
	}



	/**
	 * @param challengesEnvoyes the challengesEnvoyes to set
	 */
	public void setChallengesEnvoyes(Map<Friend, String> challengesEnvoyes) {
		this.challengesEnvoyes = challengesEnvoyes;
	}



	/**
	 * @return the challengeEnAttentes
	 */
	public Map<Friend, String> getChallengeEnAttentes() {
		return challengeEnAttentes;
	}



	/**
	 * @param challengeEnAttentes the challengeEnAttentes to set
	 */
	public void setChallengeEnAttentes(Map<Friend, String> challengeEnAttentes) {
		this.challengeEnAttentes = challengeEnAttentes;
	}



	/**
	 * @return the mesChallengesJoues
	 */
	public List<AbcChallenge> getMesChallengesJoues() {
		return mesChallengesJoues;
	}



	/**
	 * @param mesChallengesJoues the mesChallengesJoues to set
	 */
	public void setMesChallengesJoues(List<AbcChallenge> mesChallengesJoues) {
		this.mesChallengesJoues = mesChallengesJoues;
	}



	/**
	 * @return the abcsolo
	 */
	public Collection<AbcSolo> getAbcsolo() {
		return abcsolo;
	}



	/**
	 * @param abcsolo the abcsolo to set
	 */
	public void setAbcsolo(Collection<AbcSolo> abcsolo) {
		this.abcsolo = abcsolo;
	}



	/**
	 * @return the reglage
	 */
	public Reglages getReglage() {
		return reglage;
	}



	/**
	 * @param reglage the reglage to set
	 */
	public void setReglage(Reglages reglage) {
		this.reglage = reglage;
	}



	



	/**
	 * @return the emailVisible
	 */
	public String getEmailVisible() {
		return emailVisible;
	}



	/**
	 * @param emailVisible the emailVisible to set
	 */
	public void setEmailVisible(String emailVisible) {
		this.emailVisible = emailVisible;
	}



	/**
	 * @return the mobileVisible
	 */
	public String getMobileVisible() {
		return mobileVisible;
	}



	/**
	 * @param mobileVisible the mobileVisible to set
	 */
	public void setMobileVisible(String mobileVisible) {
		this.mobileVisible = mobileVisible;
	}



	/**
	 * @return the photoVisible
	 */
	public String getPhotoVisible() {
		return photoVisible;
	}



	/**
	 * @param photoVisible the photoVisible to set
	 */
	public void setPhotoVisible(String photoVisible) {
		this.photoVisible = photoVisible;
	}



	/**
	 * @return the amisVisible
	 */
	public String getAmisVisible() {
		return amisVisible;
	}



	/**
	 * @param amisVisible the amisVisible to set
	 */
	public void setAmisVisible(String amisVisible) {
		this.amisVisible = amisVisible;
	}



	/**
	 * @param id
	 * @param nom
	 * @param prenom
	 */
	public Friend(Long id, String nom, String prenom) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
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
	 * 
	 */
	public Friend() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	/**
	 * @return the friends
	 */
	public Collection<Friend> getFriends() {
		return friends;
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
	 * @param prenom
	 */
	public Friend(String prenom) {
		super();
		this.prenom = prenom;
	}



	/**
	 * @return the recues
	 */
	public Collection<Friend> getRecues() {
		return recues;
	}



	/**
	 * @param recues the recues to set
	 */
	public void setRecues(Set<Friend> recues) {
		this.recues = recues;
	}



	/**
	 * @return the envoyees
	 */
	public Collection<Friend> getEnvoyees() {
		return envoyees;
	}



	/**
	 * @param envoyees the envoyees to set
	 */
	public void setEnvoyees(Set<Friend> envoyees) {
		this.envoyees = envoyees;
	}



	/**
	 * @param friends the friends to set
	 */
	public void setFriends(Collection<Friend> friends) {
		this.friends = friends;
	}



	/**
	 * @return the albums
	 */
	public Collection<Album> getAlbums() {
		return albums;
	}
	/**
	 * @param albums the albums to set
	 */
	public void setAlbums(Collection<Album> albums) {
		this.albums = albums;
	}
	/**
	 * @return the posts
	 */
	public Collection<Post> getPosts() {
		return posts;
	}
	/**
	 * @param posts the posts to set
	 */
	public void setPosts(Collection<Post> posts) {
		this.posts = posts;
	}
	/**
	 * @return the messages
	 */
	public Collection<Message> getMessages() {
		return messages;
	}
	/**
	 * @param messages the messages to set
	 */
	public void setMessages(Collection<Message> messages) {
		this.messages = messages;
	}
	/**
	 * @return the games
	 */
	public Collection<Game> getGames() {
		return games;
	}
	/**
	 * @param games the games to set
	 */
	public void setGames(Collection<Game> games) {
		this.games = games;
	}
	/**
	 * @return the like
	 */
	public Likes getLike() {
		return like;
	}
	/**
	 * @param like the like to set
	 */
	public void setLike(Likes like) {
		this.like = like;
	}
	/**
	 * @return the comments
	 */
	public Collection<Comment> getComments() {
		return comments;
	}
	/**
	 * @param comments the comments to set
	 */
	public void setComments(Collection<Comment> comments) {
		this.comments = comments;
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
	 * @return the sexe
	 */
	public String getSexe() {
		return sexe;
	}
	/**
	 * @param sexe the sexe to set
	 */
	public void setSexe(String sexe) {
		this.sexe = sexe;
	}
	/**
	 * @return the age
	 */
	public Integer getAge() {
		return age;
	}
	/**
	 * @param age the age to set
	 */
	public void setAge(Integer age) {
		this.age = age;
	}
	/**
	 * @return the phone
	 */
	public Integer getPhone() {
		return phone;
	}
	/**
	 * @param phone the phone to set
	 */
	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	/**
	 * @return the friendDate
	 */
	public Date getFriendDate() {
		return friendDate;
	}
	/**
	 * @param friendDate the friendDate to set
	 */
	public void setFriendDate(Date friendDate) {
		this.friendDate = friendDate;
	}
	/**
	 * @return the dateDerniereConnexion
	 */
	public Date getDateDerniereConnexion() {
		return dateDerniereConnexion;
	}
	/**
	 * @param dateDerniereConnexion the dateDerniereConnexion to set
	 */
	public void setDateDerniereConnexion(Date dateDerniereConnexion) {
		this.dateDerniereConnexion = dateDerniereConnexion;
	}



	/**
	 * @return the challengeenvoiyes
	 */
	public Collection<Friend> getChallengeenvoiyes() {
		return challengeenvoiyes;
	}



	/**
	 * @param challengeenvoiyes the challengeenvoiyes to set
	 */
	public void setChallengeenvoiyes(Collection<Friend> challengeenvoiyes) {
		this.challengeenvoiyes = challengeenvoiyes;
	}



	/**
	 * @return the challengerecus
	 */
	public Collection<Friend> getChallengerecus() {
		return challengerecus;
	}



	/**
	 * @param challengerecus the challengerecus to set
	 */
	public void setChallengerecus(Collection<Friend> challengerecus) {
		this.challengerecus = challengerecus;
	}



	
	/**
	 * @param nom
	 * @param prenom
	 */
	public Friend(String nom, String prenom) {
		super();
		this.nom = nom;
		this.prenom = prenom;
	}



/**
 * @param nom
 * @param prenom
 * @param email
 * @param sexe
 * @param mdp
 */
public Friend(String nom, String prenom, String email, String sexe, String mdp) {
	super();
	this.nom = nom;
	this.prenom = prenom;
	this.email = email;
	this.sexe = sexe;
	this.mdp = mdp;
}



/**
 * @param nom
 * @param prenom
 * @param email
 * @param sexe
 * @param mdp
 * @param pseudo
 */
public Friend(String nom, String prenom, String email, String sexe, String mdp,
		String pseudo) {
	super();
	this.nom = nom;
	this.prenom = prenom;
	this.email = email;
	this.sexe = sexe;
	this.mdp = mdp;
	this.pseudo = pseudo;
}



public Friend(String nom2, String prenom2, String email2, String sexe2,
		String pass, String pseudo2, Date date) {
	// TODO Auto-generated constructor stub
	super();
	this.nom = nom2;
	this.prenom = prenom2;
	this.email = email2;
	this.sexe = sexe2;
	this.mdp = pass;
	this.pseudo = pseudo2;
	this.dateInscriptionMoi = date;
}
public Friend(String nom2, String prenom2, String email2, String sexe2,
		String pass, String pseudo2, Date date, byte[] photo) {
	// TODO Auto-generated constructor stub
	super();
	this.nom = nom2;
	this.prenom = prenom2;
	this.email = email2;
	this.sexe = sexe2;
	this.mdp = pass;
	this.pseudo = pseudo2;
	this.dateInscriptionMoi = date;
	this.photo = photo;
}
	
	
	
}
