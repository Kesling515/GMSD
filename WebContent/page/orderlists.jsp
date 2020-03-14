<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<script type="text/javascript"> 
		$("#assign").on("shown.bs.modal", function(){
			$("#worker").select2();
		})
	 </script>
	<style>
		.order-sum {
			margin-top: 10px;
			margin-bottom: -10px;
			text-align: center;
			display: flex;
		}
		.order-sum > div {
			flex: 1;
		}
		.order-sum .text-large {
			font-size: 24px;
		}
		.order-sum .total-num {
			color: #337ab7;
		}
		.order-sum .unassign-num {
			color: #d9534f;
		}
		.order-sum .finish-num {
			color: #5cb85c;
		}
		.order-sum .undone-num {
			color: #f0ad4e;
		}
		.order-sum .cancel-num {
			color: #5bc0de;
		}
		
	</style>
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
			<h1>报障单管理</h1>
			<div class="btn-group">
			</div>
		</div>
		
		<div id="breadcrumb">
			<a href="user-index.action" title="前往主页" class="tip-bottom"><i class="icon-home"></i> 主页</a>
			<a href="#" class="current">报障单管理</a>
		</div>
		
		<div class="order-sum">
			<div class="text-center total-num">
				<div class="text-large"><s:property value='orderSum[0]'/></div>
				<div>总数</div>
			</div>
			<div class="text-center unassign-num">
				<div class="text-large"><s:property value='orderSum[1]'/></div>
				<div>待指派</div>
			</div>
			<div class="text-center undone-num">
				<div class="text-large"><s:property value='orderSum[2]'/></div>
				<div>未完成</div>
			</div>
			<div class="text-center finish-num">
				<div class="text-large"><s:property value='orderSum[3]'/></div>
				<div>已完成</div>
			</div>
			<div class="text-center cancel-num">
				<div class="text-large"><s:property value='orderSum[4]'/></div>
				<div>已取消</div>
			</div>
		</div>	
		
		<!-- 主体内容  -->
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
				<table id="table" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>单号</th>
							<th>报障时间</th>
							<th>状态</th>
							<th>指派时间</th>
							<th>完成时间</th>
							<th>类型</th>
							<th>操 作</th>
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
									<s:if test="#o.state == 1">
										<button type="button" class="assign btn btn-warning btn-xs" data-info="<s:property value='#o.toString()'/>">指派</button>
									</s:if>
									<s:if test="#o.state == 3">
										等待
									</s:if>
									<s:if test="#o.state >= 4">
										结束
									</s:if>
									<s:if test="#o.state <= 2">
										<button type="button" class="cancel btn btn-danger btn-xs" data-info="<s:property value='#o.toString()'/>">取消</button>
									</s:if>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>							
			</div>
		</div>
		
		<!-- 指派窗口 -->
		<div class="modal fade" id="assign" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">指派</h4>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group msg alert alert-danger" style="text-align:center;font-size:20px;font-weight:bold;">
							</div>				
							<div class="form-group">
								<label for="worker" class="col-sm-2 control-label" style="margin-left:10px;">请选择你要指派的维修人员：</label>
								<div class="col-sm-9" style="margin-left:170px;">
									<select class="form-control" id="worker" name="worker" style="width:150px;">
										<s:iterator value="workers" id="w">
											<option value="<s:property value='account'/>"><s:property value='name'/></option>
										</s:iterator>
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="assign-submit">确定</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 查看维修单详细信息窗口 -->
		<div class="modal fade" id="detail" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">维修单详细信息</h4>
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
			<div id="footer" class="span12">
				2019 @学生宿舍维修管理系统. <a href="http://www.gdpu.edu.cn/">广东药科大学.</a> 药学中西，医道济世！
			</div>
		</div>
		
	</div>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.uniform.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/orderlists.js"></script>	
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/config.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/unicorn.form_validation.js"></script>
	
</body>
</html>