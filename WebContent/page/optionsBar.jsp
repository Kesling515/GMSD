<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>

	<div id="header">
		<h1></h1>		
	</div>
	
	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group" style="width: auto; margin: 5px;">
		    <li class="btn btn-inverse">
		    	<a href="user-info.action">
		    		<i class="icon icon-user"></i> 
		    		<span class="text"><s:property value='#session.userName' /></span>
		    	</a>
		    </li>
		    <li class="btn btn-inverse">
		    	<a href="logout.action">
		    		<i class="icon icon-share-alt"></i> <span class="text">退出登陆</span>
		    	</a>
		    </li>
		</ul>
	</div>  
	         
	<div id="sidebar">
		<ul>
			<li class="<s:if test='nav == "user-index"'>active</s:if>"><a href="user-index.action"><i class="icon icon-home"></i> <span>主页</span></a></li>
			<li class="<s:if test='nav == "user-info"'>active</s:if>"><a href="user-info.action"><i class="icon-heart"></i> <span>个人信息</span></a></li>
			<li class="<s:if test='nav == "user-password"'>active</s:if>"><a href="user-password.action"><i class="icon-lock"></i> <span>修改密码</span></a></li>
			
			<!-- 管理员权限菜单 -->
			<s:if test='#session.userRoleId == 1'>
				<li class="submenu <s:if test='nav == "user-lists"'>active</s:if>">
					<a href="#"><i class="icon-user icon-th-list"></i> <span>用户管理</span> </a>
					<ul>
						<li><a href="user-lists.action" >用户列表</a></li>
						<li><a id="wrap" href="useradd.jsp" >添加用户</a></li>
					</ul>
				</li>
				<li class="<s:if test='nav == "order-lists"'>active</s:if>"><a href="order-lists.action"><i class="icon-star-empty"></i> <span>报障单管理</span></a></li>
				<li class="<s:if test='nav == "help-lists"'>active</s:if>"><a href="help-lists.action"><i class=" icon-search"></i> <span>自助查询管理</span></a></li>
				<li class="submenu <s:if test='nav == "announcement-list"'>active</s:if>">
					<a href="#"><i class="icon-file"></i> <span>公告管理</span> </a>
					<ul>
						<li><a href="announcement-list.action">公告列表</a></li>
						<li><a href="announcementadd.jsp">更新公告</a></li>
					</ul>
				</li>
				<li class="<s:if test='nav == "stat-chart"'>active</s:if>"><a href="stat-chart"><i class="icon-indent-right"></i> <span>报表统计查询</span></a></li>
			</s:if>	
			
			<!-- 维修人员权限菜单 -->
			<s:if test='#session.userRoleId == 2'>
				<li class="<s:if test='nav == "order-worker"'>active</s:if>"><a href="order-worker.action"><i class="icon-file"></i> <span>我的维修单</span></a></li>
				<li class="<s:if test='nav == "announcement-show"'>active</s:if>"><a href="announcement-show.action"><i class="icon-bullhorn"></i> <span>公告通知</span></a></li>
			</s:if>
			
			<!-- 普通用户(学生)权限菜单 -->	
			<s:if test='#session.userRoleId == 3'>
				<li class="<s:if test='nav == "order-normal"'>active</s:if>"><a href="order-normal.action"><i class="icon-file"></i><span>我的报障单</span></a></li>
				<li class="<s:if test='nav == "help-lists"'>active</s:if>"><a href="help-lists.action"><i class="icon-star-empty"></i><span>自助查询</span></a></li>
				<li class="<s:if test='nav == "announcement-show"'>active</s:if>"><a href="announcement-show.action"><i class="icon-bullhorn"></i> <span>公告通知</span></a></li>
			</s:if>
			
		</ul>
	</div>