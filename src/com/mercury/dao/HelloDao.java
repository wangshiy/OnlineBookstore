package com.mercury.dao;

import java.util.Date;
import java.util.List;

import com.mercury.beans.Project_Book;
import com.mercury.beans.Project_Comment;
import com.mercury.beans.Project_Transaction;
import com.mercury.beans.Project_User;



public interface HelloDao {
	public Project_User findByName(String name);
	public void save(Project_User user);
	public void update(Project_User user);
	public void delete(Project_User user);
	public List<Project_User> queryAll();
	public List<Project_Book> queryBookISBN(String isbn, String bookname, String author, String press, Date releasedMin, Date releasedMax, double priceMin, double priceMax, String category);
	public void saveComment(String isbn, String username, double rating, String content);
	public List<Project_Comment> queryComment(String isbn);
	public void saveTransaction(String isbn, String username, int quantity, double price);
	public List<Project_Transaction> queryTransaction(String username);
	public void saveUser(String username, String password, String email, String image);
	public String checkUsername(String username);
	public String checkEmail(String email);
	public List<Project_User> queryUser(String username, String password);
	public List<Project_User> updateUser(String username, double total);
	public List<Project_User> addUserBalance(String username, double addedAmount);
	public List<Project_Book> queryDashboardBooks(String amount);

	//Yansan Start
	public void activeUser(String userName, String token);
	//Yansan End

}
