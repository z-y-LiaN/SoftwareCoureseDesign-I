<%@page import="com.github.pagehelper.PageInfo"%>
<%@page import="com.mysql.jdbc.PingTarget"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
	<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/pintuer.css">
	<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/admin.css">
    <script src="<%=path%>/back/js/jquery.js"></script>
    <script src="<%=path%>/back/js/pintuer.js"></script> 
	<link rel="shortcut icon" href="<%=path%>/back//images/logo.jpg">
	<!-- 1.引入 echarts.js -->
<script type="text/javascript" src="<%=path%>/back/echarts/echarts.min.js"></script>
<!-- 引入jquery.js -->
<script type="text/javascript" src="<%=path%>/back/js/jquery.js"></script>

<title>Insert title here</title>
</head>
<body>
<!-- <div class="panel admin-panel"> -->
	<!-- 2.为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main2" style="width: 400px;height:300px;right: 30px;top: 80px;  position:absolute; "></div>
	<script type="text/javascript">
	//基于准备好的dom，初始化echarts实例
                    var myChart2 = echarts.init(document.getElementById('main2'));
                    /* myChart.clear(); */
                    var names2 = [];
                    /* var nums2 = []; */
                    var mydata2 = [];
		    $.ajax({
                        method: 'post',
                        async : true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                        url: '/Epidemic_System/ChartTwoServlet',
                        dataType: 'json',
                        success: function (datas) {
                            for (var i=0;i<datas.length;i++){
                                names2.push(datas[i].name);
                                /* nums2.push(datas[i].num); */
                                mydata2[i] = {value: datas[i].num, name: datas[i].name};
                            }
                            // 指定图表的配置项和数据
                            var option = {
                                title: {
                                    text: '班级人数分布统计',
                                    left: 'center'
                                },
                                tooltip: {
                                    trigger: 'item',
                                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                                },
                                legend: {                            	
                                    orient: 'vertical',
                                    left: 'left', 
                                    data: names2
                                    /*  orient: 'horizontal', */      // 布局方式，默认为水平布局，可选为：
                                   // 'horizontal' ¦ 'vertical'
      //  x: 'center',               // 水平安放位置，默认为全图居中，可选为：
                                   // 'center' ¦ 'left' ¦ 'right'
                                   // ¦ {number}（x坐标，单位px）
      //  y: 'top',                  // 垂直安放位置，默认为全图顶端，可选为：
                                   // 'top' ¦ 'bottom' ¦ 'center'
                                   // ¦ {number}（y坐标，单位px）
                                    
                                },
                                series: [
                                    {
                                        name: '所在班级',
                                        type: 'pie',
                                        radius: '55%',
                                        center: ['50%', '60%'],
                                        data: mydata2,
                                        emphasis: {
                                            itemStyle: {
                                                shadowBlur: 10,
                                                shadowOffsetX: 0,
                                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                                            }
                                        },
                                        label:{
							              show:true,
							              formatter: '{b}: {c}人'
							            }
                                    }
                                ]
                            }; 
			    // 使用刚指定的配置项和数据显示图表。
                            myChart2.setOption(option,true);
                        }                   
                    });
   </script>
	
<!-- 	
</div> -->
</body>
</html>