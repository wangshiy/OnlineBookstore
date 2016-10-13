package com.mercury.dao;

import java.util.List;

import com.mercury.beans.Project_Book;

public interface BookDao {
	public Object saveBook(Project_Book book);
	public Project_Book getBookByISBN(String isbn);
	public List<Project_Book> searchBooksLikeISBN(String isbn);
	public void updateBook(Project_Book book);
	public void deleteBookByISBN(String isbn);
	public List<Project_Book> getAllBooks();

}
