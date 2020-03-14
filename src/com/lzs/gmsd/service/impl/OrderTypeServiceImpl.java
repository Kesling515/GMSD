package com.lzs.gmsd.service.impl;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.OrderType;
import com.lzs.gmsd.dao.iface.BaseDao;
import com.lzs.gmsd.service.iface.OrderTypeService;

public class OrderTypeServiceImpl implements OrderTypeService {

	private BaseDao orderTypeDao;
	
	@Override
	public List findOrderType() throws HibernateException {
		return orderTypeDao.findObject();
	}

	@Override
	public OrderType getOrderType(int id) throws HibernateException {
		List lists = orderTypeDao.getObject(id);
		if (lists.size() != 0) {
			return (OrderType) lists.get(0);
		}
		return null;
	}

	public void setOrderTypeDao(BaseDao orderTypeDao) {
		this.orderTypeDao = orderTypeDao;
	}
	
}
