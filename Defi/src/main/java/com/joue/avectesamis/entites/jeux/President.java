package com.joue.avectesamis.entites.jeux;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class President implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nom;
	private String pays;
	private String lien;
	private String statut;
	private String depuis;
	
	
	
	
	
	/**
	 * @return the depuis
	 */
	public String getDepuis() {
		return depuis;
	}
	/**
	 * @param depuis the depuis to set
	 */
	public void setDepuis(String depuis) {
		this.depuis = depuis;
	}
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
	 * @return the lien
	 */
	public String getLien() {
		return lien;
	}
	/**
	 * @param lien the lien to set
	 */
	public void setLien(String lien) {
		this.lien = lien;
	}
	/**
	 * 
	 */
	public President() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
