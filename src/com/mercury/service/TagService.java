package com.mercury.service;

import java.util.List;

import com.mercury.beans.Project_Tag;
import com.mercury.dao.TagDao;

public class TagService {
	private TagDao tagDao;
	public TagDao getTagDao() {
		return tagDao;
	}
	public void setTagDao(TagDao tagDao) {
		this.tagDao = tagDao;
	}
	public List<Project_Tag> getAllTags() {
		// TODO Auto-generated method stub
		return tagDao.getAllTags();
	}

}
