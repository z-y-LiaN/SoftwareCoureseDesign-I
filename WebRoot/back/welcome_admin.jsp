<%@page import="com.github.pagehelper.PageInfo"%>
<%@page import="com.mysql.jdbc.PingTarget"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/pintuer.css">
<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/admin.css">
<script src="<%=path%>/back/js/jquery.js"></script>
<script src="<%=path%>/back/js/pintuer.js"></script>
<!-- 1.引入 echarts.js -->
<script type="text/javascript" src="<%=path%>/back//echarts/echarts.min.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div style="height:40px; background:#99CCCC">
			<h2 align="center">
				<font color="white">欢迎进入辅导员后台管理系统</font>
			</h2>
		</div>

	</div>
	<div>
		<div class="body-content">
			<jsp:include page="chartjsps/report_7days.jsp" />
		</div>
		<jsp:include page="chartjsps/stu_class.jsp" />
		<jsp:include page="chartjsps/leavethings.jsp" />
		<jsp:include page="chartjsps/leavestate.jsp" />
	</div>
	<!--
	<script type="text/javascript">
		var myChart1 = echarts.init(document.getElementById('main1'));
		//3.初始化，默认显示标题，图例和xy空坐标轴
		myChart1.setOption({
			title : {
				text : '近七天打卡人次统计'
			},
			grid: [
        {x: '7%', y: '7%', width: '38%', height: '38%'},//折线图位置控制
    ],
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
		myChart1.showLoading(); //数据加载完之前先显示一段简单的loading动画

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

					myChart1.hideLoading(); //隐藏加载动画
					//9.覆盖操作-根据数据加载数据图表
					myChart1.setOption({
						xAxis : {
							data : names,
							axisLabel:{
                       			 interval:0,
                       			 rotate:-20
                   			 },
						},
						series : [ {
							name : '人次', // 根据名字对应到相应的数据
							data : nums,
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
				myChart1.hideLoading();
			}
		})
	</script>
饼状图 
<script type="text/javascript">
	//基于准备好的dom，初始化echarts实例
                    var myChart2 = echarts.init(document.getElementById('main2'));
                    myChart2.clear(); 
                    var names2 = [];
                    var nums2 = [];
		    $.ajax({
                        method: 'post',
                        async : true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                        url: '/Epidemic_System/ChartTwoServlet',
                        dataType: 'json',
                        success: function (datas) {
                            for (var i=0;i<datas.length;i++){
                                names2.push(datas[i].name);
                                nums2.push(datas[i].num);
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
                                    /* orient: 'vertical',
                                    left: 'left', */
                                     orient: 'horizontal',      // 布局方式，默认为水平布局，可选为：
                                   // 'horizontal' ¦ 'vertical'
        x: 'center',               // 水平安放位置，默认为全图居中，可选为：
                                   // 'center' ¦ 'left' ¦ 'right'
                                   // ¦ {number}（x坐标，单位px）
        y: 'top',                  // 垂直安放位置，默认为全图顶端，可选为：
                                   // 'top' ¦ 'bottom' ¦ 'center'
                                   // ¦ {number}（y坐标，单位px）
                                    data: names2
                                },
                                series: [
                                    {
                                        name: '所在班级',
                                        type: 'pie',
                                        radius: '55%',
                                        center: ['18%', '75%'],
                                        data: nums2,
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
			    // 使用刚指定的配置项和数据显示图表。
                            myChart2.setOption(option,true);
                        }                   
                    });
   </script> -->
</body>
</html>
