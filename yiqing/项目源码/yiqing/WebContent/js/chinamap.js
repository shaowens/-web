  var dt;
  var data = new Array(0);
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
              	
              	
              	
                  for (var i = 0; i < json.length; i++) {
                      var d = {};
                      
                      d["name"] = json[i].Province;
                      d["value"] = json[i].Confirmed_num;
                      d["yisi_num"] = json[i].Yisi_num;
                      d["cured_num"] = json[i].Cured_num;
                      d["dead_num"] = json[i].Dead_num;
                      
                      
                      data.push(d);
                  }
                  

  var myChart = echarts.init(document.getElementById('chinamap'));
  function randomValue() {
      return Math.round(Math.random()*1000);
  }
  var optionMap = {
		  backgroundColor: 'transparent',
          title : {
              text : '全国疫情',
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
              max: 35000,
              left: 'left',
              top: 'bottom',
              text: ['高','低'],//取值范围的文字
              inRange: {
            	  color: ['yellow','orangered','red']//取值范围的颜色
              },
              show:true//图注
          },
    

          //配置属性
          series : [ {
        	  type: "map",
        	    zoom: 1.5, //当前视角的缩放比例
        	    roam: true, //是否开启平游或缩放
        	    scaleLimit: { //滚轮缩放的极限控制
        	      min: 1,
        	      max: 3
        	    },


              mapType : 'china',
              label : {
                  show : true
              },
              data : data,
              nameMap : {

                  '南海诸岛' : '南海诸岛',
                  '北京' : '北京市',
                  '天津' : '天津市',
                  '上海' : '上海市',
                  '重庆' : '重庆市',
                  '河北' : '河北省',
                  '河南' : '河南省',
                  '云南' : '云南省',
                  '辽宁' : '辽宁省',
                  '黑龙江' : '黑龙江省',
                  '湖南' : '湖南省',
                  '安徽' : '安徽省',
                  '山东' : '山东省',
                  '新疆' : '新疆维吾尔自治区',
                  '江苏' : '江苏省',
                  '浙江' : '浙江省',
                  '江西' : '江西省',
                  '湖北' : '湖北省',
                  '广西' : '广西壮族自治区',
                  '甘肃' : '甘肃省',
                  '山西' : '山西省',
                  '内蒙古' : "内蒙古自治区",
                  '陕西' : '陕西省',
                  '吉林' : '吉林省',
                  '福建' : '福建省',
                  '贵州' : '贵州省',
                  '广东' : '广东省',
                  '青海' : '青海省',
                  '西藏' : '西藏自治区',
                  '四川' : '四川省',
                  '宁夏' : '宁夏回族自治区',
                  '海南' : '海南省',
                  '台湾' : '台湾',
                  '香港' : '香港',
                  '澳门' : '澳门'
              }

          } ]
      };



      //使用制定的配置项和数据显示图表
      myChart.setOption(optionMap);
      myChart.on('click', function (params) {
    	  
          alert(params.name);
          window.location.href = "allcity.jsp?city="+ params.name;
      });
              },
              error : function() {
                  alert("请求失败");
              },
         });
  }
       
       })
