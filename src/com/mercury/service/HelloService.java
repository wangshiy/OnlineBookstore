package com.mercury.service;

import java.util.Date;

import com.mercury.beans.BookInfo;
import com.mercury.beans.CommentInfo;
import com.mercury.beans.Project_Book;
import com.mercury.beans.Project_User;
import com.mercury.beans.TransactionInfo;
import com.mercury.beans.UserInfo;
import com.mercury.dao.HelloDao;

public class HelloService {
	private HelloDao hd;
		
	public HelloDao getHd() {
		return hd;
	}
	public void setHd(HelloDao hd) {
		this.hd = hd;
	}

	//cache zai zhe li
	public UserInfo process(Project_User user) {
		System.out.println("processing begins");
		hd.save(user);
		System.out.println("processing middle1");
		UserInfo userInfo = new UserInfo();
		userInfo.setMessage("Hello " + user.getUsername() + ", welcome to JavaEE!");
		userInfo.setUsers(hd.queryAll());
		return userInfo;
	}
	
	public BookInfo processQueryBookISBN(String isbn, String bookname, String author, String press, Date releasedMin, Date releasedMax, double priceMin, double priceMax, String category) {
		System.out.println("processing begins");
		BookInfo bookInfo = new BookInfo();
		bookInfo.setBooks(hd.queryBookISBN(isbn, bookname, author, press, releasedMin, releasedMax, priceMin, priceMax, category));
		return bookInfo;
	}
	
	public void processSaveComment(String isbn, String username, double rating, String content) {
		System.out.println("processing begins");
		hd.saveComment(isbn, username, rating, content);
	}
	
	public CommentInfo processQueryComment(String isbn) {
		System.out.println("processing begins");
		CommentInfo commentInfo = new CommentInfo();
		commentInfo.setComments(hd.queryComment(isbn));
		return commentInfo;
		
	}
	
	public void processSaveTransaction(String isbn, String username, int quantity, double price) {
		System.out.println("processing begins");
		hd.saveTransaction(isbn, username, quantity, price);
	}
	
	public TransactionInfo processQueryTransaction(String username) {
		System.out.println("processing begins");
		TransactionInfo transactionInfo = new TransactionInfo();
		transactionInfo.setTransactions(hd.queryTransaction(username));
		return transactionInfo;
		
	}
	
	public void processSaveUser(String username, String password, String email, String image) {
		System.out.println("processing begins");
		hd.saveUser(username, password, email, image);
	}
	
	public String processCheckUsername(String username) {
		System.out.println("processing begins");
		return hd.checkUsername(username);
	}
	
	public String processCheckEmail(String email) {
		System.out.println("processing begins");
		return hd.checkEmail(email);
	}
	
	public UserInfo processQueryUser(String username, String password) {
		System.out.println("processing begins");
		UserInfo userInfo = new UserInfo();
		userInfo.setUsers(hd.queryUser(username, password));
		System.out.println(userInfo.getUsers().isEmpty());
		if(userInfo.getUsers().isEmpty()){
			userInfo.setMessage("userNotFound");
		}else{
			if(userInfo.getUsers().get(0).getAuthority().equals("USER")){
				userInfo.setMessage("userFound");
			}else if(userInfo.getUsers().get(0).getAuthority().equals("ADMIN")){
				userInfo.setMessage("adminFound");
			}else{
				userInfo.setMessage("accountNotActivated");
			}			
		}
		return userInfo;
	}
	
	public UserInfo processUpdateUserBalance(String username, double total) {
		System.out.println("processing begins");
		UserInfo userInfo = new UserInfo();
		userInfo.setUsers(hd.updateUser(username, total));
		System.out.println(userInfo.getUsers().isEmpty());
		if(userInfo.getUsers().isEmpty()){
			userInfo.setMessage("userNotFound");
		}else{
			userInfo.setMessage("userFound");
		}
		return userInfo;
	}
	
	public UserInfo processAddBalance(String username, double addedAmount) {
		System.out.println("processing begins");
		UserInfo userInfo = new UserInfo();
		userInfo.setUsers(hd.addUserBalance(username, addedAmount));
		System.out.println(userInfo.getUsers().isEmpty());
		if(userInfo.getUsers().isEmpty()){
			userInfo.setMessage("userNotFound");
		}else{
			userInfo.setMessage("userFound");
		}
		return userInfo;
	}
	
	public BookInfo processQueryDashboardBooks(String amount){
		System.out.println("processing begins");
		BookInfo bookInfo = new BookInfo();
		bookInfo.setBooks(hd.queryDashboardBooks(amount));
		if(bookInfo.getBooks().isEmpty()){
			bookInfo.setMessage("NoBooksFound.");
		}else{
			String queryBookISBN = "";
			for (Project_Book b: bookInfo.getBooks()){
				
				queryBookISBN += b.getIsbn() + "~";
			}				
			bookInfo.setMessage(queryBookISBN);
		}
		return bookInfo;
	} 
	
	//Yansan Start
	public void activeUser(String userName, String token) {
		// TODO Auto-generated method stub
		hd.activeUser(userName,token);
	}
	//Yansan End

	
}
