  var dt;
  var num = new Array();
  var nam = new Array();
  var dead = new Array();
  
  var Confirmed = 0;
  var Yisi = 0;
  var Cured = 0;
  var Dead = 0;
  var Current = 0;
  var data = [];
 
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
                  "time" : time,
                  "Province" : "河北"
              },
              dataType : "json",
              success : function(json) {
            	  $("#tbody").empty();
            	  for(var i=0;i<json.length;i++){
            		
      	            var $trTemp = $("<tr></tr>");

                      //往行里面追加 td单元格
                      $trTemp.append("<td>"+ json[i].City +"</td>");
                      $trTemp.append("<td>"+ json[i].New_Confirmed_num +"</td>");
                      $trTemp.append("<td>"+ json[i].Confirmed_num +"</td>");
                      $trTemp.append("<td>"+ json[i].Zhong_num +"</td>");
                      $trTemp.append("<td>"+ json[i].Cured_num +"</td>");
                      $trTemp.append("<td>"+ json[i].Dead_num +"</td>");
  

                      $("#tbody").append($trTemp);
      	    	}
              	
                  for (var i = 0; i < json.length; i++) {
                	 
                      num[i]  =  json[i].Confirmed_num;
                      nam[i] = json[i].City;
                      Current = Current + Number(json[i].New_Confirmed_num);
                      Confirmed = Confirmed + Number(json[i].Confirmed_num);
                      Yisi = Yisi + Number(json[i].Zhong_num);
                      Cured = Cured + Number(json[i].Cured_num);
                      Dead = Dead + Number(json[i].Dead_num);
                      var d={};
                      d['name']=nam[i];
                      d['value']=num[i];
                      data.push(d);
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
            		        data: name,
            		    },
            		    series: [
            		        {
            		            name: '访问来源',
            		            type: 'pie',
            		            radius: '55%',
            		            center: ['50%', '60%'],
            		            data: data,
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
                            axisLabel:{  
                                 interval:0, 
                                 rotate:40,
                                  },
                            data :nam
                        }
                    ],

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
                		            
                		            axisLabel:{  
                		                 interval:0,
                		                 rotate:40,
                		                  },
                		            data : nam
                		        }
                		    ],
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
             	     
     	             // 获取table下所有的tr
     	             let trs = $("#table tbody tr");
     	            
     	             for (let i = 0;i<trs.length;i++){
     	                 // 获取tr下所有的td
     	                 let tds = trs.eq(i).find("td");
     	                 // 先把之前的标记的success去掉
     	                 $("#table tbody tr").eq(i).removeClass('success');
     	                 // 如果点击图示的名字和table下的某一个行的第一个td的值一样
     	                
     	                 if (params.name == tds.eq(0).text()){
     	              
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
  }
       
       })
