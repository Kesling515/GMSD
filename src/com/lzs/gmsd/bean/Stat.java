package com.lzs.gmsd.bean;

public class Stat {

	private int id;
	private int value;
	private int workerId;
	private String date;
	
	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"value\":\"" + value + "\", \"workerId\":\"" + workerId + "\", \"date\":\"" + date
				+ "\"}";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public int getWorkerId() {
		return workerId;
	}

	public void setWorkerId(int workerId) {
		this.workerId = workerId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
