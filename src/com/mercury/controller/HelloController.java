package com.mercury.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.BookInfo;
import com.mercury.beans.CommentInfo;
import com.mercury.beans.JsonComment;
import com.mercury.beans.JsonTestBean;
import com.mercury.beans.Project_Book;
import com.mercury.beans.Project_Comment;
import com.mercury.beans.Project_User;
import com.mercury.beans.TransactionInfo;
import com.mercury.beans.UserInfo;
import com.mercury.service.HelloService;
import com.mercury.utils.Image;

@Controller
@SessionAttributes
public class HelloController implements ServletContextAware{
	private HelloService hs;
	private String viewPage;
	private ServletContext context;
	
	public HelloService getHs() {
		return hs;
	}
	public void setHs(HelloService hs) {
		this.hs = hs;
	}
	public String getViewPage() {
		return viewPage;
	}
	public void setViewPage(String viewPage) {
		this.viewPage = viewPage;
	}
	
	@RequestMapping(value="/hello", method=RequestMethod.POST)
	public ModelAndView process(@ModelAttribute("user") Project_User user, BindingResult result) {
		System.out.println(user.getUsername());
		System.out.println(user.getEmail());
		System.out.println(user.getPassword());
		//user.setU_id(1);
		//System.out.println(user.getU_id());
		UserInfo userInfo = hs.process(user);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewPage);
		mav.addObject("userInfo", userInfo);
		return mav;
	}
	
	@RequestMapping("/main")
	public String mainPage() {		
		return "hello";
	}
	
	@RequestMapping("/home")
	public String mainPageHome() {		
		return "Home";
	}
	
	@RequestMapping("/result")
	public String mainPageBookResult() {		
		return "BookResult";
	}
	
	
	@RequestMapping("/jsonTest")
	public @ResponseBody BookInfo json(@RequestParam(value = "isbn", required = false) String isbn, 
	@RequestParam(value = "bookname", required = false) String bookname,
	@RequestParam(value = "author", required = false) String author,
	@RequestParam(value = "press", required = false) String press,
	@RequestParam(value = "releasedMin", required = false) String releasedMin,
	@RequestParam(value = "releasedMax", required = false) String releasedMax,
	@RequestParam(value = "priceMin", required = false) String priceMin,
	@RequestParam(value = "priceMax", required = false) String priceMax,
	@RequestParam(value = "ratingMin", required = false) String ratingMin,
	@RequestParam(value = "ratingMax", required = false) String ratingMax,
	@RequestParam(value = "category", required = false) String category) {
		BookInfo bookInfo = null;
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
				Date releasedMinD;
				Date releasedMaxD;
				double priceMinD;
				double priceMaxD;
			
				if (releasedMin == "" || releasedMin == null){
					releasedMinD = null;
				}else{
					releasedMinD = format.parse(releasedMin);
				}
				if (releasedMax == "" || releasedMax == null){
					releasedMaxD = null;
				}else{
					releasedMaxD = format.parse(releasedMax);
				}
				if (priceMin == "" || priceMin == null){
					priceMinD = (Double.POSITIVE_INFINITY * -1);
				}else{
					priceMinD = Double.parseDouble(priceMin);
				}
				if (priceMax == "" || priceMax == null){
					priceMaxD = (Double.POSITIVE_INFINITY);
				}else{
					priceMaxD = Double.parseDouble(priceMax);
				}
				bookInfo = hs.processQueryBookISBN(isbn, bookname, author, press, releasedMinD, releasedMaxD, priceMinD, priceMaxD, category);
				String queryBookISBN = "";
				for (Project_Book b: bookInfo.getBooks()){
					
					queryBookISBN += b.getIsbn() + "~";
				}				
				System.out.println(queryBookISBN);
				bookInfo.setMessage(queryBookISBN);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookInfo;
	}
	
	@RequestMapping(value = "/querybook", method = RequestMethod.GET)
	public ModelAndView processQueryBookISBN(@RequestParam(value = "isbn", required = false) String isbn, 
			@RequestParam(value = "bookname", required = false) String bookname,
			@RequestParam(value = "author", required = false) String author,
			@RequestParam(value = "press", required = false) String press,
			@RequestParam(value = "releasedMin", required = false) String releasedMin,
			@RequestParam(value = "releasedMax", required = false) String releasedMax,
			@RequestParam(value = "priceMin", required = false) String priceMin,
			@RequestParam(value = "priceMax", required = false) String priceMax,
			@RequestParam(value = "ratingMin", required = false) String ratingMin,
			@RequestParam(value = "ratingMax", required = false) String ratingMax,
			@RequestParam(value = "category", required = false) String category,
			HttpServletRequest request) {
		System.out.println(request.getRequestURL().toString() + "?" + request.getQueryString());
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("BookResult");
		mav.addObject("bookInfo", request.getQueryString());
		return mav;
	}
	
	@RequestMapping(value = "/querylocalstoragebook", method = RequestMethod.POST)
	public @ResponseBody BookInfo processQueryLocalStorageBook(@RequestParam(value = "isbn", required = true) String isbn){
		System.out.println(isbn);
		BookInfo bookInfo = new BookInfo();
		if (isbn.equals("")){
			bookInfo.setMessage("NoBooksFound.");
		}
		else{
			Date releasedMinD;
			Date releasedMaxD;
			double priceMinD;
			double priceMaxD;
			releasedMinD = null;
			releasedMaxD = null;
			priceMinD = (Double.POSITIVE_INFINITY * -1);
			priceMaxD = (Double.POSITIVE_INFINITY);

			String[] str = isbn.split("~");
			//array = new HashSet<String>(Arrays.asList(array)).toArray(new String[0]);
			//Remove duplicates from string array
			Set<String> uniqueStr = new HashSet<String>(Arrays.asList(str));
			System.out.println("uniqueStr.size(): " + uniqueStr.size());
			for(String s: uniqueStr){
				System.out.println("s: " + s);
			}
			List<Project_Book> books = new ArrayList<Project_Book>();
			for (String s: uniqueStr){
				System.out.println(s);
				books.addAll(hs.processQueryBookISBN(s,"","","",releasedMinD,releasedMaxD,priceMinD,priceMaxD,"").getBooks());
				//bookInfo = hs.processQueryBookISBN(isbn, bookname, author, press, releasedMinD, releasedMaxD, priceMinD, priceMaxD);
			}
			bookInfo.setBooks(books);
		}
		return bookInfo;
	}
	
	// Post Json object
	/*@RequestMapping(value = "/savecomment", method = RequestMethod.POST)
	public @ResponseBody CommentInfo saveComment(@RequestBody JsonComment jsonComment) {
		System.out.println(jsonComment);
		double ratingD = Double.parseDouble(jsonComment.getRating());
		hs.processSaveComment(jsonComment.getIsbn(), jsonComment.getUsername(), ratingD, jsonComment.getContent());
		CommentInfo commentInfo = new CommentInfo();
		commentInfo = hs.processQueryComment(jsonComment.getIsbn());
		return commentInfo;
	}*/
	
	@RequestMapping(value = "/savecomment", method = RequestMethod.POST)
	public @ResponseBody CommentInfo saveComment(@RequestParam(value = "isbn", required = true) String isbn,
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "rating", required = true) String rating,
			@RequestParam(value = "content", required = true) String content) {
		//System.out.println(jsonComment);
		double ratingD = Double.parseDouble(rating);
		hs.processSaveComment(isbn, username, ratingD, content);
		CommentInfo commentInfo = new CommentInfo();
		commentInfo = hs.processQueryComment(isbn);
		return commentInfo;
	}
	
	@RequestMapping(value = "/querycomment", method = RequestMethod.GET)
	public @ResponseBody CommentInfo queryComment(@RequestParam(value = "queryBookISBN", required = true) String queryBookISBN) {
		System.out.println(queryBookISBN);
		CommentInfo commentInfo = new CommentInfo();
		if (queryBookISBN.equals("")){
			commentInfo.setMessage("No comments found.");
		}
		else{
			String[] str = queryBookISBN.split("~");
			List<Project_Comment> comments = new ArrayList<Project_Comment>();
			/*for (int i = 0; i < str.length; i++){
				System.out.println(str[i]);
				//comments.addAll(hs.processQueryComment(str[i]).getComments());
			}*/
			for (int i = 0; i < str.length; i++){
				System.out.println(str[i]);
				comments.addAll(hs.processQueryComment(str[i]).getComments());
			}
			commentInfo.setComments(comments);
		}
		return commentInfo;
	}
	
	@RequestMapping(value = "/savetransaction", method = RequestMethod.POST)
	public @ResponseBody TransactionInfo saveTransaction(@RequestParam(value = "isbn", required = true) String isbn,
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "quantity", required = true) String quantity,
			@RequestParam(value = "price", required = true) String price) {
		String[] transactionISBNs = isbn.split("~");
		String[] transactionQuantities = quantity.split("~");
		String[] transactionSubtotals = price.split("~");
		double total = 0;
		for (int i = 0; i < transactionISBNs.length; i++){
			System.out.println("transactionISBNs[i]: " + transactionISBNs[i]);
			System.out.println("Integer.parseInt(transactionQuantities[i]): " + Integer.parseInt(transactionQuantities[i]));
			System.out.println("Double.parseDouble(transactionSubtotals[i]): " + Double.parseDouble(transactionSubtotals[i]));
			hs.processSaveTransaction(transactionISBNs[i], username, Integer.parseInt(transactionQuantities[i]), Double.parseDouble(transactionSubtotals[i]));
			total += Double.parseDouble(transactionSubtotals[i]);
		}
		UserInfo userInfo = hs.processUpdateUserBalance(username, total);
		String balance = String.valueOf(userInfo.getUsers().get(0).getBalance());
		TransactionInfo transactionInfo = new TransactionInfo();
		transactionInfo = hs.processQueryTransaction(username);
		
		transactionInfo.setMessage(balance);

		return transactionInfo;
	}
	
	@RequestMapping(value = "/querytransaction", method = RequestMethod.POST)
	public @ResponseBody TransactionInfo queryTransaction(@RequestParam(value = "username", required = true) String username){

		//TransactionInfo transactionInfo = new TransactionInfo();
		TransactionInfo transactionInfo = hs.processQueryTransaction(username);
		if (transactionInfo.getTransactions().isEmpty()){
			transactionInfo.setMessage("NoTransactionsFound.");
		}
		return transactionInfo;
	}
	
	@RequestMapping(value = "/addbalance", method = RequestMethod.POST)
	public @ResponseBody UserInfo addBalance(@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "amount", required = true) String amount){

		//UserInfo userInfo = new UserInfo();
		double addedAmount = Double.parseDouble(amount);
		UserInfo userInfo = hs.processAddBalance(username, addedAmount);
		return userInfo;
	}
	
	//@ModelAttribute("user") Project_User user
	/*@RequestMapping(value = "/saveuser", method = RequestMethod.POST)
	public @ResponseBody String saveUser(@RequestParam(value = "username", required = true) String username, 
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "image", required = true) String image){
		
		System.out.println("username: " + username);
		System.out.println("password: " + password);
		System.out.println("email: " + email);
		System.out.println("image: " + image);
		
		hs.processSaveUser(username, password, email, image);
		
		System.out.println("Controller finished saving user");
		
		return username;
	}*/
	
	@RequestMapping(value = "/saveuser", method = RequestMethod.POST)
	public ModelAndView saveUser(@RequestParam(value = "username", required = true) String username, 
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "image", required = true) MultipartFile image){
		
		System.out.println("username: " + username);
		System.out.println("password: " + password);
		System.out.println("email: " + email);
		System.out.println("image: " + image);
		
		String uploadPath = context.getRealPath("img");
		System.out.println("uploadPath: " + uploadPath);
		
		Image.save(image, uploadPath + "\\" + username);
		
		hs.processSaveUser(username, password, email, image.getOriginalFilename());
		
		System.out.println("Controller finished saving user");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Home");

		return mav;

	}
	
	@RequestMapping(value = "/checkusername", method = RequestMethod.POST)
	public @ResponseBody String checkUsername(@RequestParam(value = "username", required = true) String username){		
		
		return hs.processCheckUsername(username);

	}
	
	@RequestMapping(value = "/checkemail", method = RequestMethod.POST)
	public @ResponseBody String checkEmail(@RequestParam(value = "email", required = true) String email){		
		
		return hs.processCheckEmail(email);

	}
	
	@RequestMapping(value = "/queryuser", method = RequestMethod.POST)
	public @ResponseBody UserInfo queryUser(@RequestParam(value = "username", required = true) String username, 
			@RequestParam(value = "password", required = true) String password, 
			HttpSession session) {
		
		System.out.println("username: " + username);
		System.out.println("password: " + password);
		
		UserInfo userInfo = hs.processQueryUser(username, password);
		
		System.out.println("Controller finished querying user");
		
		if(userInfo.getUsers().isEmpty()){
			
		}else{
			session.setAttribute("loggedInUser", userInfo.getUsers().get(0).getUsername());
		    session.setAttribute("loggedInPassword", userInfo.getUsers().get(0).getPassword());
		}    
		
		return userInfo;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public @ResponseBody String logOutUser(@RequestParam(value = "username", required = true) String username, 
			HttpSession session) {
		
		session.removeAttribute("loggedInUser");
		session.removeAttribute("loggedInPassword");
		
		return "Log Out Successfully!";
	}
	
	@RequestMapping(value = "/guessyoulike", method = RequestMethod.POST)
	public @ResponseBody BookInfo queryLikeBook(@RequestParam(value = "liketags", required = true) String likeTags){
		
		System.out.println("likeTags " + likeTags);	
		String[] strTags = likeTags.split("~");
		BookInfo bookInfo = new BookInfo();
		
		if(strTags.length > 0){
			Map<String, Integer> tagMap = new HashMap<String, Integer>();
			for (int i = 0; i < strTags.length; i++){
				if(tagMap.containsKey(strTags[i])){
					int count = tagMap.get(strTags[i]) + 1;
					tagMap.put(strTags[i], count);
				}else{
					tagMap.put(strTags[i], 1);
				}
			}
			ArrayList<Map.Entry<String, Integer>> list = new ArrayList<Map.Entry<String, Integer>>();
			list.addAll(tagMap.entrySet());
			
			Collections.sort(list, new Comparator<Map.Entry<String, Integer>>(){ // Anonymous Class
				@Override 
				public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2){
					return o2.getValue() - o1.getValue(); // if o2 - o1, it will be descending order
				}
			});
			
			Iterator<Map.Entry<String,Integer>> it=list.iterator();
			while(it.hasNext())  
	        {  
	            System.out.println(it.next());  
	        } 
			
			String finalGuess = "";
			if(list.size() == 1){
				finalGuess += list.get(0).getKey() + "~";
			}else{
				for (int i = 0; i < list.size() - 1; i++){
					finalGuess += list.get(i).getKey() + "~";
					if(list.get(i).getValue().equals(list.get(i+1).getValue())){
						finalGuess += list.get(i+1).getKey() + "~";
					}else{
						break;
					}
				}
			}
			
			System.out.print("final guess string: " + finalGuess);
			Date releasedMinD;
			Date releasedMaxD;
			double priceMinD;
			double priceMaxD;
			releasedMinD = null;
			releasedMaxD = null;
			priceMinD = (Double.POSITIVE_INFINITY * -1);
			priceMaxD = (Double.POSITIVE_INFINITY);
			bookInfo = hs.processQueryBookISBN("", "", "", "", releasedMinD, releasedMaxD, priceMinD, priceMaxD, finalGuess);
		}else{
			bookInfo.setMessage("NoBooksFound.");
		}
			
		return bookInfo;
	}
	
	@RequestMapping(value = "/dashboardbooks", method = RequestMethod.GET)
	public @ResponseBody BookInfo queryDashboardBooks(@RequestParam(value = "amount", required = true) String amount) {

		BookInfo bookInfo = new BookInfo();
		bookInfo = hs.processQueryDashboardBooks(amount);
//		if (queryBookISBN == ""){
//			commentInfo.setMessage("No comments found.");
//		}
//		else{
//			String[] str = queryBookISBN.split("~");
//			List<Project_Comment> comments = new ArrayList<Project_Comment>();
//			for (int i = 0; i < str.length; i++){
//				System.out.println(str[i]);
//				comments.addAll(hs.processQueryComment(str[i]).getComments());
//			}
//			commentInfo.setComments(comments);
//		}
		return bookInfo;
	}
	
	
	// Yansan
	@RequestMapping("/admin")
	public String adminPage(){
		
		return "admin";
	}	
	//Yansan
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
		context = servletContext;
	}
	
	//Yansan start
	@RequestMapping(value="/activeUser", method=RequestMethod.GET)
	public ModelAndView activeUser(@RequestParam("userName") String userName, @RequestParam("token") String token ){
		hs.activeUser(userName, token);
		ModelAndView md=new ModelAndView();
		md.setViewName("Home");
		Project_User user= new Project_User();
		md.addObject("userInfo", user);
		return md;
	}
	//Yansan end
	
}
