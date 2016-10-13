package com.mercury.dao.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.criterion.Restrictions;

import com.mercury.beans.Project_Book;
import com.mercury.beans.Project_Comment;
import com.mercury.beans.Project_Tag;
import com.mercury.beans.Project_Transaction;
import com.mercury.beans.Project_User;
import com.mercury.dao.HelloDao;
import com.mercury.utils.Email;
import com.mercury.utils.HibernateUtil;

public class HelloDaoImpl implements HelloDao {
	
	private final int SHOW=1;
	private final int REPORTED=2;
	private final int HIDDEN=3;
	
	@Override
	public Project_User findByName(String name) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		return (Project_User)session.load(Project_User.class, name);
	}

	@Override
	public void save(Project_User user) {
		// TODO Auto-generated method stub
		System.out.println("saving begins");
		System.out.println("saving" + user.getUsername());
		System.out.println("saving" + user.getEmail());
		System.out.println("saving" + user.getPassword());
		//SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		//Session session = factory.openSession();
		//Transaction tx = session.beginTransaction();
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		System.out.println("saving begins1");
		session.save(user);
		tx.commit();
		System.out.println("Done");
		//HibernateUtil.closeSession();
	}

	@Override
	public void update(Project_User user) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		session.update(user);
		tx.commit();
	}

	@Override
	public void delete(Project_User user) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		session.delete(user);
		tx.commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Project_User> queryAll() {
		// TODO Auto-generated method stub
		String hql = "from Project_User";
		Session session = HibernateUtil.currentSession();
		//SessionFactory factory = new AnnotationConfiguration().configure().buildSessionFactory();
		//Session session = factory.openSession();
		return session.createQuery(hql).list();
	}

	@Override
	public List<Project_Book> queryBookISBN(String isbn, String bookname, String author, String press, Date releasedMin, Date releasedMax, double priceMin, double priceMax, String category) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_Book.class);
		List<Project_Book> book = new ArrayList<Project_Book>();
		System.out.println("bookname: " + bookname);
		if (isbn != "" && isbn != null){
			book = (List<Project_Book>)ct.add(Restrictions.eq("isbn", isbn)).list();
		}
		if(bookname != "" && bookname != null){
			book = (List<Project_Book>)ct.add(Restrictions.eq("bookname", bookname)).list();
		}
		if(author != "" && author != null){
			book = (List<Project_Book>)ct.add(Restrictions.eq("author", author)).list();
		}
		if(press != "" && press != null){
			book = (List<Project_Book>)ct.add(Restrictions.eq("press", press)).list();
		}
		if(releasedMin != null){
			book = (List<Project_Book>)ct.add(Restrictions.ge("released", releasedMin)).list();
//			Query query = session.createSQLQuery("select * from project_books where released >= to_date(:releasedMin,'DD-MON-YYYY')").addEntity(Project_Book.class);
//			query.setDate("releasedMin", releasedMin);
//			book = 
		}
		if(releasedMax != null){
			book = (List<Project_Book>)ct.add(Restrictions.le("released", releasedMax)).list(); 
		}
		if(priceMin != (Double.POSITIVE_INFINITY * -1)){
			book = (List<Project_Book>)ct.add(Restrictions.ge("price", priceMin)).list();
		}
		if(priceMax != (Double.POSITIVE_INFINITY)){
			book = (List<Project_Book>)ct.add(Restrictions.le("price", priceMax)).list();
		}
		System.out.println("category: " + category);
		if (category != "" && category != null){
			book = (List<Project_Book>)ct.add(Restrictions.le("price", Double.POSITIVE_INFINITY)).list();
			String[] str = category.split("~");
			for(int i = 0; i < str.length; i++){
				System.out.println(str[i]);
			}
			List<Project_Book> newBook = new ArrayList<Project_Book>();
			int flag = 0;
			for(Project_Book b: book){
				flag = 0;
				for(int i = 0; i < str.length; i++){
					/*System.out.println("b.getTags().contains(str[i])" + b.getTags().contains(str[i]));
					if(b.getTags().contains(str[i])){
						//flag = 1;
						//break;
						newBook.add(b);
						break;
					}*/
					for (Project_Tag t: b.getTags()){
						System.out.println("*****");
						System.out.println(t.getTagname());
						System.out.println(str[i]);
						System.out.println(str[i].equals(t.getTagname()));
						System.out.println("*****");
						if(str[i].equals(t.getTagname())){
							newBook.add(b);
							flag = 1;
							break;
						}
					}
					if(flag == 1){
						break;
					}
				}
				/*if(flag == 0){
					book.remove(b);
				}*/
			}
			book = newBook;
		}
		for (Project_Book b:book) {
			System.out.println(b.getBookname());
		}
		HibernateUtil.closeSession();
		return book;
	}

	@Override
	public void saveComment(String isbn, String username,
			double rating, String content) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		Criteria ct1 = session.createCriteria(Project_User.class);
		Criteria ct2 = session.createCriteria(Project_Book.class);
		Project_User user = (Project_User)ct1.add(Restrictions.eq("username", username)).uniqueResult();
		Project_Book book = (Project_Book)ct2.add(Restrictions.eq("isbn", isbn)).uniqueResult();
		Project_Comment comment = new Project_Comment(new Date(), content, SHOW, rating);
		comment.setProject_user(user);
		comment.setProject_book(book);
		Set<Project_Comment> comments = user.getComments();
		comments.add(comment);
		tx.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public List<Project_Comment> queryComment(String isbn) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_Book.class);
		List<Project_Comment> comments = new ArrayList<Project_Comment>();
		Project_Book book = (Project_Book)ct.add(Restrictions.eq("isbn", isbn)).uniqueResult();		
		//System.out.println(book.getBook_comments().size());
		if(book != null && book.getBook_comments().size()>0){
			for (Project_Comment c: book.getBook_comments()){
				if(c.getType()==SHOW || c.getType()==REPORTED){
					c.setISBN(isbn);
					c.setUsername(c.getProject_user().getUsername());
					comments.add(c);
				}
			}
		}
		HibernateUtil.closeSession();
		return comments;
	}

	@Override
	public void saveUser(String username, String password, String email,
			String image) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		Project_User user = new Project_User(username, email, password, Integer.toString((int) Math.ceil(Math.random()*100000)), 0.0, image);
		session.save(user);
		tx.commit();
		Email.sendActiveLink(user.getEmail(), user.getUsername(), user.getAuthority());
		System.out.println("Done");
		HibernateUtil.closeSession();
	}

	@Override
	public List<Project_User> queryUser(String username, String password) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_User.class);
		List<Project_User> users = new ArrayList<Project_User>();
		Project_User user = (Project_User)ct.add(Restrictions.eq("username", username)).add(Restrictions.eq("password", password)).uniqueResult();
		System.out.println(user == null);
		if(user != null){
			users.add(user);
		}
		HibernateUtil.closeSession();
		return users;
	}

	@Override
	public void saveTransaction(String isbn, String username, int quantity,
			double price) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		Criteria ct1 = session.createCriteria(Project_User.class);
		Criteria ct2 = session.createCriteria(Project_Book.class);
		Project_User user = (Project_User)ct1.add(Restrictions.eq("username", username)).uniqueResult();
		Project_Book book = (Project_Book)ct2.add(Restrictions.eq("isbn", isbn)).uniqueResult();
		book.setQuantity(book.getQuantity() - quantity);
		Project_Transaction transaction = new Project_Transaction(quantity, new Date(), price);
		transaction.setProject_transaction_user(user);
		transaction.setProject_transaction_book(book);
		Set<Project_Transaction> transactions = user.getTransactions();
		transactions.add(transaction);
		tx.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public List<Project_Transaction> queryTransaction(String username) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_User.class);
		List<Project_Transaction> transactions = new ArrayList<Project_Transaction>();
		Project_User user = (Project_User)ct.add(Restrictions.eq("username", username)).uniqueResult();
		System.out.println(user.getTransactions().size());
		for (Project_Transaction t: user.getTransactions()){
			t.setIsbn(t.getProject_transaction_book().getIsbn());
			t.setUsername(username);
			t.setBookname(t.getProject_transaction_book().getBookname());
			transactions.add(t);			
		}
		HibernateUtil.closeSession();
		return transactions;
	}

	@Override
	public List<Project_User> updateUser(String username, double total) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		Criteria ct = session.createCriteria(Project_User.class);
		List<Project_User> users = new ArrayList<Project_User>();
		Project_User user = (Project_User)ct.add(Restrictions.eq("username", username)).uniqueResult();
		double balance = user.getBalance() - total;
		user.setBalance(balance);
		System.out.println(user == null);
		if(user != null){
			users.add(user);
		}
		tx.commit();
		HibernateUtil.closeSession();
		return users;
	}

	@Override
	public List<Project_User> addUserBalance(String username, double addedAmount) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Transaction tx = session.beginTransaction();
		Criteria ct = session.createCriteria(Project_User.class);
		List<Project_User> users = new ArrayList<Project_User>();
		Project_User user = (Project_User)ct.add(Restrictions.eq("username", username)).uniqueResult();
		double balance = user.getBalance() + addedAmount;
		user.setBalance(balance);
		System.out.println(user == null);
		if(user != null){
			users.add(user);
		}
		tx.commit();
		HibernateUtil.closeSession();
		return users;
	}
	
	//Yansan Start
	@Override
	public void activeUser(String userName, String token) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_User.class);
		Project_User user=(Project_User)ct.add(Restrictions.eq("username", userName)).uniqueResult();
		if(user!=null&&user.getAuthority().equals(token)){
			user.setAuthority("USER");
			Transaction tx = session.beginTransaction();
			session.load(Project_User.class, user.getU_id());
			session.merge(user);
			tx.commit();
		}
		HibernateUtil.closeSession();
	}
	//Yansan End

	@Override
	public List<Project_Book> queryDashboardBooks(String amount) {
		// TODO Auto-generated method stub
		String hql = "from Project_Transaction";
		Session session = HibernateUtil.currentSession();		
		List<Project_Transaction> list = session.createQuery(hql).list();
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<Project_Book> books = new ArrayList<Project_Book>();
		for(int i = 0; i < list.size(); i++){
			if(map.containsKey(list.get(i).getProject_transaction_book().getIsbn())){
				map.put(list.get(i).getProject_transaction_book().getIsbn(), map.get(list.get(i).getProject_transaction_book().getIsbn()) + list.get(i).getQuantity());
			}else{
				map.put(list.get(i).getProject_transaction_book().getIsbn(), list.get(i).getQuantity());
			}
		}
		Set<String> set = new HashSet<String>();
		set = map.keySet();
		for (String s: set){
			Criteria ct = session.createCriteria(Project_Book.class);
			Project_Book book  = (Project_Book)ct.add(Restrictions.eq("isbn", s)).uniqueResult();
			book.setTransactionAmount(map.get(s));
			books.add(book);
		}
		// Sort list by transactionAmount
		Collections.sort(books, new Comparator<Project_Book>(){ // Anonymous Class
			@Override 
			public int compare(Project_Book b1, Project_Book b2){
				return b2.getTransactionAmount() - b1.getTransactionAmount(); // if o2 - o1, it will be descending order
			}
		});
		HibernateUtil.closeSession();
		return books;
	}

	@Override
	public String checkUsername(String username) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct1 = session.createCriteria(Project_User.class);
		Project_User user1 = (Project_User)ct1.add(Restrictions.eq("username", username)).uniqueResult();
		if(user1 != null){
			HibernateUtil.closeSession();
			return "UsernameExists";
		}
		HibernateUtil.closeSession();
		return "UsernameAccepted";
	}

	@Override
	public String checkEmail(String email) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct2 = session.createCriteria(Project_User.class);
		Project_User user2 = (Project_User)ct2.add(Restrictions.eq("email", email)).uniqueResult();
		if(user2 != null){
			HibernateUtil.closeSession();
			return "EmailExists";
		}
		HibernateUtil.closeSession();
		return "EmailAccepted";
	}

}
