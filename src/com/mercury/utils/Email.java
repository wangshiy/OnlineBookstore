package com.mercury.utils;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Email {
	private static final String user = "wangshiy@umich.edu";
	private static final String password="Wgo2013sld";
	private static final String storeName="Mercury";
	private static final String borderColor="#20B2AA";
	private static final String btnTxtColor="#20B2AA";
	public static void sendActiveLink(String to,String accout,String token){
		try{
			Message msg=new MimeMessage(getSession());
			msg.setFrom(new InternetAddress(user,storeName));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject("["+storeName+"] - Account activation email");
			msg.setSentDate(new Date());
			Multipart multipart = new MimeMultipart();
			BodyPart htmlMsg=new MimeBodyPart();
			String html="<div>" +
					"<h4>Hello "+accout+",</h4>" +
					"<p>Thank you for joining "+storeName+", To get more services, please activate your account:<p>"+
					"<h4 style='margin-left:150px;'>" +
					"<a role='button' style='padding:5px;text-decoration:none;font-size:20px;color:"+btnTxtColor+";border:1px solid "+borderColor+";border-radius:7px;' " +
					"href=\"http://localhost:8080/Project_Bookstore_XML/activeUser.html?userName="+accout+"&&token="+token+"\">" +
					"Active" +
					"</a>" +
					"</h4>" +
					"<p>if the above button is not working , please go here and activate it</p>"+
					"<p>http://localhost:8080/Project_Bookstore_XML/activeUser.html?userName="+accout+"&&token="+token+"</p>"+
					"<p>Best,</p>" +
					"<p>"+storeName+"</p>" +
					"</div>";
			htmlMsg.setContent(html, "text/html");
			multipart.addBodyPart(htmlMsg);
			msg.setContent(multipart);
			
			Transport.send(msg);		
			System.out.println("Message sent successfully");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	private static Session getSession(){
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		Properties prop=System.getProperties();
		prop.setProperty("mail.smtp.host", "smtp.gmail.com");
		prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		prop.setProperty("mail.smtp.socketFactory.fallback", "false");
		prop.setProperty("mail.smtp.port", "465");
		prop.setProperty("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.auth", "true");
		return Session.getDefaultInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() { 
            	return new PasswordAuthentication(user, password); 		
            } 
        });
	}
}
