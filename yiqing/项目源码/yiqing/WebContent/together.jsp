<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>同乘查询</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/jquery.js"></script>
 <script src="js/jquery-3.4.1.min.js"></script>
 <script src="js/chart_world.js"></script>
<script src="js/echarts.min.js"></script> 
     <link type="text/css" rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" type="text/css" href="css/timeline.css">
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
 .top{
    /* 设置宽度高度背景颜色 */
    height: 80px; /*高度改为自动高度*/
    width:30%;
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
    color:black;
    text-align: center;
    padding: 10px;
    overflow: hidden;
    text-decoration: none; /* 去除下划线 */
    
}
.top li a:hover{
    /* 鼠标选中时背景变为黑色 */
    background-color: #363636;
}
        .sel_btn{
            height: 21px;
            line-height: 21px;
            padding: 0 11px;
            background: #e4e4e4;
            border: 1px #e4e4e4 solid;
            border-radius: 3px;
            /*color: #fff;*/
            display: inline-block;
            text-decoration: none;
            font-size: 12px;
            outline: none;
        }
        .ch_cls{
            background: white;
        }    
    </style>
    <style>
            html, body{
                width: 100%;
                height: 100%;
                margin: 0;
            }
            #main{
                width: 50%;
                height: 800px;
                background: #e4e4e4;
                float: right;
            }
         #input{
                 margin-top:200px;
                 width: 750px;
                 height: 30px;
                 margin: 0 auto;
                 text-align:center;
         } 
         button{
              float:right;
         }
         #message{
           font-size:30px;
           color: red;
         }
        </style>

</head>
<body>
    <div class="top">
               
                    <ul>
                    <li><a href="index.jsp">世界疫情</a></li>
                    <li><a href="china.jsp">中国疫情</a></li>
                    <li><a href="city.jsp">省市疫情</a></li>
                    <li><a href="Track.jsp">疫情跟踪</a></li>
                    <li><a href="News.jsp">疫情资讯</a></li>
                   
                    </ul>
                        
     </div>		
<div id="input" style="margin-top:50px">
            交通工具<select name="tiff" id="tiff">
  				<option value="train"  >火车</option>
  				<option value="flight"  >飞机</option>
  				<option value="bus"  >公交</option>
  				<option value="taxi"  >出租车</option>
			</select>
            车牌号<input type="text" id="number" name="number" >
            <button type="submit" value="查找" onclick="cured()">  查找</button>


</div>
<div style="text-align: center;display: none;  width: 300px;height: 300px; margin:30px auto" id="image1">
<img src="images/dui.jpg"></img>
</div> 
<div style="text-align: center;display: none;  width: 300px;height: 300px; margin:30px auto" id="image2">
<img src="images/cuo.jpg"></img>
</div > 
<div style="margin:50px auto">
<span id="message" style="text-align: center;display:block; ">
</span>
</div>
<div class="playChatDiv" style="overflow:auto;display: none;" id="table1">
	<div class="border" style="overflow:auto;">
		<table style=" width:80%; height:100% ;margin:0 auto;" class="table table-bordered table-hover">
       <tr>
        						<td><b>出发时间</b></td>
			                    <td><b>出发地点</b></td>
			                    <td><b>到达地点</b></td>
			                    <td><b>车厢</b></td>
			                    <td><b>座位号</b></td>
		</tr>
		<tbody id="tbody">
		</tbody>
    </table>
	</div>
</div>
</body>
<script type="text/javascript">
/**
 * 
 */
  function cured(){
	  var tiff = $("#tiff").val();
	  var number = $("#number").val();//定义变量
          $.ajax({
              url : "togetherServlet",
              async : true,
              type : "POST",
              data : {
            	  "tiff" : tiff,
            	  "number" : number//传参
              },
              dataType : "json",
              success : function(json) {
            	  if(json.length>0){
            		  $("#image2").show();
            		  $("#message").html("查询到该乘客是确诊/疑似患者或已检出的无症状感染者的同乘接触者");
            		  $("#tbody").empty();
                  	  for(var i=0;i<json.length;i++){
                  		
            	            var $trTemp = $("<tr></tr>");
            	            
                            //往行里面追加 td单元格
            	            $trTemp.append("<td>"+ json[i].tripDepname +"</td>");
                            $trTemp.append("<td>"+ json[i].tripDate +"</td>");
                            $trTemp.append("<td>"+ json[i].tripArrname +"</td>");
                            $trTemp.append("<td>"+ json[i].carriage +"</td>");
                            $trTemp.append("<td>"+ json[i].seatNo +"</td>");
                          
                            $("#tbody").append($trTemp);
            	    	}
                  	    $("#table1").show();
            	  }
            	  else{
            		  $("#image1").show();
            		  $("#message").html("暂未查询到该乘客是确诊/疑似患者或已检出的无症状感染者的同乘接触者");
            		  $("#table1").hide();
            	  }                 
              },
              error : function() {
                  alert("请求失败");
              },
         });
  }
  
</script>
</html>