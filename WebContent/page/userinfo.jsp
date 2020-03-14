<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
	
	<div id="content" style="height:620px;">
		<div id="content-header">
			<h1>个人信息</h1>
		</div>
		<div id="breadcrumb">
			<a href="user-index.action" title="前往主页" class="tip-bottom"><i class="icon-home"></i> 主页</a>
			<a href="#">个人信息</a>
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
							<h5>个人信息</h5>
						</div>
						<div class="widget-content nopadding">
							<form id="form" class="form-horizontal" data-info="<s:property value='userInfo.toString()'/>" >
								<div id="form-wizard-1 form-horizontal" class="step">
									<div class="control-group">
										<label for="stuclass" class="control-label">班级</label>
										<div class="controls">
											<input type="text" style="width:80%;border-radius:4px;height:32px;-webkit-border-radius:4px;" class="ui-wizard-content" id="stuclass">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">宿舍号 / 办公室</label>
										<div for="dorm" class="controls">
											<input type="text" style="width:80%;border-radius:4px;height:32px;-webkit-border-radius:4px;" class="ui-wizard-content" id="dorm" >
											<span class="help-block">注意：请务必填写正确宿舍号或者办公室</span>
										</div>
									</div>
									<div class="control-group">
										<label for="mobile" class="control-label">联系电话</label>
										<div class="controls">
											<input type="text" style="width:80%;border-radius:4px;height:32px;-webkit-border-radius:4px;" class="ui-wizard-content" id="mobile">
										</div>
									</div>
									<div class="control-group">
										<label for="email" class="control-label">邮箱</label>
										<div class="controls">
											<input type="text" style="width:80%;border-radius:4px;height:32px;-webkit-border-radius:4px;" class="ui-wizard-content" id="email">
										</div>
									</div>
									<div class="control-group">
										<label for="sex" class="control-label">性别</label>
										<div class="controls">
											<label class="radio-inline">
												<input type="radio" name="sex" value="1"> 男    &nbsp; &nbsp; &nbsp;
												<input type="radio" name="sex" value="0"> 女
											</label>
										</div>
									</div>
								</div>

								<div class="form-actions">
									<input id="next" type="button" class="btn btn-success submit" style="width:90px;" value="保    存" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row-fluid">
				<div id="footer" class="span12" style="margin-top:10px;">
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
	<script src="js/userinfo.js"></script>
</body>
</html>

