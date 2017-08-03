package com.joue.avectesamis.entites;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class AbcSolo implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String email;
	private int score;
	private Date date ;
	private String lettre;
	private String time ;
	private String help ;
	private String agglo ;
	private String aPresident ;
	private String president ;
	private String animal ;
	private String artiste ;
	private String capitale ;
	private String pays ;
	private String nobel ;
	private String ville ;
	private String timeOut ;
	private int scoreMax;
	@ManyToOne
	private Friend friend;
	@OneToOne
//	(fetch=FetchType.EAGER, cascade=CascadeType.ALL)
	private AbcSoloJeux abcsolojeux;
	
	
	
	
	
	
	
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
	 * @return the abcsolojeux
	 */
	public AbcSoloJeux getAbcsolojeux() {
		return abcsolojeux;
	}
	/**
	 * @param abcsolojeux the abcsolojeux to set
	 */
	public void setAbcsolojeux(AbcSoloJeux abcsolojeux) {
		this.abcsolojeux = abcsolojeux;
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
	public String getTime() {
		return time;
	}
	/**
	 * @param time the time to set
	 */
	public void setTime(String time) {
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
	public String getAgglo() {
		return agglo;
	}
	/**
	 * @param agglo the agglo to set
	 */
	public void setAgglo(String agglo) {
		this.agglo = agglo;
	}
	/**
	 * @return the aPresident
	 */
	public String getaPresident() {
		return aPresident;
	}
	/**
	 * @param aPresident the aPresident to set
	 */
	public void setaPresident(String aPresident) {
		this.aPresident = aPresident;
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
	 * @return the animal
	 */
	public String getAnimal() {
		return animal;
	}
	/**
	 * @param animal the animal to set
	 */
	public void setAnimal(String animal) {
		this.animal = animal;
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
	 * @return the ville
	 */
	public String getVille() {
		return ville;
	}
	/**
	 * @param ville the ville to set
	 */
	public void setVille(String ville) {
		this.ville = ville;
	}
	/**
	 * @return the timeOut
	 */
	public String getTimeOut() {
		return timeOut;
	}
	/**
	 * @param timeOut the timeOut to set
	 */
	public void setTimeOut(String timeOut) {
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
	public AbcSolo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
//	@OneToOne
//	private AbcSoloJeux abcsolojeux;
	
	
	
}
