package com.joue.avectesamis.entites.jeux;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class VilleFrance implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nom;
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
	 * 
	 */
	public VilleFrance() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
