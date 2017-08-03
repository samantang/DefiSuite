package com.joue.avectesamis.entites.jeux.pendu;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

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
public class PenduSujetsSolo implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private Date date;
	private String dateString;
	private int temps;
	private boolean timeOut;
	private String mot;
	private int nbEssais;
	private boolean reussi;
//	en fonction du nombre, on determine l'image correspondante qui sera stockée au sein de l'appli et nom pas dans la BDD
	private int imageIconJeu;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Collection<Character> choix;
	private int score;
	private int scoreMax;
	private boolean aide;
	private int nbAide;
	@ManyToOne
	private Friend friend;
	private String tempsRestantString;
	private boolean publie;
	
	private Date datePays;
	private String  dateStringPays;
	private String lettreStringPays;
	private String tempsDepartPays;
	private String tempsRestantPays;
	private String motPays;
	private String motDepartPays;
	private int nbErreursPays;
	private int scorePays;
	private int scoreMaxPays;
	private char lettreCharPays;
	
	private Date dateCapitale;
	private String  dateStringCapitale;
	private String lettreStringCapitale;
	private String tempsDepartCapitale;
	private String tempsRestantCapitale;
	private String motCapitale;
	private String motDepartCapitale;
	private int nbErreursCapitale;
	private int scoreCapitale;
	private int scoreMaxCapitale;
	private char lettreCharCapitale;
	
	private Date dateNobel;
	private String  dateStringNobel;
	private String lettreStringNobel;
	private String tempsDepartNobel;
	private String tempsRestantNobel;
	private String motNobel;
	private String motDepartNobel;
	private int nbErreursNobel;
	private int scoreNobel;
	private int scoreMaxNobel;
	private char lettreCharNobel;
	
	
	private Date dateArtiste;
	private String  dateStringArtiste;
	private String lettreStringArtiste;
	private String tempsDepartArtiste;
	private String tempsRestantArtiste;
	private String motArtiste;
	private String motDepartArtiste;
	private int nbErreursArtiste;
	private int scoreArtiste;
	private int scoreMaxArtiste;
	private char lettreCharArtiste;
	
	
	private Date datePresident;
	private String  dateStringPresident;
	private String lettreStringPresident;
	private String tempsDepartPresident;
	private String tempsRestantPresident;
	private String motPresident;
	private String motDepartPresident;
	private int nbErreursPresident;
	private int scorePresident;
	private int scoreMaxPresident;
	private char lettreCharPresident;
	
	
	
	
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
	 * @return the tempsRestantString
	 */
	public String getTempsRestantString() {
		return tempsRestantString;
	}
	/**
	 * @param tempsRestantString the tempsRestantString to set
	 */
	public void setTempsRestantString(String tempsRestantString) {
		this.tempsRestantString = tempsRestantString;
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
	 * @return the lettreCharPays
	 */
	public char getLettreCharPays() {
		return lettreCharPays;
	}
	/**
	 * @param lettreCharPays the lettreCharPays to set
	 */
	public void setLettreCharPays(char lettreCharPays) {
		this.lettreCharPays = lettreCharPays;
	}
	/**
	 * @return the lettreCharCapitale
	 */
	public char getLettreCharCapitale() {
		return lettreCharCapitale;
	}
	/**
	 * @param lettreCharCapitale the lettreCharCapitale to set
	 */
	public void setLettreCharCapitale(char lettreCharCapitale) {
		this.lettreCharCapitale = lettreCharCapitale;
	}
	/**
	 * @return the lettreCharNobel
	 */
	public char getLettreCharNobel() {
		return lettreCharNobel;
	}
	/**
	 * @param lettreCharNobel the lettreCharNobel to set
	 */
	public void setLettreCharNobel(char lettreCharNobel) {
		this.lettreCharNobel = lettreCharNobel;
	}
	/**
	 * @return the lettreCharArtiste
	 */
	public char getLettreCharArtiste() {
		return lettreCharArtiste;
	}
	/**
	 * @param lettreCharArtiste the lettreCharArtiste to set
	 */
	public void setLettreCharArtiste(char lettreCharArtiste) {
		this.lettreCharArtiste = lettreCharArtiste;
	}
	
	/**
	 * @return the lettreCharPresident
	 */
	public char getLettreCharPresident() {
		return lettreCharPresident;
	}
	/**
	 * @param lettreCharPresident the lettreCharPresident to set
	 */
	public void setLettreCharPresident(char lettreCharPresident) {
		this.lettreCharPresident = lettreCharPresident;
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
	 * @return the agglo
	 */

	/**
	 * 
	 */
	public PenduSujetsSolo() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the datePays
	 */
	public Date getDatePays() {
		return datePays;
	}
	/**
	 * @param datePays the datePays to set
	 */
	public void setDatePays(Date datePays) {
		this.datePays = datePays;
	}
	/**
	 * @return the dateStringPays
	 */
	public String getDateStringPays() {
		return dateStringPays;
	}
	/**
	 * @param dateStringPays the dateStringPays to set
	 */
	public void setDateStringPays(String dateStringPays) {
		this.dateStringPays = dateStringPays;
	}
	/**
	 * @return the lettreStringPays
	 */
	public String getLettreStringPays() {
		return lettreStringPays;
	}
	/**
	 * @param lettreStringPays the lettreStringPays to set
	 */
	public void setLettreStringPays(String lettreStringPays) {
		this.lettreStringPays = lettreStringPays;
	}
	/**
	 * @return the tempsDepartPays
	 */
	public String getTempsDepartPays() {
		return tempsDepartPays;
	}
	/**
	 * @param tempsDepartPays the tempsDepartPays to set
	 */
	public void setTempsDepartPays(String tempsDepartPays) {
		this.tempsDepartPays = tempsDepartPays;
	}
	/**
	 * @return the tempsRestantPays
	 */
	public String getTempsRestantPays() {
		return tempsRestantPays;
	}
	/**
	 * @param tempsRestantPays the tempsRestantPays to set
	 */
	public void setTempsRestantPays(String tempsRestantPays) {
		this.tempsRestantPays = tempsRestantPays;
	}
	/**
	 * @return the motPays
	 */
	public String getMotPays() {
		return motPays;
	}
	/**
	 * @param motPays the motPays to set
	 */
	public void setMotPays(String motPays) {
		this.motPays = motPays;
	}
	/**
	 * @return the motDepartPays
	 */
	public String getMotDepartPays() {
		return motDepartPays;
	}
	/**
	 * @param motDepartPays the motDepartPays to set
	 */
	public void setMotDepartPays(String motDepartPays) {
		this.motDepartPays = motDepartPays;
	}
	/**
	 * @return the nbErreursPays
	 */
	public int getNbErreursPays() {
		return nbErreursPays;
	}
	/**
	 * @param nbErreursPays the nbErreursPays to set
	 */
	public void setNbErreursPays(int nbErreursPays) {
		this.nbErreursPays = nbErreursPays;
	}
	/**
	 * @return the scorePays
	 */
	public int getScorePays() {
		return scorePays;
	}
	/**
	 * @param scorePays the scorePays to set
	 */
	public void setScorePays(int scorePays) {
		this.scorePays = scorePays;
	}
	/**
	 * @return the scoreMaxPays
	 */
	public int getScoreMaxPays() {
		return scoreMaxPays;
	}
	/**
	 * @param scoreMaxPays the scoreMaxPays to set
	 */
	public void setScoreMaxPays(int scoreMaxPays) {
		this.scoreMaxPays = scoreMaxPays;
	}
	/**
	 * @return the dateCapitale
	 */
	public Date getDateCapitale() {
		return dateCapitale;
	}
	/**
	 * @param dateCapitale the dateCapitale to set
	 */
	public void setDateCapitale(Date dateCapitale) {
		this.dateCapitale = dateCapitale;
	}
	/**
	 * @return the dateStringCapitale
	 */
	public String getDateStringCapitale() {
		return dateStringCapitale;
	}
	/**
	 * @param dateStringCapitale the dateStringCapitale to set
	 */
	public void setDateStringCapitale(String dateStringCapitale) {
		this.dateStringCapitale = dateStringCapitale;
	}
	/**
	 * @return the lettreStringCapitale
	 */
	public String getLettreStringCapitale() {
		return lettreStringCapitale;
	}
	/**
	 * @param lettreStringCapitale the lettreStringCapitale to set
	 */
	public void setLettreStringCapitale(String lettreStringCapitale) {
		this.lettreStringCapitale = lettreStringCapitale;
	}
	/**
	 * @return the tempsDepartCapitale
	 */
	public String getTempsDepartCapitale() {
		return tempsDepartCapitale;
	}
	/**
	 * @param tempsDepartCapitale the tempsDepartCapitale to set
	 */
	public void setTempsDepartCapitale(String tempsDepartCapitale) {
		this.tempsDepartCapitale = tempsDepartCapitale;
	}
	/**
	 * @return the tempsRestantCapitale
	 */
	public String getTempsRestantCapitale() {
		return tempsRestantCapitale;
	}
	/**
	 * @param tempsRestantCapitale the tempsRestantCapitale to set
	 */
	public void setTempsRestantCapitale(String tempsRestantCapitale) {
		this.tempsRestantCapitale = tempsRestantCapitale;
	}
	/**
	 * @return the motCapitale
	 */
	public String getMotCapitale() {
		return motCapitale;
	}
	/**
	 * @param motCapitale the motCapitale to set
	 */
	public void setMotCapitale(String motCapitale) {
		this.motCapitale = motCapitale;
	}
	/**
	 * @return the motDepartCapitale
	 */
	public String getMotDepartCapitale() {
		return motDepartCapitale;
	}
	/**
	 * @param motDepartCapitale the motDepartCapitale to set
	 */
	public void setMotDepartCapitale(String motDepartCapitale) {
		this.motDepartCapitale = motDepartCapitale;
	}
	/**
	 * @return the nbErreursCapitale
	 */
	public int getNbErreursCapitale() {
		return nbErreursCapitale;
	}
	/**
	 * @param nbErreursCapitale the nbErreursCapitale to set
	 */
	public void setNbErreursCapitale(int nbErreursCapitale) {
		this.nbErreursCapitale = nbErreursCapitale;
	}
	/**
	 * @return the scoreCapitale
	 */
	public int getScoreCapitale() {
		return scoreCapitale;
	}
	/**
	 * @param scoreCapitale the scoreCapitale to set
	 */
	public void setScoreCapitale(int scoreCapitale) {
		this.scoreCapitale = scoreCapitale;
	}
	/**
	 * @return the scoreMaxCapitale
	 */
	public int getScoreMaxCapitale() {
		return scoreMaxCapitale;
	}
	/**
	 * @param scoreMaxCapitale the scoreMaxCapitale to set
	 */
	public void setScoreMaxCapitale(int scoreMaxCapitale) {
		this.scoreMaxCapitale = scoreMaxCapitale;
	}
	/**
	 * @return the dateNobel
	 */
	public Date getDateNobel() {
		return dateNobel;
	}
	/**
	 * @param dateNobel the dateNobel to set
	 */
	public void setDateNobel(Date dateNobel) {
		this.dateNobel = dateNobel;
	}
	/**
	 * @return the dateStringNobel
	 */
	public String getDateStringNobel() {
		return dateStringNobel;
	}
	/**
	 * @param dateStringNobel the dateStringNobel to set
	 */
	public void setDateStringNobel(String dateStringNobel) {
		this.dateStringNobel = dateStringNobel;
	}
	/**
	 * @return the lettreStringNobel
	 */
	public String getLettreStringNobel() {
		return lettreStringNobel;
	}
	/**
	 * @param lettreStringNobel the lettreStringNobel to set
	 */
	public void setLettreStringNobel(String lettreStringNobel) {
		this.lettreStringNobel = lettreStringNobel;
	}
	/**
	 * @return the tempsDepartNobel
	 */
	public String getTempsDepartNobel() {
		return tempsDepartNobel;
	}
	/**
	 * @param tempsDepartNobel the tempsDepartNobel to set
	 */
	public void setTempsDepartNobel(String tempsDepartNobel) {
		this.tempsDepartNobel = tempsDepartNobel;
	}
	/**
	 * @return the tempsRestantNobel
	 */
	public String getTempsRestantNobel() {
		return tempsRestantNobel;
	}
	/**
	 * @param tempsRestantNobel the tempsRestantNobel to set
	 */
	public void setTempsRestantNobel(String tempsRestantNobel) {
		this.tempsRestantNobel = tempsRestantNobel;
	}
	/**
	 * @return the motNobel
	 */
	public String getMotNobel() {
		return motNobel;
	}
	/**
	 * @param motNobel the motNobel to set
	 */
	public void setMotNobel(String motNobel) {
		this.motNobel = motNobel;
	}
	/**
	 * @return the motDepartNobel
	 */
	public String getMotDepartNobel() {
		return motDepartNobel;
	}
	/**
	 * @param motDepartNobel the motDepartNobel to set
	 */
	public void setMotDepartNobel(String motDepartNobel) {
		this.motDepartNobel = motDepartNobel;
	}
	/**
	 * @return the nbErreursNobel
	 */
	public int getNbErreursNobel() {
		return nbErreursNobel;
	}
	/**
	 * @param nbErreursNobel the nbErreursNobel to set
	 */
	public void setNbErreursNobel(int nbErreursNobel) {
		this.nbErreursNobel = nbErreursNobel;
	}
	/**
	 * @return the scoreNobel
	 */
	public int getScoreNobel() {
		return scoreNobel;
	}
	/**
	 * @param scoreNobel the scoreNobel to set
	 */
	public void setScoreNobel(int scoreNobel) {
		this.scoreNobel = scoreNobel;
	}
	/**
	 * @return the scoreMaxNobel
	 */
	public int getScoreMaxNobel() {
		return scoreMaxNobel;
	}
	/**
	 * @param scoreMaxNobel the scoreMaxNobel to set
	 */
	public void setScoreMaxNobel(int scoreMaxNobel) {
		this.scoreMaxNobel = scoreMaxNobel;
	}
	/**
	 * @return the dateArtiste
	 */
	public Date getDateArtiste() {
		return dateArtiste;
	}
	/**
	 * @param dateArtiste the dateArtiste to set
	 */
	public void setDateArtiste(Date dateArtiste) {
		this.dateArtiste = dateArtiste;
	}
	/**
	 * @return the dateStringArtiste
	 */
	public String getDateStringArtiste() {
		return dateStringArtiste;
	}
	/**
	 * @param dateStringArtiste the dateStringArtiste to set
	 */
	public void setDateStringArtiste(String dateStringArtiste) {
		this.dateStringArtiste = dateStringArtiste;
	}
	/**
	 * @return the lettreStringArtiste
	 */
	public String getLettreStringArtiste() {
		return lettreStringArtiste;
	}
	/**
	 * @param lettreStringArtiste the lettreStringArtiste to set
	 */
	public void setLettreStringArtiste(String lettreStringArtiste) {
		this.lettreStringArtiste = lettreStringArtiste;
	}
	/**
	 * @return the tempsDepartArtiste
	 */
	public String getTempsDepartArtiste() {
		return tempsDepartArtiste;
	}
	/**
	 * @param tempsDepartArtiste the tempsDepartArtiste to set
	 */
	public void setTempsDepartArtiste(String tempsDepartArtiste) {
		this.tempsDepartArtiste = tempsDepartArtiste;
	}
	/**
	 * @return the tempsRestantArtiste
	 */
	public String getTempsRestantArtiste() {
		return tempsRestantArtiste;
	}
	/**
	 * @param tempsRestantArtiste the tempsRestantArtiste to set
	 */
	public void setTempsRestantArtiste(String tempsRestantArtiste) {
		this.tempsRestantArtiste = tempsRestantArtiste;
	}
	/**
	 * @return the motArtiste
	 */
	public String getMotArtiste() {
		return motArtiste;
	}
	/**
	 * @param motArtiste the motArtiste to set
	 */
	public void setMotArtiste(String motArtiste) {
		this.motArtiste = motArtiste;
	}
	/**
	 * @return the motDepartArtiste
	 */
	public String getMotDepartArtiste() {
		return motDepartArtiste;
	}
	/**
	 * @param motDepartArtiste the motDepartArtiste to set
	 */
	public void setMotDepartArtiste(String motDepartArtiste) {
		this.motDepartArtiste = motDepartArtiste;
	}
	/**
	 * @return the nbErreursArtiste
	 */
	public int getNbErreursArtiste() {
		return nbErreursArtiste;
	}
	/**
	 * @param nbErreursArtiste the nbErreursArtiste to set
	 */
	public void setNbErreursArtiste(int nbErreursArtiste) {
		this.nbErreursArtiste = nbErreursArtiste;
	}
	/**
	 * @return the scoreArtiste
	 */
	public int getScoreArtiste() {
		return scoreArtiste;
	}
	/**
	 * @param scoreArtiste the scoreArtiste to set
	 */
	public void setScoreArtiste(int scoreArtiste) {
		this.scoreArtiste = scoreArtiste;
	}
	/**
	 * @return the scoreMaxArtiste
	 */
	public int getScoreMaxArtiste() {
		return scoreMaxArtiste;
	}
	/**
	 * @param scoreMaxArtiste the scoreMaxArtiste to set
	 */
	public void setScoreMaxArtiste(int scoreMaxArtiste) {
		this.scoreMaxArtiste = scoreMaxArtiste;
	}
	/**
	 * @return the datePresident
	 */
	public Date getDatePresident() {
		return datePresident;
	}
	/**
	 * @param datePresident the datePresident to set
	 */
	public void setDatePresident(Date datePresident) {
		this.datePresident = datePresident;
	}
	/**
	 * @return the dateStringPresident
	 */
	public String getDateStringPresident() {
		return dateStringPresident;
	}
	/**
	 * @param dateStringPresident the dateStringPresident to set
	 */
	public void setDateStringPresident(String dateStringPresident) {
		this.dateStringPresident = dateStringPresident;
	}
	/**
	 * @return the lettreStringPresident
	 */
	public String getLettreStringPresident() {
		return lettreStringPresident;
	}
	/**
	 * @param lettreStringPresident the lettreStringPresident to set
	 */
	public void setLettreStringPresident(String lettreStringPresident) {
		this.lettreStringPresident = lettreStringPresident;
	}
	/**
	 * @return the tempsDepartPresident
	 */
	public String getTempsDepartPresident() {
		return tempsDepartPresident;
	}
	/**
	 * @param tempsDepartPresident the tempsDepartPresident to set
	 */
	public void setTempsDepartPresident(String tempsDepartPresident) {
		this.tempsDepartPresident = tempsDepartPresident;
	}
	/**
	 * @return the tempsRestantPresident
	 */
	public String getTempsRestantPresident() {
		return tempsRestantPresident;
	}
	/**
	 * @param tempsRestantPresident the tempsRestantPresident to set
	 */
	public void setTempsRestantPresident(String tempsRestantPresident) {
		this.tempsRestantPresident = tempsRestantPresident;
	}
	/**
	 * @return the motPresident
	 */
	public String getMotPresident() {
		return motPresident;
	}
	/**
	 * @param motPresident the motPresident to set
	 */
	public void setMotPresident(String motPresident) {
		this.motPresident = motPresident;
	}
	/**
	 * @return the motDepartPresident
	 */
	public String getMotDepartPresident() {
		return motDepartPresident;
	}
	/**
	 * @param motDepartPresident the motDepartPresident to set
	 */
	public void setMotDepartPresident(String motDepartPresident) {
		this.motDepartPresident = motDepartPresident;
	}
	/**
	 * @return the nbErreursPresident
	 */
	public int getNbErreursPresident() {
		return nbErreursPresident;
	}
	/**
	 * @param nbErreursPresident the nbErreursPresident to set
	 */
	public void setNbErreursPresident(int nbErreursPresident) {
		this.nbErreursPresident = nbErreursPresident;
	}
	/**
	 * @return the scorePresident
	 */
	public int getScorePresident() {
		return scorePresident;
	}
	/**
	 * @param scorePresident the scorePresident to set
	 */
	public void setScorePresident(int scorePresident) {
		this.scorePresident = scorePresident;
	}
	/**
	 * @return the scoreMaxPresident
	 */
	public int getScoreMaxPresident() {
		return scoreMaxPresident;
	}
	/**
	 * @param scoreMaxPresident the scoreMaxPresident to set
	 */
	public void setScoreMaxPresident(int scoreMaxPresident) {
		this.scoreMaxPresident = scoreMaxPresident;
	}
	/**
	 * @param datePays
	 * @param dateStringPays
	 * @param lettreStringPays
	 * @param tempsDepartPays
	 * @param tempsRestantPays
	 * @param motPays
	 * @param motDepartPays
	 * @param nbErreursPays
	 * @param scorePays
	 * @param scoreMaxPays
	 * @param dateCapitale
	 * @param dateStringCapitale
	 * @param lettreStringCapitale
	 * @param tempsDepartCapitale
	 * @param tempsRestantCapitale
	 * @param motCapitale
	 * @param motDepartCapitale
	 * @param nbErreursCapitale
	 * @param scoreCapitale
	 * @param scoreMaxCapitale
	 * @param dateNobel
	 * @param dateStringNobel
	 * @param lettreStringNobel
	 * @param tempsDepartNobel
	 * @param tempsRestantNobel
	 * @param motNobel
	 * @param motDepartNobel
	 * @param nbErreursNobel
	 * @param scoreNobel
	 * @param scoreMaxNobel
	 * @param dateArtiste
	 * @param dateStringArtiste
	 * @param lettreStringArtiste
	 * @param tempsDepartArtiste
	 * @param tempsRestantArtiste
	 * @param motArtiste
	 * @param motDepartArtiste
	 * @param nbErreursArtiste
	 * @param scoreArtiste
	 * @param scoreMaxArtiste
	 * @param datePresident
	 * @param dateStringPresident
	 * @param lettreStringPresident
	 * @param tempsDepartPresident
	 * @param tempsRestantPresident
	 * @param motPresident
	 * @param motDepartPresident
	 * @param nbErreursPresident
	 * @param scorePresident
	 * @param scoreMaxPresident
	 */
	public PenduSujetsSolo(Date datePays, String dateStringPays,
			String lettreStringPays, String tempsDepartPays,
			String tempsRestantPays, String motPays, String motDepartPays,
			int nbErreursPays, int scorePays, int scoreMaxPays,
			Date dateCapitale, String dateStringCapitale,
			String lettreStringCapitale, String tempsDepartCapitale,
			String tempsRestantCapitale, String motCapitale,
			String motDepartCapitale, int nbErreursCapitale, int scoreCapitale,
			int scoreMaxCapitale, Date dateNobel, String dateStringNobel,
			String lettreStringNobel, String tempsDepartNobel,
			String tempsRestantNobel, String motNobel, String motDepartNobel,
			int nbErreursNobel, int scoreNobel, int scoreMaxNobel,
			Date dateArtiste, String dateStringArtiste,
			String lettreStringArtiste, String tempsDepartArtiste,
			String tempsRestantArtiste, String motArtiste,
			String motDepartArtiste, int nbErreursArtiste, int scoreArtiste,
			int scoreMaxArtiste, Date datePresident,
			String dateStringPresident, String lettreStringPresident,
			String tempsDepartPresident, String tempsRestantPresident,
			String motPresident, String motDepartPresident,
			int nbErreursPresident, int scorePresident, int scoreMaxPresident) {
		super();
		this.datePays = datePays;
		this.dateStringPays = dateStringPays;
		this.lettreStringPays = lettreStringPays;
		this.tempsDepartPays = tempsDepartPays;
		this.tempsRestantPays = tempsRestantPays;
		this.motPays = motPays;
		this.motDepartPays = motDepartPays;
		this.nbErreursPays = nbErreursPays;
		this.scorePays = scorePays;
		this.scoreMaxPays = scoreMaxPays;
		this.dateCapitale = dateCapitale;
		this.dateStringCapitale = dateStringCapitale;
		this.lettreStringCapitale = lettreStringCapitale;
		this.tempsDepartCapitale = tempsDepartCapitale;
		this.tempsRestantCapitale = tempsRestantCapitale;
		this.motCapitale = motCapitale;
		this.motDepartCapitale = motDepartCapitale;
		this.nbErreursCapitale = nbErreursCapitale;
		this.scoreCapitale = scoreCapitale;
		this.scoreMaxCapitale = scoreMaxCapitale;
		this.dateNobel = dateNobel;
		this.dateStringNobel = dateStringNobel;
		this.lettreStringNobel = lettreStringNobel;
		this.tempsDepartNobel = tempsDepartNobel;
		this.tempsRestantNobel = tempsRestantNobel;
		this.motNobel = motNobel;
		this.motDepartNobel = motDepartNobel;
		this.nbErreursNobel = nbErreursNobel;
		this.scoreNobel = scoreNobel;
		this.scoreMaxNobel = scoreMaxNobel;
		this.dateArtiste = dateArtiste;
		this.dateStringArtiste = dateStringArtiste;
		this.lettreStringArtiste = lettreStringArtiste;
		this.tempsDepartArtiste = tempsDepartArtiste;
		this.tempsRestantArtiste = tempsRestantArtiste;
		this.motArtiste = motArtiste;
		this.motDepartArtiste = motDepartArtiste;
		this.nbErreursArtiste = nbErreursArtiste;
		this.scoreArtiste = scoreArtiste;
		this.scoreMaxArtiste = scoreMaxArtiste;
		this.datePresident = datePresident;
		this.dateStringPresident = dateStringPresident;
		this.lettreStringPresident = lettreStringPresident;
		this.tempsDepartPresident = tempsDepartPresident;
		this.tempsRestantPresident = tempsRestantPresident;
		this.motPresident = motPresident;
		this.motDepartPresident = motDepartPresident;
		this.nbErreursPresident = nbErreursPresident;
		this.scorePresident = scorePresident;
		this.scoreMaxPresident = scoreMaxPresident;
	}
	
	
	
}
