$(document).ready(function() {
    
    $('.msg').hide();
	var msg = function(text){
		$('.msg').text(text).show();
	};
    
    $('.edit').on('click', function(){
    	var info = $(this).data('info');
    	
    	$('#id').val(info.id);
    	$('#type').val(info.type);
    	$('#question').val(info.question);
    	$('#answer').val(info.answer);
    	
    	
    	$('#form').modal('show');
    });
    
    $('.add').on('click', function(){    	
    	$('#id').val('');
    	$('#type').val('');
    	$('#question').val('');
    	$('#answer').val('');
    	
    	
    	$('#form').modal('show');
    });
    
    $('.delete').on('click', function(){
    	var info = $(this).data('info');
    	var msg = '确定要删除问题: 【'+ info.question +'】吗？'; 
    	$('#msg').text(msg);
    	$('#tips').modal('show');
    	$('#tips-submit').on('click', function(){
    		var help = {
    			"help.id": info.id
    		};
    		
    		$.ajax({
    			url: "help-delete.action",
    			type: "POST",
    			data: help,
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
    	var help = {
			"help.id": $('#id').val() || 0,
			"help.type":  $('#type').val(),
		    "help.question": $('#question').val(),
		    "help.answer": $('#answer').val() + ''
		};
		var url = $('#id').val() ? "help-edit.action" : "help-add.action";
		
		$.ajax({
			url: url,
			type: "POST",
			data: help,
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
		console.log('on click');
		var type = $('#type').val();
		var question = $('#question').val();
		var answer = $('#answer').val();
		console.log(type, question, answer, "提交的数据");
		
		if(!question){
			return msg('请输入问题');
		}else if(!answer){
			return msg('请输入回答')
		}else if(!type){
			return msg('请输入类型');
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