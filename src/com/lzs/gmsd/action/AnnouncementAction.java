package com.lzs.gmsd.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.lzs.gmsd.bean.Announcement;
import com.lzs.gmsd.service.iface.AnnouncementService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AnnouncementAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private AnnouncementService announcementService;
	private Announcement announcement;
	private List announcements;
	private Map<String, Object> jsonResult;
	private String nav;
	
	//公告列表显示--管理员
	public String announcementlist() {
		List lists = this.announcementService.findAnnouncement();
		for(Object announcement : lists){
			Announcement a = (Announcement) announcement;
		}
		this.announcements = lists;
		this.nav = "announcement-list";
		return this.SUCCESS;
	}
	
	//管理员删除公告	
	public String announcementDelete(){
		System.out.print(this.announcement);
		announcementService.deleteAnnouncement(this.announcement);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";	
	}
	
	//管理员添加公告信息
	public String announcementAdd(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String content = request.getParameter("content1");
		String announcer = ActionContext.getContext().getSession().get("userName").toString();
		
		Announcement am = new Announcement();
		am.setContent(content);
		am.setAnnouncer(announcer);
		
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		am.setContime(dateFormat.format(now));
		
		announcementService.saveAnnouncement(am);
		this.nav = "announcement-list";
		return this.SUCCESS;
	}
	
	//非管理员人员查看公告
	public String announcementShow() {
		List lists = this.announcementService.findAnnouncement();
		for(Object announcement : lists){
			Announcement a = (Announcement) announcement;
		}
		this.announcements = lists;
		this.nav = "announcement-show";
		return this.SUCCESS;
	}
		
	public AnnouncementService getAnnouncementService() {
		return announcementService;
	}
	
	public void setAnnouncementService(AnnouncementService announcementService) {
		this.announcementService = announcementService;
	}
	
	public Announcement getAnnouncement() {
		return announcement;
	}
	
	public void setAnnouncement(Announcement announcement) {
		this.announcement = announcement;
	}
	
	public Map<String, Object> getJsonResult() {
		return jsonResult;
	}
	
	public void setJsonResult(Map<String, Object> jsonResult) {
		this.jsonResult = jsonResult;
	}
	
	public String getNav() {
		return nav;
	}
	
	public void setNav(String nav) {
		this.nav = nav;
	}

	public List getAnnouncements() {
		return announcements;
	}

	public void setAnnouncements(List announcements) {
		this.announcements = announcements;
	}	
}
