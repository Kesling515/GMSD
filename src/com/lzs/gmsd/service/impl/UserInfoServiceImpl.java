package com.lzs.gmsd.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.UserInfo;
import com.lzs.gmsd.dao.iface.BaseDao;
import com.lzs.gmsd.service.iface.UserInfoService;
import com.opensymphony.xwork2.ActionContext;

public class UserInfoServiceImpl implements UserInfoService {
	
	private BaseDao userInfoDao;
	
	@Override
	public void saveUserInfo(UserInfo userInfo) throws HibernateException {
		userInfoDao.saveObject(userInfo);
	}

	@Override
	public void updateUserInfo(UserInfo userInfo) throws HibernateException {
		userInfoDao.updateObject(userInfo);
	}
	
	@Override
	public List findUserInfo() throws HibernateException {
		return userInfoDao.findObject();
	}
	
	@Override
	public void deleteUserInfo(UserInfo userInfo) throws HibernateException {
		userInfoDao.deleteObject(userInfo);
	}
	
	@Override
	public UserInfo getUserInfo(int userId) throws HibernateException {
		int uid = userId == 0 ? (int) this.getRequest().getSession().getAttribute("userId") : userId;
		List lists = userInfoDao.getObject(uid);
		if (lists.size() != 0) {
			return (UserInfo) lists.get(0);
		}
		return null;
	}
	
	@Override
	public UserInfo getWorkerInfo() throws HibernateException {
		String sql = "SELECT ui.id AS id, COUNT(o.order_no) AS total FROM user_info ui LEFT JOIN order_main o ON ui.id = o.repairer_id WHERE ui.user_id in (SELECT u.account from user_main u WHERE u.role_id = 2 AND u.is_delete = 1) GROUP BY ui.id ORDER BY total LIMIT 0,1;";
		List list = userInfoDao.executeSQL(sql);
		Object[] obj = (Object[]) list.get(0);
		UserInfo ui = new UserInfo();
		System.out.println("worker userinfo id:" + obj[0]);
		System.out.println("worker order count:" + obj[1]);
		String idStr = obj[0].toString();
		int id = Integer.valueOf(idStr);
		ui.setId(id);
		return ui;
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