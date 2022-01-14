<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统主页</title>
<link rel="stylesheet" href="./css/pintuer.css">
<link rel="stylesheet" href="./css/admin.css">
<!-- <link rel="shortcut icon" href="./images/logo.jpg"> -->
<script src="./js/jquery.js"></script>
<script src="./js/pintuer.js"></script>

</head><!-- #f2f9fd -->	
<body style="background-color:#99CCCC;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="images/logo.jpg" class="radius-circle rotate-hover"
					height="50" alt="" />辅导员管理
			</h1>
		</div>
		<div class="head-l">
			<a href="" target="_blank" style="color:#FFF">
			<span class="icon-user"></span> 欢迎 <% HttpSession Session = request.getSession();
		         String name = (String)Session.getAttribute("adminName");
		         out.println(name); %></a>&nbsp;&nbsp;
		         <a class="button button-little bg-green" href="" target="_blank"><span
				class="icon-home"></span> 首页</a> &nbsp;&nbsp;<a
				class="button button-little bg-red" href="../index.jsp"><span
				class="icon-power-off"></span> 退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span><font color="white">通知管理</font>
		</h2>
		<ul style="display:block">
			<li><a href="/Epidemic_System/ManageNoticeByPageServlet" target="right" ><span
					class="icon-caret-right"></span><font color="white">通知管理</font></a></li>
			<li><a href="notice_add_admin.jsp" target="right"><span
					class="icon-caret-right"></span><font color="white">通知发布</font></a></li>
		</ul>
		<h2>
			<span class="icon-user"></span><font color="white">请假管理</font>
		</h2>
		<ul style="display:block">
			<li><a href="/Epidemic_System/ManageLeaveByPageServlet" target="right"><span
					class="icon-caret-right"></span><font color="white">假单列表</font>
				</a>
			</li>
			<li><a href="/Epidemic_System/CheckReadyServlet" target="right"><span
				class="icon-caret-right"></span><font color="white">假单审核</font>
				</a>
			</li>
		</ul>
		<h2>
			<span class="icon-user"></span><font color="white">打卡管理</font>
		</h2>
		<ul style="display:block">
			<li><a href="/Epidemic_System/ReportTodayServlet" target="right"><span
				class="icon-caret-right"></span><font color="white">今日记录</font>
				</a>
			</li>
			<li><a href="/Epidemic_System/ReportHistoryServlet" target="right"><span
				class="icon-caret-right"></span><font color="white">历史记录</font> 
				</a>
			</li>
		</ul>
		<h2>
			<span class="icon-user"></span><font color="white">信息管理</font>
		</h2>
		<ul style="display:block">
			<li><a href="/Epidemic_System/UsersInfoServlet" target="right"><span
				class="icon-caret-right"></span><font color="white">学生信息</font>
				</a>
			</li>
			<li><a href="users_manage_admin.jsp" target="right"><span
				class="icon-caret-right"></span><font color="white">信息管理</font>
				</a>
			</li>
		</ul>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<ul class="bread">
		
		<li><a href="##" id="a_leader_txt">欢迎界面</a></li>
		<li><b>当前状态：</b><span>在线</php></span>

	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="welcome_admin.jsp"
			name="right" width="100%" height="100%"></iframe>
	</div>
</body>
</html>
