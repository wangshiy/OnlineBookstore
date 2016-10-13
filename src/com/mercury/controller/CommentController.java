package com.mercury.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mercury.beans.Project_Book;
import com.mercury.beans.Project_Comment;
import com.mercury.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	private CommentService commentService;
	@RequestMapping(value="/getAllReportedComments",method=RequestMethod.GET)
	@ResponseBody
	public List<Project_Comment> getAllReportedComments(){	
		return commentService.getAllReportedComments();
	}
	@RequestMapping(value="/getAllHiddenComments",method=RequestMethod.GET)
	@ResponseBody
	public List<Project_Comment> getAllHiddenComments(){	
		return commentService.getAllHiddenComments();
	}
	
	@RequestMapping(value="numberOfReportedComments", method=RequestMethod.GET)
	@ResponseBody
	public int numberOfReportedComments(){
		return commentService.numberOfReportedComments();
	}
	@RequestMapping(value="numberOfHiddenComments", method=RequestMethod.GET)
	@ResponseBody
	public int numberOfHiddenComments(){
		return commentService.numberOfHiddenComments();
	}
	@RequestMapping(value="hide", method=RequestMethod.POST )
	@ResponseBody
	public int hideCommentById(@RequestBody int commentId){
		commentService.hideCommentById(commentId);
		return 1;
	}
	@RequestMapping(value="show", method=RequestMethod.POST )
	@ResponseBody
	public int showCommentById(@RequestBody int commentId){
		commentService.showCommentById(commentId);
		return 1;
	}
	@RequestMapping(value="report", method=RequestMethod.POST )
	@ResponseBody
	public int reportCommentById(@RequestBody int commentId){
		commentService.reportCommentById(commentId);
		return 1;
	}
	@RequestMapping(value="reportByUser", method=RequestMethod.POST )
	@ResponseBody
	public int reportCommentByUser(@RequestBody String commentId){
		System.out.println(commentId);
		int id=Integer.parseInt(commentId);
		commentService.reportCommentById(id);
		return 1;
	}
	public CommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
}
