<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>学生宿舍维修管理系统</title>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="css/uniform.css" />	
	<link rel="stylesheet" href="css/unicorn.main.css" />
	<link rel="stylesheet" href="css/select2.min.css" />
	<link rel="stylesheet" href="css/unicorn.blue.css" class="skin-color" />
	<link rel="icon" href="img/logo1.png" />	
	<link rel="stylesheet" href="css/jquery.dataTables.min.css" />
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
		<div id="content-header">
			<h1>用户列表</h1>
			<div class="btn-group">
			</div>
		</div>
		
		<div id="breadcrumb">
			<a href="user-index.action" title="前往主页" class="tip-bottom"><i class="icon-home"></i> 主页</a>
			<a href="#" >公告管理</a>
			<a href="#" class="current">公告列表</a>
		</div>
		
		<!-- 主体部分 -->
		<div class="widget-box">
			
			<div class="widget-title">
				<span class="icon">
					<i class="icon-th"></i>
				</span>
				<h5>公告列表</h5>
			</div>
			
			<div class="widget-title">
			</div>
			
			<div class="widget-content nopadding">
				<table id="table" class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>内 容</th>
							<th>更新时间</th>
							<th>更新作者</th>
							<th>操 作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="announcements" id="as">
							<tr>
								<td id="table-td" style="width:70%;"><s:property value="content"/></td>
								<td id="table-td"><s:property value="contime"/></td>
								<td id="table-td"><s:property value="announcer"/></td>
								<td id="table-td">
									<a class="btn btn-danger delete" data-info="<s:property value='#as.toString()'/>"><i class="icon-remove icon-white" ></i> 删除</a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>							
			</div>
			
		</div>
		
		<!-- 删除用户确认弹窗 -->
		<div class="modal fade" id="tips" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">消息提示</h4>
					</div>
					<div class="modal-body">
						<p id="msg"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="tips-submit">确定</button>
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
	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/announcementlist.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/config.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/unicorn.form_validation.js"></script>
	
</body>
</html>