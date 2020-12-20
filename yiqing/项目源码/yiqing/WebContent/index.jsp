<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>可视化echarts图表</title>

<script src="js/jquery.js"></script>
 <script src="js/jquery-3.4.1.min.js"></script>

<script src="js/echarts.min.js"></script>
<script src="js/world.js"></script>
<script src="js/worldmap.js"></script>
<script src="js/worldsort.js"></script>

   
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
.L2 li{display:none}
.L1 li:hover ul.L2 li{display:block}
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
					<div class="industryChartDiv">
						<div class="border"  id="chart1">
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
			                      <td>昨日+128539</td>
			                      <td>昨日+35686</td>
			                      <td>昨日+53289</td>
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
			                      <td id="Current">昨日+188562</td>
			                      <td>昨日+27071</td>
		                     	  <td>昨日+2952</td>
	                          	</tr>
	                        </table>
                        </div>
					</div>
					
		              
					<div class="moveMapDiv" style="border: none; max-width: 100%;background:url('./images/centerbg3.png');" id="worldmap">
					    
					</div>
	
				
				</div>
			</div>
			<div class="col-md-4 item_right">
				<div class="c3">
					<div class="powerChartDiv">
						<div class="border">
						<div  style="padding-right: 10px;">
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
                        				style="font-size: 12px" onclick="inc1()">确诊人数大于十万</button>
                        		    </td>
                        		                            		    <td>
                					<button id="newconfirmbtn" class="button gray"
                        				style="font-size: 12px" onclick="dea1()">死亡人数大于一万</button>
                        		    </td>
                        		    </tr>
                        		    </table>
            						</div>          						
        						</div>
    						</div>	
						</div>
						</div>
					
					<div class="playChatDiv" style="overflow:auto;">
						<div class="border" style="overflow:auto;">
		<table style=" width:80%; height:100% ;margin:0 auto;" class="table table-bordered table-hover" id="table">

        <tr>
            <td>大洲</td>

            <td>地区</td>
            
            <td>现存人数</td>
                
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
       
</script>
<script type="text/javascript">
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
                  myChart3.on('click',function (params) {
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
     	             let name = $("#table tbody").find("tr").eq(row).find("td").eq(1).text();
     	             // 设置浮动
     	             myChart3.dispatchAction({ type: 'highlight',seriesIndex: 0, name:name});//选中高亮
     	             myChart3.dispatchAction({ type: 'showTip',seriesIndex: 0, name:name});//选中高亮
     	         });
     	         // 当鼠标移开tr时候取消浮动
     	         $("#table tbody").find("tr").on("mouseleave",function () {
     	             // 获得当前匹配元素的个数
     	             let row = $(this).prevAll().length;
     	             // 获得当前tr下td的名字
     	             let name = $("#table tbody").find("tr").eq(row).find("td").eq(1).text();
     	             // 设置浮动
     	             myChart3.dispatchAction({ type: 'downplay', name:name});//选中高亮
     	             myChart3.dispatchAction({ type: 'hideTip',seriesIndex: 0, name:name});//选中高亮
     	         });
                 
                 
                  
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
        	             // 获取table下所有的tr
        	             let trs = $("#table tbody tr");
        	            
        	             for (let i = 0;i<trs.length;i++){
        	                 // 获取tr下所有的td
        	                 let tds = trs.eq(i).find("td");
        	                 // 先把之前的标记的success去掉
        	                 $("#table tbody tr").eq(i).removeClass('success');
        	                 // 如果点击图示的名字和table下的某一个行的第一个td的值一样
        	                
        	                 if (params.name == tds.eq(1).text()){
        	              
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
        	             let name = $("#table tbody").find("tr").eq(row).find("td").eq(1).text();
        	             // 设置浮动
        	             myChart.dispatchAction({ type: 'highlight',seriesIndex: 0, name:name});//选中高亮
        	             myChart.dispatchAction({ type: 'showTip',seriesIndex: 0, name:name});//选中高亮
        	         });
        	         // 当鼠标移开tr时候取消浮动
        	         $("#table tbody").find("tr").on("mouseleave",function () {
        	             // 获得当前匹配元素的个数
        	             let row = $(this).prevAll().length;
        	             // 获得当前tr下td的名字
        	             let name = $("#table tbody").find("tr").eq(row).find("td").eq(1).text();
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
</script>
</html>