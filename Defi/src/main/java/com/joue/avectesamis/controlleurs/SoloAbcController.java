package com.joue.avectesamis.controlleurs;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joue.avectesamis.entites.AbcChallenge;
import com.joue.avectesamis.entites.AbcSolo;
import com.joue.avectesamis.entites.AbcSoloJeux;
import com.joue.avectesamis.entites.Friend;
import com.joue.avectesamis.entites.jeux.APresident;
import com.joue.avectesamis.entites.jeux.Agglo;
import com.joue.avectesamis.entites.jeux.Animaux;
import com.joue.avectesamis.entites.jeux.Artistes;
import com.joue.avectesamis.entites.jeux.Nobels;
import com.joue.avectesamis.entites.jeux.Pays_Capitale;
import com.joue.avectesamis.entites.jeux.President;
import com.joue.avectesamis.entites.jeux.VilleFrance;
import com.joue.avectesamis.metier.ChallengeMetier;
import com.joue.avectesamis.models.GameModel;
import com.joue.avectesamis.models.SocialModel;

@Controller
public class SoloAbcController {
	
	@Autowired
	private ChallengeMetier metier;
	
	@RequestMapping(value="abcSoloHome")
	public String abcSoloHome(Model model, SocialModel sm, HttpServletRequest req, GameModel gm){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);		
		List<AbcSolo> mesSolos = metier.getMesSolos(id);
		gm.setMesSolos(metier.getMesSolos(id));
		
//	    recupération des derniers jeux
	   List<AbcChallenge> mesChallenges= metier.mesDerniersChallenges(id);
	    
	    model.addAttribute("mesChallenges", mesChallenges);
	    model.addAttribute("mesSolos", mesSolos);
		

	    model.addAttribute("moi", moi);
		model.addAttribute("sm", sm);
		model.addAttribute("gm", gm);
		
