/**
 * 
 */

  var confirmbtn=1;
  var deadbtn=2;
  var curedbtn=3;
  var newconfirmbtn=4;
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
  function cured(){
	  //alert("a");
	  if(time=="")
      {
          alert("请输入时间！");
          return ;
      }
      else{
    
          $.ajax({
              url : "sortServlet",
              async : true,
              type : "POST",
              data : {
                  "time" : time,
                  "id": curedbtn
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

              },
              error : function() {
                  alert("请求失败");
              },
         });
  }
  }
  function comfirm(){
	  //alert("a");
	  if(time=="")
      {
          alert("请输入时间！");
          return ;
      }
      else{
    
          $.ajax({
              url : "sortServlet",
              async : true,
              type : "POST",
              data : {
                  "time" : time,
                  "id": confirmbtn
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
               

              },
              error : function() {
                  alert("请求失败");
              },
         });
  }
  }
  function dead(){
	  //alert("a");
	  if(time=="")
      {
          alert("请输入时间！");
          return ;
      }
      else{
    
          $.ajax({
              url : "sortServlet",
              async : true,
              type : "POST",
              data : {
                  "time" : time,
                  "id": deadbtn
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

              },
              error : function() {
                  alert("请求失败");
              },
         });
  }
  }
  function newcon(){
	  //alert("a");
	  if(time=="")
      {
          alert("请输入时间！");
          return ;
      }
      else{
    
          $.ajax({
              url : "sortServlet",
              async : true,
              type : "POST",
              data : {
                  "time" : time,
                  "id": newconfirmbtn
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


              },
              error : function() {
                  alert("请求失败");
              },
         });
  }
  }
