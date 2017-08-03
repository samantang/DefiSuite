package com.joue.avectesamis.entites.jeux.pendu;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.joue.avectesamis.entites.Friend;

@Entity
public class PenduSujetsChallenge implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@OneToOne
	private Friend friend;
	@OneToOne
	private Friend monFriend;
	 
	private String pays;
	private String capitale;
	private String nobel;
	private String president;
	private String artiste;
	
	private char lettrePays;
	private char lettreCapitale;
	private char lettreNoble;
	private char lettrePresident;
	private char lettreArtiste;
	
	private int scorePaysMoi;
	private int scoreCapitaleMoi;
	private int scoreNobelMoi;
	private int scorePresidentMoi;
	private int scoreArtisteMoi;
	
	private int scorePaysAmi;
	private int scoreCapitaleAmi;
	private int scoreNobelAmi;
	private int scorePresidentAmi;
	private int scoreArtisteAmi;
	
	private int scoreMaxPays;
	private int scoreMaxCapitale;
	private int scoreMaxNobel;
	private int scoreMaxPresident;
	private int scoreMaxArtiste;
	
	private int nbErreursPaysMoi;
	private int nbErreursCapitaleMoi;
	private int nbErreursNobelMoi;
	private int nbErreursPresidentMoi;
	private int nbErreursArtisteMoi;
	
	private int nbErreursPaysAmi;
	private int nbErreursCapitaleAmi;
	private int nbErreursNobelAmi;
	private int nbErreursPresidentAmi;
	private int nbErreursArtisteAmi;
	
	private String dateStringMoi;
	private String dateStringAmi;
	
	private boolean publie;
	
	private String lettreStringPays;
	private String lettreStringCapitale;
	private String lettreStringNobel;
	private String lettreStringPresident;
	private String lettreStringArtiste;
	
	private Date date;
	
	private String codeIndentification;
	
	private int scoreTotalMoi;
	private int scoreTotalAmi;
	private int scoreTotalMax;
	
	private String tempsRestantMoi;
	private String tempsRestantAmi;
	
	private int longueurDesMots;
	
	private boolean aideMoi;
	private boolean aideAmi;
	
	/**
	 * @return the aideMoi
	 */
	public boolean isAideMoi() {
		return aideMoi;
	}

	/**
	 * @param aideMoi the aideMoi to set
	 */
	public void setAideMoi(boolean aideMoi) {
		this.aideMoi = aideMoi;
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
	 * 
	 */
	public PenduSujetsChallenge() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param id
	 * @param pays
	 * @param capitale
	 * @param nobel
	 * @param president
	 * @param artiste
	 * @param lettrePays
	 * @param lettreCapitale
	 * @param lettreNoble
	 * @param lettrePresident
	 * @param lettreArtiste
	 * @param scorePaysMoi
	 * @param scoreCapitaleMoi
	 * @param scoreNobelMoi
	 * @param scorePresidentMoi
	 * @param scoreArtisteMoi
	 * @param scoreMaxPays
	 * @param scoreMaxCapitale
	 * @param scoreMaxNobel
	 * @param scoreMaxPresident
	 * @param scoreMaxArtiste
	 * @param nbErreursPaysMoi
	 * @param nbErreursCapitaleMoi
	 * @param nbErreursNobelMoi
	 * @param nbErreursPresidentMoi
	 * @param nbErreursArtisteMoi
	 * @param dateStringMoi
	 */
	public PenduSujetsChallenge(Long id, String pays, String capitale,
			String nobel, String president, String artiste, char lettrePays,
			char lettreCapitale, char lettreNoble, char lettrePresident,
			char lettreArtiste, int scorePaysMoi, int scoreCapitaleMoi,
			int scoreNobelMoi, int scorePresidentMoi, int scoreArtisteMoi,
			int scoreMaxPays, int scoreMaxCapitale, int scoreMaxNobel,
			int scoreMaxPresident, int scoreMaxArtiste, int nbErreursPaysMoi,
			int nbErreursCapitaleMoi, int nbErreursNobelMoi,
			int nbErreursPresidentMoi, int nbErreursArtisteMoi,
			String dateStringMoi) {
		super();
		this.id = id;
		this.pays = pays;
		this.capitale = capitale;
		this.nobel = nobel;
		this.president = president;
		this.artiste = artiste;
		this.lettrePays = lettrePays;
		this.lettreCapitale = lettreCapitale;
		this.lettreNoble = lettreNoble;
		this.lettrePresident = lettrePresident;
		this.lettreArtiste = lettreArtiste;
		this.scorePaysMoi = scorePaysMoi;
		this.scoreCapitaleMoi = scoreCapitaleMoi;
		this.scoreNobelMoi = scoreNobelMoi;
		this.scorePresidentMoi = scorePresidentMoi;
		this.scoreArtisteMoi = scoreArtisteMoi;
		this.scoreMaxPays = scoreMaxPays;
		this.scoreMaxCapitale = scoreMaxCapitale;
		this.scoreMaxNobel = scoreMaxNobel;
		this.scoreMaxPresident = scoreMaxPresident;
		this.scoreMaxArtiste = scoreMaxArtiste;
		this.nbErreursPaysMoi = nbErreursPaysMoi;
		this.nbErreursCapitaleMoi = nbErreursCapitaleMoi;
		this.nbErreursNobelMoi = nbErreursNobelMoi;
		this.nbErreursPresidentMoi = nbErreursPresidentMoi;
		this.nbErreursArtisteMoi = nbErreursArtisteMoi;
		this.dateStringMoi = dateStringMoi;
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
	 * @return the capitale
	 */
	public String getCapitale() {
		return capitale;
	}

	/**
	 * @param capitale the capitale to set
	 */
	public void setCapitale(String capitale) {
		this.capitale = capitale;
	}

	/**
	 * @return the nobel
	 */
	public String getNobel() {
		return nobel;
	}

	/**
	 * @param nobel the nobel to set
	 */
	public void setNobel(String nobel) {
		this.nobel = nobel;
	}

	/**
	 * @return the president
	 */
	public String getPresident() {
		return president;
	}

	/**
	 * @param president the president to set
	 */
	public void setPresident(String president) {
		this.president = president;
	}

	/**
	 * @return the artiste
	 */
	public String getArtiste() {
		return artiste;
	}

	/**
	 * @param artiste the artiste to set
	 */
	public void setArtiste(String artiste) {
		this.artiste = artiste;
	}

	/**
	 * @return the lettrePays
	 */
	public char getLettrePays() {
		return lettrePays;
	}

	/**
	 * @param lettrePays the lettrePays to set
	 */
	public void setLettrePays(char lettrePays) {
		this.lettrePays = lettrePays;
	}

	/**
	 * @return the lettreCapitale
	 */
	public char getLettreCapitale() {
		return lettreCapitale;
	}

	/**
	 * @param lettreCapitale the lettreCapitale to set
	 */
	public void setLettreCapitale(char lettreCapitale) {
		this.lettreCapitale = lettreCapitale;
	}

	/**
	 * @return the lettreNoble
	 */
	public char getLettreNoble() {
		return lettreNoble;
	}

	/**
	 * @param lettreNoble the lettreNoble to set
	 */
	public void setLettreNoble(char lettreNoble) {
		this.lettreNoble = lettreNoble;
	}

	/**
	 * @return the lettrePresident
	 */
	public char getLettrePresident() {
		return lettrePresident;
	}

	/**
	 * @param lettrePresident the lettrePresident to set
	 */
	public void setLettrePresident(char lettrePresident) {
		this.lettrePresident = lettrePresident;
	}

	/**
	 * @return the lettreArtiste
	 */
	public char getLettreArtiste() {
		return lettreArtiste;
	}

	/**
	 * @param lettreArtiste the lettreArtiste to set
	 */
	public void setLettreArtiste(char lettreArtiste) {
		this.lettreArtiste = lettreArtiste;
	}

	/**
	 * @return the scorePaysMoi
	 */
	public int getScorePaysMoi() {
		return scorePaysMoi;
	}

	/**
	 * @param scorePaysMoi the scorePaysMoi to set
	 */
	public void setScorePaysMoi(int scorePaysMoi) {
		this.scorePaysMoi = scorePaysMoi;
	}

	/**
	 * @return the scoreCapitaleMoi
	 */
	public int getScoreCapitaleMoi() {
		return scoreCapitaleMoi;
	}

	/**
	 * @param scoreCapitaleMoi the scoreCapitaleMoi to set
	 */
	public void setScoreCapitaleMoi(int scoreCapitaleMoi) {
		this.scoreCapitaleMoi = scoreCapitaleMoi;
	}

	/**
	 * @return the scoreNobelMoi
	 */
	public int getScoreNobelMoi() {
		return scoreNobelMoi;
	}

	/**
	 * @param scoreNobelMoi the scoreNobelMoi to set
	 */
	public void setScoreNobelMoi(int scoreNobelMoi) {
		this.scoreNobelMoi = scoreNobelMoi;
	}

	/**
	 * @return the scorePresidentMoi
	 */
	public int getScorePresidentMoi() {
		return scorePresidentMoi;
	}

	/**
	 * @param scorePresidentMoi the scorePresidentMoi to set
	 */
	public void setScorePresidentMoi(int scorePresidentMoi) {
		this.scorePresidentMoi = scorePresidentMoi;
	}

	/**
	 * @return the scoreArtisteMoi
	 */
	public int getScoreArtisteMoi() {
		return scoreArtisteMoi;
	}

	/**
	 * @param scoreArtisteMoi the scoreArtisteMoi to set
	 */
	public void setScoreArtisteMoi(int scoreArtisteMoi) {
		this.scoreArtisteMoi = scoreArtisteMoi;
	}

	/**
	 * @return the scorePaysAmi
	 */
	public int getScorePaysAmi() {
		return scorePaysAmi;
	}

	/**
	 * @param scorePaysAmi the scorePaysAmi to set
	 */
	public void setScorePaysAmi(int scorePaysAmi) {
		this.scorePaysAmi = scorePaysAmi;
	}

	/**
	 * @return the scoreCapitaleAmi
	 */
	public int getScoreCapitaleAmi() {
		return scoreCapitaleAmi;
	}

	/**
	 * @param scoreCapitaleAmi the scoreCapitaleAmi to set
	 */
	public void setScoreCapitaleAmi(int scoreCapitaleAmi) {
		this.scoreCapitaleAmi = scoreCapitaleAmi;
	}

	/**
	 * @return the scoreNobelAmi
	 */
	public int getScoreNobelAmi() {
		return scoreNobelAmi;
	}

	/**
	 * @param scoreNobelAmi the scoreNobelAmi to set
	 */
	public void setScoreNobelAmi(int scoreNobelAmi) {
		this.scoreNobelAmi = scoreNobelAmi;
	}

	/**
	 * @return the scorePresidentAmi
	 */
	public int getScorePresidentAmi() {
		return scorePresidentAmi;
	}

	/**
	 * @param scorePresidentAmi the scorePresidentAmi to set
	 */
	public void setScorePresidentAmi(int scorePresidentAmi) {
		this.scorePresidentAmi = scorePresidentAmi;
	}

	/**
	 * @return the scoreArtisteAmi
	 */
	public int getScoreArtisteAmi() {
		return scoreArtisteAmi;
	}

	/**
	 * @param scoreArtisteAmi the scoreArtisteAmi to set
	 */
	public void setScoreArtisteAmi(int scoreArtisteAmi) {
		this.scoreArtisteAmi = scoreArtisteAmi;
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
	 * @return the nbErreursPaysMoi
	 */
	public int getNbErreursPaysMoi() {
		return nbErreursPaysMoi;
	}

	/**
	 * @param nbErreursPaysMoi the nbErreursPaysMoi to set
	 */
	public void setNbErreursPaysMoi(int nbErreursPaysMoi) {
		this.nbErreursPaysMoi = nbErreursPaysMoi;
	}

	/**
	 * @return the nbErreursCapitaleMoi
	 */
	public int getNbErreursCapitaleMoi() {
		return nbErreursCapitaleMoi;
	}

	/**
	 * @param nbErreursCapitaleMoi the nbErreursCapitaleMoi to set
	 */
	public void setNbErreursCapitaleMoi(int nbErreursCapitaleMoi) {
		this.nbErreursCapitaleMoi = nbErreursCapitaleMoi;
	}

	/**
	 * @return the nbErreursNobelMoi
	 */
	public int getNbErreursNobelMoi() {
		return nbErreursNobelMoi;
	}

	/**
	 * @param nbErreursNobelMoi the nbErreursNobelMoi to set
	 */
	public void setNbErreursNobelMoi(int nbErreursNobelMoi) {
		this.nbErreursNobelMoi = nbErreursNobelMoi;
	}

	/**
	 * @return the nbErreursPresidentMoi
	 */
	public int getNbErreursPresidentMoi() {
		return nbErreursPresidentMoi;
	}

	/**
	 * @param nbErreursPresidentMoi the nbErreursPresidentMoi to set
	 */
	public void setNbErreursPresidentMoi(int nbErreursPresidentMoi) {
		this.nbErreursPresidentMoi = nbErreursPresidentMoi;
	}

	/**
	 * @return the nbErreursArtisteMoi
	 */
	public int getNbErreursArtisteMoi() {
		return nbErreursArtisteMoi;
	}

	/**
	 * @param nbErreursArtisteMoi the nbErreursArtisteMoi to set
	 */
	public void setNbErreursArtisteMoi(int nbErreursArtisteMoi) {
		this.nbErreursArtisteMoi = nbErreursArtisteMoi;
	}

	/**
	 * @return the nbErreursPaysAmi
	 */
	public int getNbErreursPaysAmi() {
		return nbErreursPaysAmi;
	}

	/**
	 * @param nbErreursPaysAmi the nbErreursPaysAmi to set
	 */
	public void setNbErreursPaysAmi(int nbErreursPaysAmi) {
		this.nbErreursPaysAmi = nbErreursPaysAmi;
	}

	/**
	 * @return the nbErreursCapitaleAmi
	 */
	public int getNbErreursCapitaleAmi() {
		return nbErreursCapitaleAmi;
	}

	/**
	 * @param nbErreursCapitaleAmi the nbErreursCapitaleAmi to set
	 */
	public void setNbErreursCapitaleAmi(int nbErreursCapitaleAmi) {
		this.nbErreursCapitaleAmi = nbErreursCapitaleAmi;
	}

	/**
	 * @return the nbErreursNobelAmi
	 */
	public int getNbErreursNobelAmi() {
		return nbErreursNobelAmi;
	}

	/**
	 * @param nbErreursNobelAmi the nbErreursNobelAmi to set
	 */
	public void setNbErreursNobelAmi(int nbErreursNobelAmi) {
		this.nbErreursNobelAmi = nbErreursNobelAmi;
	}

	/**
	 * @return the nbErreursPresidentAmi
	 */
	public int getNbErreursPresidentAmi() {
		return nbErreursPresidentAmi;
	}

	/**
	 * @param nbErreursPresidentAmi the nbErreursPresidentAmi to set
	 */
	public void setNbErreursPresidentAmi(int nbErreursPresidentAmi) {
		this.nbErreursPresidentAmi = nbErreursPresidentAmi;
	}

	/**
	 * @return the nbErreursArtisteAmi
	 */
	public int getNbErreursArtisteAmi() {
		return nbErreursArtisteAmi;
	}

	/**
	 * @param nbErreursArtisteAmi the nbErreursArtisteAmi to set
	 */
	public void setNbErreursArtisteAmi(int nbErreursArtisteAmi) {
		this.nbErreursArtisteAmi = nbErreursArtisteAmi;
	}

	/**
	 * @return the dateStringMoi
	 */
	public String getDateStringMoi() {
		return dateStringMoi;
	}

	/**
	 * @param dateStringMoi the dateStringMoi to set
	 */
	public void setDateStringMoi(String dateStringMoi) {
		this.dateStringMoi = dateStringMoi;
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
	 * @return the scoreTotalMoi
	 */
	public int getScoreTotalMoi() {
		return scoreTotalMoi;
	}

	/**
	 * @param scoreTotalMoi the scoreTotalMoi to set
	 */
	public void setScoreTotalMoi(int scoreTotalMoi) {
		this.scoreTotalMoi = scoreTotalMoi;
	}

	/**
	 * @return the scoreTotalAmi
	 */
	public int getScoreTotalAmi() {
		return scoreTotalAmi;
	}

	/**
	 * @param scoreTotalAmi the scoreTotalAmi to set
	 */
	public void setScoreTotalAmi(int scoreTotalAmi) {
		this.scoreTotalAmi = scoreTotalAmi;
	}

	/**
	 * @return the scoreTotalMax
	 */
	public int getScoreTotalMax() {
		return scoreTotalMax;
	}

	/**
	 * @param scoreTotalMax the scoreTotalMax to set
	 */
	public void setScoreTotalMax(int scoreTotalMax) {
		this.scoreTotalMax = scoreTotalMax;
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
	 * @return the longueurDesMots
	 */
	public int getLongueurDesMots() {
		return longueurDesMots;
	}

	/**
	 * @param longueurDesMots the longueurDesMots to set
	 */
	public void setLongueurDesMots(int longueurDesMots) {
		this.longueurDesMots = longueurDesMots;
	}
	
	
	
	
}
