$(document).ready(function() {

    $('.msg').hide();
	var msg = function(text){
		$('.msg').text(text).show();
	};
    
	
    $('.edit').on('click', function(){
    	var info = $(this).data('info');
    	
    	$('#account').val(info.account);
    	$('#name').val(info.name);
    	$('#password').val(info.password);
    	$('input[name="role"]').each(function(){
    		var item = $(this);
    		if(item.val() == info.roleId){
    			item.prop("checked", true);
    		}else{
    			item.prop("checked", false);
    		}
    	});
    	
    	$('#form').modal('show');
    });
    
    
    $('.delete').on('click', function(){
    	var info = $(this).data('info');
    	var msg = '确定要删除【' + info.roleName + ' ' + info.name + '】吗？'; 
    	$('#msg').text(msg);
    	$('#tips').modal('show');
    	$('#tips-submit').on('click', function(){
    		var user = {
    			"user.account": info.account
    		};
    		
    		$.ajax({
    			url: "user-delete.action",
    			type: "POST",
    			data: user,
                dataType:"json",
    			success : function(res){
    				if(res.status){
    					$('#tips').modal('hide');
    					window.location.reload();
    				}
    			}
    		});
    	});
    });
    
    var submit = function(){
    	var user = {
		    "user.account": $('#account').val() + '',
		    "user.name": $('#name').val(),
		    "user.password": $('#password').val() + '',
		    "user.roleId": $('input:radio:checked').val()
		};
		
		$.ajax({
			url: "user-edit.action",
			type: "POST",
			data: user,
            dataType:"json",
			success : function(res){
				if(res.status){
					$('#form').modal('hide');
					window.location.reload();
				}
			}
		});
    };
    
	$('#form-submit').on('click', function(){
		var account = $('#account').val();
		var name = $('#name').val();
		var password = $('#password').val();
		var role = $('input:radio:checked').val();
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
	
	$('#table').DataTable({
		"aLengthMenu": [[6, 10, 20, 30, 40, -1], [6, 10, 20, 30, 40, "所有"]],
	    language: window.language
	});
});