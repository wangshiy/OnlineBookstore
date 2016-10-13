package com.mercury.beans;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

public class Project_Comment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int c_id;
	
	private Date time;
	
	private String context;
	
	private int type;
	
	private double rate;
	
	private String ISBN;
	
	private String username;
	
	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	@JsonIgnore
	private Project_User project_user;
	@JsonIgnore
	private Project_Book project_book;
	
	public Project_Comment(){}

	public Project_Comment(Date time, String context, int type,
			double rate) {
		super();
		this.time = time;
		this.context = context;
		this.type = type;
		this.rate = rate;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}
	@JsonIgnore
	public Project_User getProject_user() {
		return project_user;
	}
	@JsonIgnore
	public void setProject_user(Project_User project_user) {
		this.project_user = project_user;
	}
	@JsonIgnore
	public Project_Book getProject_book() {
		return project_book;
	}
	@JsonIgnore
	public void setProject_book(Project_Book project_book) {
		this.project_book = project_book;
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
