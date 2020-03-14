package com.lzs.gmsd.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.lzs.gmsd.dao.iface.BaseDao;

public class RoleDao extends HibernateDaoSupport implements BaseDao {
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
		return (List) getHibernateTemplate().find("from Role");
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
		return (List) getHibernateTemplate().find("from Role a where a.id=?", obj);
	}

	@Override
	public List executeSQL(String sql) {
		// TODO Auto-generated method stub
		return null;
	}
}
