package com.joue.avectesamis.entites.jeux;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Nobels implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nom;
	private String domaine;
	private int annee;
	private String pays;
	
	
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
	 * @return the domaine
	 */
	public String getDomaine() {
		return domaine;
	}
	/**
	 * @param domaine the domaine to set
	 */
	public void setDomaine(String domaine) {
		this.domaine = domaine;
	}
	/**
	 * @return the annee
	 */
	public int getAnnee() {
		return annee;
	}
	/**
	 * @param annee the annee to set
	 */
	public void setAnnee(int annee) {
		this.annee = annee;
	}
	/**
	 * 
	 */
	public Nobels() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
