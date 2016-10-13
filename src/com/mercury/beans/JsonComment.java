package com.mercury.beans;

public class JsonComment {
	
	private String username;
	private String isbn;
	private String rating;
	private String content;
	
	public JsonComment(){}
	
	public JsonComment(String username, String isbn, String rating,
			String content) {
		super();
		this.username = username;
		this.isbn = isbn;
		this.rating = rating;
		this.content = content;
	}

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

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "JsonComment [username=" + username + ", isbn=" + isbn
				+ ", rating=" + rating + ", content=" + content + "]";
	}
	

}
