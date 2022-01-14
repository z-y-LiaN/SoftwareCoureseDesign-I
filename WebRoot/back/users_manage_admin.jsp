<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>管理学生</title>
<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/pintuer.css">
<link rel="stylesheet" href="http://localhost:8080//Epidemic_System/back/css/admin.css">
<script src="<%=path%>/back/js/jquery.js"></script>
<script src="<%=path%>/back/js/pintuer.js"></script>
<link rel="shortcut icon" href="<%=path%>/back//images/logo.jpg">
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-pencil-square-o">&emsp;管 理 员 个 人 信 息 修 改</strong>
		</div>
		<div class="body-content">
			<!-- form start -->
			<form method="post" class="form-x" action="/Epidemic_System/UpdateAdminServlet">
				<div class="form-group">
					<div class="label">
						<label>新&nbsp;姓&nbsp;名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="adminName" id="adminName"
							data-validate="required:请输入新姓名" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>修改密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" value="" name="adminPwd" id="adminPwd"
							data-validate="required:请输入新密码" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>确认密码：</label>
					</div>
					<div class="field">
						<input type="password" class="input w50" value="" name="dminPwd2" id="adminPwd2"
							data-validate="required:请再次输入密码" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<a href="javascript:UpdateAdmin()" class="button bg-main icon-check-square-o">确认修改</a>
					</div>
				</div>
			</form>
			<!-- form end -->
		</div>
	</div>
	<!---------------------------以下是学生信息修改---------------分割线-------------------------------------------  -->
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder">&emsp;添 加 学 生</strong>
		</div>
		<div class="body-content">
			<!--  form start-->
			<form method="post" class="form-x" action="/Epidemic_System/AddOneUserServlet">
				<div class="form-group">
					<div class="label">
						<label>姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="userName" id="userName"
							data-validate="required:请输入姓名" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>学号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="userID" id="userID"
							data-validate="required:请输入学号" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>班级：</label>
					</div>
					<div class="field">
						<select name="classNum" id="classNum" class="input w50">
							<option value="">--请选择所属班级--</option>
							<option value="智能一班">智能一班</option>
							<option value="网安一班">网安一班</option>
							<option value="软工一班">软工一班</option>
							<option value="计科一班">计科一班</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>联系方式：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" id="userPhone" name="userPhone"
							data-validate="required:请输入联系方式" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<a href="javascript:AddOne()" class="button bg-main icon-check-square-o">确认新增</a>
					</div>
				</div>
			</form>
			<!--  form end-->
		</div>
	</div>
	<!--  ----------------------------以下是excle分割线-------------------------------------------->
	<jsp:include page="upload_users.jsp" flush="true" />
	<!-------------------------------------------script  -------------------------------------------------->
	<!--  修改管理员个人信息-->
	<script type="text/javascript">
		function UpdateAdmin() {
			var adminName = $("#adminName").val();
			adminName = encodeURI(adminName);
			var adminPwd = $("#adminPwd").val();
			var adminPwd2 = $("#adminPwd2").val();
			if (adminName == null || adminName == "") {
				alert("姓名不能为空");return;
			}
			if (adminPwd == null || adminPwd == "") {
				alert("新密码不能为空");return;
			}
			if (adminPwd2 == null || adminPwd2 == "") {
				alert("请再次输入新密码");return;
			}
			if (adminPwd != adminPwd2) {
				alert("前后两次密码不一致,请重新输入");return;
			}
			$.ajax({
				type : "post", //请求类型
				url : "<%=request.getContextPath()%>/UpdateAdminServlet", //请求地址
				async : true, //true代表的是异步请求，false代表的是同步请求，若为同步请求则会锁住浏览器
				data : {
					adminName : adminName,
					adminPwd : adminPwd,
				}, //传入后端Controller的参数
				success : function(msg0) { //这里的msg是后台返回的值
					if (msg0 == "success") {
						/* location.reload(); */
						if (confirm("管理员信息修改成功,请重新登录")) {
							window.opener = window;
							var win = window.open("", "_self");
							win.close();
							//frame的时候
							top.close();
	
							window.open('http://localhost:8080/Epidemic_System/index.jsp');
						}
					/* alert("管理员信息修改成功,请重新登录"); */
					/* 重新打开一个页面 */
					/*  window.location.href = 'about:blank'
					 window.close();  */
					/* window.opener=null;
		window.open('','_self');
		window.close(); */
					/* top.location.href('http://localhost:8080/Epidemic_System/index.jsp'); */
					/* window.open('http://localhost:8080/Epidemic_System/index.jsp'); */
					} else {
						alert("管理员信息修改失败");
					}
				}
			});
		}
	</script>
	<!-- 新增用户 -->
	<script type="text/javascript">
		function AddOne() {
			var userID = $("#userID").val(); //#是id选择器
			var userName = $("#userName").val();
			userName = encodeURI(userName); //ajax传中文数据乱码解决方案
			var classNum = $("#classNum").val();
			classNum = encodeURI(classNum);
			var userPhone = $("#userPhone").val();
	
			if (userID == "" || userID == null) {
				alert("学号不能为空");
				return;
			}
			if (userName == "" || userName == null) {
				alert("姓名不能为空");
				return;
			}
			if (classNum == "" || classNum == null) {
				alert("班级不能为空");
				return;
			}
			if (userPhone == "" || userPhone == null) {
				alert("联系方式不能为空");
				return false;
			} else {
				$.ajax({
					type : "post", //请求类型
					url : "<%=request.getContextPath()%>/AddOneUserServlet", //请求地址
					async : true, //true代表的是异步请求，false代表的是同步请求，若为同步请求则会锁住浏览器
					data : {
						userID : userID,
						userName : userName,
						classNum : classNum,
						userPhone : userPhone
					}, //传入后端Controller的参数
					success : function(msg) { //这里的msg是后台返回的值
						if (msg == "success") {
							location.reload();alert("新增一位学生成功");
						} else {
							alert("新增学生失败");
						}
					}
				});
			}
		}
	</script>
</body>
</html>
