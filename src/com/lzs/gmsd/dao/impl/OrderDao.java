package com.lzs.gmsd.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.lzs.gmsd.dao.iface.BaseDao;

public class OrderDao extends HibernateDaoSupport implements BaseDao {
	
	@Override
	public void saveObject1(Object obj) throws HibernateException {
		getHibernateTemplate().save(obj);
	}
	
	@Override
	public Object saveObject(Object obj) throws HibernateException {
		return getHibernateTemplate().save(obj);
	}

	@Override
	public List findObject() throws HibernateException {
		return (List) getHibernateTemplate().find("from Order");
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
	public List executeSQL(final String sql) {
		return getHibernateTemplate().executeFind(new HibernateCallback<List<Object>>() {
			@SuppressWarnings("unchecked")  
		    @Override
			public List<Object> doInHibernate(Session session)  
			        throws HibernateException, SQLException {  
			        SQLQuery query = session.createSQLQuery(sql);
			        List results = query.list();
			        return (List<Object>) results;  
			    }  
		});
	}
	
}
