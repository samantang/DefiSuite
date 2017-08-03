package com.joue.avectesamis.dao;

import java.util.Collection;
import java.util.List;

import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.jeux.Artistes;
import com.joue.avectesamis.entites.jeux.Nobels;
import com.joue.avectesamis.entites.jeux.Pays_Capitale;
import com.joue.avectesamis.entites.jeux.President;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoSolo;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsSolo;

public interface PenduDao {

	public Collection<PenduDicoSolo> mesDicoSolos(Long id);
	public Collection<PenduSujetsSolo> mesSujetsSolos(Long id);
	public List<PenduDicoChallenge> mesDicoChallenges(Long id);
	public List<PenduSujetsChallenge> mesSujetsChallenges(Long id);
	
	public List<Friend> mesChallengesDicoEnvoyes(Long id);
	public List<Friend> mesChallengesDicoAttentes(Long id);
	public List<Friend> mesChallengesDicoRecus(Long m);
	
	public List<Friend> mesChallengesSujetsEnvoyes(Long id);
	public List<Friend> mesChallengesSujetsAttentes(Long id);
	public List<Friend> mesChallengesSujetsRecus(Long id);
	
	public void savePenduDicoSolo (PenduDicoSolo solo, Long id );
	public void savePenduSujetSolo (PenduSujetsSolo solo, Long id);
	public PenduDicoSolo getDicoSolo(Long id);
	public PenduSujetsSolo getSujetSolo(Long id);
	public void mettreAjourDicoSolo(Long id);
	public void mettreAjourSujetSolo(Long id);
	
	
	public void sendChallengeDico(Long moi, Long ami);
	public void sedChallengeSujets(Long moi, Long ami);
	public void acceptChallengeDico(Long moi, Long ami);
	public void acceptChallengeSujets(Long moi, Long ami);
	public void savePenduDicoChallenge(PenduDicoChallenge dicoChallenge, Long moi, Long ami);
	public void savePenduSujetChallenge (PenduSujetsChallenge sujetsChallenge, Long moi, Long ami);
	public PenduDicoChallenge getDicoChallengeById(Long id);
	public void refuserChallengeDico(Long id, Long idAmi);
	public void annulerEnvoiChallengeDico(Long id, Long idAmi);
	public void refuserChallengeSujets(Long id, Long idAmi);
	public void annulerEnvoiChallengeSujets(Long id, Long idAmi);
	public void publierChallengeDico(Long idJeu);
	
	public String getCodeAttenteMoiAmiDico(Long m, Long a);
	public String getCodeAttenteAmiMoiDico(Long m, Long a);
	public String getCodeJoueAmiMoiDico(Long m, Long a);
	
	public String getCodeAttenteMoiAmiSujets(Long m, Long a);
	public String getCodeAttenteAmiMoiSujets(Long m, Long a);
	public String getCodeJoueAmiMoiSujets(Long m, Long a);
	
	public List<String> challengeSujetAgglo(char c);
	public List<String> challengeSujetAnimaux(char c);
	public List<String> challengeSujetApresi(char c);
	public List<President> challengeSujetPresi(char c);
	public List<Artistes> challengeSujetArtiste(char c);
	public List<Nobels> challengeSujetNobel(char c);
	public List<Pays_Capitale> challengeSujetPays(char c);
	public List<Pays_Capitale> challengeSujetCapitale(char c);
	public List<String> challengeSujetVilleF(char c);
	public PenduSujetsChallenge getSujetChallenge(Long idChallenge);
	public void publierChallengeSujets(Long idChallenge);
	
	
	
	
	
	
	
	
}
