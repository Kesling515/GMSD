<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix ="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>学生宿舍维修管理系统</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="css/unicorn.login.css" />
	<link rel="icon" href="img/logo1.png" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
    <div id="logo">
		学生宿舍维修管理系统
    </div>
    <div id="loginbox">            
		<form class="form-vertical">
			<p>请输入您的账号和密码</p>
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-user"></i></span><input type="text" id="account" name="account" placeholder="账号" />
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <span class="add-on"><i class="icon-lock"></i></span><input name="password" id="password" type="password" placeholder="密码" />
                    </div>
                </div>
            </div>
            <div class="form-actions">
            	<span class="msg alert alert-danger" style="width:auto; text-align:center; font-size:15px; font-weight:bold; float:inline-start; margin-left:55px;">
    			</span>
                <span class="pull-right"><input type="button" id="submit" class="btn btn-inverse" value="登陆" /></span>
            </div>
        </form>    
    </div>
    
    
    <script src="js/jquery.min.js"></script>  
    <script src="js/unicorn.login.js"></script> 
</body>
</html>
