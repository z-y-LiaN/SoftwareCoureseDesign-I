<%@page import="com.github.pagehelper.PageInfo"%>
<%@page import="com.mysql.jdbc.PingTarget"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<title></title>
</head>

<body>
	<!-- 1.为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main3" style="width: 500px;height:400px; top:0;left:30px; "></div>
	<script type="text/javascript">
		//2.创建
		var myChart3 = echarts.init(document.getElementById('main3'));
		//3.初始化，默认显示标题，图例和xy空坐标轴
		myChart3.setOption({
			title : {
				text : '请假事务统计'
			},
			tooltip : {},
	
			legend : {
				data : [ '请假事务' ]
			},
			xAxis : {
				data : []
			},
			yAxis : {},
			series : [ {
				name : '请假事务',
				type : 'bar',
				data : []
			} ]
		});
	
		//4.设置加载动画(非必须)
		myChart3.showLoading(); //数据加载完之前先显示一段简单的loading动画
	
		//5.定义数据存放数组(动态变)
		var names3 = []; //建立一个类别数组（实际用来盛放X轴坐标值）
		var nums3 = []; //建立一个销量数组（实际用来盛放Y坐标值）
	
		//6.ajax发起数据请求
		$.ajax({
			type : "post",
			async : true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
			url : "/Epidemic_System/ChartThreeServlet", //请求发送到ChartThreeServlet
			data : {},
			dataType : "json", //返回数据形式为json
			//7.请求成功后接收数据name+num两组数据
			success : function(result) {
				//result为服务器返回的json对象
				if (result) {
					//8.取出数据存入数组
					for (var i = 0; i < result.length; i++) {
						names3.push(result[i].name); //迭代取出类别数据并填入类别数组
					}
					for (var i = 0; i < result.length; i++) {
						nums3.push(result[i].num); //迭代取出销量并填入销量数组
					}
	
					myChart3.hideLoading(); //隐藏加载动画
	
					//9.覆盖操作-根据数据加载数据图表
					myChart3.setOption({
						xAxis : {
							data : names3
						},
						series : [ {
							// 根据名字对应到相应的数据
							name : '人数',
							data : nums3,
							 markPoint: {
                                    data: [
                                        {type : 'max', name: '最大值'},
                                        {type : 'min', name: '最小值'}
                                    ]
                             },
                             itemStyle: {
							normal: {
								 color: function(params) {
			                        var colorList = [
			                          '#99CCCC','#99CC33','#FFCC99','#CCCCFF'
			                        ];
			                        return colorList[params.dataIndex]
			                    }
							}
						   },
							
						} ],
				
						 toolbox: {
                            show: true,
                            feature: {
                                dataView: {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
					});
	
				}
	
			},
			error : function(errorMsg) {
				//请求失败时执行该函数
				alert("图表请求数据失败!");
				myChart3.hideLoading();
			}
		})
	</script>
</body>
</html>
