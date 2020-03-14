package com.lzs.gmsd.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.Order;
import com.lzs.gmsd.bean.UserInfo;
import com.lzs.gmsd.dao.iface.BaseDao;
import com.lzs.gmsd.service.iface.OrderService;
import com.opensymphony.xwork2.ActionContext;
import javax.servlet.http.*;

public class OrderServiceImpl implements OrderService {
	
	private BaseDao orderDao;
	private BaseDao userInfoDao;
	
	
	//报障单保存
	@Override
	public void saveOrder(Order order) throws HibernateException {
		int userId = (int) this.getRequest().getSession().getAttribute("userId");
		UserInfo ui = (UserInfo) userInfoDao.getObject(userId).get(0);
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		Date now = new Date();
		String orderNo = "No." + sdf.format(now) + (int) Math.round(Math.random() * (9999 - 1000) + 1000); //生成维修单号
		order.setCreateTime(now);
		order.setOrderNo(orderNo);
		order.setCreater(ui);
		orderDao.saveObject1(order);
	}
	
	//更新报障单
	@Override
	public void updateOrder(Order order) throws HibernateException {
		orderDao.updateObject(order);
	}
	
	//查找报障单
	@Override
	public List findOrder() throws HibernateException {
		return orderDao.findObject();
	}
	
	//查找普通用户报障单
	@Override
	public List normalOrder() throws HibernateException {
		int userId = (int) this.getRequest().getSession().getAttribute("userId");
		UserInfo ui = (UserInfo) userInfoDao.getObject(userId).get(0);
		Object[] query = {"normalUserOrders", ui.getId()};
		return orderDao.getObject(query);
	}
	
	//查找维修人员被指派的报障单
	@Override
	public List workerOrder() throws HibernateException {
		int userId = (int) this.getRequest().getSession().getAttribute("userId");
		UserInfo ui = (UserInfo) userInfoDao.getObject(userId).get(0);
		Object[] query = {"workerOrders", ui.getId()};
		return orderDao.getObject(query);
	}

	//用户取消报障单
	@Override
	public void cancelOrder(String orderNo) throws HibernateException {
		Object[] query = {"getByOno", orderNo};
		List list = orderDao.getObject(query);
		Order o = (Order) list.get(0);
		o.setState(5);
		orderDao.updateObject(o);
	}
	
	//根据身份取消报障单
	@Override
	public void cancelOrderByAdmin(String orderNo) throws HibernateException {
		Object[] query = {"getByOno", orderNo};
		List list = orderDao.getObject(query);
		Order o = (Order) list.get(0);
		o.setState(6);
		orderDao.updateObject(o);
	}

	//获取报障单
	@Override
	public Order getOrder(String orderNo) throws HibernateException {
		Object[] query = {"getByOno", orderNo};
		List lists = orderDao.getObject(query);
		System.out.println(lists);
		if (lists.size() != 0) {
			return (Order) lists.get(0);
		}
		return null;
	}

	@Override
	public List orderSum() throws HibernateException {
		String sql = "SELECT state, COUNT(*) AS total FROM order_main GROUP BY state;";
		return orderDao.executeSQL(sql);
	}
	
	public void setOrderDao(BaseDao orderDao) {
		this.orderDao = orderDao;
	}  	
  	public void setUserInfoDao(BaseDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}
	
	/*
  	 * 注意：
  	 * 	直接用 ServletActionContext 对象的 getRequest() 或者 getResponse() 也可以直接获取到  request 或 response 对象
  	 * 但是：
  	 * 1）如果 ActionContext能够实现我们的功能 ,那最好就不要使用 ServletActionContext,让我们的 Action尽量不要直接去访问 JavaServlet的相关对象 .
  	 * 2）在使用 ActionContext时有一点要注意 :不要在 Action的构造函数里使用 ActionContext.getContext(),因为这个时候 ActionContext里的一些值也许没有设置 ,这时通过 ActionContext取得的值也许是 null.
  	 * 
  	 */

	//获取request
  	public HttpServletRequest getRequest() {  		
  		return (HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST); //struts2获取request对象的方法
  	}
  	
  	//获取response
  	public HttpServletResponse getResponse() {
  		return (HttpServletResponse)ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE); //struts2获取response对象的方法
  	}
		
}
