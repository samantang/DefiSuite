package com.joue.avectesamis.entites;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class Comment {
	
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@LazyCollection(LazyCollectionOption.FALSE)
	@ManyToMany(mappedBy="comments")
	private Collection<Friend> friends;
	@ManyToOne
	@JoinColumn(name="post")
	private Post post;
	private String commentaire;
	private Date date;
	
	
	
	
	
	/**
	 * @param commentaire
	 * @param date
	 */
	public Comment(String commentaire, Date date) {
		super();
		this.commentaire = commentaire;
		this.date = date;
	}
	/**
	 * @param commentaire
	 */
	public Comment(String commentaire) {
		super();
		this.commentaire = commentaire;
	}
	/**
	 * @return the post
	 */
	public Post getPost() {
		return post;
	}
	/**
	 * @param post the post to set
	 */
	public void setPost(Post post) {
		this.post = post;
	}
	/**
	 * @return the commentaire
	 */
	public String getCommentaire() {
		return commentaire;
	}
	/**
	 * @param commentaire the commentaire to set
	 */
	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
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
	/**
	 * 
	 */
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
