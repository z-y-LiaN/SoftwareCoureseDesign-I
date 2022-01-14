<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'reportiin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
	function Form() {
		var temperature = document.forms["reportin"]["temperature"].value;
		var isSick = document.forms["reportin"]["isSick"].value;
		var check = document.forms["reportin"]["check"].value;
		if ( temperature== null || temperature == ""||isSick==null||isSick==""||check==null||check=="") {
			alert("请填写完整");
			return false;
		} else 
			return true;
	}
</script>

</head>

<body>
	在校学生打卡登录测试
	<br>
	<form name="reportin" onsubmit="return Form()" method="post" action="/Epidemic_System/ReportInServlet"  >
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
		<label>
			<input type="checkbox" name="check">
			保证如实提交
		</label>
		<input type="submit" value="确认提交"
			style="align:center;padding:10px;background-color:#CDC673;border:1px solid black;border-radius:4px;cursor:pointer; ">
		<!-- </center> -->
	</form>
</body>
</html>
