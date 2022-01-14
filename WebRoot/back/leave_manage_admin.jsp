<%@page import="com.github.pagehelper.PageInfo"%>
<%@page import="com.mysql.jdbc.PingTarget"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
	<form method="post" action="">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder">请假单管理</strong>
			</div>
			<div class="padding border-bottom"></div>
			<table class="fl-table">
				<thead>
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>申请出校时间</th>
						<th>申请返校时间</th>
						<th>请假事由</th>
						<th>特殊情况</th>
						<th>附加信息</th>
						<th>审核状态</th>
					</tr>
				</thead>
				<c:set var="startIndex" value="${fn:length(PageInfo.list)-1 }"></c:set>
				<c:forEach var="person" items="${PageInfo.list}" varStatus="status">
					<tr>
						<td>${PageInfo.list[startIndex - status.index].userID }</td>
						<td>${PageInfo.list[startIndex - status.index].userName }</td>
						<td>${PageInfo.list[startIndex - status.index].outDate}</td>
						<td>${PageInfo.list[startIndex - status.index].returnDate }</td>
						<td>${PageInfo.list[startIndex - status.index].outThing }</td>
						<td>${PageInfo.list[startIndex - status.index].situation }</td>
						<td name="hideTd">${PageInfo.list[startIndex - status.index].note }</td>
						<c:if test="${(PageInfo.list[startIndex - status.index].state == '审核通过')}">
							<!--审核通过-->
							<td><div class="button-group">
									<a class="button border-green">${PageInfo.list[startIndex - status.index].state}</a>
								</div></td>
						</c:if>
						<c:if test="${(PageInfo.list[startIndex - status.index].state == '审核拒绝')}">
							<!--审核拒绝-->
							<td><div class="button-group">
									<a class="button border-red">${PageInfo.list[startIndex - status.index].state}</a>
								</div></td>
						</c:if>
						<c:if test="${(PageInfo.list[startIndex - status.index].state == '待审核')}">
							<!--待审核-->
							<td><div class="button-group">
									<a class="button border-yellow">${PageInfo.list[startIndex - status.index].state}</a>
								</div></td>
						</c:if>
					</tr>
				</c:forEach>
				<%--         
      			<c:forEach items="${PageInfo.list}" var="pi">
      			<c:set var="checkstate" value="${pi.state}"/>
      			<%String ckstate=(String)pageContext.getAttribute("checkstate");/* out.print(ckstate);  */%>
					<tr>
						<td>${pi.userID}</td>
						<td>${pi.userName}</td>
						<td>${pi.outDate}</td>
						<td>${pi.returnDate}</td>
						<td>${pi.outThing}</td>
						<td>${pi.situation}</td>
						<td name="hideTd">${pi.note}</td>
						
						<c:if test="${(pi.state == '审核通过')}"><!--审核通过-->
								<td><div class="button-group"> 
								<a class="button border-green">${pi.state}</a>
								</div></td>
						</c:if>
						<c:if test="${(pi.state == '审核拒绝')}"><!--审核拒绝-->
								<td><div class="button-group"> 
								<a class="button border-red">${pi.state}</a>
								</div></td>
						</c:if>
						<c:if test="${(pi.state == '待审核')}"> <!--待审核-->
								<td><div class="button-group"> 
								<a class="button border-yellow">${pi.state}</a>
								</div></td>
						</c:if>
					</tr>
				</c:forEach>   --%>

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
							<a href="ManageLeaveByPageServlet?pageNum=${PageInfo.pageNum+1}">下一页</a>
							<a href="ManageLeaveByPageServlet?pageNum=${PageInfo.pages}">尾页</a>
						</div></td>
				</tr>
				<!--中间页  -->
				<%
					} else if (currentP > 1 && currentP != tot) {
				%>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="ManageLeaveByPageServlet?pageNum=${PageInfo.pageNum-1}">上一页</a>
							<a href="ManageLeaveByPageServlet?pageNum=${PageInfo.pageNum+1}">下一页</a>
							<a href="ManageLeaveByPageServlet?pageNum=${PageInfo.pages}">尾页</a>
						</div></td>
				</tr>
				<!-- 首页，也是尾页 -->
				<%
					} else if (currentP == tot && tot == 1) {
				%>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="ManageLeaveByPageServlet?pageNum=1">首页</a>
						</div></td>
				</tr>
				<!-- 尾页，且不是首页 -->
				<%
					} else if (currentP == tot && tot > 1) {
				%>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="ManageLeaveByPageServlet?pageNum=1">首页</a>
							<a href="ManageLeaveByPageServlet?pageNum=${PageInfo.pageNum-1}">上一页</a>
						</div></td>
				</tr>
				<%
					}
				%>

			</table>
			<p align="center">一共${PageInfo.pages}页&emsp;当前是${PageInfo.pageNum}页</p>
		</div>
	</form>

	<script type="text/javascript">
		function bindingsClickHide(options) {
			debugger;
			options.addClass("td1-hide");
			options.click(function() {
				debugger;
				if ($(this).attr("class").indexOf("td1-hide") < 0) {
					$(this).removeClass("td2-show");
					$(this).addClass("td1-hide");
	
				} else {
					$(this).removeClass("td1-hide");
					$(this).addClass("td2-show");
				}
			});
		}
	
	
		bindingsClickHide($("[name = 'hideTd']"));
	</script>
</body>
</html>