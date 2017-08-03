package com.joue.avectesamis.models;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;

import javax.servlet.http.HttpServletRequest;

public class Word {

	private String word = "", secretWord = "";
	private char[] tabChar;
	private int error = 0;
	private int nbreCoup = 0;

	public Word(HttpServletRequest request){
		initWord(request );
	}
	
	
	/**
	 * 
	 */
	public Word() {
		super();
		// TODO Auto-generated constructor stub
	}


	public void initWord(HttpServletRequest request){
		
		int i = (int)(Math.random() * 100000);
		while(i > 336529){
			 i /= 2;
		}
		
		try {
			LineNumberReader fnr = new LineNumberReader(new FileReader(new File(request.getServletContext().getRealPath("/resources/dico/word.txt"))));
			int carac;
			this.word = "";
			this.secretWord= "";
			while((carac = fnr.read()) != -1){
//				System.out.println(" la valeur de carac = fnr.read "+(carac = fnr.read()));
//				System.out.println("la valeur de i "+i);
				if(fnr.getLineNumber() == (i+1))
					break;
				
				else{
					if(fnr.getLineNumber() == i){
						this.word += (char)carac;						
					}
				}
			}
			
			this.word = this.word.trim().toUpperCase();
//			System.out.println("le mot majuscule "+this.word);
			for(int j = 0; j < this.word.length(); j++)
			{
				this.secretWord += (this.word.charAt(j) != '\'' && this.word.charAt(j) != '-') ? "*" : this.word.charAt(j);
//				System.out.println("le mot secret "+this.secretWord);
			}
			
			fnr.close();
			this.nbreCoup = 0;
		} catch (FileNotFoundException e) {
//			System.out.println(e.getMessage());
			System.out.println("le fichier est introuvable");
//			JOptionPane.showMessageDialog(null, "Erreur de chargement depuis le fichier de mots !", "ERREUR", JOptionPane.ERROR_MESSAGE);
		} catch (IOException e) {
//			JOptionPane.showMessageDialog(null, "Erreur de chargement depuis le fichier de mots !", "ERREUR", JOptionPane.ERROR_MESSAGE);
		}
		
		this.tabChar = this.secretWord.toCharArray();
		this.error = 0;
	}
	
	public int verifyWord(char c){
		
		boolean bok = false;
		
		for(int i = 0; i < this.word.length(); i++){
			
			if(this.word.toUpperCase().charAt(i) == c){
				this.tabChar[i] = c;
				bok = true;
			}
		}
		++this.nbreCoup;
		this.secretWord = new String(this.tabChar);
//		System.out.println("Mot secret sans tableau = " + this.word);
		return (bok == true) ? 1 : -1;
	}
	
	public int verifyWord(char[] tc){
		
		boolean bok = false;
		
		for(char c : tc)
		{
			for(int i = 0; i < this.word.length(); i++){
				
				if(this.word.toUpperCase().charAt(i) == c){
					this.tabChar[i] = c;
					System.out.println("OK !");
					bok = true;
				}
			}
		}	
		++this.nbreCoup;	
		this.secretWord = new String(this.tabChar);
//		System.out.println("Mot secret avec tableau = " + this.word);
		
		return (bok == true) ? 1 : -1;
	}
	
	public boolean isFinished(){
		
		for(char c : this.tabChar){
			if(c == '*')
				return false;
		}
		return true;
	}
	
	public String getWord() {
		return word;
	}

	public String getSecretWord() {
		return secretWord;
	}
	
	public int getNombreErreur(){
		return this.error;
	}
	
	public void setNombreErreur(int nbre){
		this.error = nbre;
	}

	public int getNombreCoup() {
		return nbreCoup;
	}


	/**
	 * @param word the word to set
	 */
	public void setWord(String word) {
		this.word = word;
	}


	/**
	 * @param secretWord the secretWord to set
	 */
	public void setSecretWord(String secretWord) {
		this.secretWord = secretWord;
	}

	
}
