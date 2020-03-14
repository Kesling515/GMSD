package com.lzs.gmsd.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lzs.gmsd.bean.Help;
import com.lzs.gmsd.service.iface.HelpService;
import com.opensymphony.xwork2.ActionSupport;

public class HelpAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	private String nav;
	private Help help;
	private List helps;
	private HelpService helpService;
	private Map<String, Object> jsonResult;
	
	//自助查询列表显示
	public String helplists() {
		List lists = this.helpService.findHelp();
		for(Object help : lists){
			Help h = (Help) help;
		}
		
		this.helps = lists;
		this.nav = "help-lists";
		return this.SUCCESS;
	}
	
	//管理员添加自主查询信息
	public String helpAdd(){
		int id = helpService.saveHelp(this.help);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";	
	}
	
	//管理员修改自主查询信息
	public String helpEdit(){
		helpService.updateHelp(this.help);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";	
	}
	
	//管理员删除自主查询信息	
	public String helpDelete(){
		System.out.print(this.help);
		helpService.deleteHelp(this.help);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";	
	}
	
	
	public String getNav() {
		return nav;
	}
	
	public void setNav(String nav) {
		this.nav = nav;
	}
	
	public Help getHelp() {
		return help;
	}
	
	public void setHelp(Help help) {
		this.help = help;
	}
	
	public List getHelps() {
		return helps;
	}
	
	public void setHelps(List helps) {
		this.helps = helps;
	}
	
	public HelpService getHelpService() {
		return helpService;
	}
	
	public void setHelpService(HelpService helpService) {
		this.helpService = helpService;
	}
	
	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}
	
	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}
	
}
