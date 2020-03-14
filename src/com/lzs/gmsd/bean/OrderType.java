package com.lzs.gmsd.bean;

public class OrderType {

	private int id; //编号
	private String name; //类型
	private int autoDispat; //是否自动指派
	
	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"name\":\"" + name + "\", \"autoDispat\":\"" + autoDispat + "\"}";
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

	public int getAutoDispat() {
		return autoDispat;
	}

	public void setAutoDispat(int autoDispat) {
		this.autoDispat = autoDispat;
	}

}
