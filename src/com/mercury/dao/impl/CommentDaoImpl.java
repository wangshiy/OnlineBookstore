package com.mercury.dao.impl;

import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.mercury.beans.Project_Book;
import com.mercury.beans.Project_Comment;
import com.mercury.dao.CommentDao;
import com.mercury.utils.HibernateUtil;

public class CommentDaoImpl implements CommentDao {
	private final int SHOW=1;
	private final int REPORTED=2;
	private final int HIDDEN=3;
	@Override
	public String deleteComment(Project_Comment comment) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Project_Comment> getAllReportedComments() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_Comment.class);
		List<Project_Comment> comments=(List<Project_Comment>)ct
				.add(Restrictions.eq("type", REPORTED))
				.list();
		return comments;
	}

	@Override
	public int numberOfReportedComments() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_Comment.class);
		return (Integer) ct.setProjection(Projections.rowCount()).add(Restrictions.eq("type", REPORTED)).uniqueResult();
	}

	@Override
	public void hideCommentById(int commentId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		Project_Comment comment =(Project_Comment) session.load(Project_Comment.class, commentId);
		comment.setType(HIDDEN);
		session.update(comment);
		//session.flush();
		tx.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public void showCommentById(int commentId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		Project_Comment comment =(Project_Comment) session.load(Project_Comment.class, commentId);
		comment.setType(SHOW);
		session.update(comment);
		//session.flush();
		tx.commit();
		HibernateUtil.closeSession();
	}
	@Override
	public void reportCommentById(int commentId) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		Project_Comment comment =(Project_Comment) session.load(Project_Comment.class, commentId);
		comment.setType(REPORTED);
		session.update(comment);
		//session.flush();
		tx.commit();
		HibernateUtil.closeSession();
	}
	@Override
	public int numberOfHiddenComments() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_Comment.class);
		return (Integer) ct.setProjection(Projections.rowCount()).add(Restrictions.eq("type", HIDDEN)).uniqueResult();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Project_Comment> getAllHiddenComments() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_Comment.class);
		List<Project_Comment> comments=(List<Project_Comment>)ct
				.add(Restrictions.eq("type", HIDDEN)).list();
		return comments;
	}

	
}
