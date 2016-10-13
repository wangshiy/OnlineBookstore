package com.mercury.controller;

import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.mercury.beans.Project_Book;
import com.mercury.beans.Project_Tag;
import com.mercury.service.BookService;
import com.mercury.utils.Image;


@Controller
@RequestMapping("/book")
public class BookController implements ServletContextAware {	
	private ServletContext context;
	@Override
	public void setServletContext(ServletContext servletContext) {
	     context = servletContext;
	}
	private BookService bookService;

	@RequestMapping("/add")
	@ResponseBody
	public Object saveBook(@ModelAttribute("book") Project_Book book,
			@RequestParam("releasedSql") Date date ,
			@RequestParam("tagNames[]") String[] tagNames,
			@RequestParam("coverImage") MultipartFile cover,
			@RequestParam("contentImages[]") MultipartFile[] contentImages
			){	
		Object result=null;	
		
		String uploadPath=context.getRealPath("img");
		Image.save(cover, uploadPath+"\\"+book.getIsbn());
		book.setCover(cover.getOriginalFilename());
		
		Image.save(contentImages, uploadPath+"\\"+book.getIsbn());
		book.setContent1(contentImages[0].getOriginalFilename());
		book.setContent2(contentImages[1].getOriginalFilename());
		book.setContent3(contentImages[2].getOriginalFilename());
		
		Set<Project_Tag> tags = new HashSet<Project_Tag>();
		for(String tagName: tagNames){
			Project_Tag tag=new Project_Tag(tagName);
			tags.add(tag);
		}
		book.setTags(tags);
		book.setReleased(date);
		result=bookService.saveBook(book);
		return result;
	}
	@RequestMapping("/update")
	@ResponseBody
	public Object updateBook(@ModelAttribute("book") Project_Book book,
			@RequestParam("releasedSql") Date date ,
			@RequestParam("tagNames[]") String[] tagNames,
			@RequestParam("coverImage") MultipartFile cover,
			@RequestParam("contentImages[]") MultipartFile[] contentImages
			){	
		Object result=null;	
		String uploadPath=context.getRealPath("img");
		if(cover!=null){
			Image.save(cover, uploadPath+"\\"+book.getIsbn());
			book.setCover(cover.getOriginalFilename());
		}
		if(contentImages.length>0){
			Image.save(contentImages, uploadPath+"\\"+book.getIsbn());			
			book.setContent1(contentImages[0].getOriginalFilename());
			book.setContent2(contentImages[1].getOriginalFilename());
			book.setContent3(contentImages[2].getOriginalFilename());
		}
		System.out.println(uploadPath+"\\"+book.getIsbn());
		Set<Project_Tag> tags = new HashSet<Project_Tag>();
		for(String tagName: tagNames){
			Project_Tag tag=new Project_Tag(tagName);
			tags.add(tag);
		}
		book.setTags(tags);
		book.setReleased(date);
		bookService.updateBook(book);
		return result;
	}
	@RequestMapping(value="/search",method=RequestMethod.GET)
	@ResponseBody
	public List<Project_Book> searchBooksLikeISBN(@RequestParam("isbn") String isbn){
		return bookService.searchBooksLikeISBN(isbn);
	}
	
	@RequestMapping(value="/get",method=RequestMethod.GET)
	@ResponseBody
	public Project_Book getBookByISBN(@RequestParam("isbn") String isbn){
		return bookService.getBookByISBN(isbn);
	}
	@RequestMapping(value="delete",method=RequestMethod.GET)
	@ResponseBody
	public void deleteBookByISBN(@RequestParam("isbn") String isbn){
		bookService.deleteBookByISBN(isbn);
	}
	@RequestMapping(value="all",method=RequestMethod.GET)
	@ResponseBody
	public List<Project_Book> getAllBooks(){
		return bookService.getAllBooks();
	}
	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
}
