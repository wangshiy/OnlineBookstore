package com.mercury.beans;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Project_Tag implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String tagname;
	
	@JsonIgnore
	private Set<Project_Book> books = new HashSet<Project_Book>();
	
	public Project_Tag(){}
	
	public Project_Tag(String tagname) {
		super();
		this.tagname = tagname;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
	
	@JsonIgnore
	public Set<Project_Book> getBooks() {
		return books;
	}

	@JsonIgnore
	public void setBooks(Set<Project_Book> books) {
		this.books = books;
	}

//	@Override
//	public String toString() {
//		Iterator<Book> it = books.iterator();
//		String result = "";
//		while(it.hasNext()){
//			result += tagname + "\t" + it.next().getIsbn() + "\t" + it.next().getBookname() + "\n";
//		}
//		return result;
//	}

}
