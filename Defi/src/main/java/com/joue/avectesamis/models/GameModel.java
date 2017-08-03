package com.joue.avectesamis.models;

import java.util.Collection;
import java.util.List;

import com.joue.avectesamis.entites.AbcChallenge;
import com.joue.avectesamis.entites.AbcSolo;
import com.joue.avectesamis.entites.Friend;


public class GameModel {
	
	private AbcSolo solo;
	private List<AbcSolo> mesSolos;
	private String pays ="n";
	private String capitales ="n" ;
	private String presidents ="n";
	private String villesFrance ="n" ;
	private String nobels ="n";
	private String ancientPresidents ="n";
	private String aglomerations ="n";
	private String chanteurs ="n";
	private String animaux ="n";
	private List<String> nobel;
	private List<Friend> mesChallengesRecus;
	private List<Friend> mesChallengesEnvoyes;
	private List<Friend> mesChallengesEnAttentes;
	private List<AbcChallenge> mesChallengesJoues;
	private int nombreDeChallengesRecus;
	private List<AbcChallenge> challengesAmis;
	private List <AbcChallenge> challengeAmisOrdreCoupe;
	
	/**
	 * @return the challengeAmisOrdreCoupe
	 */
	public List<AbcChallenge> getChallengeAmisOrdreCoupe() {
		return challengeAmisOrdreCoupe;
	}

	/**
	 * @param challengeAmisOrdreCoupe the challengeAmisOrdreCoupe to set
	 */
	public void setChallengeAmisOrdreCoupe(
			List<AbcChallenge> challengeAmisOrdreCoupe) {
		this.challengeAmisOrdreCoupe = challengeAmisOrdreCoupe;
	}

	/**
	 * @return the solo
	 */
	public AbcSolo getSolo() {
		return solo;
	}

	/**
	 * @param solo the solo to set
	 */
	public void setSolo(AbcSolo solo) {
		this.solo = solo;
	}

	/**
	 * @return the challengesAmis
	 */
	public List<AbcChallenge> getChallengesAmis() {
		return challengesAmis;
	}

	/**
	 * @param challengesAmis the challengesAmis to set
	 */
	public void setChallengesAmis(List<AbcChallenge> challengesAmis) {
		this.challengesAmis = challengesAmis;
	}

	/**
	 * @return the mesChallengesJoues
	 */
	public List<AbcChallenge> getMesChallengesJoues() {
		return mesChallengesJoues;
	}

	/**
	 * @param mesChallengesJoues the mesChallengesJoues to set
	 */
	public void setMesChallengesJoues(List<AbcChallenge> mesChallengesJoues) {
		this.mesChallengesJoues = mesChallengesJoues;
	}

	/**
	 * @return the mesChallengesRecus
	 */
	public List<Friend> getMesChallengesRecus() {
		return mesChallengesRecus;
	}

	/**
	 * @param mesChallengesRecus the mesChallengesRecus to set
	 */
	public void setMesChallengesRecus(List<Friend> mesChallengesRecus) {
		this.mesChallengesRecus = mesChallengesRecus;
	}

	/**
	 * @return the mesChallengesEnvoyes
	 */
	public List<Friend> getMesChallengesEnvoyes() {
		return mesChallengesEnvoyes;
	}

	/**
	 * @param mesChallengesEnvoyes the mesChallengesEnvoyes to set
	 */
	public void setMesChallengesEnvoyes(List<Friend> mesChallengesEnvoyes) {
		this.mesChallengesEnvoyes = mesChallengesEnvoyes;
	}

	/**
	 * @return the mesChallengesEnAttentes
	 */
	public List<Friend> getMesChallengesEnAttentes() {
		return mesChallengesEnAttentes;
	}

	/**
	 * @param mesChallengesEnAttentes the mesChallengesEnAttentes to set
	 */
	public void setMesChallengesEnAttentes(List<Friend> mesChallengesEnAttentes) {
		this.mesChallengesEnAttentes = mesChallengesEnAttentes;
	}

	/**
	 * @return the nombreDeChallengesRecus
	 */
	public int getNombreDeChallengesRecus() {
		return nombreDeChallengesRecus;
	}

	/**
	 * @param nombreDeChallengesRecus the nombreDeChallengesRecus to set
	 */
	public void setNombreDeChallengesRecus(int nombreDeChallengesRecus) {
		this.nombreDeChallengesRecus = nombreDeChallengesRecus;
	}

	/**
	 * @return the nobel
	 */
	public List<String> getNobel() {
		return nobel;
	}

	/**
	 * @param nobel the nobel to set
	 */
	public void setNobel(List<String> nobel) {
		this.nobel = nobel;
	}

	/**
	 * @return the pays
	 */
	public String getPays() {
		return pays;
	}

	/**
	 * @param pays the pays to set
	 */
	public void setPays(String pays) {
		this.pays = pays;
	}

	/**
	 * @return the capitales
	 */
	public String getCapitales() {
		return capitales;
	}

	/**
	 * @param capitales the capitales to set
	 */
	public void setCapitales(String capitales) {
		this.capitales = capitales;
	}

	/**
	 * @return the presidents
	 */
	public String getPresidents() {
		return presidents;
	}

	/**
	 * @param presidents the presidents to set
	 */
	public void setPresidents(String presidents) {
		this.presidents = presidents;
	}

	/**
	 * @return the villesFrance
	 */
	public String getVillesFrance() {
		return villesFrance;
	}

	/**
	 * @param villesFrance the villesFrance to set
	 */
	public void setVillesFrance(String villesFrance) {
		this.villesFrance = villesFrance;
	}

	/**
	 * @return the nobels
	 */
	public String getNobels() {
		return nobels;
	}

	/**
	 * @param nobels the nobels to set
	 */
	public void setNobels(String nobels) {
		this.nobels = nobels;
	}

	/**
	 * @return the ancientPresidents
	 */
	public String getAncientPresidents() {
		return ancientPresidents;
	}

	/**
	 * @param ancientPresidents the ancientPresidents to set
	 */
	public void setAncientPresidents(String ancientPresidents) {
		this.ancientPresidents = ancientPresidents;
	}

	/**
	 * @return the aglomerations
	 */
	public String getAglomerations() {
		return aglomerations;
	}

	/**
	 * @param aglomerations the aglomerations to set
	 */
	public void setAglomerations(String aglomerations) {
		this.aglomerations = aglomerations;
	}

	/**
	 * @return the chanteurs
	 */
	public String getChanteurs() {
		return chanteurs;
	}

	/**
	 * @param chanteurs the chanteurs to set
	 */
	public void setChanteurs(String chanteurs) {
		this.chanteurs = chanteurs;
	}

	/**
	 * @return the animaux
	 */
	public String getAnimaux() {
		return animaux;
	}

	/**
	 * @param animaux the animaux to set
	 */
	public void setAnimaux(String animaux) {
		this.animaux = animaux;
	}

	/**
	 * 
	 */
	public GameModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the mesSolos
	 */
	public List<AbcSolo> getMesSolos() {
		return mesSolos;
	}

	/**
	 * @param mesSolos the mesSolos to set
	 */
	public void setMesSolos(List<AbcSolo> mesSolos) {
		this.mesSolos = mesSolos;
	}
	
	

}
