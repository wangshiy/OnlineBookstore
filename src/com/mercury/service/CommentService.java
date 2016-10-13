package com.mercury.service;

import java.util.List;

import com.mercury.beans.Project_Comment;
import com.mercury.dao.CommentDao;

public class CommentService {
	private CommentDao commnetDao;
	public String deleteComment(Project_Comment comment) {
		// TODO Auto-generated method stub
		return commnetDao.deleteComment(comment);
	}
	public CommentDao getCommnetDao() {
		return commnetDao;
	}
	public void setCommnetDao(CommentDao commnetDao) {
		this.commnetDao = commnetDao;
	}
	public List<Project_Comment> getAllReportedComments() {
		// TODO Auto-generated method stub
		return commnetDao.getAllReportedComments();
	}
	public int numberOfReportedComments(){
		return commnetDao.numberOfReportedComments();
	}
	public void hideCommentById(int commentId) {
		// TODO Auto-generated method stub
		commnetDao.hideCommentById(commentId);
	}
	public void showCommentById(int commentId) {
		// TODO Auto-generated method stub
		commnetDao.showCommentById(commentId);
	}
	public int numberOfHiddenComments() {
		// TODO Auto-generated method stub
		return commnetDao.numberOfHiddenComments();
	}
	public List<Project_Comment> getAllHiddenComments() {
		// TODO Auto-generated method stub
		return commnetDao.getAllHiddenComments();
	}
	public void reportCommentById(int commentId) {
		// TODO Auto-generated method stub
		commnetDao.reportCommentById(commentId);
	}
}
