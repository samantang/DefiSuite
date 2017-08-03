package com.joue.avectesamis.entites;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Message {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String message;
	@ManyToOne
	@JoinColumn(name="nro_friend")
	private Friend friendpost;
	private String sujet;
	private boolean contactezNous;
	private String email;
	private String nom;
	
	
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSujet() {
		return sujet;
	}
	public void setSujet(String sujet) {
		this.sujet = sujet;
	}
	public boolean isContactezNous() {
		return contactezNous;
	}
	public void setContactezNous(boolean contactezNous) {
		this.contactezNous = contactezNous;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 
	 */
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @return the friendpost
	 */
	public Friend getFriendpost() {
		return friendpost;
	}
	/**
	 * @param friendpost the friendpost to set
	 */
	public void setFriendpost(Friend friendpost) {
		this.friendpost = friendpost;
	}
	/**
	 * @param message
	 */
	public Message(String message) {
		super();
		this.message = message;
	}
	
	
	
	

}
