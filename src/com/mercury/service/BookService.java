package com.mercury.service;

import java.util.List;

import com.mercury.beans.Project_Book;
import com.mercury.dao.BookDao;

public class BookService {
	private BookDao bookDao;
	public Object saveBook(Project_Book book) {
		// TODO Auto-generated method stub
		return bookDao.saveBook(book);
	}
	public BookDao getBookDao() {
		return bookDao;
	}
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	public List<Project_Book> searchBooksLikeISBN(String isbn) {
		// TODO Auto-generated method stub
		
		return bookDao.searchBooksLikeISBN(isbn);
	}
	public Project_Book getBookByISBN(String isbn) {
		// TODO Auto-generated method stub
		return bookDao.getBookByISBN(isbn);
	}
	public void updateBook(Project_Book book) {
		// TODO Auto-generated method stub
		 bookDao.updateBook(book);
		 
	}
	public void deleteBookByISBN(String isbn) {
		// TODO Auto-generated method stub
		bookDao.deleteBookByISBN(isbn);
	}
	public List<Project_Book> getAllBooks() {
		// TODO Auto-generated method stub
		return bookDao.getAllBooks();
	}


}
