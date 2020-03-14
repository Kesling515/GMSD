package com.lzs.gmsd.service.iface;

import java.util.List;


import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.UserInfo;

public interface UserInfoService {
	public void saveUserInfo(UserInfo userInfo) throws HibernateException;
	
	public void updateUserInfo(UserInfo userInfo) throws HibernateException;
	
	public void deleteUserInfo(UserInfo userInfo) throws HibernateException;
	
	public List findUserInfo() throws HibernateException;
	
	public UserInfo getUserInfo(int userId) throws HibernateException;
	
	public UserInfo getWorkerInfo() throws HibernateException;
}