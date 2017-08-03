package com.joue.avectesamis.entites;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;


@Entity
@DiscriminatorValue("admin")
public class Admin extends User{

	/**
	 * 
	 */
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
