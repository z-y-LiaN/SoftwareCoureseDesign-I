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
</head>
<body>
	<!--页面开始  -->
	<!--  未打卡学生-->
	<div class="panel admin-panel margin-top">
		<div class="panel-head" id="add">
			<strong><span class="icon-reorder"></span> 今日暂未打卡总记录</strong>
		</div>
		<div class="body-content">
			<div class="padding border-bottom ">
				<ul>
					<li>
						<a href="http://localhost:8080/Epidemic_System/ExportExcelServlet" class="button border-green"
							align="center">
							<span class="icon-download"></span> 导出未打卡学生名单
						</a>
					</li>
				</ul>
			</div>
			<table class="fl-table">
				<thead>
					<tr>
						<th>姓名</th>
						<th>学号</th>
						<th>班级</th>
						<th>联系方式</th>
					</tr>
				</thead>
				<c:forEach items="${nolist}" var="npi">
					<tr>
						<td>${npi.userName}</td>
						<td>${npi.userID}</td>
						<td>${npi.classNum}</td>
						<td>${npi.userPhone}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!--在校学生今日打卡  -->
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 在校学生-今日打卡总记录</strong>
		</div>
		<div class="body-content">
			<form method="post" action="">
				<table class="fl-table">
					<thead>
						<tr>
							<th>学号</th>
							<th>体温</th>
							<th>是否出现发热症状</th>
							<th>上报时间</th>
						</tr>
					</thead>
					<c:forEach items="${InPageInfo.list}" var="ipi">
						<tr>
							<td>${ipi.userID}</td>
							<td>${ipi.temperature}</td>
							<c:if test="${ipi.isSick==0}">
								<td>否</td>
							</c:if>
							<c:if test="${ipi.isSick==1}">
								<td>是</td>
							</c:if>
							<%-- <td>${ipi.isSick}</td>  --%>
							<td>${ipi.reportTime}</td>
						</tr>
					</c:forEach>
					<c:set var="currentP" value="${InPageInfo.pageNum}" />
					<c:set var="tot" value="${InPageInfo.pages}" />
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
								<a href="ReportTodayServlet?pageNum=${InPageInfo.pageNum+1}">下一页</a>
								<a href="ReportTodayServlet?pageNum=${InPageInfo.pages}">尾页</a>
							</div></td>
					</tr>
					<!--中间页  -->
					<%
						} else if (currentP > 1 && currentP != tot) {
					%>
					<tr>
						<td colspan="8"><div class="pagelist">
								<a href="ReportTodayServlet?pageNum=${InPageInfo.pageNum-1}">上一页</a>
								<a href="ReportTodayServlet?pageNum=${InPageInfo.pageNum+1}">下一页</a>
								<a href="ReportTodayServlet?pageNum=${InPageInfo.pages}">尾页</a>
							</div></td>
					</tr>
					<!-- 首页，也是尾页 -->
					<%
						} else if (currentP == tot && tot == 1) {
					%>
					<tr>
						<td colspan="8"><div class="pagelist">
								<a href="ReportTodayServlet?pageNum=1">首页</a>
							</div></td>
					</tr>
					<!-- 尾页，且不是首页 -->
					<%
						} else if (currentP == tot && tot > 1) {
					%>
					<tr>
						<td colspan="8"><div class="pagelist">
								<a href="ReportTodayServlet?pageNum=1">首页</a>
								<a href="ReportTodayServlet?pageNum=${InPageInfo.pageNum-1}">上一页</a>
							</div></td>
					</tr>
					<%
						}
					%>

				</table>
				<p align="center">一共${InPageInfo.pages}页&emsp;当前是${InPageInfo.pageNum}页</p>
			</form>
		</div>
	</div>
	<!--一条华丽可爱的分割线线线线线线线线  -->
	<!-- 非在校学生今日打卡 -->
	<div class="panel admin-panel margin-top">
		<div class="panel-head" id="add">
			<strong><span class="icon-reorder"></span> 离校学生-今日打卡总记录</strong>
		</div>
		<div class="body-content">
			<!--start form  -->
			<form method="post" action="">
				<table class="fl-table">
					<thead>
						<tr>
							<th>学号</th>
							<th>体温</th>
							<th>是否出现发热症状</th>
							<th>上报时间</th>
							<th>苏康码状态</th>
							<th>已接种疫苗/剂</th>
							<th>是否处于隔离状态</th>
							<th>是否位于中高风险区</th>
							<th>家庭住址</th>
							<th>思想状况及其他上报信息</th>
						</tr>
					</thead>
					<c:forEach items="${OuPageInfo.list}" var="opi">
						<tr>
							<td>${opi.userID}</td>
							<td>${opi.temperature}</td>
							<c:if test="${opi.isSick==0}">
								<td>否</td>
							</c:if>
							<c:if test="${opi.isSick==1}">
								<td>是</td>
							</c:if>
							<%-- <td>${opi.isSick}</td> --%>
							<td>${opi.reportTime}</td>
							<td>${opi.codeState}</td>
							<td>${opi.dosage}</td>
							<c:if test="${opi.isIsolated==0}">
								<td>否</td>
							</c:if>
							<c:if test="${opi.isIsolated==1}">
								<td>是</td>
							</c:if>
							<%-- <td>${opi.isIsolated}</td> --%>
							<c:if test="${opi.isDangerous==0}">
								<td>否</td>
							</c:if>
							<c:if test="${opi.isDangerous==1}">
								<td>是</td>
							</c:if>
							<%-- <td>${opi.isDangerous}</td> --%>
							<td>${opi.address}</td>
							<td>${opi.extraInfo}</td>
						</tr>
					</c:forEach>
					<c:set var="currentPo" value="${OuPageInfo.pageNum}" />
					<c:set var="toto" value="${OuPageInfo.pages}" />
					<%
						int currentPo = (Integer) pageContext.getAttribute("currentPo");
					%>
					<%
						int toto = (Integer) pageContext.getAttribute("toto");
					%>
					<!--首页，但不是尾页  -->
					<%
						if (currentPo == 1 && currentPo != toto) {
					%>
					<tr>
						<td colspan="10"><div class="pagelist">
								<a href="ReportTodayServlet?pageNum2=${OuPageInfo.pageNum+1}">下一页</a>
								<a href="ReportTodayServlet?pageNum2=${OuPageInfo.pages}">尾页</a>
							</div></td>
					</tr>
					<!--中间页  -->
					<%
						} else if (currentPo > 1 && currentPo != toto) {
					%>
					<tr>
						<td colspan="10"><div class="pagelist">
								<a href="ReportTodayServlet?pageNum2=${OuPageInfo.pageNum-1}">上一页</a>
								<a href="ReportTodayServlet?pageNum2=${OuPageInfo.pageNum+1}">下一页</a>
								<a href="ReportTodayServlet?pageNum2=${OuPageInfo.pages}">尾页</a>
							</div></td>
					</tr>
					<!-- 首页，也是尾页 -->
					<%
						} else if (currentPo == toto && toto == 1) {
					%>
					<tr>
						<td colspan="10"><div class="pagelist">
								<a href="ReportTodayServlet?pageNum2=1">首页</a>
							</div></td>
					</tr>
					<!-- 尾页，且不是首页 -->
					<%
						} else if (currentPo == toto && toto > 1) {
					%>
					<tr>
						<td colspan="10"><div class="pagelist">
								<a href="ReportTodayServlet?pageNum2=1">首页</a>
								<a href="ReportTodayServlet?pageNum2=${OuPageInfo.pageNum-1}">上一页</a>
							</div></td>
					</tr>
					<%
						}
					%>
				</table>
				<p align="center">一共${OuPageInfo.pages}页&emsp;当前是${OuPageInfo.pageNum}页</p>
			</form>

		</div>
	</div>

</body>
</html>
