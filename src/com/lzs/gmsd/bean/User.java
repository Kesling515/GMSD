package com.lzs.gmsd.bean;

public class User {

	private int account;  // 账号
	private String name;  // 用户名字
	private String password;  // 密码
	private int roleId; 
	
	private String roleName;
	private int isDelete;
	
	
	@Override
	public String toString() {
		return "{\"account\":\"" + account
				+ "\", \"name\":\"" + name + "\", \"password\":\"" + password
				+ "\", \"roleId\":\"" + roleId + "\", \"roleName\":\""
				+ roleName + "\", \"isDelete\":\"" + isDelete + "\"}";
	}

	
	
	public int getAccount() {
		return account;
	}

	public void setAccount(int account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	
}
