<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'reportout.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	非在校学生打卡登录测试
	<br>
	<form method="post" action="/Epidemic_System/ReportOutServlet">
		<select name="temperature" style="border-radius:4px">
			<option>---请选择体温---</option>
			<option value="35.0">35.0</option>
			<option value="36.0">36.0</option>
			<option value="37.0">37.0</option>
		</select>
		是否出现发热症状：
		<input type="radio" name="isSick" value="1">
		是
		<input type="radio" name="isSick" checked="checked" value="0">
		否
		<input type="hidden" name="reportTime"
			value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
		当前苏康码状态：
		<input type="radio" name="codeState" value="绿码">
		绿码
		<input type="radio" name="codeState" value="黄码">
		黄码
		<input type="radio" name="codeState" value="红码">
		红码 当前已接种新冠疫苗剂量：
		<input type="radio" name="dosage" value="0">
		0剂
		<input type="radio" name="dosage" value="1">
		1剂
		<input type="radio" name="dosage" value="2">
		2剂
		<input type="radio" name="dosage" value="3">
		3剂或及其以上 当前是否处于隔离状态：
		<input type="radio" name="isIsolated" value="0">
		是
		<input type="radio" name="isIsolated" value="1">
		否 所在地区是否为中高风险区：
		<input type="radio" name="isDangerous" value="0">
		是
		<input type="radio" name="isDangerous" value="1">
		否 当前居住地址
		<input type="text" name="address">
		附加上报信息
		<input type="text" name="extraInfo">
		<label>
			<input type="checkbox" name="check">
			保证如实提交
		</label>
		<input type="submit" value="确认提交"
			style="align:center;padding:10px;background-color:#CDC673;border:1px solid black;border-radius:4px;cursor:pointer; ">
		</center>


	</form>
</body>
</html>
