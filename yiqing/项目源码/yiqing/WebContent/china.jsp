<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>可视化echarts图表</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/chinamap.js"></script>
    <script src="js/world.js"></script>
    <script src="js/chart_china.js"></script>
    <script src="js/echarts.min.js"></script>
    <script src="js/china.js"></script>
    <script src="js/sort.js"></script>
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
					<div class="industryChartDiv" >
						<div class="border" id="chart1">
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
			                      <td>昨日-1335</td>
			                      <td>昨日+1614</td>
			                      <td>昨日-231</td>
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
			                      <td id="Current">昨日+892</td>
			                      <td>昨日+2109</td>
		                     	  <td>昨日+118</td>
	                          	</tr>
	                        </table>
                        </div>
					</div>
					
		              
					<div class="moveMapDiv" style="border: none; max-width: 100%;background:url('./images/centerbg3.png');" id="chinamap">
					    
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
                        		                            		    </td>
                        		                            		    <td>
                					<button id="newconfirmbtn" class="button gray"
                        				style="font-size: 12px" onclick="inc1()">现存人数为零</button>
                        		    </td>
                        		                            		    <td>
                					<button id="newconfirmbtn" class="button gray"
                        				style="font-size: 12px" onclick="dea1()">确诊人数大于一千</button>
                        		    </td>
                        		    </tr>
                        		    </table>
            						</div>          						
        						</div>
    					
						</div>
					</div>
					<div class="playChatDiv" style="overflow:auto;">
						<div class="border" style="overflow:auto;">
		<table style=" width:80%; height:100% ;margin:0 auto;" class="table table-bordered table-hover">

        <tr>

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

</html>