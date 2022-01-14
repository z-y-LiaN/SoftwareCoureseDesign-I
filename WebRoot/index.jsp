<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script>
	function Form() {
		var uname = document.forms["login"]["userID"].value;
		var upwd = document.forms["login"]["userPwd"].value;
		if (uname == null || uname == "") {
			alert("请填写用户名");
			return false;
		} else if (upwd == null || upwd == "") {
			alert("密码不能为空");
			return false;
		}
	}
</script>
<!-- 	<script type="text/javascript">
	window.onload=function(){
    //如果location存有数据,跳到锚点
	    var location_id='${location}';
	    if(location_id!=''){
	        document.getElementById(location_id).click();
	    }
	
	}
</script> -->

</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="content">
				<div class="inner">
					<h1>校 园 疫 情 防 控 系 统</h1>
					<p>请登录后使用</p>
				</div>
			</div>
			<nav>
				<ul>
					<li>
						<a href="#login">登&emsp;录</a>
					</li>
				</ul>
			</nav>
		</header>

		<!-- Main -->
		<div id="main">

			<!-- Login -->
			<article id="login">
				<h2 class="major">校园内疫情防控系统</h2>
				<form name="login" onsubmit="return Form()" method="post" action="/Epidemic_System/LoginServlet">
					<div class="fields">
						<div class="field">
							<label for="name">账号:</label>
							<input type="text" name="userID" placeholder="请输入学工号..." />
						</div>
						<div class="field">
							<label for="password">密&emsp;码:</label>
							<input type="password" name="userPwd" placeholder="请输入密码..." />
						</div>
						<div class="field">
							<label for="student">请选择身份:</label>
						</div>
						<div class="field half">
							<input type="radio" name="type" checked="checked" value="user" />
							学 生
						</div>
						<div class="field half">
							<input type="radio" name="type" value="admin" />
							管理员
						</div>
					</div>
					<ul class="actions">
						<li>
							<input type="submit" value="登 录" class="primary" />
						</li>
						<li>
							<input type="reset" value="重 置" />
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

	</div>

	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>