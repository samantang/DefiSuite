package com.joue.avectesamis.models;

public class MesAmisJeuxModel {

	private Long id;
	private String nom;
	private String prenom;
	
	private boolean abcChallenger;
	private boolean abcRefuser;
	private boolean abcAnnuler;
	private boolean abcAttente;
	
	private boolean dicoChallenger;
	private boolean dicoRefuser;
	private boolean dicoAnnuler;
	private boolean dicoAttente;
	
	private boolean sujetsChallenger;
	private boolean sujetsRefuser;
	private boolean sujetsAnnuler;
	private boolean sujetsAttente;
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
	 * @return the abcChallenger
	 */
	public boolean isAbcChallenger() {
		return abcChallenger;
	}
	/**
	 * @param abcChallenger the abcChallenger to set
	 */
	public void setAbcChallenger(boolean abcChallenger) {
		this.abcChallenger = abcChallenger;
	}
	/**
	 * @return the abcRefuser
	 */
	public boolean isAbcRefuser() {
		return abcRefuser;
	}
	/**
	 * @param abcRefuser the abcRefuser to set
	 */
	public void setAbcRefuser(boolean abcRefuser) {
		this.abcRefuser = abcRefuser;
	}
	/**
	 * @return the abcAnnuler
	 */
	public boolean isAbcAnnuler() {
		return abcAnnuler;
	}
	/**
	 * @param abcAnnuler the abcAnnuler to set
	 */
	public void setAbcAnnuler(boolean abcAnnuler) {
		this.abcAnnuler = abcAnnuler;
	}
	/**
	 * @return the abcAttente
	 */
	public boolean isAbcAttente() {
		return abcAttente;
	}
	/**
	 * @param abcAttente the abcAttente to set
	 */
	public void setAbcAttente(boolean abcAttente) {
		this.abcAttente = abcAttente;
	}
	/**
	 * @return the dicoChallenger
	 */
	public boolean isDicoChallenger() {
		return dicoChallenger;
	}
	/**
	 * @param dicoChallenger the dicoChallenger to set
	 */
	public void setDicoChallenger(boolean dicoChallenger) {
		this.dicoChallenger = dicoChallenger;
	}
	/**
	 * @return the dicoRefuser
	 */
	public boolean isDicoRefuser() {
		return dicoRefuser;
	}
	/**
	 * @param dicoRefuser the dicoRefuser to set
	 */
	public void setDicoRefuser(boolean dicoRefuser) {
		this.dicoRefuser = dicoRefuser;
	}
	/**
	 * @return the dicoAnnuler
	 */
	public boolean isDicoAnnuler() {
		return dicoAnnuler;
	}
	/**
	 * @param dicoAnnuler the dicoAnnuler to set
	 */
	public void setDicoAnnuler(boolean dicoAnnuler) {
		this.dicoAnnuler = dicoAnnuler;
	}
	/**
	 * @return the dicoAttente
	 */
	public boolean isDicoAttente() {
		return dicoAttente;
	}
	/**
	 * @param dicoAttente the dicoAttente to set
	 */
	public void setDicoAttente(boolean dicoAttente) {
		this.dicoAttente = dicoAttente;
	}
	/**
	 * @return the sujetsChallenger
	 */
	public boolean isSujetsChallenger() {
		return sujetsChallenger;
	}
	/**
	 * @param sujetsChallenger the sujetsChallenger to set
	 */
	public void setSujetsChallenger(boolean sujetsChallenger) {
		this.sujetsChallenger = sujetsChallenger;
	}
	/**
	 * @return the sujetsRefuser
	 */
	public boolean isSujetsRefuser() {
		return sujetsRefuser;
	}
	/**
	 * @param sujetsRefuser the sujetsRefuser to set
	 */
	public void setSujetsRefuser(boolean sujetsRefuser) {
		this.sujetsRefuser = sujetsRefuser;
	}
	/**
	 * @return the sujetsAnnuler
	 */
	public boolean isSujetsAnnuler() {
		return sujetsAnnuler;
	}
	/**
	 * @param sujetsAnnuler the sujetsAnnuler to set
	 */
	public void setSujetsAnnuler(boolean sujetsAnnuler) {
		this.sujetsAnnuler = sujetsAnnuler;
	}
	/**
	 * @return the sujetsAttente
	 */
	public boolean isSujetsAttente() {
		return sujetsAttente;
	}
	/**
	 * @param sujetsAttente the sujetsAttente to set
	 */
	public void setSujetsAttente(boolean sujetsAttente) {
		this.sujetsAttente = sujetsAttente;
	}
	/**
	 * 
	 */
	public MesAmisJeuxModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param id
	 * @param nom
	 * @param prenom
	 * @param abcChallenger
	 * @param abcRefuser
	 * @param abcAnnuler
	 * @param abcAttente
	 * @param dicoChallenger
	 * @param dicoRefuser
	 * @param dicoAnnuler
	 * @param dicoAttente
	 * @param sujetsChallenger
	 * @param sujetsRefuser
	 * @param sujetsAnnuler
	 * @param sujetsAttente
	 */
	public MesAmisJeuxModel(Long id, String nom, String prenom,
			boolean abcChallenger, boolean abcRefuser, boolean abcAnnuler,
			boolean abcAttente, boolean dicoChallenger, boolean dicoRefuser,
			boolean dicoAnnuler, boolean dicoAttente, boolean sujetsChallenger,
			boolean sujetsRefuser, boolean sujetsAnnuler, boolean sujetsAttente) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.abcChallenger = abcChallenger;
		this.abcRefuser = abcRefuser;
		this.abcAnnuler = abcAnnuler;
		this.abcAttente = abcAttente;
		this.dicoChallenger = dicoChallenger;
		this.dicoRefuser = dicoRefuser;
		this.dicoAnnuler = dicoAnnuler;
		this.dicoAttente = dicoAttente;
		this.sujetsChallenger = sujetsChallenger;
		this.sujetsRefuser = sujetsRefuser;
		this.sujetsAnnuler = sujetsAnnuler;
		this.sujetsAttente = sujetsAttente;
	}
	
	
	
	
	
	
}
