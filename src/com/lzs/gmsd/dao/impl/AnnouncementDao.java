package com.lzs.gmsd.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.lzs.gmsd.dao.iface.BaseDao;

public class AnnouncementDao extends HibernateDaoSupport implements BaseDao {

	@Override
	public Object saveObject(Object obj) throws HibernateException {
		// TODO Auto-generated method stub
		return getHibernateTemplate().save(obj);
	}

	@Override
	public List findObject() throws HibernateException {
		// TODO Auto-generated method stub
		return (List) getHibernateTemplate().find("from Announcement order by contime desc");
	}

	@Override
	public void updateObject(Object obj) throws HibernateException {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(obj);
	}

	@Override
	public void deleteObject(Object obj) throws HibernateException {
		// TODO Auto-generated method stub
		getHibernateTemplate().delete(obj);
	}

	@Override
	public List getObject(Object obj) throws HibernateException {
		// TODO Auto-generated method stub
		Object[] arr = (Object[]) obj;
		return getHibernateTemplate().findByNamedQuery((String) arr[0], arr[1]);
	}

	@Override
	public List executeSQL(String sql) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void saveObject1(Object obj) throws HibernateException {
		getHibernateTemplate().save(obj);
	}
	
}
