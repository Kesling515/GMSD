package com.lzs.gmsd.service.iface;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.OrderDetail;


public interface OrderDetailService {

	public int saveOrderDetail(OrderDetail orderDetail) throws HibernateException;
	
	public List findOrderDetail() throws HibernateException;
	
	public void updateOrderDetail(OrderDetail orderDetail) throws HibernateException;
	
	public OrderDetail getOrderDetail(int orderDetailId) throws HibernateException;
	
}
