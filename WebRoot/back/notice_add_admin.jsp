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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<%
	String Info = (String) request.getAttribute("INFOcode"); // 获取错误属性
	if (Info != null) {
%>
<script type="text/javascript" language="javascript">
	window.location = 'http://localhost:8080/Epidemic_System/back/notice_add_admin.jsp' ; // 跳转到登录界面
	alert("公告发布成功"); // 弹出错误信息
</script>
<%
	}
%>

<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 通知发布</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="/Epidemic_System/NoticeAddServlet">
				<div class="form-group">
					<div class="label">
						<label>通知标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input" name="noticeTitle" placeholder="请控制字数在十五字以内..." />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>通知内容：</label>
					</div>
					<div class="field">
						<textarea name="content" style="height:60%"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<input type="hidden" name="outTime"
						value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>">
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>