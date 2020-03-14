package com.lzs.gmsd.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lzs.gmsd.bean.Role;
import com.lzs.gmsd.bean.User;
import com.lzs.gmsd.bean.UserInfo;
import com.lzs.gmsd.service.iface.RoleService;
import com.lzs.gmsd.service.iface.UserInfoService;
import com.lzs.gmsd.service.iface.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private User user;
	private List users;
	private List roles;
	private UserInfo userInfo;
	private UserService userService;
	private UserInfoService userInfoService;
	private RoleService roleService;
	
	private Map<String, Object> jsonResult;

	private String nav;
	private String oldPwd;
	private String newPwd;
	
	// 处理用户登录
	public String login() {
		User us = userService.getUser(this.user);
		Map<String,Object> map = new HashMap<String,Object>();
		if (us != null) {
			if (us.getPassword().equals(this.user.getPassword())) {
				map.put("status", true);
				userService.userLogin(us);
			} else {
				map.put("status", false);
				map.put("msg", "密码错误");
			}
		} else {
			map.put("status", false);
			map.put("msg", "该账号不存在");
		}
		this.jsonResult = map;
		return "json";
	}
	
	//主页的显示
	public String index() {
		this.nav = "user-index";
		return this.SUCCESS;
	}
	
	//用户个人信息的显示
	public String info() {
		this.userInfo = userInfoService.getUserInfo(0);
		this.nav = "user-info";
		return this.SUCCESS;
	}
	
	//更新用户个人信息
	public String upinfo() {
		userInfoService.updateUserInfo(userInfo);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}
	
	//登录退出
	public String logout(){
		userService.userLogout();
		return this.SUCCESS;
	}
	
	//显示密码页面
	public String password(){
		this.nav = "user-password";
		return this.SUCCESS;
	}
	
	//修改密码操作
	public String changePwd(){
		User u = userService.getCurrentUser();
		System.out.println(u.getPassword());
		Map<String,Object> map = new HashMap<String,Object>();
		if (!u.getPassword().equals(oldPwd)){
			map.put("status", false);
			map.put("msg", "旧密码不正确");
		}else{
			u.setPassword(newPwd);
			userService.updateUser(u);
			map.put("status", true);
		}
		this.jsonResult = map;
		return "json";
	}
	
	//管理员模块用户列表
	public String lists() {
		List lists = this.userService.findUser();
		List roleLists = this.roleService.findRole();
		for (Object user : lists) {
			User u = (User) user;
			for (Object role : roleLists) {
				Role r = (Role) role;
				if (u.getRoleId() == r.getId()) {
					u.setRoleName(r.getName());
					break;
				}
			}
		}
		this.users = lists;
		this.roles = roleLists;
		this.nav = "user-lists";
		return this.SUCCESS;
	}
	
	//管理员删除用户
	public String delete() {
		UserInfo ui = userInfoService.getUserInfo(this.user.getAccount());
		userInfoService.deleteUserInfo(ui);
		userService.deleteUser(this.user);	
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}
	
	//管理员修改用户
	public String edit() {
		this.user.setIsDelete(1);
		userService.updateUser(this.user);
		UserInfo ui = userInfoService.getUserInfo(this.user.getAccount());
		ui.setName(this.user.getName());
		userInfoService.updateUserInfo(ui);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.jsonResult = map;
		return "json";
	}
	
	//管理员添加用户
	public String add() {
		this.user.setIsDelete(1);
		userService.saveUser(this.user);	
		UserInfo ui = new UserInfo();
		ui.setUserId(this.user.getAccount());
		ui.setIsDelete(1);
		ui.setName(this.user.getName());		
		userInfoService.saveUserInfo(ui);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", true);
		this.nav = "user-add";
		this.jsonResult = map;
		return "json";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public String getNav() {
		return nav;
	}

	public void setNav(String nav) {
		this.nav = nav;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public List getUsers() {
		return users;
	}

	public void setUsers(List users) {
		this.users = users;
	}

	public List getRoles() {
		return roles;
	}

	public void setRoles(List roles) {
		this.roles = roles;
	}
	
}
