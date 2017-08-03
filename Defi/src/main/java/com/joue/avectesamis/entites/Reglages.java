package com.joue.avectesamis.entites;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Reglages {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String email;
	private String mobile;
	private String photo;
	private String amis;
	@OneToOne(mappedBy="reglage")
	private Friend friend;
	
	
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
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}
	/**
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	/**
	 * @return the amis
	 */
	public String getAmis() {
		return amis;
	}
	/**
	 * @param amis the amis to set
	 */
	public void setAmis(String amis) {
		this.amis = amis;
	}
	/**
	 * 
	 */
	public Reglages() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param email
	 * @param mobile
	 * @param photo
	 * @param amis
	 */
	public Reglages(String email, String mobile, String photo, String amis) {
		super();
		this.email = email;
		this.mobile = mobile;
		this.photo = photo;
		this.amis = amis;
	}
	
	

}
