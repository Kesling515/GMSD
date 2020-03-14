$(document).ready(function() {

    $('.msg').hide();
	var msg = function(text){
		$('.msg').text(text).show();
	};
	
	/*查看报障单详情*/
	$('.detail').on('click', function(){
		var info = $(this).data('info');
		
		var modal = $('#detail');
		$('.creater', modal).text(info.creater.name);
		$('.mobile', modal).text(info.detail.mobile);
		$('.address', modal).text(info.detail.address);
		$('.faultDesc', modal).text(info.detail.faultDesc);
		$('.repairer', modal).text(info.repairer ? info.repairer.name : '');
		$('.repairDesc', modal).text(info.detail.repairDesc == 'null' ? '' : info.detail.repairDesc);
		$('.comment', modal).text(info.detail.comment == 'null' ? '' : info.detail.comment);
		$('.score', modal).text(info.detail.score == 0 ? '' : info.detail.score);
		
		modal.modal('show');
	});
	
	/*普通用户删维修单确认窗口*/
	$('.cancel').on('click', function(){
		var info = $(this).data('info');
		var msg = '确定要取消【' + info.orderNo + '】吗？'; 
    	$('#msg').text(msg);
    	$('#tips').modal('show');
    	$('#tips-submit').on('click', function(){
    		var order = {
    			"order.orderNo": info.orderNo
    		};
    		
    		$.ajax({
    			url: "order-cancel.action",
    			type: "POST",
    			data: order,
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
	
	/*普通用户报障窗口*/
	$('.add').on('click', function(){    	
    	$('#mobile').val('');
    	$('#address').val('');
    	$('#fault').val('');
    	$('#indoortime').val('');
    	$('text[name="type"]:checked').prop('checked', false);
    	
    	$('#form').modal('show');
    });
	
	var submit = function(){
    	var order = {
    		"order.detail.mobile": $('#mobile').val(),
    		"order.detail.address": $('#address').val(),
    		"order.detail.faultDesc": $('#fault').val(),
    		"order.detail.indoorTime": $('#indoortime').val(),
    		"order.orderType.id": $('input[name="type"]:checked').val()
		};
		
		$.ajax({
			url: "order-add",
			type: "POST",
			data: order,
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
		var mobile = $('#mobile').val();
		var address = $('#address').val();
		var fault = $('#fault').val();
		var type = $('input[name="type"]:checked').val();
		var mobileReg = /^1[0-9]{10}$/;
		
		if(!mobile){
			return msg('请输入手机号码');
		}else if(!mobileReg.test(mobile)){
			return msg('请输入正确的手机号');
		}else if(!address){
			return msg('请输入宿舍');
		}else if(!fault) {
			return msg('请输入故障描述');
		}else if(type === undefined){
			return msg('请选择报账单类型');
		}else{
			$('.msg').hide();
			submit();
		}
	});
	
	/*用户评价*/
	$('.evaluation').on('click', function(){
		var info = $(this).data('info');
		
		$('#comment').val('');
		$('input[name="score"]:checked').prop('checked', false);
		$('#evaluation').modal('show');
		$('#evaluation-submit').on('click', function(){
			var comment = $('#comment').val();
			var score = $('input[name="score"]:checked').val();
			if(!comment){
				return msg('请输入评论内容');
			}else if(score === undefined){
				return msg('请输选择评价分数');
			}else{
				$('.msg').hide();
				var order = {
					"order.orderNo": info.orderNo,
					"order.detail.comment": comment,
					"order.detail.score": score
				};
				
				$.ajax({
					url: "order-evaluation",
					type: "POST",
					data: order,
		            dataType:"json",
					success : function(res){
						if(res.status){
							$('#evaluation').modal('hide');
							window.location.reload();
						}
					}
				});
			}
		});
	});
	
	$('#table').DataTable({
		"aLengthMenu": [[6, 10, 20, 30, 40, -1], [6, 10, 20, 30, 40, "所有"]],
	    language: window.language,
	    order: [[1, 'DESC']]
	});
});