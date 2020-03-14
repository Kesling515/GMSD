package com.lzs.gmsd.service.iface;

import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.Help;

public interface HelpService {

	public int saveHelp(Help help) throws HibernateException;

	public List<Help> findHelp() throws HibernateException;

	public void updateHelp(Help help) throws HibernateException;

	public void deleteHelp(Help help) throws HibernateException;
	
}
