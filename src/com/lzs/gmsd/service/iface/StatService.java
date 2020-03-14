package com.lzs.gmsd.service.iface;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.Stat;


public interface StatService {
	
	public int saveStat(Stat obj) throws HibernateException;
	
	public void updateStat(Stat obj) throws HibernateException;
	
	public List findStat() throws HibernateException;
	
	public Stat getStat(String date, int workerId) throws HibernateException;
	
	public List getSum(Date date) throws HibernateException;
	
	public List getSuminput(String sday, String eday) throws HibernateException;
	
}
