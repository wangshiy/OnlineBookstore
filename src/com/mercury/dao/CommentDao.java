package com.mercury.dao;

import java.util.List;

import com.mercury.beans.Project_Comment;

public interface CommentDao {

	public String deleteComment(Project_Comment comment);

	public List<Project_Comment> getAllReportedComments();
	public int numberOfReportedComments();

	public void hideCommentById(int commentId);

	public void showCommentById(int commentId);

	public int numberOfHiddenComments();
	public List<Project_Comment> getAllHiddenComments();

	public void reportCommentById(int commentId);
}
