  var dt;
  var num = new Array();
  var nam = new Array();
  var dead = new Array();
  var other =0;
  var Confirmed = 0;
  var Yisi = 0;
  var Cured = 0;
  var Dead = 0;
  var Current = 0;
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
              url : "MapServlet",
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
                      if(Number(num[i])>1000){
                          var d={};
                          d['name']=nam[i];
                          d['value']=num[i];
                          data2.push(d);
                      }
                      else{
                    	  other = other +Number(num[i]);
                      }
                      if(i == json.length-1){
                          d['name']="其他";
                          d['value']=other;
                          data2.push(d);
                      }
 
                  }
  
                
                  $('#Confirmednow').html(Current);
                  $('#Confirmed').html(Confirmed);
                  $('#Cured').html(Cured);
                  $('#Dead').html(Dead);
                  $('#Yisi').html(Yisi);
                
      
                 

                  var myChart3=echarts.init(document.getElementById("chart3"));
                  var option3 = {
              		    title: {
            		        text: '饼图',
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
            		        data: nam,
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
                  
                  
                  var myChart2=echarts.init(document.getElementById("chart2"));

                  var option2={

                    title:{
                      text:'疫情统计(折线图)'
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
                            type : 'category',
                            rotate: -25 ,// 旋转角度
                            axisLabel:{  
                                 interval:0, 
                                 rotate:40,
                                  },
                            data :nam
                        }
                    ],
         	          dataZoom: [{                 // 内置于坐标系中，使用户可以在坐标系上通过鼠标拖拽、鼠标滚轮、手指滑动（触屏上）来缩放或漫游坐标系 
         	                type: 'inside',
         	                start: 0,
         	                end: 30
         	            }, {
         	                start: 0,
         	                end: 30,                  // handleIcon 手柄的 icon 形状，支持路径字符串
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

                    series:[{
                        name:'患者数',
                        type:'line',
                        data:num,
                        itemStyle:{
                            normal:{
                              label : {
                              show: true
                              },
                              borderColor:'blue', 
                              lineStyle:{                 
                                width:5,  
                                type:'solid'  
                              }
                            }
                          }
                    }]
                  };

                  //使用前面指定的配置项和数据项显示图表
                  myChart2.setOption(option2);
     
                  var myChart = echarts.init(document.getElementById('chart1'));

                  // 指定图表的配置项和数据
                  var option = {
                		    title: {
                		        text: '疫情统计(柱状图)'
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
                		            rotate: -25 ,// 旋转角度
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
                 	                end: 30
                 	            }, {
                 	                start: 0,
                 	                end: 30,                  // handleIcon 手柄的 icon 形状，支持路径字符串
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
                  
                  
               

              },
              error : function() {
                  alert("请求失败");
              },
         });
  }
       
       })
