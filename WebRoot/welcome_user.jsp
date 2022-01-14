<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<title>学生主页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="shortcut icon" href="./images/icon.png">
<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>

</head>
<body class="is-preload">
	<!--  跳到通知页面-->
	<%
		if (request.getAttribute("IDforGet") != null) {
	%>
	<script type="text/javascript">
		window.location.href = "/Epidemic_System/welcome_user.jsp?#notice";
	</script>
	<%
		}
	%>
	<!--跳到个人请假记录页面-->
	<%
		if (request.getAttribute("IDforLeave") != null) {
	%>
	<script type="text/javascript">
		window.location.href = "/Epidemic_System/welcome_user.jsp?#leave";
	</script>
	<%
		}
	%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="content">
				<div class="inner">
					<h2>学生端</h2>
					<h1>
						<%
							out.print(session.getAttribute("NowUser"));
						%>
					</h1>
					<p>登录成功，欢迎使用校园疫情防控系统</p>
				</div>
			</div>
			<nav>
				<ul>
					<li>
						<a href="#noschool_report">离校生打卡</a>
					</li>
					<li>
						<a href="#isschool_report">在校生打卡</a>
					</li>
					<li>
						<a href="http://localhost:8080/Epidemic_System/NoticeServlet">通&emsp;知</a>
					</li>
					<li>
						<a href="http://localhost:8080/Epidemic_System/LeaveServlet">请销假</a>
					</li>
					<li>
						<a href="#about">开发者</a>
					</li>
				</ul>
			</nav>
		</header>

		<!-- Main -->
		<div id="main">

			<!-- Report -->
			<article id="noschool_report">
				<h2 class="major">非在校生健康打卡</h2>
				<form method="post" action="/Epidemic_System/ReportOutServlet">
					<div class="fields">
						<div class="field">
							<label for="temperature">填报时体温:</label>
							<select id="temperature" name="temperature" onchange="selecttemp()">
								<option value="36.0">36.0</option>
								<option value="36.1">36.1</option>
								<option value="36.2">36.2</option>
								<option value="36.3">36.3</option>
								<option value="36.4">36.4</option>
								<option value="36.5">36.5</option>
								<option value="36.6">37.6</option>
								<option value="36.7">36.7</option>
								<option value="36.8">36.8</option>
								<option value="36.9">36.9</option>
								<option value="37.0">37.0</option>
								<option value="37.1">37.1</option>
								<option value="37.2">37.2</option>
								<option value="37.3">37.3</option>
							</select>
						</div>
						<div class="field">
							<label for="codeState">填报时健康码状态:</label>
							<select id="codeState" name="codeState" onchange="selectcode()">
								<option value="绿码">绿码</option>
								<option value="黄码">黄码</option>
								<option value="红码">红码</option>
							</select>
						</div>
						<div class="field">
							<label for="dosage">已接种新冠疫苗针数:</label>
							<select id="dosage" name="dosage" onchange="selectvaccine()">
								<option value="0">0剂</option>
								<option value="1">1剂</option>
								<option value="2">2剂</option>
								<option value="3">3剂或及以上</option>
							</select>
						</div>
						<div class="field">
							<label for="isSick">是否出现呼吸道感染或发热症状:</label>
						</div>
						<div class="field half">
							<input type="radio" id="isSick" name="isSick" value="1" />
							是
						</div>
						<div class="field half">
							<input type="radio" id="isSick" name="isSick" value="0" />
							否
						</div>
						<div class="field">
							<label for="isIsolated">是否正处于隔离:</label>
						</div>
						<div class="field half">
							<input type="radio" name="isIsolated" value="1" />
							是
						</div>
						<div class="field half">
							<input type="radio" name="isIsolated" value="0" />
							否
						</div>
						<div class="field">
							<label for="isDangerous">所在地是否为中高风险地区:</label>
						</div>
						<div class="field half">
							<input type="radio" name="isDangerous" value="1" />
							是
						</div>
						<div class="field half">
							<input type="radio" name="isDangerous" value="0" />
							否
						</div>
						<div class="field">
							<label for="address">家庭住址:</label>
							<input type="text" name="address" />
						</div>
						<div class="field">
							<label for="extraInfo">思想状态及其他需要上报的信息:</label>
							<input type="text" name="extraInfo" height=20rem />
						</div>
						<div class="field">
							<input type="radio" />
							本人承诺以上内容填写真实可靠
						</div>
					</div>
					<input type="hidden" name="reportTime"
						value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
					<ul class="actions">
						<li>
							<input type="submit" value="提 交" class="primary" />
						</li>
						<li>
							<input type="reset" value="重 置" />
						</li>
					</ul>
				</form>
				<!--  form end-->
			</article>

			<article id="isschool_report">
				<h2 class="major">在校生健康打卡</h2>
				<form  name="reportin" onsubmit="return Form2()" method="post" action="/Epidemic_System/ReportInServlet">
					<div class="fields">
						<div class="field">
							<label for="Intemperature">填报时体温:</label>
							<select id="Intemperature" name="temperature" onchange="selecttemp()">
								<option value="36.0">36.0</option>
								<option value="36.1">36.1</option>
								<option value="36.2">36.2</option>
								<option value="36.3">36.3</option>
								<option value="36.4">36.4</option>
								<option value="36.5">36.5</option>
								<option value="36.6">36.6</option>
								<option value="36.7">36.7</option>
								<option value="36.8">36.8</option>
								<option value="36.9">36.9</option>
								<option value="37.0">37.0</option>
								<option value="37.1">37.1</option>
								<option value="37.2">37.2</option>
								<option value="37.3">37.3</option>
							</select>
						</div>
						<div class="field">
							<label for="InisSick">是否出现呼吸道感染或发热症状:</label>
						</div>
						<div class="field half">
							<input type="radio" id="InisSick" name="isSick" value="1" />
							是
						</div>
						<div class="field half">
							<input type="radio" id="InisSick" name="isSick" value="0" />
							否
						</div>

						<div class="field">
							<input type="radio" id="Incheck" />
							本人承诺以上内容填写真实可靠
							<input type="hidden" name="reportTime" id="InreportTime"
								value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
						</div>

					</div>
					<ul class="actions">
						<li>
							<input type="submit" value="提 交" class="primary" />
						</li>
						<li>
							<input type="reset" value="重 置" />
						</li>
					</ul>
				</form>
			</article>

			<!-- Notice -->
			<article id="notice">
				<h3 class="major">最新通知</h3>
				<!-- <p class="notice text"> -->

				<div>
					<h2 align="center">${notice.noticeTitle }</h2>
				</div>
				<div align="right">发布时间：${notice.outTime}</div>
				<p class="notice text">${notice.noticeContent}</p>
				<!-- </p> -->
				<h3 class="major">历史通知</h3>
				<nav>
					<ul>
						<c:set var="startIndex" value="${fn:length(allList)-1 }"></c:set>
						<c:forEach var="noticeItem" items="${allList }" varStatus="status">
							<li>
								<a href="NoticeServlet?noticeID=${allList[startIndex - status.index].noticeID}"
									title="${allList[startIndex - status.index].noticeTitle }"> ${allList[startIndex - status.index].outTime}&emsp;&emsp;${allList[startIndex - status.index].noticeTitle }

								</a>
							</li>
						</c:forEach>
					</ul>
				</nav>
			</article>

			<!-- Leave -->
			<article id="leave">
				<form method="post" action="#">
					<div class="fields">
						<div class="field half">
							<h2 class="major">请假记录</h2>
						</div>
						<div class="field half add">
							<button onclick="window.location.href='#addleave'" type="button" id="add">新&emsp;增</button>
						</div>
					</div>
				</form>
				<table>
					<tr>
						<th>离校时间</th>
						<th>返校时间</th>
						<th>请假事由</th>
						<th>特殊情况</th>
						<th>附加说明</th>
						<th>审批状态</th>
					</tr>
					<c:forEach items="${PageInfo.list}" var="pi">
						<tr>
							<td>${pi.outDate}</td>
							<td>${pi.returnDate}</td>
							<td>${pi.outThing}</td>
							<td>${pi.situation}</td>
							<td name="hideTd">${pi.note}</td>
							<td>${pi.state}</td>
						</tr>
					</c:forEach>
					<c:set var="currentP" value="${PageInfo.pageNum}" />
					<c:set var="tot" value="${PageInfo.pages}" />
					<%
						int currentP = -1;
						if (pageContext.getAttribute("currentP") != null) {
							currentP = (Integer) pageContext.getAttribute("currentP");
						}
					%>
					<%
						int tot = -1;
						if (pageContext.getAttribute("tot") != null) {
							tot = (Integer) pageContext.getAttribute("tot");
						}
					%>
					<!--首页，但不是尾页  -->
					<%
						if (currentP == 1 && currentP != tot) {
					%>
					<tr>
						<td><div>
								<a href="LeaveServlet?pageNum=${PageInfo.pageNum+1}">下一页</a>
								<a href="LeaveServlet?pageNum=${PageInfo.pages}">尾页</a>
							</div></td>
					</tr>
					<!--中间页  -->
					<%
						} else if (currentP > 1 && currentP != tot) {
					%>
					<tr>
						<td><div>
								<a href="LeaveServlet?pageNum=${PageInfo.pageNum-1}">上一页</a>
								<a href="LeaveServlet?pageNum=${PageInfo.pageNum+1}">下一页</a>
								<a href="LeaveServlet?pageNum=${PageInfo.pages}">尾页</a>
							</div></td>
					</tr>
					<!-- 首页，也是尾页 -->
					<%
						} else if (currentP == tot && tot == 1) {
					%>
					<tr>
						<td><div>
								<a href="LeaveServlet?pageNum=1">首页</a>
							</div></td>
					</tr>
					<!-- 尾页，且不是首页 -->
					<%
						} else if (currentP == tot && tot > 1) {
					%>
					<tr>
						<td><div>
								<a href="LeaveServlet?pageNum=1">首页</a>
								<a href="LeaveServlet?pageNum=${PageInfo.pageNum-1}">上一页</a>
							</div></td>
					</tr>
					<%
						}
					%>

				</table>
			</article>
			<article id="addleave">
				<h2 class="major">填写请假信息</h2>
				<form method="post" action="/Epidemic_System/AddLeaveServlet">
					<div class="fields">
						<div class="field">
							<label for="leavedate">申请出校时间:</label>
							<input type="datetime-local" id="outDate" name="outDate" step="1" />
						</div>
						<div class="field">
							<label for="backdate">预计返校时间:</label>
							<input type="datetime-local" id="returnDate" name="returnDate" step="1" />
						</div>
						<div class="field">
							<label for="leavetype">外出事由类型:</label>
							<select id="outThing" name="outThing" onchange="selecttype()">
								<option value="请假返家">请假返家</option>
								<option value="外出就医">外出就医</option>
								<option value="物资购置">物资购置</option>
								<option value="其他原因">其他原因</option>
							</select>
						</div>
						<div class="field">
							<label for="leavespecial">是否有以下情形:</label>
						</div>
						<div class="field fifth">
							<input type="radio" name="situation" value="外宿" />
							外宿
						</div>
						<div class="field fifth">
							<input type="radio" name="situation" value="离宁" />
							离宁
						</div>
						<div class="field fifth">
							<input type="radio" name="situation" value="重疾" />
							重疾
						</div>
						<div class="field fifth">
							<input type="radio" name="situation" value="其他" />
							其他
						</div>
						<div class="field fifth">
							<input type="radio" name="situation" value="无" checked="1" />
							无
						</div>
						<div class="field">
							<label for="supplement">附加信息:</label>
							<input type="text" name="note" rows="4" />
						</div>
					</div>
					<!-- 同时提交学号&姓名 -->
					<input type="hidden" name="userID" value="<%=session.getAttribute("userID")%>">
					<input type="hidden" name="userName" value="<%=session.getAttribute("NowUser")%>">
					<ul class="actions">
						<li>
							<input type="submit" value="提&emsp;交" class="primary" />
						</li>
						<li>
							<input type="reset" value="重&emsp;置" />
						</li>
					</ul>
				</form>
			</article>

			<!-- About -->
			<article id="about">
				<h2 class="major">Contact US</h2>
				<form method="post" action="#">
					<div class="fields">
						<div class="field half">
							<label>前端开发人员:&emsp;蔡瑾瑶 &emsp;学号：919106840501</label>
							<label>后端开发人员:&emsp;周运莲 &emsp;学号：919106840212</label>
							<label>email:&emsp;1638621112@qq.com</label>
						</div>
					</div>
				</form>
			</article>
			<!--  修改个人信息-->
			<article id="change">
				<h2 class="major">修改个人信息</h2>
				<form method="post" action="" onsubmit="return UpdateUser()">
					<div class="fields">
						<div class="field">
							<label>密码:</label>
							<input type="password" name="userPwd" id="userPwd" />
						</div>
						<div class="field">
							<label>确认密码:</label>
							<input type="password" name="userPwd2" id="userPwd2" />
						</div>
						<div class="field">
							<label>手机号:</label>
							<input type="text" name="userPhone" id="userPhone" />
						</div>
					</div>
					<ul class="actions">
						<li>
							<input type="submit" value="提&emsp;交" class="primary" />
						</li>
						<li>
							<input type="reset" value="重&emsp;置" />
						</li>
					</ul>
				</form>
			</article>

		</div>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				Copyright &copy;
				<script>
                 document.write(new Date().getFullYear());
             </script>
				All rights reserved by 周运莲&蔡瑾瑶 From NJUST
			</p>
		</footer>
		<div class="asidebutton">
			<a href="#change" type="button">修改信息</a>
			&emsp;
			<a href="index.jsp" type="button">退出登录</a>
			<!-- <button onclick="window.location.href='#change'" type="button" id="add">修改信息</button>
			<button onclick="window.location.href='index.jsp'" type="button" id="logout">退出登录</button> -->
		</div>

	</div>

	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
		function Form2() {
			console.log("hhhhhh");
			var Intemperature = $("#Intemperature").val();
			var InisSick = $("#InisSick").val();
			var Incheck = $("#Incheck").val();
			var InreportTime=$("#InreportTime").val();
			console.log("check: "+Incheck);
			if ( Intemperature== null || Intemperature == ""||InisSick==null||InisSick==""||Incheck==null||Incheck=="") {
				alert("请填写完整");
				console.log("fffff");
				return false;
			} else{
				console.log("fffff");
				return true;
			}
		<%-- 	$.ajax({
				type : "post", //请求类型
				url : "<%=request.getContextPath()%>/ReportInServlet", //请求地址
				async : false,
				data : {
					temperature : Intemperature,
					isSick : InisSick,
					reportTime:InreportTime					
				}, //传入后端Controller的参数
				success : function(msg0) { //这里的msg是后台返回的值
					if (msg0 == "success") {
						/* location.reload(); */
						alert("今日打卡成功，请明日继续");
						/* 重新打开一个页面 */
						window.reload();
					} else {
						alert("打卡失败");
						
					}
				}
			}); --%>
		}
