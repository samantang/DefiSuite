package com.joue.avectesamis.entites.jeux.pendu;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.joue.avectesamis.entites.Friend;

@Entity
public class PenduDicoChallenge implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private Date date;
	private String dateString;
//	private char lettre;
	private int temps;
	private int nbErreurs;
	private int tempsRestant;
	private String tempsRestantMoi;
	private boolean timeOut;
	private String mot;
	private String motSecret;
	private int nbEssais;
	private boolean reussi;
//	en fonction du nombre, on determine l'image correspondante qui sera stockée au sein de l'appli et non pas dans la BDD
	private int imageIconJeu;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Collection<Character> choix;
	private int score;
	private int scoreMax;
	private boolean aide;
	private int nbAide;
	@JsonIgnore
	@OneToOne
	private Friend friend;
	@JsonIgnore
	@OneToOne
	private Friend monFriend;
	private String codeIndentification;
	
	private int scoreAmi;
	private boolean aideAmi;
	private String dateStringAmi;
	private String tempsRestantAmi;
	private boolean timeOutAmi;
	private boolean publie;
	
	private String lettreString;
//	private char lettre;
	private int nbErreursAmi;

	
	
	
	
	
	
//	/**
//	 * @return the lettre
//	 */
//	public char getLettre() {
//		return lettre;
//	}
//
//	/**
//	 * @param lettre the lettre to set
//	 */
//	public void setLettre(char lettre) {
//		this.lettre = lettre;
//	}
	
	
//	/**
//	 * @return the lettreString
//	 */
//	public String getLettreString() {
//		return lettreString;
//	}
//
//	/**
//	 * @return the lettre
//	 */
//	public char getLettre() {
//		return lettre;
//	}
//
//	/**
//	 * @param lettre the lettre to set
//	 */
//	public void setLettre(char lettre) {
//		this.lettre = lettre;
//	}
//
//	/**
//	 * @param lettreString the lettreString to set
//	 */
//	public void setLettreString(String lettreString) {
//		this.lettreString = lettreString;
//	}
	
	/**
	 * @return the nbErreursAmi
	 */
	public int getNbErreursAmi() {
		return nbErreursAmi;
	}

	/**
	 * @param nbErreursAmi the nbErreursAmi to set
	 */
	public void setNbErreursAmi(int nbErreursAmi) {
		this.nbErreursAmi = nbErreursAmi;
	}

	/**
	 * @return the publie
	 */
	public boolean isPublie() {
		return publie;
	}

	/**
 * @param date
 * @param dateString
 * @param nbErreurs
 * @param tempsRestantMoi
 * @param timeOut
 * @param mot
 * @param imageIconJeu
 * @param score
 * @param scoreMax
 * @param lettreString
	 * @param motSecet 
 */