		return "abcSoloHome";
		
	}
	@RequestMapping(value="abcSoloJeu")
	public String abcSoloJeu (Model model, GameModel gm, HttpServletRequest request){
		System.out.println("nous sommes dans abcsolojeu ====");
		gm = new GameModel();
				
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
		Random r = new Random();
		char lettre = (char) (r.nextInt(26)+'a');
		session.setAttribute("lettre", lettre);
		
		int temps =0;
		
		// liste des checksboxs coch�s pour les intitul�s
				List<String> checkList = new ArrayList<String>();
				
				// listes pour les diff�rents checkboxs pour la contruction des tableaux
				// on les remplit pour savoir combien de lignes il faut pr�voir
				List<Pays_Capitale>listPays = new ArrayList<Pays_Capitale>();
				List<Pays_Capitale>listeCapitales = new ArrayList<Pays_Capitale>();
				List<VilleFrance>listeVillesFrance = new ArrayList<VilleFrance>();
				List<President>listePresidentsA = new ArrayList<President>();
				List<APresident>listeAPresidents = new ArrayList<APresident>();
				List<Animaux>listeAnimaux = new ArrayList<Animaux>();
				List<Agglo>listeAglo = new ArrayList<Agglo>();
				List<Artistes>listeChanteurs = new ArrayList<Artistes>();
				List<Nobels>listeNobels = new ArrayList<Nobels>();
				
//				les listes de tous les intitul�s (et non des objets) � envoyer via la session pour pouvoir les comparer aux propositions de l'utilisteur
				List<String> tousLesPays = new ArrayList<String>();
				List<String> toutesLesCapitales = new ArrayList<String>();
				List<String> toutesLesVillesFrance = new ArrayList<String>();
				List<String> tousLesAnciensPresidents = new ArrayList<String>();
				List<String> tousLesPresidents = new ArrayList<String>();
				List<String> tousLesAnimaux = new ArrayList<String>();
				List<String> toutesLesAgglometions = new ArrayList<String>();
				List<String> tousLesChanteurs = new ArrayList<String>();
				List<String> tousLesNobels = new ArrayList<String>();
				

				
				gm = new GameModel();
				// LES PAYS
				System.out.println("dans le abcSoloJeu encore juste avant le if ===============");
				if(request.getParameter("pays")!=null){
					System.out.println("le if des pays =============");
					// recup�ration des pays comman�ant par la lettre pour compter le nomnbre de lignes � r�server
					listPays.addAll(metier.getPays(lettre));
					for(Pays_Capitale p:listPays){
						tousLesPays.add(p.getPays());
						System.out.println("les pays de tousLesPays: "+p.getPays());
					}
					checkList.add(request.getParameter("pays"));
					System.out.println("juste avant la fin du if");
				}
				if(request.getParameter("capitales")!=null){
					listeCapitales.addAll(metier.getCapitales(lettre));
					for(Pays_Capitale c:listeCapitales){
						toutesLesCapitales.add(c.getCapitale());
					}
					checkList.add("capitales");
				}
				if(request.getParameter("presidents")!=null){
					listePresidentsA.addAll(metier.getPresidents(lettre));
					for(President p : listePresidentsA){
						tousLesPresidents.add(p.getNom());
					}
					checkList.add(request.getParameter("presidents"));
				}
				if(request.getParameter("ancienPresidents")!=null){
					listeAPresidents.addAll(metier.getAPresidents(lettre));
					for(APresident ap: listeAPresidents){
						tousLesAnciensPresidents.add(ap.getNom());
					}
					checkList.add("ancienPresidents");
				}
				if(request.getParameter("nobels")!=null){
					listeNobels.addAll(metier.getNobels(lettre));
					for(Nobels n : listeNobels){
						tousLesNobels.add(n.getNom());
					}
					checkList.add("nobels");
					
				}
				if(request.getParameter("aglomerations")!=null){
					listeAglo.addAll(metier.getAgglos(lettre));
					for(Agglo a : listeAglo){
						toutesLesAgglometions.add(a.getNom());
					}
					checkList.add("aglomerations");
				}
				if(request.getParameter("chanteurs")!=null){
					listeChanteurs.addAll(metier.getArtistes(lettre));
					for(Artistes a: listeChanteurs){
						tousLesChanteurs.add(a.getNom());
					}
					checkList.add("chanteurs");
				}
				if(request.getParameter("animaux")!=null){
					listeAnimaux.addAll(metier.getAnimaux(lettre));
					for(Animaux a: listeAnimaux){
						tousLesAnimaux.add(a.getNom());
					}
					checkList.add("animaux");
				}
				String lettreString = String.valueOf(lettre);
				
				
//				pour les premières lettres des nobels en cas de demande d'aide
				List<String> lettresArtistes = new ArrayList<String>();
				for (String astiste : tousLesChanteurs) {
					lettresArtistes.add(astiste.substring(0, 3));
				}
				
				model.addAttribute("lettresArtistes", lettresArtistes);
				
				// �������������������������������������������������������������������������������������
				int taillePays = listPays.size();
				int tailleCapitale = listeCapitales.size();
				int tailleVilles= listeVillesFrance.size();
				int tailleNobel = listeNobels.size();
				int tailleAnimaux = listeAnimaux.size();
				int taillePresidents = listePresidentsA.size();
				int tailleAPresidents = listeAPresidents.size();
				int tailleAgglo = listeAglo.size();
				int tailleChanteurs = listeChanteurs.size();
				temps = taillePays+tailleCapitale+tailleVilles+tailleNobel+tailleAnimaux+taillePresidents+tailleAPresidents+tailleAgglo+tailleChanteurs;
				
				
				session.setAttribute("tousLesPays", tousLesPays);
				session.setAttribute("toutesLesCapitales", toutesLesCapitales);
				session.setAttribute("listeVillesFrance", toutesLesVillesFrance);
				session.setAttribute("listeNobels", tousLesNobels);
				session.setAttribute("listeAnimaux", tousLesAnimaux);
				session.setAttribute("listePresidentsA", tousLesAnciensPresidents);
				session.setAttribute("listeAPresidents", tousLesPresidents);
				session.setAttribute("listeAglo", toutesLesAgglometions);
				session.setAttribute("listeChanteurs", tousLesChanteurs);
				request.setAttribute("temps", temps);
				session.setAttribute("lettre", lettre);
				session.setAttribute("lettreMajuscule", lettreString.toUpperCase());
				session.setAttribute("checkList", checkList);
				
				model.addAttribute("moi", moi);
				model.addAttribute("listPays", listPays);
				model.addAttribute("listeCapitales", listeCapitales);
				model.addAttribute("listeVillesFrance", listeVillesFrance);
				model.addAttribute("listeNobels", listeNobels);
				model.addAttribute("listeAnimaux", listeAnimaux);
				model.addAttribute("listePresidentsA", listePresidentsA);
				model.addAttribute("listeAPresidents", listeAPresidents);
				model.addAttribute("listeAglo", listeAglo);
				model.addAttribute("listeChanteurs", listeChanteurs);
				model.addAttribute("taillePays", taillePays);
				model.addAttribute("gm", gm);
				
				
				return "abcSoloJeu";

		
		
	}
	@RequestMapping(value="abcSoloCorrection")
	public String abcSoloCorrection(Model model, GameModel gm, HttpServletRequest request){
		
		gm = new GameModel();
		HttpSession session = request.getSession();
		
//		savoir si l'utilisateur a demand� de l'aide "oui ou non
		String aidePays = request.getParameter("valeuraidepays");
		
		
		// recup�ration des objets en session
				String email = (String) session.getAttribute("email");
				Character lettre =  (Character) session.getAttribute("lettre");
				String date = null;
				int time =0; // le temps qui reste a la fin du jeu
				String help = "no"; // si l'utlisateur a demand� de l'aide
				int score = 0;
				int scorePossible =0;
				 // pour savoir ce qu'on doit inserer dans les colonnes des intitul�s
				 String pays = "no";
				 String capitale = "no";
				 String president = "no";
				 String APresident = "no";
				 String ville = "no";
				 String nobel = "no";
				 String chanteur = "no";
				 String agglo = "no";
				 String animaux ="no";
				
				/*
				 * POUR LE PAYS =====================================================================================================================================
				 */
				// liste de tous les pays concern�s 
				List<String> tousLesPays = (List<String>) session.getAttribute("tousLesPays");
				for(String i: tousLesPays){
					System.out.println(" un pays dans la liste: "+i);
				}
				// liste des choix faits par l'utilisateur 
				List <String> choixPays = new ArrayList<String>();
				// liste des pays restants (s'il en reste)
				List<String> paysRestants = new ArrayList<String>();
				// recup�ration des contenus dans les input
				String [] reponses = null;
//				List<String> reponses = new ArrayList<String>();
//					reponses.addAll(request.getParameterValues("pays"));
				if(request.getParameterValues("pays")!=null){
					reponses = request.getParameterValues("pays");
					for(String s: reponses){
						if(!s.equals("pays")) choixPays.add(s);
					}
				}
				// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
				// donc il gagne des points
				if(choixPays.containsAll(tousLesPays)){
//					score = score +1;
				}
				paysRestants.addAll(tousLesPays);
				int taillePays = paysRestants.size();
				paysRestants.removeAll(choixPays);
				int scorePays = taillePays - paysRestants.size();
				score = score + scorePays;
				scorePossible = scorePossible+taillePays;
			
				 if(request.getParameter("pays")!=null){
					 pays ="selectioned";
				 }
				 
				 /*
					 * POUR LES CAPITALES =====================================================================================================================================
					 */
				// liste de tous les pays concern�s 
					List<String> listeCapitales = (List<String>) session.getAttribute("toutesLesCapitales");
					// liste des choix faits par l'utilisateur 
					List <String> choixCapitales = new ArrayList<String>();
					// liste des pays restants (s'il en reste)
					List<String> capitalesRestantes = new ArrayList<String>();
				 if(request.getParameter("capitale")!=null){
						
						
						String [] reponsesCapitales = request.getParameterValues("capitale");
						for(String s: reponsesCapitales){
							if(!s.equals("capitale")) choixCapitales.add(s);
						}
						// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
						// donc il gagne des points
						if(choixCapitales.containsAll(listeCapitales)){
//							score = score +1;
						}
						capitalesRestantes.addAll(listeCapitales);	
						int tailleCapitales = capitalesRestantes.size();
						capitalesRestantes.removeAll(choixCapitales);
						int scoreCapitales = tailleCapitales - capitalesRestantes.size();
						score = score + scoreCapitales;
						scorePossible = scorePossible+tailleCapitales;
					
						 
						 capitale ="selectioned";
					 }
					 
					 /*
						 * POUR LES VILLES DE FRANCE =====================================================================================================================================
						 */
				// liste de tous les pays concern�s 
					List<String> listeVillesFrance = (List<String>) session.getAttribute("listeVillesFrance");
					// liste des choix faits par l'utilisateur 
					List <String> choixVilles = new ArrayList<String>();
					// liste des pays restants (s'il en reste)
					List<String> villesRestantes = new ArrayList<String>();
					 if(request.getParameter("ville")!=null){
						
						
						String [] reponsesVilles = request.getParameterValues("ville");
						for(String s: reponsesVilles){
							if(!s.equals("ville")) choixVilles.add(s);
						}
						// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
						// donc il gagne des points
						if(choixVilles.containsAll(listeVillesFrance)){
//							score = score +1;
						}
						villesRestantes.addAll(listeVillesFrance);	
						int tailleVilleF = villesRestantes.size();
						villesRestantes.removeAll(choixVilles);
						int scoreVillesFr = tailleVilleF - villesRestantes.size();
						score = score + scoreVillesFr;
						scorePossible = scorePossible+tailleVilleF;
					
						 
							 ville ="selectioned";
						 }
						 
						 /*
							 * POUR LES PRIX NOBELS =====================================================================================================================================
							 */
					// liste de tous les pays concern�s 
						List<String> listeNobels = (List<String>) session.getAttribute("listeNobels");
						// liste des choix faits par l'utilisateur 
						List <String> choixNobels= new ArrayList<String>();
						// liste des pays restants (s'il en reste)
						List<String> nobelsRestants = new ArrayList<String>();
						 if(request.getParameter("nobel")!=null){
							
							
							String [] reponsesNobels = request.getParameterValues("nobel");
							for(String s: reponsesNobels){
								if(!s.equals("nobel")) choixNobels.add(s);
							}
							// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
							// donc il gagne des points
							if(choixNobels.containsAll(listeNobels)){
//								score = score +1;
							}
							nobelsRestants.addAll(listeNobels);
							int tailleNobel = nobelsRestants.size();
							nobelsRestants.removeAll(choixNobels);
							int scoreNobel = tailleNobel - nobelsRestants.size();
							score = score + scoreNobel;
							scorePossible = scorePossible+tailleNobel;
						
							 
								 nobel ="selectioned";
							 }
						 
						 /*
							 * POUR LES ANIMAUX =====================================================================================================================================
							 */
						// liste de tous les pays concern�s 
							List<String> listeAnimaux = (List<String>) session.getAttribute("listeAnimaux");
							// liste des choix faits par l'utilisateur 
							List <String> choixAnimaux = new ArrayList<String>();
							// liste des pays restants (s'il en reste)
							List<String> animauxRestants = new ArrayList<String>();
						 if(request.getParameter("animaux")!=null){
								
								
								String [] reponsesAnimaux = request.getParameterValues("animaux");
								for(String s: reponsesAnimaux){
									if(!s.equals("animaux")) choixAnimaux.add(s);
								}
								// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
								// donc il gagne des points
								if(choixAnimaux.containsAll(listeAnimaux)){
//									score = score +1;
								}
								animauxRestants.addAll(listeAnimaux);
								int tailleAnimaux = animauxRestants.size();
								animauxRestants.removeAll(choixAnimaux);
								int scoreAnimaux = tailleAnimaux - animauxRestants.size();
								score = score + scoreAnimaux;
								scorePossible = scorePossible+tailleAnimaux;
								
							
								 
								 animaux ="selectioned";
							 }
						 
						 /*
							 * POUR LES PRESIDENTS =====================================================================================================================================
							 */
						// liste de tous les pays concern�s 
							List<String> listePresidentsA = (List<String>) session.getAttribute("listePresidentsA");
							// liste des choix faits par l'utilisateur 
							List <String> choixPresidents = new ArrayList<String>();
							// liste des pays restants (s'il en reste)
							List<String> presidentsRestants = new ArrayList<String>();

						 if(request.getParameter("president")!=null){
														
								String [] reponsesPresidents = request.getParameterValues("president");
								for(String s: reponsesPresidents){
									if(!s.equals("president")) choixPresidents.add(s);
								}
								// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
								// donc il gagne des points
								if(choixPresidents.containsAll(listePresidentsA)){
//									score = score +1;
								}
								presidentsRestants.addAll(listePresidentsA);
								int taillePresi = presidentsRestants.size();
								presidentsRestants.removeAll(choixPresidents);
								int scorePresi = taillePresi - presidentsRestants.size();
								score = score + scorePresi;
								scorePossible = scorePossible+taillePresi;
							
								 
								 president ="selectioned";
							 }
						 
						 /*
							 * POUR LES ANCIENS PRESIDENTS =====================================================================================================================================
							 */
						// liste de tous les pays concern�s 
							List<String> listeAPresidents = (List<String>) session.getAttribute("listeAPresidents");
							// liste des choix faits par l'utilisateur 
							List <String> choixAPresidents = new ArrayList<String>();
							// liste des pays restants (s'il en reste)
							List<String> ApresidentsRestants = new ArrayList<String>();
						 if(request.getParameter("ancienP")!=null){
								
								
								String [] reponsesAPresidents = request.getParameterValues("ancienP");
								for(String s: reponsesAPresidents){
									if(!s.equals("ancienP")) choixAPresidents.add(s);
								}
								// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
								// donc il gagne des points
								if(choixAPresidents.containsAll(listeAPresidents)){
									score = score +1;
								}
								ApresidentsRestants.addAll(listeAPresidents);
								int tailleAncienP = ApresidentsRestants.size();
								ApresidentsRestants.removeAll(choixAPresidents);
								int scoreAncienP = tailleAncienP - ApresidentsRestants.size();
								score = score + scoreAncienP;
								scorePossible = scorePossible+tailleAncienP;
							
								 
								 APresident ="selectioned";
							 }
						 /*
							 * POUR LES AGGOLOMERATIONS =====================================================================================================================================
							 */
						// liste de tous les pays concern�s 
							List<String> listeAglo = (List<String>) session.getAttribute("listeAglo");
							// liste des choix faits par l'utilisateur 
							List <String> choixAgglo = new ArrayList<String>();
							// liste des pays restants (s'il en reste)
							List<String> AggloRestantes = new ArrayList<String>();

						 if(request.getParameter("agglo")!=null){
														
								String [] reponsesAgglo = request.getParameterValues("agglo");
								for(String s: reponsesAgglo){
									if(!s.equals("agglo")) choixAgglo.add(s);
								}
								// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
								// donc il gagne des points
								if(choixAgglo.containsAll(listeAglo)){
//									score = score +1;
								}
								AggloRestantes.addAll(listeAglo);	
								int tailleAgglo = AggloRestantes.size();
								AggloRestantes.removeAll(choixAgglo);
								int scoreAgglo = tailleAgglo - AggloRestantes.size();
								score  = score + scoreAgglo;
								scorePossible = scorePossible+tailleAgglo;
								
							
								 
								 agglo ="selectioned";
							 }
						 /*
							 * POUR LES ARSTISTES CHANTEURS =====================================================================================================================================
							 */
						// liste de tous les pays concern�s 
							List<String> listeChanteurs = (List<String>) session.getAttribute("listeChanteurs");
							// liste des choix faits par l'utilisateur 
							List <String> choixArtistes = new ArrayList<String>();
							// liste des pays restants (s'il en reste)
							List<String> ArtistesRestants = new ArrayList<String>();
						 if(request.getParameter("artiste")!=null){
								
								
								String [] reponsesArtistes= request.getParameterValues("artiste");
								for(String s: reponsesArtistes){
									if(!s.equals("artiste")) choixArtistes.add(s);
								}
								// si on retrouve tous les pays concern�s dans la liste des pays choisis alors l'utilisateur a trouv�
								// donc il gagne des points
								if(choixArtistes.containsAll(listeChanteurs)){
//									score = score +1;
								}
								ArtistesRestants.addAll(listeChanteurs);	
								int tailleArtiste = ArtistesRestants.size();
								ArtistesRestants.removeAll(choixArtistes);
								int scoreArtistes = tailleArtiste - ArtistesRestants.size();
								score = score + scoreArtistes;
								scorePossible = scorePossible+tailleArtiste;
							
								 
								 chanteur ="selectioned";
							 }
						 SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
						 
//						 pour savoir si l'utilisateur a demand� de l'aide
					if(request.getParameter("aidePaysNo")=="oui") help="oui";	 
		
//					insertion dans la base de donn�es =========================
					AbcSoloJeux solojeu = new AbcSoloJeux(email, score, sdf.format(new Date()), lettre, time, aidePays,scorePossible, choixAgglo, choixAPresidents, choixPresidents, choixAnimaux, choixArtistes,
					choixCapitales, choixPays, choixNobels, choixVilles, time, request.getParameter("tempsRestant"));
					AbcSolo solo= new AbcSolo();
					
//					recup�ration de l'id de l'utilisateur
					Long id =  (Long) session.getAttribute("id");
										
					metier.saveAbcSolo(id, solo, solojeu);
					
					model.addAttribute("id", id);
					
					model.addAttribute("score", score);
					model.addAttribute("scorePossible", scorePossible);
					
					
					model.addAttribute("listePays", tousLesPays);
					model.addAttribute("paysRestants", paysRestants);
					model.addAttribute("paysTest", choixPays);
					 
					model.addAttribute("listeCapitales", listeCapitales);
					model.addAttribute("capitalesRestantes", capitalesRestantes);
					model.addAttribute("choixCapitales", choixCapitales);
					 
					model.addAttribute("listeVillesFrance", listeVillesFrance);
					model.addAttribute("villesRestantes", villesRestantes);
					model.addAttribute("choixVilles", choixVilles);
					 
					model.addAttribute("listeAglo", listeAglo); 
					model.addAttribute("AggloRestantes", AggloRestantes);
					model.addAttribute("choixAgglo", choixAgglo);
					 
					model.addAttribute("listeAnimaux", listeAnimaux);
					model.addAttribute("animauxRestants", animauxRestants);
					model.addAttribute("choixAnimaux", choixAnimaux);
					 
					model.addAttribute("listeAPresidents", listeAPresidents);
					model.addAttribute("ApresidentsRestants", ApresidentsRestants);
					model.addAttribute("choixAPresidents", choixAPresidents);
					 
					model.addAttribute("listeChanteurs", listeChanteurs);
					model.addAttribute("ArtistesRestants", ArtistesRestants);
					model.addAttribute("choixArtistes", choixArtistes);
					 
					model.addAttribute("listeNobels", listeNobels);
					model.addAttribute("nobelsRestants", nobelsRestants);
					model.addAttribute("choixNobels", choixNobels);
					 
					model.addAttribute("listePresidentsA", listePresidentsA);
					model.addAttribute("presidentsRestants", presidentsRestants);
					model.addAttribute("choixPresidents", choixPresidents);
				
					model.addAttribute("gm", gm);
					
		return "abcSoloCorrection";
		
	}
	
	@RequestMapping(value="infoJeuSolo")
	public String infoJeuSolo(Model model, SocialModel sm, HttpServletRequest req, GameModel gm){
		HttpSession session = req.getSession();
		Long id =  (Long) session.getAttribute("id");
		
		List<AbcSolo> mesSolos = metier.getMesSolos(id);
		gm.setMesSolos(metier.getMesSolos(id));
		
		
		model.addAttribute("sm", sm);
		model.addAttribute("gm", gm);
		return "infoJeuSolo";
		
	}
	@RequestMapping(value="supprimerSolo")
	public String supprimerSolo(Model model, GameModel gm, HttpServletRequest request){
		Long id = (long) Integer.parseInt(request.getParameter("id"));
		metier.supprimerSolo(id);
		HttpSession session = request.getSession();
		Long idMoi = (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(idMoi);
		
		model.addAttribute("id", idMoi);
		
		return "abcSoloHome";
		 
	}
	@RequestMapping(value="publierSolo")
	public String publierSolo(Model model, GameModel gm, HttpServletRequest request, SocialModel sm){
		Long idSolo = Long.parseLong(request.getParameter("idSolo"));
		HttpSession session = request.getSession();
		Long id =  (Long) session.getAttribute("id");
		metier.pubierSolo(idSolo, id);
		
		return "infoPublicationSolo";
		
	}
	@RequestMapping(value="challengerAmi")
	public String challengerAmi (Model model, GameModel gm, HttpServletRequest request, SocialModel sm){
		Long ami = Long.parseLong(request.getParameter("id"));
		HttpSession session = request.getSession();
		Long moi =  (Long) session.getAttribute("id");
		metier.envoyerDemandeAmi(moi, ami);
		
		model.addAttribute("id", moi);
		return "mesamis";
		
	}
	@RequestMapping(value="detailSolo")
	public String detailSolo(Model model, GameModel gm, HttpServletRequest request, SocialModel sm){
		Long id = Long.parseLong(request.getParameter("id"));
//		HttpSession session = request.getSession();
//		Long idsession =  (Long) session.getAttribute("id");
		Friend moi = metier.getFriend(id);
		
//		recup�ration des jeux en fonction de l'id du jeu
		gm.setSolo(metier.detailsSolo(id));
		AbcSolo solo = metier.detailsSolo(id);
		
		model.addAttribute("solo", solo);
		model.addAttribute("gm", gm);
		
		return "detailSolo";
		
	}
	
}
