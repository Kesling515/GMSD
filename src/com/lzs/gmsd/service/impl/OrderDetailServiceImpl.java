package com.lzs.gmsd.service.impl;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.OrderDetail;
import com.lzs.gmsd.dao.iface.BaseDao;
import com.lzs.gmsd.service.iface.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService {

	private BaseDao orderDetailDao;
	
	@Override
	public int saveOrderDetail(OrderDetail orderDetail) throws HibernateException {
		return (int) orderDetailDao.saveObject(orderDetail);
	}

	@Override
	public List findOrderDetail() throws HibernateException {
		return orderDetailDao.findObject();
	}

	@Override
	public void updateOrderDetail(OrderDetail orderDetail) throws HibernateException {
		orderDetailDao.updateObject(orderDetail);
	}
	
	@Override
	public OrderDetail getOrderDetail(int orderDetailId) throws HibernateException {
		List lists = orderDetailDao.getObject(orderDetailId);
		if(lists.size() != 0){
			return (OrderDetail) lists.get(0);
		}
		return null;
	}

	public void setOrderDetailDao(BaseDao orderDetailDao) {
		this.orderDetailDao = orderDetailDao;
	}
	
}
