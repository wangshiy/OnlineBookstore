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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.GenericGenerator;

@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Project_Book implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String isbn;
	
	private String bookname;
	
	private String series;
	
	private String author;
	
	private String press;
	
	private Date released;
	
	private String cover;
	
	//Yansan start
	private String content1;
	private String content2;
	private String content3;
	//Yansan end
	
	private double price;
	
	private int transactionAmount;
	
	public int getTransactionAmount() {
		return transactionAmount;
	}

	public void setTransactionAmount(int transactionAmount) {
		this.transactionAmount = transactionAmount;
	}

	public String getContent1() {
		return content1;
	}

	public void setContent1(String content1) {
		this.content1 = content1;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public String getContent3() {
		return content3;
	}

	public void setContent3(String content3) {
		this.content3 = content3;
	}
	private int quantity;
	
	private String description;
	
	private Set<Project_Tag> tags = new HashSet<Project_Tag>();
	
	@JsonIgnore
	private Set<Project_Transaction> book_transactions = new HashSet<Project_Transaction>();
	
	@JsonIgnore
	private Set<Project_Comment> book_comments = new HashSet<Project_Comment>();
	
	public Project_Book(){}

	public Project_Book(String isbn, String bookname, String series,
			String author, String press, Date released, String cover,
			double price, int quantity, String description) {
		super();
		this.isbn = isbn;
		this.bookname = bookname;
		this.series = series;
		this.author = author;
		this.press = press;
		this.released = released;
		this.cover = cover;
		this.price = price;
		this.quantity = quantity;
		this.description = description;
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

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public Date getReleased() {
		return released;
	}

	public void setReleased(Date released) {
		this.released = released;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Project_Tag> getTags() {
		return tags;
	}

	public void setTags(Set<Project_Tag> tags) {
		this.tags = tags;
	}
	@JsonIgnore
	public Set<Project_Comment> getBook_comments() {
		return book_comments;
	}
	@JsonIgnore
	public void setBook_comments(Set<Project_Comment> book_comments) {
		this.book_comments = book_comments;
	}
	@JsonIgnore
	public Set<Project_Transaction> getBook_transactions() {
		return book_transactions;
	}
	@JsonIgnore
	public void setBook_transactions(Set<Project_Transaction> book_transactions) {
		this.book_transactions = book_transactions;
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
