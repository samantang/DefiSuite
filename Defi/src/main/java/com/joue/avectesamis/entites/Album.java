package com.joue.avectesamis.entites;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Album {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name="code_friend")
	private Friend friend;
	@OneToMany(mappedBy="album", fetch=FetchType.LAZY)
	private Collection<Photo> photos;
	private String nom;
	private Date albumDate;
	
	
	
	
	/**
	 * 
	 */
	public Album() {
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
	 * @return the photos
	 */
	public Collection<Photo> getPhotos() {
		return photos;
	}




	/**
	 * @param photos the photos to set
	 */
	public void setPhotos(Collection<Photo> photos) {
		this.photos = photos;
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
	 * @return the albumDate
	 */
	public Date getAlbumDate() {
		return albumDate;
	}




	/**
	 * @param albumDate the albumDate to set
	 */
	public void setAlbumDate(Date albumDate) {
		this.albumDate = albumDate;
	}
	
	
	
}
