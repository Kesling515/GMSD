package com.lzs.gmsd.bean;

public class Announcement {

	private int id;
	private String announcer;
	private String content;
	private String contime;
	
	
	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"announcer\":\"" + announcer
				+ "\", \"content\":\"" + content + "\", \"contime\":\""
				+ contime + "\"}";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAnnouncer() {
		return announcer;
	}

	public void setAnnouncer(String announcer) {
		this.announcer = announcer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContime() {
		return contime;
	}

	public void setContime(String contime) {
		this.contime = contime;
	}
		
}