public PenduDicoChallenge(Date date, String dateString, int nbErreurs,
		String tempsRestantMoi, boolean timeOut, String mot, int imageIconJeu,
		int score, int scoreMax, String lettreString, String motSecet) {
	super();
	this.date = date;
	this.dateString = dateString;
	this.nbErreurs = nbErreurs;
	this.tempsRestantMoi = tempsRestantMoi;
	this.timeOut = timeOut;
	this.mot = mot;
	this.imageIconJeu = imageIconJeu;
	this.score = score;
	this.scoreMax = scoreMax;
	this.lettreString = lettreString;
	this.motSecret = motSecet;
}

	/**
	 * @return the lettreString
	 */
	public String getLettreString() {
		return lettreString;
	}

	/**
	 * @param lettreString the lettreString to set
	 */
	public void setLettreString(String lettreString) {
		this.lettreString = lettreString;
	}

	/**
	 * @param publie the publie to set
	 */
	public void setPublie(boolean publie) {
		this.publie = publie;
	}

	/**
	 * @return the tempsRestantMoi
	 */
	public String getTempsRestantMoi() {
		return tempsRestantMoi;
	}

	/**
	 * @param tempsRestantMoi the tempsRestantMoi to set
	 */
	public void setTempsRestantMoi(String tempsRestantMoi) {
		this.tempsRestantMoi = tempsRestantMoi;
	}

	/**
	 * @return the scoreAmi
	 */
	public int getScoreAmi() {
		return scoreAmi;
	}

	/**
	 * @param scoreAmi the scoreAmi to set
	 */
	public void setScoreAmi(int scoreAmi) {
		this.scoreAmi = scoreAmi;
	}

	/**
	 * @return the aideAmi
	 */
	public boolean isAideAmi() {
		return aideAmi;
	}

	/**
	 * @param aideAmi the aideAmi to set
	 */
	public void setAideAmi(boolean aideAmi) {
		this.aideAmi = aideAmi;
	}

	/**
	 * @return the dateStringAmi
	 */
	public String getDateStringAmi() {
		return dateStringAmi;
	}

	/**
	 * @param dateStringAmi the dateStringAmi to set
	 */
	public void setDateStringAmi(String dateStringAmi) {
		this.dateStringAmi = dateStringAmi;
	}

	/**
	 * @return the tempsRestantAmi
	 */
	public String getTempsRestantAmi() {
		return tempsRestantAmi;
	}

	/**
	 * @param tempsRestantAmi the tempsRestantAmi to set
	 */
	public void setTempsRestantAmi(String tempsRestantAmi) {
		this.tempsRestantAmi = tempsRestantAmi;
	}

	/**
	 * @return the timeOutAmi
	 */
	public boolean isTimeOutAmi() {
		return timeOutAmi;
	}

	/**
	 * @param timeOutAmi the timeOutAmi to set
	 */
	public void setTimeOutAmi(boolean timeOutAmi) {
		this.timeOutAmi = timeOutAmi;
	}

	/**
	 * @return the motSecret
	 */
	public String getMotSecret() {
		return motSecret;
	}

	/**
	 * @param motSecret the motSecret to set
	 */
	public void setMotSecret(String motSecret) {
		this.motSecret = motSecret;
	}

	/**
	 * @param date
	 * @param dateString
	 * @param temps
	 * @param nbErreurs
	 * @param tempsRestant
	 * @param timeOut
	 * @param mot
	 * @param nbEssais
	 * @param reussi
	 * @param imageIconJeu
	 * @param choix
	 * @param score
	 * @param aide
	 * @param nbAide
	 */
	public PenduDicoChallenge(Date date, String dateString, int temps,
			int nbErreurs, int tempsRestant, boolean timeOut, String mot,
			int nbEssais, boolean reussi, int imageIconJeu,
			Collection<Character> choix, int score, int scoreMax,  boolean aide, int nbAide) {
		super();
		this.date = date;
		this.dateString = dateString;
		this.temps = temps;
		this.nbErreurs = nbErreurs;
		this.tempsRestant = tempsRestant;
		this.timeOut = timeOut;
		this.mot = mot;
		this.nbEssais = nbEssais;
		this.reussi = reussi;
		this.imageIconJeu = imageIconJeu;
		this.choix = choix;
		this.score = score;
		this.scoreMax=scoreMax;
		this.aide = aide;
		this.nbAide = nbAide;
	}

	/**
	 * @return the nbErreurs
	 */
	public int getNbErreurs() {
		return nbErreurs;
	}

	/**
	 * @param nbErreurs the nbErreurs to set
	 */
	public void setNbErreurs(int nbErreurs) {
		this.nbErreurs = nbErreurs;
	}

	/**
	 * @return the tempsRestant
	 */
	public int getTempsRestant() {
		return tempsRestant;
	}

	/**
	 * @param tempsRestant the tempsRestant to set
	 */
	public void setTempsRestant(int tempsRestant) {
		this.tempsRestant = tempsRestant;
	}

	/**
	 * @param date
	 * @param dateString
	 * @param temps
	 * @param timeOut
	 * @param mot
	 * @param nbEssais
	 * @param reussi
	 * @param imageIconJeu
	 * @param choix
	 * @param score
	 * @param aide
	 * @param nbAide
	 * @param friend
	 * @param monFriend
	 * @param codeIndentification
	 */
	public PenduDicoChallenge(Date date, String dateString, int temps,
			boolean timeOut, String mot, int nbEssais, boolean reussi,
			int imageIconJeu, Collection<Character> choix, int score,
			boolean aide, int nbAide, Friend friend, Friend monFriend,
			String codeIndentification) {
		super();
		this.date = date;
		this.dateString = dateString;
		this.temps = temps;
		this.timeOut = timeOut;
		this.mot = mot;
		this.nbEssais = nbEssais;
		this.reussi = reussi;
		this.imageIconJeu = imageIconJeu;
		this.choix = choix;
		this.score = score;
		this.aide = aide;
		this.nbAide = nbAide;
		this.friend = friend;
		this.monFriend = monFriend;
		this.codeIndentification = codeIndentification;
	}
	
	/**
	 * @param date
	 * @param dateString
	 * @param temps
	 * @param timeOut
	 * @param mot
	 * @param nbEssais
	 * @param reussi
	 * @param imageIconJeu
	 * @param choix
	 * @param score
	 * @param aide
	 * @param nbAide
	 */
	public PenduDicoChallenge(Date date, String dateString, int temps,
			boolean timeOut, String mot, int nbEssais, boolean reussi,
			int imageIconJeu, Collection<Character> choix, int score,
			boolean aide, int nbAide) {
		super();
		this.date = date;
		this.dateString = dateString;
		this.temps = temps;
		this.timeOut = timeOut;
		this.mot = mot;
		this.nbEssais = nbEssais;
		this.reussi = reussi;
		this.imageIconJeu = imageIconJeu;
		this.choix = choix;
		this.score = score;
		this.aide = aide;
		this.nbAide = nbAide;
	}

	/**
	 * @return the codeIndentification
	 */
	public String getCodeIndentification() {
		return codeIndentification;
	}
	/**
	 * @param codeIndentification the codeIndentification to set
	 */
	public void setCodeIndentification(String codeIndentification) {
		this.codeIndentification = codeIndentification;
	}
	/**
	 * 
	 */
	public PenduDicoChallenge() {
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
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	/**
	 * @return the dateString
	 */
	public String getDateString() {
		return dateString;
	}
	/**
	 * @param dateString the dateString to set
	 */
	public void setDateString(String dateString) {
		this.dateString = dateString;
	}
	/**
	 * @return the temps
	 */
	public int getTemps() {
		return temps;
	}
	/**
	 * @param temps the temps to set
	 */
	public void setTemps(int temps) {
		this.temps = temps;
	}
	/**
	 * @return the timeOut
	 */
	public boolean isTimeOut() {
		return timeOut;
	}
	/**
	 * @param timeOut the timeOut to set
	 */
	public void setTimeOut(boolean timeOut) {
		this.timeOut = timeOut;
	}
	/**
	 * @return the mot
	 */
	public String getMot() {
		return mot;
	}
	/**
	 * @param mot the mot to set
	 */
	public void setMot(String mot) {
		this.mot = mot;
	}
	/**
	 * @return the nbEssais
	 */
	public int getNbEssais() {
		return nbEssais;
	}
	/**
	 * @param nbEssais the nbEssais to set
	 */
	public void setNbEssais(int nbEssais) {
		this.nbEssais = nbEssais;
	}
	/**
	 * @return the reussi
	 */
	public boolean isReussi() {
		return reussi;
	}
	/**
	 * @param reussi the reussi to set
	 */
	public void setReussi(boolean reussi) {
		this.reussi = reussi;
	}
	/**
	 * @return the imageIconJeu
	 */
	public int getImageIconJeu() {
		return imageIconJeu;
	}
	/**
	 * @param imageIconJeu the imageIconJeu to set
	 */
	public void setImageIconJeu(int imageIconJeu) {
		this.imageIconJeu = imageIconJeu;
	}
	/**
	 * @return the choix
	 */
	public Collection<Character> getChoix() {
		return choix;
	}
	/**
	 * @param choix the choix to set
	 */
	public void setChoix(Collection<Character> choix) {
		this.choix = choix;
	}
	/**
	 * @return the score
	 */
	public int getScore() {
		return score;
	}
	/**
	 * @param score the score to set
	 */
	public void setScore(int score) {
		this.score = score;
	}
	/**
	 * @return the aide
	 */
	public boolean isAide() {
		return aide;
	}
	/**
	 * @param aide the aide to set
	 */
	public void setAide(boolean aide) {
		this.aide = aide;
	}
	/**
	 * @return the nbAide
	 */
	public int getNbAide() {
		return nbAide;
	}
	/**
	 * @param nbAide the nbAide to set
	 */
	public void setNbAide(int nbAide) {
		this.nbAide = nbAide;
	}
	/**
	 * @return the friend
	 */
	public Friend getFriend() {
		return friend;
	}
	/**
	 * @param friend the friend to set
	 */
	public void setFriend(Friend friend) {
		this.friend = friend;
	}
	/**
	 * @return the monFriend
	 */
	public Friend getMonFriend() {
		return monFriend;
	}
	/**
	 * @param monFriend the monFriend to set
	 */
	public void setMonFriend(Friend monFriend) {
		this.monFriend = monFriend;
	}

	/**
	 * @return the scoreMax
	 */
	public int getScoreMax() {
		return scoreMax;
	}

	/**
	 * @param scoreMax the scoreMax to set
	 */
	public void setScoreMax(int scoreMax) {
		this.scoreMax = scoreMax;
	}
	
	
}
