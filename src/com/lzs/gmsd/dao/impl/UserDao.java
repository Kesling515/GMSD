package com.lzs.gmsd.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.lzs.gmsd.dao.iface.BaseDao;

public class UserDao extends HibernateDaoSupport implements BaseDao {

	@Override
	public Object saveObject(Object obj) throws HibernateException {
		return getHibernateTemplate().save(obj);
	}
	
	@Override
	public void saveObject1(Object obj) throws HibernateException {
		getHibernateTemplate().save(obj);
	}

	@Override
	public List findObject() throws HibernateException {
		return (List) getHibernateTemplate().find("from User a where a.isDelete = 1");
	}

	@Override
	public void updateObject(Object obj) throws HibernateException {
		getHibernateTemplate().update(obj);	
	}

	@Override
	public void deleteObject(Object obj) throws HibernateException {
		getHibernateTemplate().delete(obj);
	}

	@Override
	public List getObject(Object obj) throws HibernateException {
		Object[] arr = (Object[]) obj;
		return (List) getHibernateTemplate().findByNamedQuery((String) arr[0], arr[1]);
	}

	@Override
	public List executeSQL(String sql) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
