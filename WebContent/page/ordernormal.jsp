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
	<link rel="stylesheet" href="css/uniform.css" />
	<link rel="stylesheet" href="css/select2.min.css" />		
	<link rel="stylesheet" href="css/unicorn.main.css" />
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
			<h1>我的报障单</h1>
			<div class="btn-group buttons">
				<button type="button" class="add btn btn-success btn-sm" style="padding:7px 13px;">报     障</button>
			</div>
		</div>
		
		<div id="breadcrumb">
			<a href="user-index.action" title="前往主页" class="tip-bottom"><i class="icon-home"></i> 主页</a>
			<a href="#" class="current">我的报障单</a>
		</div>
		
		<!-- 主体内容 -->
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
				<table id="table" class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>单号</th>
							<th>报障时间</th>
							<th>状态</th>
							<th>指派时间</th>
							<th>完成时间</th>
							<th>类型</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="orders" id="o">
							<tr>
								<td id="table-td"><a class="detail" href="javascript:;" data-info="<s:property value='#o.toString()'/>"><s:property value='orderNo'/></a></td>
								<td id="table-td"><s:date name="createTime" format="yyyy-MM-dd HH:mm:ss" /></td>
								<td id="table-td"><s:property value='stateText'/></td>
								<td id="table-td"><s:date name="assignTime" format="yyyy-MM-dd HH:mm:ss" /></td>
								<td id="table-td"><s:date name="finishTime" format="yyyy-MM-dd HH:mm:ss" /></td>
								<td id="table-td"><s:property value='orderType.name'/></td>
								<td id="table-td">
									<s:if test="#o.state == 3">
									<button type="button" class="evaluation btn btn-primary btn-xs" data-info="<s:property value='#o.toString()'/>">评 价</button>
									</s:if>
									<s:if test="#o.state >= 4">
										结 束
									</s:if>
									<s:if test="#o.state <= 2">
										<button type="button" class="cancel btn btn-danger btn-xs" data-info="<s:property value='#o.toString()'/>">取 消</button>
									</s:if>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>							
			</div>
		</div>
		
		<!-- 评价窗口 -->
		<div class="modal fade" id="evaluation" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" style="font-weight:600;">评   价</h4>
					</div>
					<div class="modal-body" >
						<form>
							<div class="form-group msg alert alert-danger" style="text-align:center;font-size:20px;font-weight:bold;">
							</div>
							<div class="form-group">
								<label for="comment" class="col-sm-2 control-label">评论内容：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" style="width:97%;height:auto;" id="comment" placeholder="请输入评论内容">
								</div>
							</div>					
							<div class="form-group">
								<label for="score" class="col-sm-2 control-label">维修评分：</label>
								<div class="col-sm-9" style="margin-left:60px;">
									<label class="radio-inline">
										<input type="radio" name="score" value="1"> 1分
									</label>
									<label class="radio-inline">
										<input type="radio" name="score" value="2"> 2分
									</label>
									<label class="radio-inline">
										<input type="radio" name="score" value="3"> 3分
									</label>
									<label class="radio-inline">
										<input type="radio" name="score" value="4"> 4分
									</label>
									<label class="radio-inline">
										<input type="radio" name="score" value="5"> 5分
									</label>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="evaluation-submit">确定</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 报障信息填写窗口 -->
		<div class="modal fade" id="form" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" style="font-weight:600;">填写报障信息</h4>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group msg alert alert-danger" style="text-align:center;font-size:20px;font-weight:bold;">
							</div>
							<div class="form-group">
								<label for="mobile" class="col-sm-2 control-label">手机号码：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" style="width:97%;height:auto;" id="mobile" placeholder="请输入手机号码">
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label">宿舍号：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" style="width:97%;height:auto;" id="address" placeholder="请输入宿舍号">
								</div>
							</div>
							<div class="form-group">
								<label for="fault" class="col-sm-2 control-label">故障描述：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" style="width:97%;height:auto;" id="fault" placeholder="请输入故障描述" >
								</div>
							</div>
							<div class="form-group">
								<label for="indoortime" class="col-sm-2 control-label">在宿舍时间段：</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" style="width:97%;height:auto;" id="indoortime" placeholder="请输入你在宿舍的时间" >
								</div>
							</div>							
							<div class="form-group">
								<label for="type" class="col-sm-2 control-label">报障类型：</label>
								<div class="col-sm-9" style="margin-left:60px;">
									<s:iterator value="types" id="tp" >
									<label>
										<input type="radio" name="type" value="<s:property value='id'/>"> <s:property value='name'/>
									</label>
									</s:iterator>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="form-submit">确定</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 点击单号，查看详情 -->
		<div class="modal fade" id="detail" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" style="font-weight:600;">报障单详细信息</h4>
					</div>
					<div class="modal-body">
						<dl class="dl-horizontal">
							<dt>报障人：</dt><dd class="creater"></dd>
							<dt>联系电话：</dt><dd class="mobile"></dd>
							<dt>地址：</dt><dd class="address"></dd>
							<dt>故障描述：</dt><dd class="faultDesc"></dd>
							<dt>维修人：</dt><dd class="repairer"></dd>
							<dt>维修描述：</dt><dd class="repairDesc"></dd>
							<dt>评价：</dt><dd class="comment"></dd>
							<dt>评分：</dt><dd class="score"></dd>
						</dl>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 删除维修单确认窗口 -->
		<div class="modal fade" id="tips" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" style="font-weight:600;">消息提示</h4>
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
			<div id="footer" class="span12">
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
	<script src="js/ordernormal.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/config.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/unicorn.form_validation.js"></script>

</body>
</html>