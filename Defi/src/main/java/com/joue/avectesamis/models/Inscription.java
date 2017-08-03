package com.joue.avectesamis.models;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;




public class Inscription {
	
	private String sex;
	@NotNull
	@Size(min =4, message="merci de mettre au moins 4 caracteres")
	private String lastName;
	@NotNull
	@Size(min =4, message="merci de mettre au moins 4 caracteres")
	private String nom;
	@NotNull
	@Email
	private String email;
	private String pseudo;
	@NotNull
	@Size(min =6, message="merci de mettre au moins 6 caracteres")
	private String password;
	@NotNull
	@Size(min =4, message="merci de mettre au moins 4 caracteres")
	private String prenom;
	@NotNull 
	@Size(min =6, message="merci de mettre au moins 6 caracteres")
	private String password2;

	
	
	
	
	
	
	public String getPassword2() {
		return password2;
	}



	public void setPassword2(String password2) {
		this.password2 = password2;
	}



	/**
	 * @param sex
	 * @param lastName
	 * @param nom
	 * @param email
	 * @param pseudo
	 * @param password
	 */
	public Inscription(String sex, String lastName, String nom, String email,
			String pseudo, String password) {
		super();
		this.sex = sex;
		this.lastName = lastName;
		this.nom = nom;
		this.email = email;
		this.pseudo = pseudo;
		this.password = password;
	}

	

	/**
	 * @return the prenom
	 */
	public String getPrenom() {
		return prenom;
	}



	/**
	 * @param prenom the prenom to set
	 */
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}



	/**
	 * 
	 */
	public Inscription() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
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
	 * @return the pseudo
	 */
	public String getPseudo() {
		return pseudo;
	}

	/**
	 * @param pseudo the pseudo to set
	 */
	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
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
	
	
	
}