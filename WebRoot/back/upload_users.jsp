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
<style>
.file {
	/* background-color: red; */
	right: 86px;
	height: 30px;
	filter: alpha(opacity : 0);
	opacity: 0;
	width: 275px;
	left: 120px;
	position: absolute
}
/* .file-box{ position:relative;width:340px} */
.txt {
	height: 30px;
	border: 1px solid #99CCCC;
	width: 200px;
	left: 120px;
	position: absolute
}

.btnl {
	background-color: #99CCCC;
	border: 1px solid #99CCCC;
	height: 30px;
	width: 70px;
	left: 320px;
	position: absolute
}

.btnn {
	background-color: #99CCCC;
	border: 1px solid #99CCCC;
	height: 30px;
	width: 70px;
	left: 400px;
	position: absolute
}
</style>
</head>

<body>
	<div class="panel admin-panel margin-top">
		<div class="panel-head" id="add">
			<strong><span class="icon-reorder"></span>&emsp;Excel 文 件 导 入 学 生 信 息</strong>
		</div>
		<div class="body-content">

			<div class="file-box">
				<!-- form start  -->
				<div class="form-group">
					<div class="label">
						<label>上传学生信息(.xsl)：</label>
					</div>
					<div class="filed">
						<input type='text' name='textfield' id='textfield' class='txt' />
						<input type='button' class='btnl' value='浏览...' />
						<input id="uploadEventFile" type="file" name="file" class="file" size="20"
							onchange="document.getElementById('textfield').value=this.value" />
						<input type="button" value="上传" onclick="upload()" class="btnn" />
					</div>
					</br>
				</div>
			</div>
		</div>
	</div>
	<!--form end  -->
	<!--     <form action="/Epidemic_System/UploadExcelServlet" enctype="multipart/form-data" method="post">
     选择文件： <input type="file" name="excelfilename"><br>
     <input type="submit" value="数据入库"/>
</form> -->

	</script>
	<!--  上传excel-->
	<script type="text/javascript">
		function upload() {
			var file = $('#uploadEventFile')[0].files[0];
			console.log("AAAAAAAAAAAAA" + file)
	
			console.log($('#uploadEventFile')[0].files);
			var uploadEventFile = $("#uploadEventFile").val();
			if (uploadEventFile == '') {
				alert("请选择excel,再上传");
			} else if (uploadEventFile.lastIndexOf(".xls") < 0) { //可判断以.xls和.xlsx结尾的excel  
				alert("只能上传以.xls结尾的Excel文件");
			}
			var fd = new FormData();
			fd.append('file', file);
			console.log(fd);
			$.ajax({
				url : "/Epidemic_System/UploadExcelServlet",
				type : 'post',
				data : fd,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) {
					console.log(data);
					if (data == "success") alert("学生信息上传成功");
					if (data.status) {
						console.log('upload success');
					} else {
						console.log(data.message);
					}
				},
				error : function(data) {
					console.log(data.status);
				}
			});
	
		}
	</script>
</body>
</html>
