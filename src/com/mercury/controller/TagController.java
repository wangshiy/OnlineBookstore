package com.mercury.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mercury.beans.Project_Tag;
import com.mercury.service.TagService;

@Controller
@RequestMapping("/tag")
public class TagController {
	private TagService tagService;
	public TagService getTagService() {
		return tagService;
	}
	public void setTagService(TagService tagService) {
		this.tagService = tagService;
	}
	@RequestMapping(value="all",method=RequestMethod.GET)
	@ResponseBody
	public List<Project_Tag> getAllTags(){	
		return tagService.getAllTags();
	}
}
