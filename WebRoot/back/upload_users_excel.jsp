<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>定义input type="file" 的样式</title>

<style type="text/css">
body {
	font-size: 14px;
}

input {
	vertical-align: middle;
	margin: 0;
	padding: 0
}

.file-box {
	position: relative;
	width: 340px
}

.txt {
	height: 22px;
	border: 1px solid #cdcdcd;
	width: 180px;
}

.btn {
	background-color: #FFF;
	border: 1px solid red;
	height: 24px;
	width: 70px;
}
/* .file{ position:absolute; top:0; right:80px; height:24px; background:blue; filter:alpha(opacity:0);opacity: 6;width:260px }
 */
</style>

</head>
<body>
	<div class="panel admin-panel margin-top">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>增加内容</strong>
		</div>
		<div class="body-content">
			<div class="file-box">
				<form method="post" class="form-x" action="">
					<div class="form-group">
						<div class="label">
							<label>上传学生信息(xsl)：</label>
						</div>
						</br>
						<div class="form-group">
							<input id="uploadEventFile" type="file" name="file">
							<input type="button" value="上传" onclick="oupload()" />
						</div>
					</div>
				</form>

				<!--  <form action="" method="post" enctype="multipart/form-data">
 			<input type='text' name='textfield' id='textfield' class='txt' style="background:red" />  
 			<input type='button' class='btn' value='浏览...' />
 		 	<input id="uploadEventFile" type="file" name="file" class="file" size="20" onchange="document.getElementById('textfield').value=this.value" />
 			<input type="button" value="上传" onclick="oupload()" /> 
  </form> -->
			</div>
		</div>
	</div>
	<!--  上传excel-->
	<script type="text/javascript">
function oupload(){
	var file = $('#uploadEventFile')[0].files[0];
	console.log($('#uploadEventFile')[0].files);
	var fd = new FormData();
	fd.append('file', file);
	console.log(fd);

$.ajax({
url: "/Epidemic_System/UploadExcelServlet",
type: 'post',
data: fd,
async: false,
cache: false,
contentType: false,
processData: false,
success: function (data) {
console.log(data);
if(data.status){
console.log('upload success');
}else{
console.log(data.message);
}
},
error: function (data) {
console.log(data.status);
}
});

}	
</script>
</body>
</html>
