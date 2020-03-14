package com.lzs.gmsd.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.lzs.gmsd.bean.Stat;
import com.lzs.gmsd.service.iface.StatService;
import com.lzs.gmsd.service.iface.UserInfoService;
import com.lzs.gmsd.service.iface.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class StatAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private String nav;
	private Date date;
	private List workers;
	private List infoList;
	private List statList;
	private List statinputs;
	
	private StatService statService;
	private UserService userService;
	private UserInfoService userInfoService;
	private Map<String, Object> jsonResult;
	
	
	public String run () {
		List list = statService.getSum(this.date);
		String tDate = this.date != null ? this.formatDate(this.date) : this.getYesterday();
		for(Iterator iterator = list.iterator(); iterator.hasNext();){  
			Object[] obj = (Object[]) iterator.next();
			int workerId = ((Number) obj[0]).intValue();
			int total = ((Number) obj[1]).intValue();
			Stat ns = statService.getStat(tDate, workerId);
			System.out.println("查询" + ns);
			if (ns != null) {
				ns.setValue(total);
				statService.updateStat(ns);
				System.out.println("更新" + ns);
			} else {
				Stat s = new Stat();
				s.setWorkerId(workerId);
				s.setDate(tDate);
				s.setValue(total);
				statService.saveStat(s);
				System.out.println("新增" + s);
			}
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}
	
	public String chart () {
		this.statList = statService.findStat();
		this.infoList = userInfoService.findUserInfo();
		this.workers = userService.getWorker();	
		this.nav = "stat-chart";
		return this.SUCCESS;
	}
	
	//更新最新一天统计
	public String updatetoday () {
		List list = statService.getSum(this.date);
		String tDate = this.date != null ? this.formatDate(this.date) : this.getYesterday();
		for(Iterator iterator = list.iterator(); iterator.hasNext();){  
			Object[] obj = (Object[]) iterator.next();
			int workerId = ((Number) obj[0]).intValue();
			int total = ((Number) obj[1]).intValue();
			Stat ns = statService.getStat(tDate, workerId);
			System.out.println("查询" + ns);
			if (ns != null) {
				ns.setValue(total);
				statService.updateStat(ns);
				System.out.println("更新" + ns);
			} else {
				Stat s = new Stat();
				s.setWorkerId(workerId);
				s.setDate(tDate);
				s.setValue(total);
				statService.saveStat(s);
				System.out.println("新增" + s);
			}
		}
		return this.SUCCESS;
	}
	
	//统计页面输入的时间段
	/*public String inputs() {
		
		List list = statService.getSuminput(sday,eday);
		System.out.println(list);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("data", list);
		this.jsonResult = map;
		return "json";	
	}*/
	
	private String formatDate (Date date) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(date);
	}
	
	private String getYesterday () {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
	    return this.formatDate(cal.getTime());
	}
	
	public String getNav() {
		return nav;
	}
	
	public void setNav(String nav) {
		this.nav = nav;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public List getWorkers() {
		return workers;
	}
	
	public void setWorkers(List workers) {
		this.workers = workers;
	}
	
	public List getInfoList() {
		return infoList;
	}
	
	public void setInfoList(List infoList) {
		this.infoList = infoList;
	}
	
	public List getStatList() {
		return statList;
	}
	
	public void setStatList(List statList) {
		this.statList = statList;
	}
	
	public StatService getStatService() {
		return statService;
	}
	
	public void setStatService(StatService statService) {
		this.statService = statService;
	}
	
	public UserService getUserService() {
		return userService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public UserInfoService getUserInfoService() {
		return userInfoService;
	}
	
	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}
	
	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}
	
	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}

	public List getStatinputs() {
		return statinputs;
	}

	public void setStatinputs(List statinputs) {
		this.statinputs = statinputs;
	}

	
	
}
