package com.mercury.beans;

import java.util.List;

public class BookInfo {
	private String message;
	private List<Project_Book> books;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<Project_Book> getBooks() {
		return books;
	}
	public void setBooks(List<Project_Book> books) {
		this.books = books;
	}

}
