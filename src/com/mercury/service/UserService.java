package com.mercury.service;

import com.mercury.dao.UserDao;

public class UserService {
	private UserDao userDao;

	public void activeUser(String userName, String token) {
		// TODO Auto-generated method stub
		userDao.activeUser(userName,token);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
}
