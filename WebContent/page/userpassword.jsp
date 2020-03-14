<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>学生宿舍维修管理系统</title>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
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
	
	<!-- 主体部分 -->
	<div id="content" style="height:600px;">
		<div id="content-header">
			<h1>修改密码</h1>
		</div>
		<div id="breadcrumb">
			<a href="user-index.action" title="前往主页" class="tip-bottom"><i class="icon-home"></i> 主页</a>
			<a href="#">修改密码</a>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-group msg alert alert-danger" style="text-align:center;font-size:20px;font-weight:bold;">
					</div>
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon">
								<i class="icon-pencil"></i>
							</span>
							<h5>进行密码修改</h5>
						</div>
						<div class="widget-content nopadding">
							<form id="form" class="form-horizontal" data-info="<s:property value='user.toString()'/>">
								<div id="form-wizard-1">
									<div class="control-group">
										<label class="control-label" for="oldPassword">旧密码</label>
										<div class="controls">
											<input type="password" style="height: 27px;" class="form-control" id="oldPassword" placeholder="请输入旧的密码" />
										</div>
									</div>
										<div class="control-group">
										<label for="newPassword" class="control-label">新密码</label>
										<div class="controls">
											<input type="password" style="height: 27px;" class="form-control" id="newPassword" placeholder="请输入新的密码" />
											<span class="help-block">注意：新密码不可与旧密码相同</span>
										</div>
									</div>
									<div class="control-group">
										<label for="renewPassword" class="control-label">再次确认</label>
										<div class="controls">
											<input type="password" style="height: 27px;" class="form-control" id="renewPassword" placeholder="请再次输入新的密码"/>
										</div>
									</div>									
								</div>
								<div class="form-actions">
									<input class="btn btn-primary" type="reset" value="重置" />&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="submit btn btn-success" type="button" value="修改" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row-fluid">
				<div id="footer" class="span12" style="position:absolute;bottom:20px;">
					2019 @学生宿舍维修管理系统. <a href="http://www.gdpu.edu.cn/">广东药科大学.</a> 药学中西，医道济世！
				</div>
			</div>		
		</div>
	</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/jquery.wizard.js"></script>
    <script src="js/unicorn.js"></script>
    <script src="js/unicorn.wizard.js"></script>
    <script src="js/userpassword.js"></script>
</body>
</html>
