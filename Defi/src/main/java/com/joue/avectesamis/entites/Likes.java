package com.joue.avectesamis.entites;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Likes {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@OneToMany(mappedBy="like")
	private Collection<Friend> friends;
	@ManyToOne
	@JoinColumn(name="post")
	private Post post;
	
	/** 
	 * 
	 */
	public Likes() {
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
	 * @return the friends
	 */
	public Collection<Friend> getFriends() {
		return friends;
	}
	/**
	 * @param friends the friends to set
	 */
	public void setFriends(Collection<Friend> friends) {
		this.friends = friends;
	}
	
	
	

}
