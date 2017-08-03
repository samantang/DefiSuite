package com.joue.avectesamis.models;

import java.util.Collection;
import java.util.List;

import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoSolo;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsSolo;

public class PenduModel {
	
	private List<Friend> mesChallengesDicoRecus;
	private List<Friend> mesChallengesDicoEnvoyes;
	private List<Friend> mesChallengesDicoEnAttentes;
	private List<PenduDicoChallenge> mesChallengesDicoJoues;
	private List<PenduDicoChallenge> challengesDicoAmis;
	private Collection<PenduDicoChallenge> mesChallengesDico;
	
	private List<Friend> mesChallengesSujetsRecus;
	private List<Friend> mesChallengesSujetsEnvoyes;
	private List<Friend> mesChallengesSujetsEnAttentes;
	private List<PenduSujetsChallenge> mesChallengesSujetsJoues;
	private List<PenduSujetsChallenge> challengesSujetsAmis;
	
	
	private List<PenduDicoChallenge> challengeAmisOrdreCoupe;
	private List<PenduSujetsChallenge> challengeAmisOrdreSujetsCoupe;
	
	private Collection<PenduDicoSolo> mesDicoSolo;
	private Collection<PenduSujetsSolo> mesSujetsoSolo;
	
	
	
	
	
	
	
	
	
	
	/**
	 * @return the mesSujetsoSolo
	 */
	public Collection<PenduSujetsSolo> getMesSujetsoSolo() {
		return mesSujetsoSolo;
	}
	/**
	 * @param mesSujetsoSolo the mesSujetsoSolo to set
	 */
	public void setMesSujetsoSolo(Collection<PenduSujetsSolo> mesSujetsoSolo) {
		this.mesSujetsoSolo = mesSujetsoSolo;
	}
	/**
	 * @return the challengeAmisOrdreSujetsCoupe
	 */
	public List<PenduSujetsChallenge> getChallengeAmisOrdreSujetsCoupe() {
		return challengeAmisOrdreSujetsCoupe;
	}
	/**
	 * @param challengeAmisOrdreSujetsCoupe the challengeAmisOrdreSujetsCoupe to set
	 */
	public void setChallengeAmisOrdreSujetsCoupe(
			List<PenduSujetsChallenge> challengeAmisOrdreSujetsCoupe) {
		this.challengeAmisOrdreSujetsCoupe = challengeAmisOrdreSujetsCoupe;
	}
	/**
	 * @return the mesDicoSolo
	 */
	public Collection<PenduDicoSolo> getMesDicoSolo() {
		return mesDicoSolo;
	}
	/**
	 * @param mesDicoSolo the mesDicoSolo to set
	 */
	public void setMesDicoSolo(Collection<PenduDicoSolo> mesDicoSolo) {
		this.mesDicoSolo = mesDicoSolo;
	}
	/**
	 * @return the mesChallengesDico
	 */
	public Collection<PenduDicoChallenge> getMesChallengesDico() {
		return mesChallengesDico;
	}
	/**
	 * @param mesChallengesDico the mesChallengesDico to set
	 */
	public void setMesChallengesDico(
			Collection<PenduDicoChallenge> mesChallengesDico) {
		this.mesChallengesDico = mesChallengesDico;
	}
	/**
	 * @return the challengesDicoAmis
	 */
	public List<PenduDicoChallenge> getChallengesDicoAmis() {
		return challengesDicoAmis;
	}
	/**
	 * @param challengesDicoAmis the challengesDicoAmis to set
	 */
	public void setChallengesDicoAmis(List<PenduDicoChallenge> challengesDicoAmis) {
		this.challengesDicoAmis = challengesDicoAmis;
	}
	/**
	 * @return the challengesSujetsAmis
	 */
	public List<PenduSujetsChallenge> getChallengesSujetsAmis() {
		return challengesSujetsAmis;
	}
	/**
	 * @param challengesSujetsAmis the challengesSujetsAmis to set
	 */
	public void setChallengesSujetsAmis(
			List<PenduSujetsChallenge> challengesSujetsAmis) {
		this.challengesSujetsAmis = challengesSujetsAmis;
	}
	/**
	 * @return the mesChallengesDicoJoues
	 */
	public List<PenduDicoChallenge> getMesChallengesDicoJoues() {
		return mesChallengesDicoJoues;
	}
	/**
	 * @param mesChallengesDicoJoues the mesChallengesDicoJoues to set
	 */
	public void setMesChallengesDicoJoues(
			List<PenduDicoChallenge> mesChallengesDicoJoues) {
		this.mesChallengesDicoJoues = mesChallengesDicoJoues;
	}
	/**
	 * @return the mesChallengesSujetsJoues
	 */
	public List<PenduSujetsChallenge> getMesChallengesSujetsJoues() {
		return mesChallengesSujetsJoues;
	}
	/**
	 * @param mesChallengesSujetsJoues the mesChallengesSujetsJoues to set
	 */
	public void setMesChallengesSujetsJoues(
			List<PenduSujetsChallenge> mesChallengesSujetsJoues) {
		this.mesChallengesSujetsJoues = mesChallengesSujetsJoues;
	}
	/**
	 * @return the challengeAmisOrdreCoupe
	 */
	public List<PenduDicoChallenge> getChallengeAmisOrdreCoupe() {
		return challengeAmisOrdreCoupe;
	}
	/**
	 * @param challengeAmisOrdreCoupe the challengeAmisOrdreCoupe to set
	 */
	public void setChallengeAmisOrdreCoupe(
			List<PenduDicoChallenge> challengeAmisOrdreCoupe) {
		this.challengeAmisOrdreCoupe = challengeAmisOrdreCoupe;
	}
	/**
	 * 
	 */
	public PenduModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the Friend
	 */
	public List<Friend> getMesChallengesDicoRecus() {
		return mesChallengesDicoRecus;
	}
	/**
	 * @param mesChallengesDicoRecus the mesChallengesDicoRecus to set
	 */
	public void setMesChallengesDicoRecus(
			List<Friend> mesChallengesDicoRecus) {
		this.mesChallengesDicoRecus = mesChallengesDicoRecus;
	}
	/**
	 * @return the mesChallengesDicoEnvoyes
	 */
	public List<Friend> getMesChallengesDicoEnvoyes() {
		return mesChallengesDicoEnvoyes;
	}
	/**
	 * @param mesChallengesDicoEnvoyes the mesChallengesDicoEnvoyes to set
	 */
	public void setMesChallengesDicoEnvoyes(
			List<Friend> mesChallengesDicoEnvoyes) {
		this.mesChallengesDicoEnvoyes = mesChallengesDicoEnvoyes;
	}
	/**
	 * @return the mesChallengesDicoEnAttentes
	 */
	public List<Friend> getMesChallengesDicoEnAttentes() {
		return mesChallengesDicoEnAttentes;
	}
	/**
	 * @param mesChallengesDicoEnAttentes the mesChallengesDicoEnAttentes to set
	 */
	public void setMesChallengesDicoEnAttentes(
			List<Friend> mesChallengesDicoEnAttentes) {
		this.mesChallengesDicoEnAttentes = mesChallengesDicoEnAttentes;
	}
	/**
	 * @return the mesChallengesSujetsRecus
	 */
	public List<Friend> getMesChallengesSujetsRecus() {
		return mesChallengesSujetsRecus;
	}
	/**
	 * @param mesChallengesSujetsRecus the mesChallengesSujetsRecus to set
	 */
	public void setMesChallengesSujetsRecus(
			List<Friend> mesChallengesSujetsRecus) {
		this.mesChallengesSujetsRecus = mesChallengesSujetsRecus;
	}
	/**
	 * @return the mesChallengesSujetsEnvoyes
	 */
	public List<Friend> getMesChallengesSujetsEnvoyes() {
		return mesChallengesSujetsEnvoyes;
	}
	/**
	 * @param mesChallengesSujetsEnvoyes the mesChallengesSujetsEnvoyes to set
	 */
	public void setMesChallengesSujetsEnvoyes(
			List<Friend> mesChallengesSujetsEnvoyes) {
		this.mesChallengesSujetsEnvoyes = mesChallengesSujetsEnvoyes;
	}
	/**
	 * @return the mesChallengesSujetsEnAttentes
	 */
	public List<Friend> getMesChallengesSujetsEnAttentes() {
		return mesChallengesSujetsEnAttentes;
	}
	/**
	 * @param mesChallengesSujetsEnAttentes the mesChallengesSujetsEnAttentes to set
	 */
	public void setMesChallengesSujetsEnAttentes(
			List<Friend> mesChallengesSujetsEnAttentes) {
		this.mesChallengesSujetsEnAttentes = mesChallengesSujetsEnAttentes;
	}
	
}