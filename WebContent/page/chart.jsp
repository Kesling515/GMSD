<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	
	<!-- 主体内容 -->
	<div id="content">
		<div id="content-header">
			<h1>图表统计查看</h1>
		</div>
		<div id="breadcrumb">
			<a href="user-index.action" title="前往主页" class="tip-bottom"><i class="icon-home"></i> 主页</a>
			<a href="#" title="图表统计查看" class="tip-bottom" id="chart-data"
			 			data-workers="<s:property value='workers.toString()'/>" 
						data-infos="<s:property value='infoList.toString()'/>" 
						data-stats="<s:property value='statList.toString()'/>" 
						>图表统计查看</a>
		</div>
		
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon">
								<i class="icon-signal"></i>
							</span>
							<h5>图表</h5>
							<div class="buttons">
								<a href="stat-updatetoday" class="btn btn-mini" id="updatetoday"><i class="icon-refresh"></i> &nbsp;刷新统计</a>
							</div>
						</div>
						
						<div class="widget-content">
							<div class="row-fluid">
								<div class="span4">
									<ul class="site-stats">
										<form>
											<li>
												<input type="text" style="width:30%;margin:auto" class="Wdate" name="sday" id="sday" onFocus="WdatePicker({lang:'zh-cn'})" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/>
												<small>至 &nbsp; </small>
												<input type="text" style="width:30%;margin:auto" class="Wdate" name="eday" id="eday" onFocus="WdatePicker({lang:'zh-cn'})" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/> &nbsp; &nbsp;
												<input type="button" id="statinputs" class="btn btn-success" value="统计" >
											</li>
										</form>
										<li class="divider"></li>
										<li id="chart-bar1"><i class="icon-tasks"></i> &nbsp; &nbsp; &nbsp; &nbsp; <strong>柱状图</strong></li>
										<li id="chart-bar2"><i class="icon-tasks"></i> &nbsp; &nbsp; &nbsp; &nbsp; <strong>饼图</strong></li>
									</ul>
								</div>
								<div class="span8">
									<div id="chart"></div>
								</div>	
							</div>							
						</div>
					</div>
				</div>
			</div>
			
			<div class="row-fluid">
				<div id="footer" class="span12">
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
	<script src="js/echarts.min.js"></script>
	<script src="js/chart.js"></script>
	<script src="My97DatePicker/WdatePicker.js"></script>

</body>
</html>