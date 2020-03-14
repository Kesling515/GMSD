package com.lzs.gmsd.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;

import com.lzs.gmsd.bean.Stat;
import com.lzs.gmsd.dao.iface.BaseDao;
import com.lzs.gmsd.service.iface.StatService;

public class StatServiceImpl implements StatService {

	private BaseDao statDao;
	
	@Override
	public List findStat() throws HibernateException {
		return statDao.findObject();
	}
	
	@Override
	public int saveStat(Stat obj) throws HibernateException {
		return (int) statDao.saveObject(obj);
	}

	@Override
	public void updateStat(Stat obj) throws HibernateException {
		statDao.updateObject(obj);		
	}
	
	@Override
	public Stat getStat(String date, int workerId) throws HibernateException {
		List lists = statDao.getObject(new Object[] { date, workerId });
		if (lists.size() != 0) {
			return (Stat) lists.get(0);
		}
		return null;
	}
	
	
	//获取统计数据
	@Override
	public List getSum(Date date) throws HibernateException {
		String aDate = "";
		String bDate = "";
		if (date != null) {
			aDate = this.formatDate(date);
			bDate = this.getNextDay(date);
		} else {
			aDate = this.getYesterday();
			bDate = this.getToday();
		}
		System.out.println("aDate:" + aDate);
		System.out.println("bDate:" + bDate);
		String sql = "SELECT ui.id AS id, COUNT(o.order_no) AS total FROM user_info ui LEFT JOIN order_main o ON (ui.id = o.repairer_id AND (o.finish_time BETWEEN '" 
					+ aDate + "' AND '" + bDate
					+ "')) WHERE ui.user_id in (SELECT u.account from user_main u WHERE u.role_id = 2) GROUP BY ui.id;";
		System.out.println("SQL:" + sql);
		List list = statDao.executeSQL(sql);
		return list;
	}
	
	//获取一段时间的统计数据
	@Override
	public List getSuminput(String sday,String eday) throws HibernateException {
		String aDate = sday;
		String bDate = eday;
		System.out.println("aDate:" + aDate);
		System.out.println("bDate:" + bDate);
		String sql = "SELECT ui.id AS id, ui.name As name, COUNT(o.order_no) AS total FROM user_info ui LEFT JOIN order_main o ON (ui.id = o.repairer_id AND (o.finish_time BETWEEN '" 
					+ aDate + "' AND '" + bDate
					+ "')) WHERE ui.user_id in (SELECT u.account from user_main u WHERE u.role_id = 2) GROUP BY ui.id;";
		System.out.println("SQL:" + sql);
		List list = statDao.executeSQL(sql);
		return list;
	}

	private String formatDate (Date date) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(date);
	}
	
	private String getNextDay (Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		return this.formatDate(cal.getTime());
	}
	
	private String getToday () {
		Calendar cal = Calendar.getInstance();
		return this.formatDate(cal.getTime());
	}
	
	private String getYesterday () {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
	    return this.formatDate(cal.getTime());
	}
	
	public void setStatDao(BaseDao statDao) {
		this.statDao = statDao;
	}
	
}
