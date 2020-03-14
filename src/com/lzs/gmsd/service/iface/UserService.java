package com.lzs.gmsd.service.iface;

import java.util.List;


import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.User;


public interface UserService {
	public void saveUser(User user) throws HibernateException;
	
	public List findUser() throws HibernateException;
	
	public void updateUser(User user) throws HibernateException;
	
	public void deleteUser(User user) throws HibernateException;
	
	public User getUser(User user) throws HibernateException;
	
	public User getCurrentUser() throws HibernateException;
	
	public List getWorker() throws HibernateException;
	
	public void userLogin(User user) throws HibernateException;
	
	public void userLogout() throws HibernateException;
}