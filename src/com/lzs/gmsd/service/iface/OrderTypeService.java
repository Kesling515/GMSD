package com.lzs.gmsd.service.iface;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.OrderType;


public interface OrderTypeService {

	public List findOrderType() throws HibernateException;
	
	public OrderType getOrderType (int id) throws HibernateException;
	
}
