$(document).ready(function() {
    
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
		$('.indoorTime', modal).text(info.detail.indoorTime);
		$('.repairer', modal).text(info.repairer ? info.repairer.name : '');
		$('.repairDesc', modal).text(info.detail.repairDesc == 'null' ? '': info.detail.repairDesc);
		$('.comment', modal).text(info.detail.comment == 'null' ? '': info.detail.comment);
		$('.score', modal).text(info.detail.score == 0 ? '' : info.detail.score);
		
		modal.modal('show');
	});
	
	$('.finish').on('click', function(){
		var info = $(this).data('info');
		
		$('#desc').val('');
		$('#finish').modal('show');
		$('#finish-submit').on('click', function(){
			var desc = $('#desc').val();
			if(!desc){
				return msg('请输入维修描述');
			}else{
				$('.msg').hide();
				
				var order = {
					"order.orderNo": info.orderNo,
					"order.detail.repairDesc": desc
				}
				
				$.ajax({
					url: "order-finish",
					type: "POST",
					data: order,
		            dataType:"json",
					success : function(res){
						if(res.status){
							$('#finish').modal('hide');
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