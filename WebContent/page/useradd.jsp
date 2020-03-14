<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html lang="en">
<head>
	<title>学生宿舍维修管理系统</title>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="css/uniform.css" />		
	<link rel="stylesheet" href="css/unicorn.main.css" />
	<link rel="stylesheet" href="css/unicorn.blue.css" class="skin-color" />
	<link rel="icon" href="img/logo1.png" />	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<!-- 左侧菜单 -->
	<%@ include file="optionsBar.jsp" %>
	
	<!-- 界面颜色修改 -->
	<div id="style-switcher">
		<i class="icon-arrow-left icon-white"></i>
		<span>界面颜色:</span>
		<a href="#grey" style="background-color: #555555;border-color: #aaaaaa;"></a>
		<a href="#blue" style="background-color: #2D2F57;"></a>
		<a href="#red" style="background-color: #673232;"></a>
	</div>
	
	<div id="content" style="height:600px;">
		<div id="content-header">
			<h1>添加用户</h1>
			<div class="btn-group">
			</div>
		</div>
		
		<div id="breadcrumb">
			<a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
			<a href="#">用户管理</a>
			<a href="#" class="current">添加用户</a>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="msg alert alert-danger" style="text-align:center;font-size:20px;font-weight:bold;">
					</div>
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon">
								<i class="icon-pencil"></i>
							</span>
							<h5>添加用户</h5>
						</div>
						<div class="widget-content nopadding">
							<form id="form-wizard" class="form-horizontal">
								<div id="form-wizard-1">
									<div class="control-group">
										<label class="control-label">账号</label>
										<div class="controls">
											<input id="account" type="text" style="height:30px;" placeholder="请输入新用户账号" />
										</div>
									</div>
										<div class="control-group">
										<label class="control-label">密码</label>
										<div class="controls">
											<input id="password" type="password" style="height:30px;" placeholder="请输入新用户密码" />
										</div>
									</div>
								
									<div class="control-group">
										<label class="control-label">用户姓名</label>
										<div class="controls">
											<input id="name" type="text" style="height:30px;" placeholder="请输入新用户姓名" />
											<span class="help-block">请务必填写该用户的真实姓名</span>
										</div>
									</div>
									<div class="control-group">
										<label for="role" class="col-sm-2 control-label">角色:</label>
										<div class="controls col-sm-9">
											<input type="radio" name="role" value="1"/> &nbsp;管理员 &nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="role" value="2"/> &nbsp;维修人员&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="role" value="3"/> &nbsp;学生&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
									</div>
									
								</div>
								<div class="form-actions">
									<input class="btn btn-primary" type="reset" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="btn btn-success" type="button" id="form-submit" value="提交" />
								</div>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="row-fluid" style="margin-top:60px;">
			<div id="footer" class="span12">
				2019 @学生宿舍维修管理系统. <a href="http://www.gdpu.edu.cn/">广东药科大学.</a> 药学中西，医道济世！
			</div>
		</div>
		
	</div>
	 
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/jquery.wizard.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/useradd.js"></script>
	
</body>
</html>
