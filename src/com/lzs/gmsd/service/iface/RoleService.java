package com.lzs.gmsd.service.iface;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.User;

public interface RoleService {
	public List findRole() throws HibernateException;
}