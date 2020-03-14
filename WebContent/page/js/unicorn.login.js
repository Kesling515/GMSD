/**
	对登陆界面密码和账号格式进行查验
**/
$(document).ready(function(){
	
	$('.msg').hide();
	
	var msg = function(text){
		$('.msg').text(text).show();
	};
	
	var submit = function(){
		var user = {
			"user.account": $('#account').val(),
			"user.password": $('#password').val()
		};
		
		$.ajax({
			url: 'user-login.action',
			type: 'POST',
			data: user,
            dataType:"json",
			success : function(res){
				if(res.status){
					window.location.href = 'user-index.action';
				}else{
					msg(res.msg);
				}
			}
		});
	};
	
	$('#submit').on('click', function(){
		   var account = $('#account').val();
		   var password = $('#password').val();
		   if(!account){
			   return msg('请输入账号!');
		   }else if(isNaN(account)){
			   return msg('账号格式错误!');
		   }else if(!password) {
			   return msg('请输入密码!');
		   }else{
			   $('.msg').hide();
			   submit();
		   }
	});
	
});