</script>
	<script type="text/javascript">
		function bindingsClickHide(options) {
			console.log("bindingsClickHide");
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
	<script type="text/javascript">
		function UpdateUser() {
			var ajaxFlag = true;
			var userPwd = $("#userPwd").val();
			var userPwd2 = $("#userPwd2").val();
			var userPhone = $("#userPhone").val();
			if (userPwd == null || userPwd == "") {
				alert("新密码不能为空");return false;
			}
			if (userPwd2 == null || userPwd2 == "") {
				alert("请再次输入密码");return false;
			}
			if (userPhone == null || userPhone == "") {
				alert("联系方式不能为空");return false;
			}
			if (userPwd != userPwd2) {
				alert("前后两次密码不一致,请重新输入");return false;
			}
			$.ajax({
				type : "post", //请求类型
				url : "<%=request.getContextPath()%>/UpdateUserServlet", //请求地址
				async : false,
				data : {
					userPwd : userPwd,
					userPhone : userPhone
				}, //传入后端Controller的参数
				success : function(msg0) { //这里的msg是后台返回的值
					if (msg0 == "success") {
						/* location.reload(); */
						alert("个人信息修改成功,请重新登录");
						/* 重新打开一个页面 */
						window.close();
						window.open('http://localhost:8080/Epidemic_System/index.jsp');
					} else {
						alert("修改成功，修改后信息与原信息一致，信息未发生变化，请重新登录");
						window.open('http://localhost:8080/Epidemic_System/index.jsp');
					}
				}
			});
		}
	</script>
</body>
</html>