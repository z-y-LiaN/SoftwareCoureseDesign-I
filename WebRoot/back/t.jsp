<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
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
				<strong class="icon-reorder"> 请假列表</strong>
			</div>
			<div class="padding border-bottom">
			</div>
			<div class="padding border-bottom">
	<form>
      <ul class="search">
        <li>
          <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
          <button type="submit" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
        </li>
      </ul>
    </div>
			<table class="table table-hover text-center">
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>申请出校时间</th>
					<th>申请返校时间</th>
					<th>请假事由</th>
					<th>情况</th>
					<th>附加信息</th>
					<th>审核状态</th>
				</tr>   
				   
      			<c:forEach items="${PageInfo.list}" var="pi">
					<tr>
						<td><input type="checkbox" name="id[]" value="1" />1</td>
						<td>${pi.userID}</td>
						<td>${pi.userName}</td>
						<td>${pi.outDate}</td>
						<td>${pi.returnDate}</td>
						<td>${pi.outThing}</td>
						<td>${pi.situation}</td>
						<td name="hideTd">${pi.note}</td>
						<td>${pi.state}</td>
						 <td><div class="button-group"> <a class="button border-red" href="javascript:void(0)" onclick="return del(1)"><span class="icon-trash-o"></span> 删除</a> </div></td>
					</tr>
				</c:forEach>  
			</form>
			      <tr>
			        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="ManageLeaveByPageServlet?pageNum=${PageInfo.pageNum+1}">下一页</a><a href="">尾页</a> </div></td>
			      </tr>
					
			</table>
		</div>
</body>
<script type="text/javascript">
function bindingsClickHide(options){
debugger;
	options.addClass("td1-hide");
	options.click(function(){
	debugger;
		if($(this).attr("class").indexOf("td1-hide") < 0){
		$(this).removeClass("td2-show");
			$(this).addClass("td1-hide");
			  
		}else{
			 $(this).removeClass("td1-hide");
				$(this).addClass("td2-show");
		}
	});
}
 
 
bindingsClickHide($("[name = 'hideTd']"));

function del(id){
	if(confirm("您确定要删除吗?")){
		
	}
}


$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false; 		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>
</html>