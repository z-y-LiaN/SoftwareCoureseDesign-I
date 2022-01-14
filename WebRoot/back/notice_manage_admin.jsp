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
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 通知管理</strong>
		</div>
		<div class="padding border-bottom ">
			<ul class="search">
				<li>
					<button type="button" class="button border-green" id="checkall">
						<span class="icon-check"></span> 全选
					</button>
					<a href="javascript:DelSelect()" class="button border-red">
						<span class="icon-trash-o"></span>批量删除
					</a>

				</li>
				<li>
					<form method="post" action="/Epidemic_System/SearchNoticeByKeyServlet">
						<input type="text" placeholder="请输入搜索关键字" name="keywords" id="keywords" class="input"
							style="width:250px; line-height:17px;display:inline-block" />
						<input type="submit" class="button border-main icon-search" value="内容搜索" />
					</form>
				</li>
			</ul>

		</div>
		<!-- table table-hover text-center -->
		<table class="fl-table">
			<thead>
				<tr>
					<th width="120">选择</th>
					<th>通知标题</th>
					<th width="40%">通知内容</th>
					<th>通知时间</th>
					<th>操作</th>
				</tr>
			</thead>

			<c:forEach items="${PageInfo.list}" var="pi">
				<tr>
					<td><input type="checkbox" name="id" value="${pi.noticeID}"></td>
					<td>${fn:replace(pi.noticeTitle, lightkey, "<font color='red'>".concat(lightkey).concat("</font>") )}</td>
					<td name="hideTd">${fn:replace(pi.noticeContent, lightkey, "<font color='red'>".concat(lightkey).concat("</font>") )}</td>
					<td>${pi.outTime}</td>
					<td><div class="button-group">
							<a class="button border-red" onclick="return delOne(${pi.noticeID})">
								<span class="icon-trash-o"></span> 删除
							</a>
						</div></td>
				</tr>
			</c:forEach>

		</table>
		<div class="isbottom">
			<table>
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
							<a href="ManageNoticeByPageServlet?pageNum=${PageInfo.pageNum+1}">下一页</a>
							<a href="ManageNoticeByPageServlet?pageNum=${PageInfo.pages}">尾页</a>
						</div></td>
				</tr>
				<!--中间页  -->
				<%
					} else if (currentP > 1 && currentP != tot) {
				%>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="ManageNoticeByPageServlet?pageNum=${PageInfo.pageNum-1}">上一页</a>
							<a href="ManageNoticeByPageServlet?pageNum=${PageInfo.pageNum+1}">下一页</a>
							<a href="ManageNoticeByPageServlet?pageNum=${PageInfo.pages}">尾页</a>
						</div></td>
				</tr>
				<!-- 首页，也是尾页 -->
				<%
					} else if (currentP == tot && tot == 1) {
				%>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="ManageNoticeByPageServlet?pageNum=1">首页</a>
						</div></td>
				</tr>
				<!-- 尾页，且不是首页 -->
				<%
					} else if (currentP == tot && tot > 1) {
				%>
				<tr>
					<td colspan="8"><div class="pagelist">
							<a href="ManageNoticeByPageServlet?pageNum=1">首页</a>
							<a href="ManageNoticeByPageServlet?pageNum=${PageInfo.pageNum-1}">上一页</a>
						</div></td>
				</tr>
				<%
					}
				%>
			</table>
			<p align="center">一共${PageInfo.pages}页&emsp;当前是${PageInfo.pageNum}页</p>
		</div>
	</div>

	<script type="text/javascript">
function bindingsClickHide(options){
debugger;
	options.addClass("td1-hide");
	options.click(function(){
		console.log("aaa-----bindingsClickHide");
	debugger;
		if($(this).attr("class").indexOf("td1-hide") < 0){
		$(this).removeClass("td2-show");
			$(this).addClass("td1-hide");
			console.log("if------bindingsClickHide");
			  
		}else{
			 $(this).removeClass("td1-hide");
				$(this).addClass("td2-show");
				console.log("else------bindingsClickHide");
		}
	});
}
 
 
bindingsClickHide($("[name = 'hideTd']"));
/*删除单个  */
function delOne(id){
	if(confirm("您确定要删除吗?")){
		window.event.returnValue=true;
	}else{
		window.event.returnValue=false;
	}
	if(window.event.returnValue==true){
		$.ajax({
		 type:"POST",
		 url:"<%=request.getContextPath()%>/delNoticeServlet",
             data:{
                "delitems":id.toString()
           },
             success:function(msg){
             	console.log(msg);
                 if(msg=="success"){
                     $("[name='id']:checkbox").prop("checked",false);//把复选择框清空
                     location.reload();
                    <%--  window.location.href="<%=request.getContextPath()%>/infoListServlet"; --%>
                     alert("删除成功");
                 }else{
                 	alert("删除失败");
                 }
             }
         });
	}

}

var i=0;//全选标记
$("#checkall").click(function(){ //一个按钮实现全选和全不选

    $("input[name='id']").prop("checked","checked");
                    //这个地方只能用prop实现多次点击切换全选和全不选的效果，用attr的话不会多次实现。
                    // 因为attr不会记录当前checkbox的选中状态，所以这个地方只能使用prop
     if(i==1)	$("input[name='id']").prop("checked",false);
     i++;
     if(i>1)  i=0;
});
/*删除多个  */
function DelSelect(){
	//判断是否至少选择一项
	var checkedNum = $("input[name='id']:checked").length;
	if(checkedNum==0){
		alert("请至少选择一项！"); return;
	}
	//批量选择
	if(confirm("确定要删除所选项目？")){
		var checkedList = new Array();
		$("input[name='id']:checked").each(function(){
		checkedList.push($(this).val());
		});
		 $.ajax({
		 type:"POST",
		 url:"<%=request.getContextPath()%>/delNoticeServlet",
             data:{
                "delitems":checkedList.toString()
           },
             success:function(msg){
                 if(msg=="success"){
                     $("[name='id']:checkbox").prop("checked",false);//把复选择框清空
                     location.reload();
                     alert("删除成功");
                 }else{
                 	alert("删除失败");
                 }
             }
         });
     }
	}
/*搜索  */
<%-- function Search(){
	 var keywords=$("#keywords").val();
	 if(keywords==null||keywords==""){
	 	alert("请输入搜索的关键字");return;
	 }
	 $.ajax({
		 type:"POST",
		 url:"<%=request.getContextPath()%>/SearchNoticeByKeyServlet",
         data:{"keywords":keywords},
         success:function(msg){
         	console.log(msg);
         	if(msg=="success"){
         		location.reload();
         	}else{
         		alert("查询无结果");
         	}
         	
         }
         
     });
} --%>

</script>
</body>
</html>