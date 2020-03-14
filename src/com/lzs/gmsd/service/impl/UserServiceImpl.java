package com.lzs.gmsd.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

import com.lzs.gmsd.bean.User;
import com.lzs.gmsd.dao.iface.BaseDao;
import com.lzs.gmsd.service.iface.UserService;
import com.opensymphony.xwork2.ActionContext;

public class UserServiceImpl implements UserService {
	
	private BaseDao userDao;

	@Override
	public void saveUser(User user) throws HibernateException {
		userDao.saveObject(user);
	}
	
	@Override
	public List findUser() throws HibernateException {
		return userDao.findObject();
	}
	
	@Override
	public void updateUser(User user) throws HibernateException {	
		userDao.updateObject(user);
	}

	@Override
	public void deleteUser(User user) throws HibernateException {
		userDao.deleteObject(user);
	}

	@Override
	public User getUser(User user) throws HibernateException {
		Object[] query = {"byAccount", user.getAccount()};
		List lists = userDao.getObject(query);
		if (lists.size() != 0) {
			return (User) lists.get(0);
		}
		return null;
	}
	
	@Override
	public User getCurrentUser() throws HibernateException {
		int userId = (int) this.getRequest().getSession().getAttribute("userId");
		Object[] query = {"byUserId", userId};
		List lists = userDao.getObject(query);
		if (lists.size() != 0) {
			return (User) lists.get(0);
		}
		return null;
	}

	@Override
	public List getWorker() throws HibernateException {
		Object[] query = {"byRole", 2};
		return userDao.getObject(query);
	}

	@Override
	public void userLogin(User user) throws HibernateException {
		HttpSession session = this.getRequest().getSession();
		session.setAttribute("userId", user.getAccount());
		session.setAttribute("userRoleId", user.getRoleId());
		session.setAttribute("userName", user.getName());
		session.setAttribute("userAccount", user.getAccount());
	}
	
	@Override
	public void userLogout() throws HibernateException {
		HttpSession session = this.getRequest().getSession();
		session.invalidate();
	}
	
	public void setUserDao(BaseDao userDao) {
		this.userDao = userDao;
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