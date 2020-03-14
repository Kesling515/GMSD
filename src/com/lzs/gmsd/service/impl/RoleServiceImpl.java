package com.lzs.gmsd.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;

import com.lzs.gmsd.dao.iface.BaseDao;
import com.lzs.gmsd.service.iface.RoleService;
import com.opensymphony.xwork2.ActionContext;

public class RoleServiceImpl implements RoleService {
	private BaseDao roleDao;

	@Override
	public List findRole() throws HibernateException {
		return roleDao.findObject();
	}

	public void setRoleDao(BaseDao roleDao) {
		this.roleDao = roleDao;
	}
}