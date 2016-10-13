package com.mercury.beans;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.GenericGenerator;

@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Project_User implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int u_id;
	
	private String username;
	
	private String email;
	
	private String password;
	
	private String authority;
	
	private double balance;
	
	private String image;
	
	@JsonIgnore
	private Set<Project_Transaction> transactions = new HashSet<Project_Transaction>();
	
	@JsonIgnore
	private Set<Project_Comment> comments = new HashSet<Project_Comment>();
	
	public Project_User(){}

	public Project_User(String username, String email,
			String password, String authority, double balance, String image) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.authority = authority;
		this.balance = balance;
		this.image = image;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	@JsonIgnore
	public Set<Project_Transaction> getTransactions() {
		return transactions;
	}
	@JsonIgnore
	public void setTransactions(Set<Project_Transaction> transactions) {
		this.transactions = transactions;
	}
	@JsonIgnore
	public Set<Project_Comment> getComments() {
		return comments;
	}
	@JsonIgnore
	public void setComments(Set<Project_Comment> comments) {
		this.comments = comments;
	}


//	@Override
//	public String toString() {
//		Iterator<Tag> it = tags.iterator();
//		String result = "";
//		while(it.hasNext()){
//			result += isbn + "\t" + bookname + "\t" + it.next().getTagname() + "\n";
//		}
//		return result;
//	}

}
