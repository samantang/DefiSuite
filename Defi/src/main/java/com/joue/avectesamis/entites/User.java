package com.joue.avectesamis.entites;

import java.util.Collection;
import java.util.Date;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;


@Entity
@Table(name="users")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="type_user", discriminatorType=DiscriminatorType.STRING, length=10)
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String userName;
	private String password;
	private boolean actived;
	
	
	/**
	 * 
	 */
	public User() {
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
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}


	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}


	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}


	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}


	/**
	 * @return the actived
	 */
	public boolean isActived() {
		return actived;
	}


	/**
	 * @param actived the actived to set
	 */
	public void setActived(boolean actived) {
		this.actived = actived;
	}
	
	
}
