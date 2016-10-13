package com.mercury.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.mercury.beans.Project_Book;
import com.mercury.beans.Project_Tag;
import com.mercury.dao.BookDao;
import com.mercury.utils.HibernateUtil;
import com.mercury.utils.JdbcUtil;

public class BookDaoImpl implements BookDao{

	@Override
	public Object saveBook(Project_Book book) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		Object object=session.save(book);
		tx.commit();
		HibernateUtil.closeSession();
		return object;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Project_Book> searchBooksLikeISBN(String isbn) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_Book.class);
		List<Project_Book> books = null;
		if (isbn != "" && isbn != null){
			books = (List<Project_Book>)ct.add(Restrictions.like("isbn", isbn,MatchMode.START )).list();
		}
		HibernateUtil.closeSession();
		return books;
	}

	@Override
	public Project_Book getBookByISBN(String isbn) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_Book.class);
		Project_Book book=null;
		if (isbn != "" && isbn != null){
			book = (Project_Book)ct.add(Restrictions.eq("isbn", isbn)).uniqueResult();
		}
		HibernateUtil.closeSession();
		return book;
	}
	@Override
	public void updateBook(Project_Book book) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		session.load(Project_Book.class, book.getIsbn());
		session.merge(book);
		tx.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public void deleteBookByISBN(String isbn) {
		// TODO Auto-generated method stub
		try {		
			Connection conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);//for transaction safe;
			String sql = "delete from project_books_tags where isbn='"+isbn+"'";
			Statement st = conn.createStatement();
			st.executeUpdate(sql);
			sql="delete from project_books where isbn='"+isbn+"'";
			st.executeUpdate(sql);
			conn.commit();
			System.out.println("book with isbn = "+isbn+" has been deleted!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Project_Book> getAllBooks() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_Book.class);
		List<Project_Book> books=(List<Project_Book>)ct.list();
		HibernateUtil.closeSession();
		return books;
	}

}
