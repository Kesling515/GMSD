$(document).ready(function() {
	var info = $('#form').data('info');
	console.log(info);
	
	$('.msg').hide();
	var msg = function(text){
		$('.msg').text(text).show();
	};
	
	$('#oldPassword').val(info.password === 'null' ? '' : info.password);
	
	var submit = function(){	
		var data = {
			"oldPwd": $('#oldPassword').val(),
			"newPwd": $('#newPassword').val()
		};
		
		$.ajax({
			url: "user-change-pwd.action",
			type: "POST",
			cache: false,
			data: data,
            dataType:"json",
			success : function(res){
				if(res.status){
					msg('修改密码成功');
					setTimeout(function(){
						window.location.href = 'logout.action';
					}, 1000);
				}else{
					msg(res.msg);
				}
			}
		});
	};
	
	$('.submit').on('click', function(){
		var oldPassword = $('#oldPassword').val();
		var newPassword = $('#newPassword').val();
		var renewPassword = $('#renewPassword').val();
		
		if(!oldPassword){
			return msg('请输入旧的密码');
		}else if(!newPassword){
			return msg('请输入新的密码');
		}else if(oldPassword == newPassword){
			return msg('新旧密码不能一样');
		}else if(renewPassword != newPassword){
			return msg('两次密码不相同');
		}else{
			$('.msg').hide();
			submit();
		}		
	});
	
});