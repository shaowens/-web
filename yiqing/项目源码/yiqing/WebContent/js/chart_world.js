var dt;
var num = new Array();
var nam = new Array();
var num2_current = new Array();
var num2_confirmed = new Array();
var num2_cured = new Array();
var num2_dead = new Array();


var nam2 = new Array();
var num3 = new Array();
var nam3 = new Array();

var Confirmed = 0;
var Yisi = 0;
var Cured = 0;
var Dead = 0;
var Current = 0;

var area1 = 0;
var area2 = 0;
var area3 = 0;
var area4 = 0;
var area5 = 0;
var area6 = 0;
var area7 = 0;

var data2 = [];

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
            url : "WorldSumServlet",
            async : true,
            type : "POST",
            data : { },
            dataType : "json",
            success : function(json) {
                for (var i = 0; i < json.length; i++) {
              	
                    num2_current[i]  =  json[i].currentt;
                    num2_cured[i]  =  json[i].cured_num;
                    num2_dead[i]  =  json[i].dead_num;
                    num2_confirmed[i]  =  json[i].confirmed_num;
                    nam2[i] = json[i].date;   
                    
             
                }
                
                var myChart2=echarts.init(document.getElementById("chart2"));

                var option2={

                  title:{
                    text:'每日疫情趋势图(折线图)'
                  },
                  tooltip: {
                      trigger: 'axis'
                  },
                  toolbox:{
                      show:true,
                      feature:{
                          saveAsImage:{
                              show:true
                          }
                      }
                  },

                  legend:{
                      data:['患者数']
                  },

                  xAxis : [
                      {
                    	  show : false,
                          type : 'category',
                          axisLabel:{  
                               interval:0, 
                               rotate:40,
                                },
                          data :nam2
                      }
                  ],
    	          dataZoom: [{                 // 内置于坐标系中，使用户可以在坐标系上通过鼠标拖拽、鼠标滚轮、手指滑动（触屏上）来缩放或漫游坐标系 
	                type: 'inside',
	                start: 0,
	                end: 10
	            }, {
	                startValue: 0,
	                endValue: 10,                  // handleIcon 手柄的 icon 形状，支持路径字符串
	                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
	                handleSize: '80%',        //  控制手柄的尺寸，可以是像素大小，也可以是相对于 dataZoom 组件宽度的百分比，默认跟 dataZoom 宽度相同。
	                handleStyle: {
	                    color: 'pink',
	                    shadowBlur: 3,      // shadowBlur图片阴影模糊值，shadowColor阴影的颜色
	                    shadowColor: 'red',
	                    shadowOffsetX: 2,
	                    shadowOffsetY: 2
	                }
	            }],
                 yAxis : [
                      {
                          type : 'value'
                      }
                  ],

                  series:[
                  {
                      name:'患者数',
                      type:'line',
                      data: num2_confirmed,
                  
                  },
                  {
                      name:'现存数',
                      type:'line',
                      data: num2_current,
                  
                  },
                  {
                      name:'痊愈数',
                      type:'line',
                      data: num2_cured,
                  
                  },
                  {
                      name:'死亡数',
                      type:'line',
                      data: num2_dead,
                  
                  },
                  
                  
                  
                  ]
                };

                //使用前面指定的配置项和数据项显示图表
                myChart2.setOption(option2);
   
               
                

                $.ajax({
                    url : "WorldDataServlet",
                    async : true,
                    type : "POST",
                    data : {
                        "time" : time
                    },
                    dataType : "json",
                    success : function(json) {
                  	  $("#tbody").empty();
                  	  for(var i=0;i<json.length;i++){
                  		
            	            var $trTemp = $("<tr></tr>");

                            //往行里面追加 td单元格
            	            $trTemp.append("<td>"+ json[i].Continents +"</td>");
                            $trTemp.append("<td>"+ json[i].Province +"</td>");
                            $trTemp.append("<td>"+ json[i].Current_num +"</td>");
                            $trTemp.append("<td>"+ json[i].Confirmed_num +"</td>");
                            $trTemp.append("<td>"+ json[i].Yisi_num +"</td>");
                            $trTemp.append("<td>"+ json[i].Cured_num +"</td>");
                            $trTemp.append("<td>"+ json[i].Dead_num +"</td>");
        

                            $("#tbody").append($trTemp);
            	    	}
                  	  
                      for (var i = 0; i < json.length; i++) {
                        	
                          num[i]  =  json[i].Confirmed_num;
                          nam[i] = json[i].Province;
                          Current = Current + Number(json[i].Current_num);
                          Confirmed = Confirmed + Number(json[i].Confirmed_num);
                          Yisi = Yisi + Number(json[i].Yisi_num);
                          Cured = Cured + Number(json[i].Cured_num);
                          Dead = Dead + Number(json[i].Dead_num);
                          
                          if(json[i].Continents=="欧洲"){
                        	  area1 = area1 + Confirmed;  
                          }
                          else if(json[i].Continents=="亚洲"){
                        	  area2 = area2 + Confirmed;  
                          }
                          else if(json[i].Continents=="非洲"){
                        	  area3 = area3 + Confirmed;  
                          }
                          else if(json[i].Continents=="南美洲"){
                        	  area4 = area4 + Confirmed;  
                          }
                          else if(json[i].Continents=="北美洲"){
                        	  area5 = area5 + Confirmed;  
                          }
                          else if(json[i].Continents=="大洋洲"){
                        	  area6 = area6+ Confirmed;  
                          }
                          else if(json[i].Continents=="其他"){
                        	  area7 = area7 + Confirmed;  
                          }
                      }
                      
                      nam3[1]="欧洲";
                      nam3[2]="亚洲";
                      nam3[3]="非洲"
                      nam3[4]="南美洲";
                      nam3[5]="北美洲";
                      nam3[6]="大洋洲";
                      nam3[7]="其他";
                      
                      num3[1]=area1;
                      num3[2]=area2;
                      num3[3]=area3;
                      num3[4]=area4;
                      num3[5]=area5;
                      num3[6]=area6;
                      num3[7]=area7;
                      
                      for(var i=0;i<7;i++){
                    	  var d={};
                    	  d['name']=nam3[i];
                          d['value']=num3[i];
                          data2.push(d);
                      }
                       
                      
          
                      $('#Confirmednow').html(Current);
                      $('#Confirmed').html(Confirmed);
                      $('#Cured').html(Cured);
                      $('#Dead').html(Dead);
                      $('#Yisi').html(Yisi);
                      
                      
                      var myChart3=echarts.init(document.getElementById("chart3"));
                      var option3 = {
                  		    title: {
                		        text: '各大洲疫情',
                		        subtext: '疫情数据',
                		        left: 'center'
                		    },
                		    tooltip: {
                		        trigger: 'item',
                		        formatter: '{a} <br/>{b} : {c} ({d}%)'
                		    },
                		    legend: {
                		        orient: 'vertical',
                		        left: 'left',
                		        data: nam3,
                		    },
                		    series: [
                		        {
                		            name: '访问来源',
                		            type: 'pie',
                		            radius: '55%',
                		            center: ['50%', '60%'],
                		            data: data2,
                		            emphasis: {
                		                itemStyle: {
                		                    shadowBlur: 10,
                		                    shadowOffsetX: 0,
                		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                		                }
                		            }
                		        }
                		    ]
                		};

                  myChart3.setOption(option3);
                  
                  	 var myChart = echarts.init(document.getElementById('chart1'));

                     // 指定图表的配置项和数据
                     var option = {
                   		    title: {
                   		        text: '各国患者总数图(柱状图)'
                   		    },
                   		    tooltip: {
                   		        show: true
                   		    },
                   		    toolbox:{
                                   show:true,
                                   feature:{
                                       saveAsImage:{
                                           show:true
                                       }
                                   }
                               },
                   		    legend: {
                   		        data:['患者数']
                   		    },

                   		    xAxis : [
                   		        {
                   		            type : 'category',
                   		            
                   		            axisLabel:{  
                   		                 interval:0,
                   		                 rotate:40,
                   		                  },
                   		            data : nam
                   		        }
                   		    ],
                   	          dataZoom: [{                 // 内置于坐标系中，使用户可以在坐标系上通过鼠标拖拽、鼠标滚轮、手指滑动（触屏上）来缩放或漫游坐标系 
                   	                type: 'inside',
                   	                start: 0,
                   	                end: 10
                   	            }, {
                   	                start: 0,
                   	                end: 10,                  // handleIcon 手柄的 icon 形状，支持路径字符串
                   	                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                   	                handleSize: '80%',        //  控制手柄的尺寸，可以是像素大小，也可以是相对于 dataZoom 组件宽度的百分比，默认跟 dataZoom 宽度相同。
                   	                handleStyle: {
                   	                    color: 'pink',
                   	                    shadowBlur: 3,      // shadowBlur图片阴影模糊值，shadowColor阴影的颜色
                   	                    shadowColor: 'red',
                   	                    shadowOffsetX: 2,
                   	                    shadowOffsetY: 2
                   	                }
                   	            }],
              
                   		    yAxis : [
                   		        {
                   		            type : 'value'
                   		        }
                   		    ],
                   		    series : [
                   		        {
                   		            name:'患者数',
                   		            type:'bar',
                   		            data: num
                   		        }
                   		    ]
                   		};

                     // 使用刚指定的配置项和数据显示图表
                     myChart.setOption(option);
                     myChart.on('click',function (params) {
        	        	 alert("a");
        	             // 获取table下所有的tr
        	             let trs = $("#table tbody tr");
        	            
        	             for (let i = 0;i<trs.length;i++){
        	                 // 获取tr下所有的td
        	                 let tds = trs.eq(i).find("td");
        	                 // 先把之前的标记的success去掉
        	                 $("#table tbody tr").eq(i).removeClass('success');
        	                 // 如果点击图示的名字和table下的某一个行的第一个td的值一样
        	                
        	                 if (params.name == tds.eq(6).text()){
        	              
        	                     //设置success状态
        	                     $("#table tbody tr").eq(i).addClass('success');
        	                     // 跳转到页面指定的id位置
        	                     $("html,body").animate({scrollTop:$("#table tbody tr").eq(i).offset().top},1000);
        	                 }
        	             }
        	         });
        	         $("#table tbody").find("tr").on("mouseenter",function () {
        	        	 
        	             // 获得当前匹配元素的个数
        	             let row = $(this).prevAll().length;
        	             
        	             // 获得当前tr下td的名字
        	             let name = $("#table tbody").find("tr").eq(row).find("td").eq(0).text();
        	             // 设置浮动
        	             myChart.dispatchAction({ type: 'highlight',seriesIndex: 0, name:name});//选中高亮
        	             myChart.dispatchAction({ type: 'showTip',seriesIndex: 0, name:name});//选中高亮
        	         });
        	         // 当鼠标移开tr时候取消浮动
        	         $("#table tbody").find("tr").on("mouseleave",function () {
        	             // 获得当前匹配元素的个数
        	             let row = $(this).prevAll().length;
        	             // 获得当前tr下td的名字
        	             let name = $("#table tbody").find("tr").eq(row).find("td").eq(0).text();
        	             // 设置浮动
        	             myChart.dispatchAction({ type: 'downplay', name:name});//选中高亮
        	             myChart.dispatchAction({ type: 'hideTip',seriesIndex: 0, name:name});//选中高亮
        	         });
                    
                    },
                    error : function() {
                        alert("请求失败");
                    },
               });
             

            },
            error : function() {
                alert("请求失败");
            },
       });
}
     
     })