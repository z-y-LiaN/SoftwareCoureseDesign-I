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
<title>请假信息列表</title>
	<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/pintuer.css">
	<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/admin.css">
    <script src="<%=path%>/back/js/jquery.js"></script>
    <script src="<%=path%>/back/js/pintuer.js"></script> 
	<link rel="shortcut icon" href="<%=path%>/back/images/logo.jpg">
	<!-- 1.引入 echarts.js -->
<script type="text/javascript" src="http://localhost:8080/Epidemic_System/back/echarts/echarts.min.css"></script>
<!-- 引入jquery.js -->
<script type="text/javascript" src="<%=path%>/back/js/jquery.js"></script>

<title>Insert title here</title>
</head>
<body>
<div>
	<!-- 2.为ECharts准备一个具备大小（宽高）的Dom -->
	<!-- <div id="main" style="width: 600px;height:400px;  /* position:absolute; */ top:0;left:30px; "></div> -->
	<div id="main" style="width: 500px; height: 350px;left:30px;top:550px;  position:absolute;"></div>
</div>
	<!-- div的id=下面的id  -->
<!--  折线图-->
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));

		//3.初始化，默认显示标题，图例和xy空坐标轴
		myChart.setOption({

			title : {
				text : '近七天打卡人次统计',
			},
			tooltip : {},

			legend : {

				data : [ '打卡人次' ]
			},
			xAxis : {
				data : []
			},
			yAxis : {
				name:'单位：人次',
			},
			series : [ {
				name : '打卡人次',
				type : 'line',
				data : []
			} ]
		});

		//4.设置加载动画(非必须)
		myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

		//5.定义数据存放数组(动态变)
		var names = []; //建立一个类别数组（实际用来盛放X轴坐标值）
		var nums = []; //建立一个销量数组（实际用来盛放Y坐标值）

		//6.ajax发起数据请求
		$.ajax({
			type : "post",
			async : true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
			url : "/Epidemic_System/ChartOneServlet", //请求发送到TestServlet
			data : {},
			dataType : "json", //返回数据形式为json

			//7.请求成功后接收数据name+num两组数据
			success : function(result) {
				//result为服务器返回的json对象
				if (result) {
					//8.取出数据存入数组
					for (var i = 0; i < result.length; i++) {
						names.push(result[i].name); //迭代取出类别数据并填入类别数组
					}
					for (var i = 0; i < result.length; i++) {
						nums.push(result[i].num); //迭代取出销量并填入销量数组
					}

					myChart.hideLoading(); //隐藏加载动画

					//9.覆盖操作-根据数据加载数据图表
					myChart.setOption({
						xAxis : {
							data : names,
							axisLabel:{
                       			 interval:0,
                        		 rotate:-20
                  	   		},
                 		},
                 		grid: {//图的位置
					        top: 60,
					        bottom:40
					    },
					     toolbox: {//可以用来切换图例
                            show: true,
                            feature: {
                                dataView: {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                         calculable: true,
						series : [ {
							// 根据名字对应到相应的数据
							name : '人次',
							data : nums,
							/* smooth:0.5, */
							 markLine: {
                                    data: [
                                        {type: 'average', name: '平均值'}
                                    ]
                                },
							itemStyle: {
							normal: {
								color:'#99CC99',
								label: {
									show: true, //开启显示
									position: 'top', //在上方显示
									textStyle: { //数值样式
										color: 'black',
										fontSize: 12
									}
								}
							}
						   },
						} ]
					});

				}

			},
			error : function(errorMsg) {
				//请求失败时执行该函数
				alert("图表请求数据失败!");
				myChart.hideLoading();
			}
		})
	</script>
</body>
</html>