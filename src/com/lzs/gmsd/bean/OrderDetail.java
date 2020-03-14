package com.lzs.gmsd.bean;

public class OrderDetail {

	private int id; //编号
	private String faultDesc; //故障描述
	private String indoorTime; //建议上门保修时间描述
	private String address; //地址宿舍号
	private String mobile; //联系电话
	private String repairDesc; //维修后描述
	private String comment; //评价
	private int score; //分数
	
	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"faultDesc\":\"" + faultDesc + "\",\"indoorTime\":\"" + indoorTime + "\", \"address\":\"" + address
				+ "\", \"mobile\":\"" + mobile + "\", \"repairDesc\":\"" + repairDesc + "\", \"comment\":\"" + comment
				+ "\", \"score\":\"" + score + "\"}";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFaultDesc() {
		return faultDesc;
	}

	public void setFaultDesc(String faultDesc) {
		this.faultDesc = faultDesc;
	}

	public String getIndoorTime() {
		return indoorTime;
	}

	public void setIndoorTime(String indoorTime) {
		this.indoorTime = indoorTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getRepairDesc() {
		return repairDesc;
	}

	public void setRepairDesc(String repairDesc) {
		this.repairDesc = repairDesc;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
}
