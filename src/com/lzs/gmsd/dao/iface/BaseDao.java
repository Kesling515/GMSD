package com.lzs.gmsd.dao.iface;

import java.util.List;

import org.hibernate.HibernateException;

public interface BaseDao {
	public Object saveObject(Object obj) throws HibernateException;
	
	public List findObject() throws HibernateException;
	
	public void updateObject(Object obj) throws HibernateException;
	
	public void deleteObject(Object obj) throws HibernateException;
	
	public List getObject(Object obj) throws HibernateException;

	public List executeSQL(String sql);
	
	public void saveObject1(Object obj) throws HibernateException;
}