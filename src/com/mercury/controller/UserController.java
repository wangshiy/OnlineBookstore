package com.mercury.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Project_User;
import com.mercury.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	private UserService userService;
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	//Yansan start
	@RequestMapping(value="/activeUser", method=RequestMethod.GET)
	public ModelAndView activeUser(@RequestParam("userName") String userName, @RequestParam("token") String token ){
		userService.activeUser(userName, token);
		ModelAndView md=new ModelAndView();
		md.setViewName("Home");
		Project_User user= new Project_User();
		md.addObject("userInfo", user);
		return md;
	}
	//Yansan end
}
