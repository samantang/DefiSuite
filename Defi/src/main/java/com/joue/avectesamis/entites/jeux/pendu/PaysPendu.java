package com.joue.avectesamis.entites.jeux.pendu;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PaysPendu {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
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
	 * 
	 */
	public PaysPendu() {
		super();
		// TODO Auto-generated constructor stub
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
	 */
	public PaysPendu(Date datePays, String dateStringPays,
			String lettreStringPays, String tempsDepartPays,
			String tempsRestantPays, String motPays, String motDepartPays,
			int nbErreursPays, int scorePays, int scoreMaxPays) {
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
	}
	
	
	
	
}
