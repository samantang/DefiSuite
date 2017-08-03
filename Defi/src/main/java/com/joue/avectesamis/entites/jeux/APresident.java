package com.joue.avectesamis.entites.jeux;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class APresident implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nom;
	private String pays;
	private String periode;
	private String statut;
	
	
	
	/**
	 * @return the statut
	 */
	public String getStatut() {
		return statut;
	}
	/**
	 * @param statut the statut to set
	 */
	public void setStatut(String statut) {
		this.statut = statut;
	}
	/**
	 * 
	 */
	public APresident() {
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

	
	
}
