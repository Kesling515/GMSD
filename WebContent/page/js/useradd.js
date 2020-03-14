$(document).ready(function() {
    
    $('.msg').hide();
	var msg = function(text){
		$('.msg').text(text).show();
	};
    
    var submit = function(){
    	var user = {
		    "user.account": $('#account').val() + '',
		    "user.name": $('#name').val(),
		    "user.password": $('#password').val() + '',
		    "user.roleId": $('input[name="role"]:checked').val()
		};
		
		$.ajax({
			url: "user-add.action",
			type: "POST",
			data: user,
            dataType: "json",
			success : function(res){
				if(res.status){
					msg('添加用户成功');
				}
			}
		});
    };
    
	$('#form-submit').on('click', function(){
		var account = $('#account').val();
		var name = $('#name').val();
		var password = $('#password').val();
		var role = $('input[name="role"]:checked').val();
		if(!account){
			return msg('请输入账号');
		}else if(isNaN(account)){
			return msg('账号格式错误');
		}else if(!name){
			return msg('请输入姓名')
		}else if(!password) {
			return msg('请输入密码');
		}else if(role === undefined){
			return msg('请选择身份');
		}else{
			$('.msg').hide();
			submit();
		}
	});

});