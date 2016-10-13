package com.mercury.beans;

import java.util.List;

import org.codehaus.jackson.annotate.JsonBackReference;

public class CommentInfo {
	
	private String message;
	@JsonBackReference
	private List<Project_Comment> comments;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<Project_Comment> getComments() {
		return comments;
	}
	public void setComments(List<Project_Comment> comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "CommentInfo [message=" + message + ", comments=" + comments
				+ "]";
	}

}
