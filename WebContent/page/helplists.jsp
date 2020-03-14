<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
			<h1>自助查询</h1>
			<div class="btn-group">
				<s:if test='#session.userRoleId == 1'>
					<div class="buttons">
						<button type="button" class="add btn btn-success btn-sm" style="padding:7px 13px;">添加</button>
					</div>
				</s:if>
			</div>
		</div>
		
		<div id="breadcrumb">
			<a href="user-index.action" title="前往主页" class="tip-bottom"><i class="icon-home"></i> 主页</a>
			<a href="#" class="current">自助查询管理</a>
		</div>
		
		<!-- 主体部分 -->
		<div class="widget-box">
			
			<div class="widget-title">
				<span class="icon">
					<i class="icon-th"></i>
				</span>
				<h5>列表数据</h5>
			</div>
			
			<div class="widget-title">
			</div>
			
			<div class="widget-content nopadding">
				<table id="table" class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>故障类型</th>
							<th>问题</th>
							<th>解决方法</th>
							<s:if test='#session.userRoleId == 1'>
							<th>操作</th>
							</s:if>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="helps" id="hp">
							<tr>
								<td><s:property value='id'/></td>
								<td><s:property value='type'/></td>
								<td><s:property value='question'/></td>
								<td><s:property value='answer'/></td>
								<s:if test='#session.userRoleId == 1'>
								<td>
									<a class="btn btn-info btn-xs edit" data-info="<s:property value='#hp.toString()'/>"><i class="icon-pencil icon-white"></i> 修改</a>&nbsp;&nbsp;&nbsp;
									<a class="delete btn btn-danger btn-xs" data-info="<s:property value='#hp.toString()'/>"><i class="icon-remove icon-white" ></i> 删除</a>
								</td>
								</s:if>
							</tr>
						</s:iterator>
					</tbody>
				</table>							
			</div>
			
		</div>

		
		<!-- 管理员添加或者修改自助查询信息窗口 -->
		<div class="modal fade" id="form" tabindex="-1" role="dialog">  
		    <div class="modal-dialog" role="document">  
		        <div class="modal-content">  
		            <div class="modal-header">  
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
		                <h4 class="modal-title">编辑内容</h4>  
		            </div>  
		            <div class="modal-body">  
		                 <form>
		                 	<div class="form-group msg alert alert-danger" style="text-align:center;font-size:20px;font-weight:bold;">
							</div>
							<div class="form-group">
								<label for="id" class="col-sm-2 control-label">ID :</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="id" style="width:97%;height:auto;" placeholder="ID" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="type" class="col-sm-2 control-label">故障类型 :</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" style="width:97%;height:auto;" id="type" placeholder="请输入故障类型">
								</div>
							</div>
							<div class="form-group">
								<label for="question" class="col-sm-2 control-label">问题 :</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="question" style="width:97%;height:auto;" placeholder="请输入问题">
								</div>
							</div>
							<div class="form-group">
								<label for="answer" class="col-sm-2 control-label">解决方法 :</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="answer" style="width:97%;height:auto;" placeholder="请输入解决方法">
								</div>
							</div>							
						</form>
		            </div>  
		            <div class="modal-footer">  
		                <button type="button" class="btn btn-danger" data-dismiss="modal">取    消</button>
						<button type="button" class="btn btn-primary" id="form-submit">确    定</button> 
		            </div>  
		        </div>  
		    </div>  
		</div> 
		
		<!-- 删除确认弹窗 -->
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
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="tips-submit">确定</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row-fluid">
			<div id="footer" class="span12" style="margin-top:10px;" >
				2019 @学生宿舍维修管理系统. <a href="http://www.gdpu.edu.cn/">广东药科大学.</a> 药学中西，医道济世！
			</div>
		</div>
		
	</div>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!--  <script src="js/jquery.uniform.js"></script> -->
	<script src="js/jquery.validate.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/helplists.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/config.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/unicorn.form_validation.js"></script>

</body>
</html>