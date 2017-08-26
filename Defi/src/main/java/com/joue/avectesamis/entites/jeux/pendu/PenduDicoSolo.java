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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.joue.avectesamis.entites.Friend;

@Entity
public class PenduDicoSolo implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Date date;
	private String dateString;
	private String lettreString;
	private int temps;
	private String tempsDepart;
	private String tempsRestant;
	private boolean timeOut;
	private String cinqErreurs;
	private String mot;
	private String motDepart;
	private int nbErreurs;
	private int nbEssais;
	private boolean reussi;
	// en fonction du nombre, on determine l'image correspondante qui sera
	// stockée au sein de l'appli et nom pas dans la BDD
	private int imageIconJeu;
	@ElementCollection(fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Collection<Character> choix;
	private int score;
	private int scoreMax;
	private boolean aide;
	private int nbAide;
	@ManyToOne
	@JsonIgnore
	private Friend friend;
	private String motUser;
	private boolean publie;
	
	
	
	
	
//	/**
//	 * @param date
//	 * @param dateString
//	 * @param tempsDepart
//	 * @param tempsRestant
//	 * @param mot
//	 * @param motDepart
//	 * @param nbErreurs
//	 * @param score
//	 * @param scoreMax
//	 * @param friend
//	 */
//	public PenduDicoSolo(Date date, String dateString, String tempsDepart,
//			String tempsRestant, String mot, String motDepart, int nbErreurs,
//			int score, int scoreMax, Friend friend) {
//		super();
//		this.date = date;
//		this.dateString = dateString;
//		this.tempsDepart = tempsDepart;
//		this.tempsRestant = tempsRestant;
//		this.mot = mot;
//		this.motDepart = motDepart;
//		this.nbErreurs = nbErreurs;
//		this.score = score;
//		this.scoreMax = scoreMax;
//		this.friend = friend;
//	}
	
	
	

	/**
	 * @return the publie
	 */
	public boolean isPublie() {
		return publie;
	}









	/**
	 * @param publie the publie to set
	 */
	public void setPublie(boolean publie) {
		this.publie = publie;
	}









	/**
	 * @param timeOut
	 */
	public PenduDicoSolo(boolean timeOut) {
		super();
		this.timeOut = timeOut;
	}


	






	/**
	 * @param date
	 * @param dateString
	 * @param lettreString
	 * @param timeOut
	 * @param mot
	 */
	public PenduDicoSolo(Date date, String dateString, String lettreString,
			boolean timeOut, String mot) {
		super();
		this.date = date;
		this.dateString = dateString;
		this.lettreString = lettreString;
		this.timeOut = timeOut;
		this.mot = mot;
	}
	/**
	 * @param date
	 * @param dateString
	 * @param lettreString
	 * @param timeOut
	 * @param mot
	 */
	public PenduDicoSolo(Date date, String dateString, String lettreString,
			boolean timeOut, String mot, int nbErreurs, int points, int pointMax) {
		super();
		this.date = date;
		this.dateString = dateString;
		this.lettreString = lettreString;
		this.timeOut = timeOut;
		this.mot = mot;
		this.nbErreurs = nbErreurs;
		this.score = points;
		this.scoreMax = pointMax;
	}




	/**
	 * @param date
	 * @param dateString
	 * @param lettreString
	 * @param tempsDepart
	 * @param tempsRestant
	 * @param mot
	 * @param motDepart
	 * @param nbErreurs
	 * @param score
	 * @param scoreMax
	 */
	public PenduDicoSolo(Date date, String dateString, String lettreString,
			String tempsDepart, String tempsRestant, String mot,
			String motDepart, int nbErreurs, int score, int scoreMax) {
		super();
		this.date = date;
		this.dateString = dateString;
		this.lettreString = lettreString;
		this.tempsDepart = tempsDepart;
		this.tempsRestant = tempsRestant;
		this.mot = mot;
		this.motDepart = motDepart;
		this.nbErreurs = nbErreurs;
		this.score = score;
		this.scoreMax = scoreMax;
	}









	/**
 * @param cinqErreurs
 * @param nbErreurs
 */
public PenduDicoSolo(String cinqErreurs, int nbErreurs) {
	super();
	this.cinqErreurs = cinqErreurs;
	this.nbErreurs = nbErreurs;
}









	/**
	 * @return the cinqErreurs
	 */
	public String getCinqErreurs() {
		return cinqErreurs;
	}




	/**
	 * @param cinqErreurs the cinqErreurs to set
	 */
	public void setCinqErreurs(String cinqErreurs) {
		this.cinqErreurs = cinqErreurs;
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

	/**
	 * @return the tempsDepart
	 */
	public String getTempsDepart() {
		return tempsDepart;
	}

	/**
	 * @param tempsDepart the tempsDepart to set
	 */
	public void setTempsDepart(String tempsDepart) {
		this.tempsDepart = tempsDepart;
	}

	/**
	 * @return the tempsRestant
	 */
	public String getTempsRestant() {
		return tempsRestant;
	}

	/**
	 * @param tempsRestant the tempsRestant to set
	 */
	public void setTempsRestant(String tempsRestant) {
		this.tempsRestant = tempsRestant;
	}

	/**
	 * @return the motDepart
	 */
	public String getMotDepart() {
		return motDepart;
	}

	/**
	 * @param motDepart the motDepart to set
	 */
	public void setMotDepart(String motDepart) {
		this.motDepart = motDepart;
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
	 * @return the motUser
	 */
	public String getMotUser() {
		return motUser;
	}

	/**
	 * @param motUser the motUser to set
	 */
	public void setMotUser(String motUser) {
		this.motUser = motUser;
	}

	/**
	 * 
	 */
	public PenduDicoSolo() {
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
	 * @param id
	 *            the id to set
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
	 * @param date
	 *            the date to set
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
	 * @param dateString
	 *            the dateString to set
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
	 * @param temps
	 *            the temps to set
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
	 * @param timeOut
	 *            the timeOut to set
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
	 * @param mot
	 *            the mot to set
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
	 * @param nbEssais
	 *            the nbEssais to set
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
	 * @param reussi
	 *            the reussi to set
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
	 * @param imageIconJeu
	 *            the imageIconJeu to set
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
	 * @param choix
	 *            the choix to set
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
	 * @param score
	 *            the score to set
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
	 * @param aide
	 *            the aide to set
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
	 * @param nbAide
	 *            the nbAide to set
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
	 * @param friend
	 *            the friend to set
	 */
	public void setFriend(Friend friend) {
		this.friend = friend;
	}

}
