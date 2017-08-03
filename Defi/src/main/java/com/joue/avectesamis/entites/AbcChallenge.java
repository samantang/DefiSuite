package com.joue.avectesamis.entites;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class AbcChallenge {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
//	private Long idAmiChallenge;
	private String codeIndentification;
	private String email;
	private int score;
	private Date date ;
	private char lettre;
	private int time ;
	private String help ; 
	private Long idAmi;
	private int scoreMax;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>agglo ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>aPresident ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>president ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>animal ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>artiste ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>capitale ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>pays ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>nobel ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>ville ;
	private int timeOut ;
	@OneToOne
	private Friend friend;
	@OneToOne
	private Friend monFriend;
//	les infos de mon ami en challenge
	private int scoreAmi;
	private boolean timeOutAmi;
	private String tempsRestantAmi;
	private String dateStringAmi;
	private boolean aideAmi;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>aggloAmi ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>aPresidentAmi ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>presidentAmi ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>animalAmi ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>artisteAmi ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>capitaleAmi ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>paysAmi ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>nobelAmi ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private Set<String>villeAmi ;
//	mes ifos qui manquaient
	private String dateString;
	private boolean timeOutMoi;
	private boolean aide;
	private String tempsRestant;
	
//	si l'ami a joué
	private boolean amiJoue;
//	si le jeu est publie ou pas
	private boolean publie;
	
	
	
	
	
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
	 * @return the amiJoue
	 */
	public boolean isAmiJoue() {
		return amiJoue;
	}
	/**
	 * @param amiJoue the amiJoue to set
	 */
	public void setAmiJoue(boolean amiJoue) {
		this.amiJoue = amiJoue;
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
	 * @return the timeOutMoi
	 */
	public boolean isTimeOutMoi() {
		return timeOutMoi;
	}
	/**
	 * @param timeOutMoi the timeOutMoi to set
	 */
	public void setTimeOutMoi(boolean timeOutMoi) {
		this.timeOutMoi = timeOutMoi;
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
	 * @return the aggloAmi
	 */
	public Set<String> getAggloAmi() {
		return aggloAmi;
	}
	/**
	 * @param aggloAmi the aggloAmi to set
	 */
	public void setAggloAmi(Set<String> aggloAmi) {
		this.aggloAmi = aggloAmi;
	}
	/**
	 * @return the aPresidentAmi
	 */
	public Set<String> getaPresidentAmi() {
		return aPresidentAmi;
	}
	/**
	 * @param aPresidentAmi the aPresidentAmi to set
	 */
	public void setaPresidentAmi(Set<String> aPresidentAmi) {
		this.aPresidentAmi = aPresidentAmi;
	}
	/**
	 * @return the presidentAmi
	 */
	public Set<String> getPresidentAmi() {
		return presidentAmi;
	}
	/**
	 * @param presidentAmi the presidentAmi to set
	 */
	public void setPresidentAmi(Set<String> presidentAmi) {
		this.presidentAmi = presidentAmi;
	}
	/**
	 * @return the animalAmi
	 */
	public Set<String> getAnimalAmi() {
		return animalAmi;
	}
	/**
	 * @param animalAmi the animalAmi to set
	 */
	public void setAnimalAmi(Set<String> animalAmi) {
		this.animalAmi = animalAmi;
	}
	/**
	 * @return the artisteAmi
	 */
	public Set<String> getArtisteAmi() {
		return artisteAmi;
	}
	/**
	 * @param artisteAmi the artisteAmi to set
	 */
	public void setArtisteAmi(Set<String> artisteAmi) {
		this.artisteAmi = artisteAmi;
	}
	/**
	 * @return the capitaleAmi
	 */
	public Set<String> getCapitaleAmi() {
		return capitaleAmi;
	}
	/**
	 * @param capitaleAmi the capitaleAmi to set
	 */
	public void setCapitaleAmi(Set<String> capitaleAmi) {
		this.capitaleAmi = capitaleAmi;
	}
	/**
	 * @return the paysAmi
	 */
	public Set<String> getPaysAmi() {
		return paysAmi;
	}
	/**
	 * @param paysAmi the paysAmi to set
	 */
	public void setPaysAmi(Set<String> paysAmi) {
		this.paysAmi = paysAmi;
	}
	/**
	 * @return the nobelAmi
	 */
	public Set<String> getNobelAmi() {
		return nobelAmi;
	}
	/**
	 * @param nobelAmi the nobelAmi to set
	 */
	public void setNobelAmi(Set<String> nobelAmi) {
		this.nobelAmi = nobelAmi;
	}
	/**
	 * @return the villeAmi
	 */
	public Set<String> getVilleAmi() {
		return villeAmi;
	}
	/**
	 * @param villeAmi the villeAmi to set
	 */
	public void setVilleAmi(Set<String> villeAmi) {
		this.villeAmi = villeAmi;
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
	 * @return the idAmi
	 */
	public Long getIdAmi() {
		return idAmi;
	}
	/**
	 * @param idAmi the idAmi to set
	 */
	public void setIdAmi(Long idAmi) {
		this.idAmi = idAmi;
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
//	/**
//	 * @return the idAmiChallenge
//	 */
//	public Long getIdAmiChallenge() {
//		return idAmiChallenge;
//	}
//	/**
//	 * @param idAmiChallenge the idAmiChallenge to set
//	 */
//	public void setIdAmiChallenge(Long idAmiChallenge) {
//		this.idAmiChallenge = idAmiChallenge;
//	}
//	
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
	 * @return the lettre
	 */
	public char getLettre() {
		return lettre;
	}
	/**
	 * @param lettre the lettre to set
	 */
	public void setLettre(char lettre) {
		this.lettre = lettre;
	}
	/**
	 * @return the time
	 */
	public int getTime() {
		return time;
	}
	/**
	 * @param time the time to set
	 */
	public void setTime(int time) {
		this.time = time;
	}
	/**
	 * @return the help
	 */
	public String getHelp() {
		return help;
	}
	/**
	 * @param help the help to set
	 */
	public void setHelp(String help) {
		this.help = help;
	}
	/**
	 * @return the agglo
	 */
	public Set<String> getAgglo() {
		return agglo;
	}
	/**
	 * @param agglo the agglo to set
	 */
	public void setAgglo(Set<String> agglo) {
		this.agglo = agglo;
	}
	/**
	 * @return the aPresident
	 */
	public Set<String> getaPresident() {
		return aPresident;
	}
	/**
	 * @param aPresident the aPresident to set
	 */
	public void setaPresident(Set<String> aPresident) {
		this.aPresident = aPresident;
	}
	/**
	 * @return the president
	 */
	public Set<String> getPresident() {
		return president;
	}
	/**
	 * @param president the president to set
	 */
	public void setPresident(Set<String> president) {
		this.president = president;
	}
	/**
	 * @return the animal
	 */
	public Set<String> getAnimal() {
		return animal;
	}
	/**
	 * @param animal the animal to set
	 */
	public void setAnimal(Set<String> animal) {
		this.animal = animal;
	}
	/**
	 * @return the artiste
	 */
	public Set<String> getArtiste() {
		return artiste;
	}
	/**
	 * @param artiste the artiste to set
	 */
	public void setArtiste(Set<String> artiste) {
		this.artiste = artiste;
	}
	/**
	 * @return the capitale
	 */
	public Set<String> getCapitale() {
		return capitale;
	}
	/**
	 * @param capitale the capitale to set
	 */
	public void setCapitale(Set<String> capitale) {
		this.capitale = capitale;
	}
	/**
	 * @return the pays
	 */
	public Set<String> getPays() {
		return pays;
	}
	/**
	 * @param pays the pays to set
	 */
	public void setPays(Set<String> pays) {
		this.pays = pays;
	}
	/**
	 * @return the nobel
	 */
	public Set<String> getNobel() {
		return nobel;
	}
	/**
	 * @param nobel the nobel to set
	 */
	public void setNobel(Set<String> nobel) {
		this.nobel = nobel;
	}
	/**
	 * @return the ville
	 */
	public Set<String> getVille() {
		return ville;
	}
	/**
	 * @param ville the ville to set
	 */
	public void setVille(Set<String> ville) {
		this.ville = ville;
	}
	/**
	 * @return the timeOut
	 */
	public int getTimeOut() {
		return timeOut;
	}
	/**
	 * @param timeOut the timeOut to set
	 */
	public void setTimeOut(int timeOut) {
		this.timeOut = timeOut;
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
	 * 
	 */
	public AbcChallenge() {
		super();
		// TODO Auto-generated constructor stub
	}

/**
 * @param score
 * @param date
 * @param lettre
 * @param scoreMax
 * @param agglo
 * @param aPresident
 * @param president
 * @param animal
 * @param artiste
 * @param capitale
 * @param pays
 * @param nobel
 * @param ville
 * @param dateString
 * @param aide
 * @param tempsRestant
 */
public AbcChallenge(int score, Date date, char lettre, int scoreMax,
		Set<String> agglo, Set<String> aPresident, Set<String> president,
		Set<String> animal, Set<String> artiste, Set<String> capitale,
		Set<String> pays, Set<String> nobel, Set<String> ville,
		String dateString, boolean aide, String tempsRestant) {
	super();
	this.score = score;
	this.date = date;
	this.lettre = lettre;
	this.scoreMax = scoreMax;
	this.agglo = agglo;
	this.aPresident = aPresident;
	this.president = president;
	this.animal = animal;
	this.artiste = artiste;
	this.capitale = capitale;
	this.pays = pays;
	this.nobel = nobel;
	this.ville = ville;
	this.dateString = dateString;
	this.aide = aide;
	this.tempsRestant = tempsRestant;
}
	
	
}
