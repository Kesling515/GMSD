$(document).ready(function(){
	$('.msg').hide();
	var msg = function(text){
		$('.msg').text(text).show();
	};
	
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
    			url: "order-cancel-by-admin.action",
    			type: "POST",
    			data: order,
                dataType: "json",
    			success : function(res){
    				if(res.status){
    					$('#tips').modal('hide');
    					window.location.reload();
    				}
    			}
    		});
		});
	});
	
	$('.assign').on('click', function(){
		var info = $(this).data('info');
		
		$("#worker").val(null).trigger("change");
		$('#assign').modal('show');
		$('#assign-submit').on('click', function(){	

			var worker = $("#worker").val() ;
			//$('#worker').val('value').trigger('change');
			if(!worker){
				return msg('请选择维修人员');
			}else{
				$('.msg').hide();
				
				var order = {
					"order.orderNo": info.orderNo,
					"order.repairer.userId": worker
				};
				
				$.ajax({
	    			url: "order-assign.action",
	    			type: "POST",
	    			data: order,
	                dataType:"json",
	    			success : function(res){
	    				if(res.status){
	    					$('#assign').modal('hide');
	    					window.location.reload();
	    				}
	    			}
	    		});
			}
		});
	});
	
	$('#table').DataTable({
		"aLengthMenu": [[5, 10, 20, 30, 40, -1], [5, 10, 20, 30, 40, "所有"]],
	    language: window.language,
	    order: [[1, 'DESC']]
	});
	
});