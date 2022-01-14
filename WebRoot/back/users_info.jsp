<%@page import="com.github.pagehelper.PageInfo"%>
<%@page import="com.mysql.jdbc.PingTarget"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
</head>
<body>
	<!-- ---------------------------------- 分分分咯咯咯咸咸咸----------------------------------------->
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 学生信息</strong>
		</div>
		<div class="mybody-content">
			<div class="padding border-bottom">
				<ul class="search">
					<li style="text-align:center">
						<form method="post" action="/Epidemic_System/SearchStuByKeyServlet">
							<input type="text" placeholder="请输入信息" name="infoString" id="infoString" class="input"
								style="width:250px; line-height:17px;display:inline-block" />
							<input type="submit" class="button border-green icon-search" value="信息搜索" />
						</form>
					</li>
				</ul>
			</div>
			<form method="post" action="">
				<table class="fl-table">
					<thead>
						<tr>
							<th>姓名</th>
							<th>学号</th>
							<th>班级</th>
							<th>联系方式</th>
						</tr>
					</thead>
					<c:forEach items="${PageInfo.list}" var="pi">
						<tr>
							<%-- <td>${pi.userName}</td> --%>
							<%-- <td>${pi.userID}</td>
							<td>${pi.classNum}</td>
							<td>${pi.userPhone}</td> --%>
							<td>${fn:replace(pi.userName, lightkey, "<font color='red'>".concat(lightkey).concat("</font>") )}</td>
							<td>${fn:replace(pi.userID, lightkey, "<font color='red'>".concat(lightkey).concat("</font>") )}</td>
							<td>${fn:replace(pi.classNum, lightkey, "<font color='red'>".concat(lightkey).concat("</font>") )}</td>
							<td>${fn:replace(pi.userPhone, lightkey, "<font color='red'>".concat(lightkey).concat("</font>") )}</td>
						</tr>
					</c:forEach>
					<c:set var="currentP" value="${PageInfo.pageNum}" />
					<c:set var="tot" value="${PageInfo.pages}" />
					<%
						int currentP = (Integer) pageContext.getAttribute("currentP");
					%>
					<%
						int tot = (Integer) pageContext.getAttribute("tot");
					%>
					<!--首页，但不是尾页  -->
					<%
						if (currentP == 1 && currentP != tot) {
					%>
					<tr>
						<td colspan="8"><div class="pagelist">
								<a href="UsersInfoServlet?pageNum=${PageInfo.pageNum+1}">下一页</a>
								<a href="UsersInfoServlet?pageNum=${PageInfo.pages}">尾页</a>
							</div></td>
					</tr>
					<!--中间页  -->
					<%
						} else if (currentP > 1 && currentP != tot) {
					%>
					<tr>
						<td colspan="8"><div class="pagelist">
								<a href="UsersInfoServlet?pageNum=${PageInfo.pageNum-1}">上一页</a>
								<a href="UsersInfoServlet?pageNum=${PageInfo.pageNum+1}">下一页</a>
								<a href="UsersInfoServlet?pageNum=${PageInfo.pages}">尾页</a>
							</div></td>
					</tr>
					<!-- 首页，也是尾页 -->
					<%
						} else if (currentP == tot && tot == 1) {
					%>
					<tr>
						<td colspan="8"><div class="pagelist">
								<a href="UsersInfoServlet?pageNum=1">首页</a>
							</div></td>
					</tr>
					<!-- 尾页，且不是首页 -->
					<%
						} else if (currentP == tot && tot > 1) {
					%>
					<tr>
						<td colspan="8"><div class="pagelist">
								<a href="UsersInfoServlet?pageNum=1">首页</a>
								<a href="UsersInfoServlet?pageNum=${PageInfo.pageNum-1}">上一页</a>
							</div></td>
					</tr>
					<%
						}
					%>
				</table>
				<p align="center">一共${PageInfo.pages}页&emsp;当前是${PageInfo.pageNum}页</p>
			</form>
		</div>
	</div>
	<!-- ---------------------------------- 分分分咯咯咯咸咸咸-----下面是添加学生信息------------------------------------>

</body>
</html>
