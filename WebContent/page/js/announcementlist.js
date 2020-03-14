$(document).ready(function() {
	
    $('.delete').on('click', function(){
    	var info = $(this).data('info');
    	var msg = '确定要删除【' + info.content + '】吗？'; 
    	$('#msg').text(msg);
    	$('#tips').modal('show');
    	$('#tips-submit').on('click', function(){
    		var announcement = {
    			"announcement.id": info.id
    		};
    		
    		$.ajax({
    			url: "announcement-delete.action",
    			type: "POST",
    			data: announcement,
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
	
	$('#table').DataTable({
		"aLengthMenu": [[6, 10, 20, 30, 40, -1], [6, 10, 20, 30, 40, "所有"]],
	    language: window.language
	});
});