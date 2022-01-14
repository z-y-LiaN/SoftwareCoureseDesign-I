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
<title>请假信息列表</title>
<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/pintuer.css">
<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/admin.css">
<script src="<%=path%>/back/js/jquery.js"></script>
<script src="<%=path%>/back/js/pintuer.js"></script>
<link rel="shortcut icon" href="<%=path%>/back//images/logo.jpg">
<title>Insert title here</title>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 请假列表</strong>
		</div>
		<div class="padding border-bottom"></div>
		<table class="fl-table">
			<thead>
				<tr>
					<th>学号</th>
					<th>学号</th>
					<th>申请出校时间</th>
					<th>申请返校时间</th>
					<th>请假事由</th>
					<th>情况</th>
					<th>附加信息</th>
					<th>审核状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<c:forEach items="${PageInfo.list}" var="pi">
				<tr>
					<td>${pi.userID}</td>
					<td>${pi.userName}</td>
					<td>${pi.outDate}</td>
					<td>${pi.returnDate}</td>
					<td>${pi.outThing}</td>
					<td>${pi.situation}</td>
					<td name="hideTd">${pi.note}</td>
					<td>${pi.state}</td>
					<td>
						<div class="button-group">
							<a class="button border-main" href="CheckLeaveServlet?flag=1&userID=${pi.userID}"
								onclick="note()">
								<span class="icon-edit"></span> 同意
							</a>
							<a class="button border-red" href="CheckLeaveServlet?flag=2&userID=${pi.userID}">
								<span class="icon-trash-o"></span> 拒绝
							</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script type="text/javascript">
	$("[name='keywords']").each(function() {
		var n = $(this).attr("search");
		if (n.indexOf(name) == -1) {
			$(this).hide(); //隐藏不存在关键字的列表
		}
	});

	function note() {
		confirm("确认同意审批？");
	/* if (confirm("确认同意审批？")){
	}else */
	/* alert("确认同意审批？"); */
	}
</script>
</html>