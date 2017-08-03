package com.joue.avectesamis.entites.jeux;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Artistes implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nom;
	private String pays;
	private String lette;
	private String periode;
	private String categorie;
	private String lettre;
	
	
	
	
	
	
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
	 * @return the periode
	 */
	public String getPeriode() {
		return periode;
	}
	/**
	 * @param periode the periode to set
	 */
	public void setPeriode(String periode) {
		this.periode = periode;
	}
	/**
	 * @return the categorie
	 */
	public String getCategorie() {
		return categorie;
	}
	/**
	 * @param categorie the categorie to set
	 */
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	/**
	 * @return the lette
	 */
	public String getLette() {
		return lette;
	}
	/**
	 * @param lette the lette to set
	 */
	public void setLette(String lette) {
		this.lette = lette;
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
	 * 
	 */
	public Artistes() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
