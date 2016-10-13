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

public class Project_Transaction implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int t_id;
	
	private int quantity;
	
	private Date orderDate;	
	
	private double price;
	
	private String username;
	
	private String isbn;
	
	private String bookname;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	@JsonIgnore
	private Project_User project_transaction_user;

	@JsonIgnore
	private Project_Book project_transaction_book;
	
	public Project_Transaction(){}

	public Project_Transaction(int quantity, Date orderDate, double price) {
		super();
		this.quantity = quantity;
		this.orderDate = orderDate;
		this.price = price;
	}

	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@JsonIgnore
	public Project_User getProject_transaction_user() {
		return project_transaction_user;
	}

	@JsonIgnore
	public void setProject_transaction_user(Project_User project_transaction_user) {
		this.project_transaction_user = project_transaction_user;
	}

	@JsonIgnore
	public Project_Book getProject_transaction_book() {
		return project_transaction_book;
	}

	@JsonIgnore
	public void setProject_transaction_book(Project_Book project_transaction_book) {
		this.project_transaction_book = project_transaction_book;
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
