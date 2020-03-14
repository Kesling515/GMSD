<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"  %>
<html lang="en">
<head>
	<title>学生宿舍维修管理系统</title>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="css/fullcalendar.css" />	
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
	
	<div id="content">
		<div id="content-header" style="height:45px;">
			<h1>广东药科大学</h1>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box index-box">
							<div class="index-box1">
								欢迎进入学生宿舍维修管理系统 !
							</div>
					</div>					
				</div>
			</div>
			
			<div class="row-fluid">
				<div id="footer" class="span12" style="margin-top:30px;">
					2019 @学生宿舍维修管理系统. <a href="http://www.gdpu.edu.cn/">广东药科大学.</a> 药学中西，医道济世！
				</div>
			</div>
			
		</div>
	</div>
	
    <script src="js/excanvas.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.flot.min.js"></script>
    <script src="js/jquery.flot.resize.min.js"></script>
    <script src="js/jquery.peity.min.js"></script>
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/unicorn.js"></script>
    <script src="js/unicorn.dashboard.js"></script>
</body>
</html>
