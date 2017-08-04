package com.joue.avectesamis.entites;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
public class AbcSoloJeux implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String email;
	private int score;
	private Date date ;
	private String datestring;
	private String lettre;
	private Character lettrechar;
	private int time ;
	private String help ; 
	private int scoreMax;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<String>agglo ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<String>aPresident ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<String>president ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<String>animal ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<String>artiste ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<String>capitale ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<String>pays ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<String>nobel ;
	@ElementCollection(fetch=FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<String>ville ;
	private int timeOut ;
	@OneToOne
	private AbcSolo solo;
	private boolean publie;
	private String tempsRestant;
	
	
	
	
	/**
	 * @param email
	 * @param score
	 * @param date
	 * @param lettre
	 * @param time
	 * @param help
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
	 * @param timeOut
	 */
	public AbcSoloJeux(String email, int score, Date date, String lettre,
			int time, String help, int scoreMax, List<String> agglo,
			List<String> aPresident, List<String> president,
			List<String> animal, List<String> artiste, List<String> capitale,
			List<String> pays, List<String> nobel, List<String> ville,
			int timeOut) {
		super();
		this.email = email;
		this.score = score;
		this.date = date;
		this.lettre = lettre;
		this.time = time;
		this.help = help;
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
		this.timeOut = timeOut;
	}
	
	public boolean isPublie() {
		return publie;
	}

	public void setPublie(boolean publie) {
		this.publie = publie;
	}
	

	public String getTempsRestant() {
		return tempsRestant;
	}

	public void setTempsRestant(String tempsRestant) {
		this.tempsRestant = tempsRestant;
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
	 * @param email
	 * @param score
	 * @param date
	 * @param lettre
	 * @param time
	 * @param help
	 * @param agglo
	 * @param aPresident
	 * @param president
	 * @param animal
	 * @param artiste
	 * @param capitale
	 * @param pays
	 * @param nobel
	 * @param ville
	 * @param timeOut
	 */
	public AbcSoloJeux(String email, int score, Date date, String lettre,
			int time, String help, List<String> agglo, List<String> aPresident,
			List<String> president, List<String> animal, List<String> artiste,
			List<String> capitale, List<String> pays, List<String> nobel,
			List<String> ville, int timeOut) {
		super();
		this.email = email;
		this.score = score;
		this.date = date;
		this.lettre = lettre;
		this.time = time;
		this.help = help;
		this.agglo = agglo;
		this.aPresident = aPresident;
		this.president = president;
		this.animal = animal;
		this.artiste = artiste;
		this.capitale = capitale;
		this.pays = pays;
		this.nobel = nobel;
		this.ville = ville;
		this.timeOut = timeOut;
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
	public String getLettre() {
		return lettre;
	}
	/**
	 * @param lettre the lettre to set
	 */
	public void setLettre(String lettre) {
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
	public List<String> getAgglo() {
		return agglo;
	}
	
	/**
	 * @return the aPresident
	 */
	public List<String> getaPresident() {
		return aPresident;
	}
	/**
	 * @param aPresident the aPresident to set
	 */
	public void setaPresident(List<String> aPresident) {
		this.aPresident = aPresident;
	}
	/**
	 * @param agglo the agglo to set
	 */
	public void setAgglo(List<String> agglo) {
		this.agglo = agglo;
	}
//	/**
//	 * @return the aPresident
//	 */
//	public List<String> getaPresident() {
//		return aPresident;
//	}
//	/**
//	 * @param aPresident the aPresident to set
//	 */
//	public void setaPresident(List<String> aPresident) {
//		this.aPresident = aPresident;
//	}
	/**
	 * @return the president
	 */
	public List<String> getPresident() {
		return president;
	}
	/**
	 * @param president the president to set
	 */
	public void setPresident(List<String> president) {
		this.president = president;
	}
	/**
	 * @return the animal
	 */
	public List<String> getAnimal() {
		return animal;
	}
	/**
	 * @param animal the animal to set
	 */
	public void setAnimal(List<String> animal) {
		this.animal = animal;
	}
	/**
	 * @return the artiste
	 */
	public List<String> getArtiste() {
		return artiste;
	}
	/**
	 * @param artiste the artiste to set
	 */
	public void setArtiste(List<String> artiste) {
		this.artiste = artiste;
	}
	/**
	 * @return the capitale
	 */
	public List<String> getCapitale() {
		return capitale;
	}
	/**
	 * @param capitale the capitale to set
	 */
	public void setCapitale(List<String> capitale) {
		this.capitale = capitale;
	}
	/**
	 * @return the pays
	 */
	public List<String> getPays() {
		return pays;
	}
	/**
	 * @param pays the pays to set
	 */
	public void setPays(List<String> pays) {
		this.pays = pays;
	}
	/**
	 * @return the nobel
	 */
	public List<String> getNobel() {
		return nobel;
	}
	/**
	 * @param nobel the nobel to set
	 */
	public void setNobel(List<String> nobel) {
		this.nobel = nobel;
	}
	/**
	 * @return the ville
	 */
	public List<String> getVille() {
		return ville;
	}
	/**
	 * @param ville the ville to set
	 */
	public void setVille(List<String> ville) {
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
	 * 
	 */
	public AbcSoloJeux() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param agglo
	 * @param aPresident
	 * @param president
	 * @param animal
	 * @param artiste
	 * @param capitale
	 * @param pays
	 * @param nobel
	 * @param ville
	 */
	public AbcSoloJeux(List<String> agglo, List<String> aPresident,
			List<String> president, List<String> animal, List<String> artiste,
			List<String> capitale, List<String> pays, List<String> nobel,
			List<String> ville) {
		super();
		this.agglo = agglo;
		this.aPresident = aPresident;
		this.president = president;
		this.animal = animal;
		this.artiste = artiste;
		this.capitale = capitale;
		this.pays = pays;
		this.nobel = nobel;
		this.ville = ville;
	}
	/**
	 * @return the datestring
	 */
	public String getDatestring() {
		return datestring;
	}
	/**
	 * @param datestring the datestring to set
	 */
	public void setDatestring(String datestring) {
		this.datestring = datestring;
	}
	/**
	 * @return the solo
	 */
	public AbcSolo getSolo() {
		return solo;
	}
	/**
	 * @param solo the solo to set
	 */
	public void setSolo(AbcSolo solo) {
		this.solo = solo;
	}
	/**
	 * @param email
	 * @param score
	 * @param datestring
	 * @param lettre
	 * @param time
	 * @param help
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
	 * @param timeOut
	 */
	public AbcSoloJeux(String email, int score, String datestring,
			String lettre, int time, String help, int scoreMax,
			List<String> agglo, List<String> aPresident,
			List<String> president, List<String> animal, List<String> artiste,
			List<String> capitale, List<String> pays, List<String> nobel,
			List<String> ville, int timeOut) {
		super();
		this.email = email;
		this.score = score;
		this.datestring = datestring;
		this.lettre = lettre;
		this.time = time;
		this.help = help;
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
		this.timeOut = timeOut;
	}
	/**
	 * @return the lettrechar
	 */
	public Character getLettrechar() {
		return lettrechar;
	}
	/**
	 * @param lettrechar the lettrechar to set
	 */
	public void setLettrechar(Character lettrechar) {
		this.lettrechar = lettrechar;
	}
	/**
	 * @param email
	 * @param score
	 * @param datestring
	 * @param lettrechar
	 * @param time
	 * @param help
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
	 * @param timeOut
	 * @param tempsRestant
	 */
	public AbcSoloJeux(String email, int score, String datestring,
			Character lettrechar, int time, String help, int scoreMax,
			List<String> agglo, List<String> aPresident,
			List<String> president, List<String> animal, List<String> artiste,
			List<String> capitale, List<String> pays, List<String> nobel,
			List<String> ville, int timeOut, String tempsRestant) {
		super();
		this.email = email;
		this.score = score;
		this.datestring = datestring;
		this.lettrechar = lettrechar;
		this.time = time;
		this.help = help;
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
		this.timeOut = timeOut;
		this.tempsRestant = tempsRestant;
	}
	
	
	
	
	
}
