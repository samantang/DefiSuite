package com.joue.avectesamis.entites;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Photo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String nom;
	@ManyToOne
	@JoinColumn(name="code_album")
	private Album album;
	private int nro;
	private Date photoDate;
	
	
	/**
	 * 
	 */
	public Photo() {
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
	 * @return the album
	 */
	public Album getAlbum() {
		return album;
	}


	/**
	 * @param album the album to set
	 */
	public void setAlbum(Album album) {
		this.album = album;
	}


	/**
	 * @return the nro
	 */
	public int getNro() {
		return nro;
	}


	/**
	 * @param nro the nro to set
	 */
	public void setNro(int nro) {
		this.nro = nro;
	}


	/**
	 * @return the photoDate
	 */
	public Date getPhotoDate() {
		return photoDate;
	}


	/**
	 * @param photoDate the photoDate to set
	 */
	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}
	
	
	
	

}
