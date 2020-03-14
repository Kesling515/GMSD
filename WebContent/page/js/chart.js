$(document).ready(function() {
	var workers = [];
	var statList = [];
	
	var handleWorkers = function () {
		
		var wList = $('#chart-data').data('workers');
		var iList = $('#chart-data').data('infos');
		var statList = $('#chart-data').data('stats');
		console.log(wList);
		console.log(iList);
		console.log(statList);
		wList.forEach(function(item) {
			var info = iList.filter(function(it){
				return item.account == it.userId
			});
			info = info[0];
			console.log(info);
			workers.push({
				id: info.id,
				account: info.userId,
				name: item.name
			});
		});
		var map = {};
    	var data = [];
    	statList.forEach(function(item){
    		if (!map[item.workerId]) {
    			map[item.workerId] = 0;
    		}
    		map[item.workerId] += Number(item.value);
    	});
    	workers.forEach(function(item){
    		item.total = map[item.id];
    		console.log(map[item.id]);
    	});
    	console.log(workers);
	};
	
    var drawBarChart = function() {    	
    	var myChart = null;
    	if (myChart && myChart.dispose) { 
    		myChart.dispose(); 
    	}
    	myChart = echarts.init(document.getElementById("chart"));
    	var option = {
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    toolbox: {
		        show : true,
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : workers.map(function(item) {
		            	return item.name;
		            }),
		            axisTick: {
		                alignWithLabel: true
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'完成数量',
		            type:'bar',
		            barWidth: '60%',
		            data: workers.map(function(item) {
		            	return item.total;
		            }),
		            itemStyle: {
		                normal: {
		                    color: function(params) {
		                        // build a color map as your need.
		                        var colorList = [
		                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
		                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
		                           '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
		                        ];
		                        return colorList[params.dataIndex]
		                    }
		                }
		            }
		        }
		    ]
		};
    	myChart.setOption(option);
    };
    
    var drawPieChart = function() {
    	var myChart = null;
    	if (myChart && myChart.dispose) { 
    		myChart.dispose(); 
    	}
    	myChart = echarts.init(document.getElementById("chart"));
    	
    	var option = {    
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    series : [
		        {
		            name: '完成比例',
		            type: 'pie',
		            radius : '75%',
		            center: ['50%', '50%'],
		            data: workers.map(function(item){
		            	return {
		            		value: item.total,
		            		name: item.name
		            	}
		            }),
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
    	myChart.setOption(option);
    } 
    
    $('#chart-bar1').on('click', function(){
    	drawBarChart();
	});
    
    
    $('#chart-bar2').on('click', function(){
    	drawPieChart();
	});

    /*$('#statinputs').on('click', function(){
    	var longdate = {
    		"longdate.sday": $('#sday').val() + '',	
    		"longdate.eday": $('#sday').val() + '',	
    	};
    	
    	$.ajax({
			url: "stat-inputs.action",
			type: "POST",
			data: longdate,
            dataType: "json",
			success : function(res){
				if(res.status){
					
				}
			}
		});
	});*/
    
    handleWorkers();
});