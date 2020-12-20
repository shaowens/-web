<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8");%>
    
<%@page import="java.sql.*" %>  <%--导入java.sql包--%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>Insert title here</title>
</head>
<meta charset="UTF-8">
     <link type="text/css" rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" type="text/css" href="css/timeline.css">
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/echarts-wordcloud.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    
    
<title>显示</title>
<style>
 .top{
    /* 设置宽度高度背景颜色 */
    height: 80px; /*高度改为自动高度*/
    width:40%;
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
        </style>
        <style type="text/css">
		*{
			margin: 0;
			padding: 0;
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
		}
		.slide-btn{
			width:100px;
			display:inline-block;
			border:1px solid;
			border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
			border-radius:5px;
			position: relative;
			overflow: hidden;
			cursor: pointer;
		}
		.slide-btn .inner-on,.slide-btn .inner-off{
			width:151px;
			box-sizing:border-box;
			display: inline-block;
			position: relative;
			right:0;
			cursor: pointer;
			transition:left 0.5s;
			
			
		}
		.inner-on .left,.inner-off .left{
			width: 50px;
			color: #fff;
			text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
			background:#58b058;
			text-align:center;
			display: inline-block;
			padding: 4px 0;
		}
		.inner-on .space,.inner-off .space{
			width: 51px;
			display: inline-block;
			box-sizing:border-box;
			padding: 4px 0;
			color: #fff;
			background-color: #f5f5f5;
			border-left: 1px solid #cccccc;
			border-right: 1px solid #cccccc;
			text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
			background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
			border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
		}
		.inner-on .right,.inner-off .right{
			width: 50px;
			color: #fff;
			text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
			background:#f9a123;
			text-align:center;
			display: inline-block;
			padding: 4px 0;
		}
	</style>
</head>

<body style="background:#C0C0C0">
		<div class="top">
               
                    <ul>
                    <li><a href="index.jsp">世界疫情</a></li>
                    <li><a href="china.jsp">中国疫情</a></li>
                    <li><a href="city.jsp">省市疫情</a></li>
                    <li><a href="Track.jsp">疫情跟踪</a></li>
                    <li><a href="News.jsp">疫情资讯</a></li>
                    <li><a href="together.jsp">同乘查询</a></li>
                   
                   <div class="slide-btn">
		<div class="inner-on" id="inner">
			<input style="display:none;" type="checkbox" checked>
			<span class="right">辟谣</span><span class="space">&nbsp;</span><span class="left">新闻</span>
		</div>
	</div>
	<script type="text/javascript">
		document.getElementById("inner").onclick = function() {
			window.open('News.jsp','_self');
		}
	</script>
                    </ul>
                        
     </div>
<div style=" text-align:center;margin-top:50px">
<form  action="./Rumors.jsp">
<span>
        <select id="area" class="slide-up " name="suoyin" >
             <option value="title">标题</option>
             <option value="body">内容</option>
        </select>
        <input class="slide-up " type="text" id="cha" name="cha">
        <button class="clearfix" style="display:inline-block;width:100px;height:40px" type="submit">查询</button>
 </span><br><br>
 </form>
 </div>

<div>
 <div style="float: left; width:100%;">
   <section id="cd-timeline" class="cd-container">

        
<%  
        try {  
            Class.forName("com.mysql.jdbc.Driver");  //驱动程序名
            String url = "jdbc:mysql://localhost:3306/yiqing?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&serverTimezone=UTC"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态
            String cha=request.getParameter("cha");
            String suoyin=request.getParameter("suoyin");
            if(conn != null){  
                Statement stmt = null;  
                ResultSet rs = null;  
                String sql="SELECT * FROM covid_rumor";
                if(cha!=null&&cha!=""){
                	if(!cha.equals("null")){
                	if(suoyin!=null&&suoyin!=""){
                		if(!suoyin.equals("null"))
                		sql="SELECT * FROM covid_rumor where "+suoyin+" like '%"+cha+"%'";
                		System.out.println("gdgdd");
                	}}
                }
                System.out.println(sql);
                stmt = conn.createStatement();  
                rs = stmt.executeQuery(sql); 
                if(!rs.next()){
                	System.out.println("无数据！  ");
                }else{
                int intPageSize; //一页显示的记录数
                int intRowCount; //记录的总数
                int intPageCount; //总页数
                int intPage; //待显示的页码
                String strPage;
                //设置一页显示的记录数
                intPageSize = 3;
                //取得待显示的页码
                strPage = request.getParameter("page");
                //判断strPage是否等于null,如果是，显示第一页数据
                if (strPage == null) {
                    intPage = 1;
                } else {
                    //将字符串转换为整型
                    intPage = java.lang.Integer.parseInt(strPage);
                }
                if (intPage < 1) {
                    intPage = 1;
                }
                //获取记录总数
                rs.last();
                intRowCount = rs.getRow();
                //计算机总页数
                intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
                //调整待显示的页码
                if (intPage > intPageCount)
                    intPage = intPageCount;
                if (intPageCount > 0) {
                    //将记录指针定位到待显示页的第一条记录上
                    rs.absolute((intPage - 1) * intPageSize + 1);
                }
                int i=0;
                
                while (i < intPageSize && !rs.isAfterLast()){
                	
%>
			<div class="cd-timeline-block">
                <div class="cd-timeline-img cd-picture">
                    <img src="images/cd-icon-picture.svg" alt="Picture">
                </div>

                <div class="cd-timeline-content">
                    <h2><%=rs.getString("title") %></h2>
                    <p><%=rs.getString("body") %></p>
                    <a οnclick="window.location = 'URL' " class="cd-read-more" target="_blank">编号：<%=rs.getString("rumor_id") %></a>
                    <span class="cd-date">热度：<%=rs.getString("score") %></span>
                </div>
            </div>
            
            
<%
					rs.next();
                    i++;
            }
              //关闭连接、释放资源
                rs.close();
                stmt.close();
                conn.close();
                
             %> 

    </section>
    
    <div class="page"  style=" text-align:center;">
				<div >
					<a class="sel_btn" id="sel_btn2"  href="Rumors.jsp?page=<%=intPage-1%>&cha=<%=cha%>&suoyin=<%=suoyin%>">上一页</a> 
					<span class="current" ><%=intPage%></span>  
					<a  class="sel_btn" id="sel_btn2"   href="Rumors.jsp?page=<%=intPage+1%>&cha=<%=cha%>&suoyin=<%=suoyin%>">下一页</a>
				</div>
			</div>	
			</div>
			<%
            
            }}else{  
                out.print("连接失败！");  
            }  
        }catch (Exception e) {        
            e.printStackTrace();  
            out.print("数据库连接异常！");  
        }  
%> 
<br>
    </div>
</body>
</html>