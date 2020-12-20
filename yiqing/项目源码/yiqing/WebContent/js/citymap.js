
     var Province = "河北";
    var dt;
    var mydata = new Array(0);
             myDate = new Date();
             var y = myDate.getFullYear();
             var m = myDate.getMonth()+1;//获取当前月份的日期
             if(m<10){
            	 m='0'+m;
             }
             var d = myDate.getDate();
             if(d<10){
   	             d='0'+d;
             }
    var time = y+"-"+m+"-"+d;
    $(function () {
        

        if(time=="")
        {
            alert("请输入时间！");
            return ;
        }
        else{

        	$.ajax({
                url : "CityServlet",
                async : true,
                type : "POST",
                data : {
                	"Province" : Province,
                    "time" : time,
                    
                },
                dataType : "json",
                success : function(json) {
                	
                	
                	
                    for (var i = 1; i < json.length; i++) {
                        var d = {};
                        
                        d["name"] = json[i].City+'市';
                        d["value"] = json[i].Confirmed_num;
                        d["yisi_num"] = json[i].Zhong_num;
                        d["cured_num"] = json[i].Cured_num;
                        d["dead_num"] = json[i].Dead_num;
                        
                        mydata.push(d);
                    }
                        

        
        	  var myChart = echarts.init(document.getElementById('citymap'));
        	    function randomValue() {
        	        return Math.round(Math.random()*1000);
        	    }
        	    var optionMap = {
        	    		backgroundColor: 'transparent',
        	            title : {
        	                text : '省市疫情',
        	                subtext : '',
        	                x : 'center'
        	            },
        	            tooltip : {
        	                formatter : function(params) {
        	                    return params.name + '<br/>' + '确诊人数 : '
        	                            + params.value + '<br/>' + '死亡人数 : '
        	                            + params['data'].dead_num + '<br/>' + '治愈人数 : '
        	                            + params['data'].cured_num + '<br/>'+ '疑似患者人数 : '
        	                            + params['data'].yisi_num;
        	                }
        	            },

        	            //左侧小导航图标
        	            visualMap: {
        	                min: 0,
        	                max: 50,
        	                left: 'left',
        	                top: 'bottom',
        	                text: ['高','低'],//取值范围的文字
        	                inRange: {
        	                    color: ['#e0ffff', '#006edd']//取值范围的颜色
        	                },
        	                show:true//图注
        	            },
        	      

        	            //配置属性
        	            series : [ {
        	                type : 'map',
        	                mapType : Province,
        	                label : {
        	                    show : true
        	                },
        	                data : mydata,
        	                

        	            } ]
        	        };

     

            //使用制定的配置项和数据显示图表
            myChart.setOption(optionMap);
            myChart.on('click', function (params) {
                alert(params.name);
            });

                },
                error : function() {
                    alert("请求失败");
                },
           });
        }
         
    })        