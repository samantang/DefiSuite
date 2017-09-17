package com.defi;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.joue.avectesamis.dao.ChallengeDao;
import com.joue.avectesamis.dao.PenduDao;
import com.joue.avectesamis.dao.repositories.FriendRepository;
import com.joue.avectesamis.entites.AbcChallenge;
import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.Post;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduDicoSolo;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsChallenge;
import com.joue.avectesamis.entites.jeux.pendu.PenduSujetsSolo;
import com.joue.avectesamis.metier.ChallengeMetier;

@SpringBootApplication
public class DefiApplication implements CommandLineRunner{
	
//	@Autowired
//	private ChallengeMetier metier;
//	@Autowired
//	private FriendRepository friendRepository;
//	@Autowired
//	private PenduDao penduDao;
//	@Autowired
//	private ChallengeDao challengeDao;
//	@Autowired
//	private ChallengeMetier metier;
	
	public static void main(String[] args) {
		SpringApplication.run(DefiApplication.class, args);
	}


	@Override
	public void run(String... arg0) throws Exception {
		
		
//		AbcChallenge abc = new AbcChallenge(null, null, null, 0, null, 'l', 0, null, null, null, null, null, null, null, null, null, null, 0, null, null);
//		metier.envoyerChallenge(4L, 3L); 
//		metier.accepterChallenge(3L, 4L);
		
//		penduDao.sendChallengeDico(1L, 2L);
//		penduDao.acceptChallengeDico(2L, 1L);
		
//		challengeDao.envoyerDemandeAmi(1L, 2L);
//		challengeDao.accepterAmi(2L, 1L);
//		
//		challengeDao.envoyerDemandeAmi(1L, 4L);
//		challengeDao.accepterAmi(4L, 1L);
//		
//		challengeDao.envoyerDemandeAmi(4L, 2L);
//		challengeDao.accepterAmi(2L, 4L);
//		
//		challengeDao.envoyerDemandeAmi(1L, 3L);
//		challengeDao.accepterAmi(3L, 1L);
//		
//		challengeDao.envoyerDemandeAmi(3L, 2L);
//		challengeDao.accepterAmi(2L, 3L);
		
//		challengeDao.supprimerAmi(1L, 2L);
//		challengeDao.supprimerAmi(1L, 3L);
//		challengeDao.supprimerAmi(2L, 4L);
//		challengeDao.supprimerAmi(3L, 2L);
		
		
//		PenduDicoChallenge challenge = new PenduDicoChallenge(null, null, 0, true, null, 0, true, 0, null, 0, false, 0);
//		penduDao.sendChallengeDico(2L, 1L);
//		penduDao.acceptChallengeDico(4L, 3L);
//		penduDao.savePenduDicoChallenge(challenge, 4L, 3L);
		 
		// TODO Auto-generated method stub
//		Collection<Character> cha = new ArrayList<Character>();
//		penduDao.savePenduDicoSolo(new PenduDicoSolo(new Date(), "date1", 140, false, "tsllksj", 110, true, 3, cha, 100, false, 2), 1L);
//		penduDao.savePenduSujetSolo(new PenduSujetsSolo(new Date(), "ladate", 0, false, null, 0, true,	 1, cha, 1, true, 5, null, null, null, null, null, null, null, null, null), 1L);
//		metier.enregistreFriend(new Friend("Daouda", "diallo"));
//		metier.enregistreFriend(new Friend("Fatoumata", "DIALLO"));
//		metier.enregistreFriend(new Friend("Djindji", "BAH"));
//		metier.envoyerDemandeAmi(1L, 2L);
//		metier.envoyerDemandeAmi(1L, 3L);
//		metier.accepterAmi(2L, 1L);
//		metier.accepterAmi(3L, 1L);
//		metier.posterPost(1L, "ceci est mon premier post");
//		metier.posterPost(1L, "et un deuxieme");
//		metier.posterPost(1L, " et de trois");
//		metier.commenterPost(2L, 1L, "commentaire pour le premier post");
//		metier.posterPost(new Post("messagePost", true));
//		friendRepository.save(new Friend("BAH", "Saliou", "saliou@bah.com", "M", "saliou"));
//		friendRepository.save(new Friend("DIALLO", "Daouda", "diallo@daouda.com", "M", "daouda"));
//		friendRepository.save(new Friend("KABA", "Mamady", "kaba@mamady.com", "M", "mamady"));
//		friendRepository.save(new Friend("nouveauNom", "nouveauPrenom", "nouveau@email.com", "M", "nouveau"));
//		
//		
//		Collection<Character> characters = new ArrayList<Character>();
//		characters.add('e');
//		characters.add('A');
//		characters.add('f');
//		PenduDicoChallenge challengeb = new PenduDicoChallenge(new Date(), "aujourdhui", 120, false, "leMot", 10, true, 2, characters, 15, true, 3);
//
//		penduDao.sendChallengeDico(1L, 2L);
//		penduDao.acceptChallengeDico(2L, 1L);
//		penduDao.savePenduDicoChallenge(challengeb, 1L, 2L);
//		
//		penduDao.sedChallengeSujets(1L, 4L);
//		penduDao.acceptChallengeSujets(4L, 1L);
		
//		PenduSujetsChallenge penduSujetsChallenge = new PenduSujetsChallenge(new Date(), null, 3, "lePays", "laCapitale", "leNobel", "lartiste", "lePresident", 's', 'e', 'e', 'e', 'd');		
//		penduDao.savePenduSujetChallenge(penduSujetsChallenge, 2L, 3L);
	}
}
