package com.lzs.gmsd.service.impl;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.Help;
import com.lzs.gmsd.dao.iface.BaseDao;
import com.lzs.gmsd.service.iface.HelpService;

public class HelpServiceImpl implements HelpService {

	private BaseDao helpDao;
	
	public void setHelpDao(BaseDao helpDao) {
		this.helpDao = helpDao;
	}

	@Override
	public int saveHelp(Help help) throws HibernateException {
		return (int) helpDao.saveObject(help);
	}

	@Override
	public List findHelp() throws HibernateException {
		return helpDao.findObject();
	}
	
	@Override
	public void updateHelp(Help help) throws HibernateException {
		helpDao.updateObject(help);
	}

	@Override
	public void deleteHelp(Help help) throws HibernateException {
		helpDao.deleteObject(help);
	}
	
}
