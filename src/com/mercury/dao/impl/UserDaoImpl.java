package com.mercury.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.mercury.beans.Project_User;
import com.mercury.dao.UserDao;
import com.mercury.utils.HibernateUtil;

public class UserDaoImpl implements UserDao{

	@Override
	public void activeUser(String userName, String token) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.currentSession();
		Criteria ct = session.createCriteria(Project_User.class);
		Project_User user=(Project_User)ct.add(Restrictions.eq("username", userName)).uniqueResult();
		if(user!=null&&user.getAuthority().equals(token)){
			user.setAuthority("USER");
			Transaction tx = session.beginTransaction();
			session.load(Project_User.class, user.getU_id());
			session.merge(user);
			tx.commit();
		}
		HibernateUtil.closeSession();
	}

}
