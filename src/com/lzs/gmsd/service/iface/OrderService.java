package com.lzs.gmsd.service.iface;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.Order;

public interface OrderService {

	public void saveOrder(Order order) throws HibernateException;
	
	public void updateOrder(Order order) throws HibernateException;
	
	public List findOrder() throws HibernateException;
	
	public List normalOrder() throws HibernateException;
	
	public List workerOrder() throws HibernateException;
	
	public void cancelOrder(String orderNo) throws HibernateException;
	
	public void cancelOrderByAdmin(String orderId) throws HibernateException;
	
	public Order getOrder(String orderNo) throws HibernateException;
	
	public List orderSum() throws HibernateException;
	
}
