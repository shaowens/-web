<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>

<head>
<meta charset="UTF-8">
<%
  request.setCharacterEncoding("utf-8");
  String city=request.getParameter("city"); 
  request.setAttribute("city",city); 
%>
<title>可视化echarts图表</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/echarts.min.js"></script>
<script src="city/hebei.js"></script>
<script src="city/anhui.js"></script>
<script src="city/aomen.js"></script>
<script src="city/beijing.js"></script>
<script src="city/chongqing.js"></script>
<script src="city/fujian.js"></script>
<script src="city/gansu.js"></script>
<script src="city/guangdong.js"></script>
<script src="city/guangxi.js"></script>
<script src="city/guizhou.js"></script>
<script src="city/heilongjiang.js"></script>
<script src="city/hainan.js"></script>
<script src="city/hubei.js"></script>
<script src="city/hunan.js"></script>
<script src="city/henan.js"></script>
<script src="city/jiangsu.js"></script>
<script src="city/jiangxi.js"></script>
<script src="city/jilin.js"></script>
<script src="city/liaoning.js"></script>
<script src="city/neimenggu.js"></script>
<script src="city/ningxia.js"></script>
<script src="city/qinghai.js"></script>
<script src="city/shandong.js"></script>
<script src="city/shanghai.js"></script>
<script src="city/shanxi.js"></script>
<script src="city/shanxi1.js"></script>
<script src="city/sichuan.js"></script>
<script src="city/taiwan.js"></script>
<script src="city/xianggang.js"></script>
<script src="city/xinjiang.js"></script>
<script src="city/xizang.js"></script>
<script src="city/yunnan.js"></script>
<script src="city/zhejiang.js"></script>
<script src="js/citysort.js"></script>
<style>
.contains{background:#fffef9;height:100%;width:100%;}
.header{height:80px;background-size: 100% 100%;
background:url('./images/headerbg.png') no-repeat center center;}
.header .title{display:flex;justify-content:center;color:#fff;font-weight:bold;font-size:2.8rem;align-items: center;height: 100%;}
.time{margin-right: 10px;font-size: 1.8rem;margin-top: -4rem;color: #fff;float: right;}
.time .label{font-weight:300}
.container{height:calc(100vh - 80px);width:100%;}
.item_left,.item_center,.item_right{height:100%; padding-right: 10px;padding-left: 10px;display: flex;}
.c1,.c2,.c3{display: flex;flex-direction: column;align-content: stretch;justify-content: stretch;width: 100%;}
.industryChartDiv,.changeChartDiv,.ageChartDiv{flex:1;margin: 10px 0px;}
.powerChartDiv{flex: 1;margin: 10px 0px;}
.playChatDiv{flex:2;margin: 10px 0px;}
.totalInfoDiv{flex: 1;margin: 10px 0px; margin:0 auto;}
.moveMapDiv{flex:4;margin: 10px 0px;}
.border{
	border: 2px solid #02a6b5;
    width: 100%;
    height: 100%;
    position: relative;
    margin: auto;
}
 .top{
    /* 设置宽度高度背景颜色 */
    height: 80px; /*高度改为自动高度*/
    width:50%;
    margin-left: 0;
    position: fixed; /*固定在顶部*/
    top: 0px;/*离顶部的距离为0*/
 
}
.top ul{
    /* 清除ul标签的默认样式 */
    width: auto;/*宽度也改为自动*/
    list-style-type: none;
    white-space:nowrap;
    overflow: hidden;
    margin-left: 5%;
    /* margin-top: 0;          */
    padding: 0;

}
.top li {
    float:left; /* 使li内容横向浮动，即横向排列  */
    margin-right:2%;  /* 两个li之间的距离*/
    position: relative;
    overflow: hidden;
}

.top li a{
   /* 设置链接内容显示的格式*/
    display: block; /* 把链接显示为块元素可使整个链接区域可点击 */
    color:white;
    text-align: center;
    padding: 10px;
    overflow: hidden;
    text-decoration: none; /* 去除下划线 */
    
}
.top li a:hover{
    /* 鼠标选中时背景变为黑色 */
    background-color: #363636;
}
td { text-align:center; }
	table { width:366px; }
	#container2{
    	border-radius:5px;
    	-webkit-box-shadow: 3px 3px 6px rgba(55,55,55,0.2); 
		-moz-box-shadow: 3px 3px 6px rgba(55,55,55,0.2); 
		box-shadow: 3px 3px 6px rgba(55,55,55,0.2); 
    }
    .td1{
    	font-size:18px;
    	font-weight:700;
    }
    .td2 {
   		font-size:16px;
    	font-weight:600;
    }
    .td3 {
    	font-size:8px;
    	font-weight:500;
    }
        .button{
                cursor: pointer;
                width: 140px;
                line-height: 38px;
                text-align: center;
                font-weight: bold;
                color: #fffef9;
                text-shadow:1px 1px 1px #333;
                border-radius: 5px;
                margin:0 20px 20px 0;
                position: relative;
                overflow: hidden;
            }

    .button.gray{
                color: #8c96a0;
                text-shadow:1px 1px 1px #fff;
                border:1px solid #dce1e6;
                box-shadow: 0 1px 2px #fff inset,0 -1px 0 #a8abae inset;
                background: -webkit-linear-gradient(top,#f2f3f7,#e4e8ec);
                background: -moz-linear-gradient(top,#f2f3f7,#e4e8ec);
                background: linear-gradient(top,#f2f3f7,#e4e8ec);
            }

    .gray:hover{
                background: -webkit-linear-gradient(top,#fefefe,#ebeced);
                background: -moz-linear-gradient(top,#f2f3f7,#ebeced);
                background: linear-gradient(top,#f2f3f7,#ebeced);
            }
 
    .gray:active{
                top:1px;
                box-shadow: 0 1px 3px #a8abae inset,0 3px 0 #fff;
                background: -webkit-linear-gradient(top,#e4e8ec,#e4e8ec);
                background: -moz-linear-gradient(top,#e4e8ec,#e4e8ec);
                background: linear-gradient(top,#e4e8ec,#e4e8ec);
            }
</style>
</head>
<body class="contains">
	<div class="header">

		<div class = "title" >COVID-2019数据可视化</div>
		<div class = "time" ><label id="time"></label></div>
	</div>
		<div class="top">
               
                    <ul>
                    <li><a href="index.jsp">世界疫情</a></li>
                    <li><a href="china.jsp">中国疫情</a></li>
                    <li><a href="city.jsp">省市疫情</a></li>
                    <li><a href="Track.jsp">疫情跟踪</a></li>
                    <li><a href="News.jsp">疫情资讯</a></li>
                    <li><a href="together.jsp">同乘查询</a></li>
                    </ul>
                        
     </div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 item_left">
				<div class="c1">
					<div class="industryChartDiv"  >
						<div class="border"id="chart1" >
				
						</div>
					</div>
					<div class="changeChartDiv"   >
						<div class="border" id="chart2"></div>
					</div>
					<div class="ageChartDiv"  >
						<div class="border" id="chart3"></div>
					</div>
				</div>
			</div>
			<div class="col-md-4 item_center">
				<div class="c2">
					<div class="totalInfoDiv" >
		
                         <div id="container2" style="height:140px; width:366px;padding:10px 0px 15px 0px;">
	                          <table>
		                        <tr class="td1">
			                      <td><b>现有确诊</b></td>
			                      <td><b>现有疑似</b></td>
			                      <td><b>现有重症</b></td>
		                        </tr>
		                        <tr class="td2">
			                      <td style="color:#ff5555;" id="Confirmednow" >54927</td>
			                      <td style="color:#888811;" id="Yisi" >5206</td>
		                          <td style="color:#aaaa33;" id="Zhong" >11633</td>
		                        </tr>
		                        <tr class="td3">
			                      <td>昨日-0</td>
			                      <td>昨日+0</td>
			                      <td>昨日-0</td>
		                        </tr>
	                        </table>
	                        <table>
		                        <tr class="td1">
		                      	  <td>累计确诊</td>
		                          <td>累计治愈</td>
			                      <td>累计死亡</td>
		                        </tr>
		                        <tr class="td2">
			                      <td style="color:#2288ff;" id="Confirmed" >75567</td>
			                      <td style="color:#22bb88;" id="Cured" >18401</td>
	                      		  <td style="color:#990000;" id="Dead" >2239</td>
		                        </tr>
		                        <tr class="td3">
			                      <td id="Current">昨日+0</td>
			                      <td>昨日+0</td>
		                     	  <td>昨日+0</td>
	                          	</tr>
	                        </table>
                        </div>
					</div>
					
		              
					<div class="moveMapDiv" style="border: none; max-width: 100%;background:url('./images/centerbg3.png');" id="citymap">
					    
					</div>
	
				
				</div>
			</div>
			<div class="col-md-4 item_right">
				<div class="c3">
					<div class="powerChartDiv">
						<div class="border">
<div >
            					    <p style="text-align: center; padding-top: 20px; font-size: 20px">数据筛选</p>
            						<div 
                 					style="padding: 1px; padding-bottom: 15px;" >
                 					<table style = "margin:auto" >
                					<tr>
                					<td><button id="confirmbtn" class="button gray"
                        				style="font-size: 12px" onclick="comfirm()">总确诊数</button>
                        			</td>
                        			<td>
                					<button id="deadbtn" class="button gray"
                        				style="font-size: 12px" onclick="dead()">死亡数</button>
                        			</td>
                        			<td>
                					<button id="curedbtn" class="button gray"
                        				style="font-size: 12px" onclick="cured()">治愈数</button>
                        		    </td>
                        			</tr>
                        			<tr>
                        		    <td>
                					<button id="newconfirmbtn" class="button gray"
                        				style="font-size: 12px" onclick="newcon()">现存患者增量</button>
                        		    </td>
                        		                            		                            		    <td>
                					<button id="newconfirmbtn" class="button gray"
                        				style="font-size: 12px" onclick="inc1()">现存人数大于零</button>
                        		    </td>
                        		                            		    <td>
                					<button id="newconfirmbtn" class="button gray"
                        				style="font-size: 12px" onclick="dea1()">死亡人数为零</button>
                        		    </td>
                        		    </tr>
                        		    </table>
            						</div>          						
        						</div>
    					
						
						</div>
					</div>
					<div class="playChatDiv" style="overflow:auto;">
						<div class="border" style="overflow:auto;">
		<table style=" width:80%; height:100% ;margin:0 auto;" class="table table-bordered table-hover" id="table">

        <tr>

            <td>地区</td>
            
            <td>新增人数</td>
            
            <td>确诊人数</td>
            
            <td>疑似人数</td>
            
            <td>治愈人数</td>

            <td>死亡人数</td>
            
        </tr>
       <tbody id="tbody">

       </tbody>
    </table>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"> 
       

        setInterval(function(){   
        var date = new Date();   
        var year = date.getFullYear();    //获取当前年份   
        var mon = date.getMonth()+1;      //获取当前月份   
        var da = date.getDate();          //获取当前日   
        var day = date.getDay();          //获取当前星期几   
        var h = date.getHours();          //获取小时   
        var m = date.getMinutes();        //获取分钟   
        var s = date.getSeconds();        //获取秒   
        var d = document.getElementById('time');    
          d.innerHTML='当前时间:'+year+'年'+mon+'月'+da+'日'+' '+h+':'+m+':'+s;  
        },1000)
       
        
function Short(province){
      
        if(province == "北京市")
            return "北京";
        else if(province == "天津市")
            return "天津";
        else if(province == "重庆市")
            return "重庆";
        else if(province == "上海市")
            return "上海";
        else if(province == "河北省")
            return "河北";
        else if(province == "山西省")
            return "山西";
        else if(province == "辽宁省")
            return "辽宁";
        else if(province == "吉林省")
            return "吉林";
        else if(province == "黑龙江省")
            return "黑龙江";
        else if(province == "江苏省")
            return "江苏";
        else if(province == "浙江省")
            return "浙江";
        else if(province == "安徽省")
            return "安徽";
        else if(province == "福建省")
            return "福建";
        else if(province == "江西省")
            return "江西";
        else if(province == "山东省")
            return "山东";
        else if(province == "河南省")
            return "河南";
        else if(province == "湖北省")
            return "湖北";
        else if(province == "湖南省")
            return "湖南";
        else if(province == "广东省")
            return "广东";
        else if(province == "海南省")
            return "海南";
        else if(province == "四川省")
            return "四川";
        else if(province == "贵州省")
            return "贵州";
        else if(province == "云南省")
            return "云南";
        else if(province == "陕西省")
            return "陕西";
        else if(province == "甘肃省")
            return "甘肃";
        else if(province == "青海省")
            return "青海";
        else if(province == "台湾省")
            return "台湾";
        else if(province == "广西壮族自治区")
            return "广西";
        else if(province == "宁夏回族自治区")
            return "宁夏";
        else if(province == "新疆维吾尔自治区 ")
            return "新疆";
        else if(province == "西藏自治区")
            return "西藏";
        else if(province == "香港特别行政区")
            return "香港";
        else if(province == "澳门特别行政区")
            return "澳门";
        else if(province == "内蒙古自治区")
            return "内蒙古";
        else 
        	return province;
        
    }
    var Pro = "${city}";

    var Province = Short(Pro);
   


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
        
        
        
        
</script>
<script type="text/javascript">
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
                "Province" : Province
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


</script>

</html>