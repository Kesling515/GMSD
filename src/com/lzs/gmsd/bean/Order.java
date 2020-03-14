package com.lzs.gmsd.bean;

import java.util.Date;

public class Order {
	
	private String orderNo; //维修单号
	private Date createTime; //申请时间
	private int state; //状态
	private Date assignTime; //指派时间
	private Date finishTime; //完成时间
	
	private OrderType orderType; //维修单类型
	private String stateText; 
	private UserInfo creater; //申请人
	private UserInfo repairer; //维修人
	private OrderDetail detail; //维修单详情
	
	@Override
	public String toString() {
		return "{\"orderNo\":\"" + orderNo
				+ "\", \"createTime\":\"" + createTime + "\", \"state\":\""
				+ state + "\", \"assignTime\":\"" + assignTime
				+ "\", \"finishTime\":\"" + finishTime
				+ "\", \"orderType\":" + orderType + ", \"stateText\":\""
				+ stateText + "\", \"creater\":" + creater
				+ ", \"repairer\":" + repairer + ", \"detail\":"
				+ detail + "}";
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getAssignTime() {
		return assignTime;
	}

	public void setAssignTime(Date assignTime) {
		this.assignTime = assignTime;
	}

	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	public OrderType getOrderType() {
		return orderType;
	}

	public void setOrderType(OrderType orderType) {
		this.orderType = orderType;
	}

	public String getStateText() {
		return stateText;
	}

	public void setStateText(String stateText) {
		this.stateText = stateText;
	}

	public UserInfo getCreater() {
		return creater;
	}

	public void setCreater(UserInfo creater) {
		this.creater = creater;
	}

	public UserInfo getRepairer() {
		return repairer;
	}

	public void setRepairer(UserInfo repairer) {
		this.repairer = repairer;
	}

	public OrderDetail getDetail() {
		return detail;
	}

	public void setDetail(OrderDetail detail) {
		this.detail = detail;
	}
	
}
