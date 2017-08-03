package com.joue.avectesamis.entites;

import java.util.Collection;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;


@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="type_game", discriminatorType=DiscriminatorType.STRING, length=10)
public class Game {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@ManyToMany(mappedBy="games")
	private Collection<Friend> friend;
	
	
	
	
	
	
	
	/**
	 * 
	 */
	public Game() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
