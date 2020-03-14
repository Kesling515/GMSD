$(document).ready(function() {
	var info = $('#form').data('info');
	console.log(info);
	$('.msg').hide();
	var msg = function(text){
		$('.msg').text(text).show();
	};
	
	$('#email').val(info.email === 'null' ? '' : info.email);
	$('#mobile').val(info.mobile === 'null' ? '' : info.mobile);
	$('#stuclass').val(info.stuclass === 'null' ? '' : info.stuclass);
	$('#dorm').val(info.dorm === 'null' ? '' : info.dorm);
	$('input[name="sex"]').each(function(){
		var item = $(this);
		if(item.val() == info.sex){
			item.prop('checked', true);
		}else{
			item.prop('checked', false);
		}
	});
	
	var submit = function(){
		var data = {
			"userInfo.id": info.id,
			"userInfo.userId": info.userId,
			"userInfo.email": $('#email').val(),
			"userInfo.mobile": $('#mobile').val(),
			"userInfo.sex": $('input[name="sex"]:checked').val(),
			"userInfo.dorm": $('#dorm').val(),
			"userInfo.stuclass": $('#stuclass').val()
		};
		
		$.ajax({
			url: 'user-upinfo.action',
			type: 'POST',
			data: data,
            dataType:"json",
			success : function(res){
				if(res.status){
					msg('更新个人信息成功');
				}
			}
		});
	};
	
	$('.submit').on('click', function(){
		var email = $('#email').val();
		var mobile = $('#mobile').val();
		var dorm = $('#dorm').val();
		var stuclass = $('#stuclass').val();
		var sex = $('input[name="sex"]:checked').val();
		var emailReg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
		var mobileReg = /^1[0-9]{10}$/;
		
		if(!email){
			return msg('请输入邮箱');
		}else if(!emailReg.test(email)){
			return msg('邮箱格式错误');
		}else if(!mobile){
			return msg('请输入手机号码');
		}else if(!mobileReg.test(mobile)){
			return msg('请输入正确的手机号')
		}else if(sex === undefined){
			return msg('请选择性别');
		}else{
			$('.msg').hide();
			submit();
		}
	});
});