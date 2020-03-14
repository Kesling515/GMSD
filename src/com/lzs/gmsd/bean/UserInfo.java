package com.lzs.gmsd.bean;


public class UserInfo {

	private int id;
	private String name;
	private int userId;
	private int sex;
	private String mobile;
	private String email;
	private String dorm;
	private String stuclass; 
	private int isDelete;
	
	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"name\":\"" + name
				+ "\", \"userId\":\"" + userId + "\", \"sex\":\"" + sex
				+ "\", \"mobile\":\"" + mobile + "\", \"email\":\"" + email
				+ "\", \"dorm\":\"" + dorm + "\", \"stuclass\":\""
				+ stuclass + "\", \"isDelete\":\"" + isDelete + "\"}";
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDorm() {
		return dorm;
	}

	public void setDorm(String dorm) {
		this.dorm = dorm;
	}

	public String getStuclass() {
		return stuclass;
	}

	public void setStuclass(String stuclass) {
		this.stuclass = stuclass;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
		
}
