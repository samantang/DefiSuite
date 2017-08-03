package com.joue.avectesamis.entites.jeux;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Pays_Capitale implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String capitale;
	private String pays;
	private String habitants;
	private String lienPays;
	private String lienCapitale;
	
	
	/**
	 * @return the lienPays
	 */
	public String getLienPays() {
		return lienPays;
	}
	/**
	 * @param lienPays the lienPays to set
	 */
	public void setLienPays(String lienPays) {
		this.lienPays = lienPays;
	}
	/**
	 * @return the lienCapitale
	 */
	public String getLienCapitale() {
		return lienCapitale;
	}
	/**
	 * @param lienCapitale the lienCapitale to set
	 */
	public void setLienCapitale(String lienCapitale) {
		this.lienCapitale = lienCapitale;
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
	 * @return the habitants
	 */
	public String getHabitants() {
		return habitants;
	}
	/**
	 * @param habitants the habitants to set
	 */
	public void setHabitants(String habitants) {
		this.habitants = habitants;
	}
	/**
	 * 
	 */
	public Pays_Capitale() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
