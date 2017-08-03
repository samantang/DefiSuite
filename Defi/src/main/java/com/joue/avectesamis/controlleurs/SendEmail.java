package com.joue.avectesamis.controlleurs;



/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.Properties;     
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author A1
 */
public class SendEmail {
    String status="";
    String email="";
    String code="";
    public void setEmail(String nemail)
    {
        email=nemail;
    }
    public void setCode(String ncode) 
    {
        code=ncode;
    }
    public String sendEmail()
    {	
    	System.out.println("avant properties ----------------");
        Properties props = new Properties();    
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        
        System.out.println("avant Authenticator ----------------");
        Authenticator auth = new SMTPAuthenticator();
        
        System.out.println("avant session ----------------");
        Session session = Session.getInstance(props, auth);
        System.out.println("avant try ----------------");
        try
        {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("salioubahdiallo@gmail.com"));
            System.out.println("avant setRecipient ----------------");
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email));
            System.out.println("avant setSubject ----------------");
            message.setSubject("Verification Code");
            message.setContent("<p style='{color:#0033CC}'>Suite à votre demande pour le mot de passe oublié .<br/><br/><b>, nous vous le communiquons ce mot de passe temporaire: "+code+" , Nous vous invitons à "
            		+ "le changer en allant dans 'monProfil' une fois connecté </b></p>","text/html");
            System.out.println("avant Transport ----------------");
            Transport.send(message);
            System.out.println("Après Transport ----------------");
            status="Success";
        }
        catch(Exception e)
        {
            System.out.println(e);
            status="Fail";
        }

        return status;
    }

}
class SMTPAuthenticator extends javax.mail.Authenticator
{
    public PasswordAuthentication getPasswordAuthentication()
    {
        return new PasswordAuthentication("salioubahdiallo@gmail.com","fatoumataBINTA83");
    }
}
