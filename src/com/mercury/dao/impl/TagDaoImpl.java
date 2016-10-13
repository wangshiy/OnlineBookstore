package com.mercury.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import com.mercury.beans.Project_Tag;
import com.mercury.dao.TagDao;
import com.mercury.utils.HibernateUtil;

public class TagDaoImpl implements TagDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<Project_Tag> getAllTags() {
		// TODO Auto-generated method stub
		Session session=HibernateUtil.currentSession();
		Criteria ct =session.createCriteria(Project_Tag.class);
		List<Project_Tag> tags=ct.list();
		HibernateUtil.closeSession();
		return tags;
	}

}
