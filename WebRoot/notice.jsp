<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'notice.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%-- <div>
    	<jsp:include page="${mainPage }"></jsp:include>
    </div> --%>

	<%-- <div >
					  		<!--正序  -->
					  			<ul>
									<c:forEach var="noticeItem" items="${allList }">
										<li><a href="NoticeServlet?noticeID=${noticeItem.noticeID }" title="${noticeItem.noticeTitle }">${noticeItem.noticeTitle }</a></li>
									</c:forEach>
					  			</ul>
					  		<!--逆序  -->
					  			 <c:set var="startIndex" value="${fn:length(allList)-1 }"></c:set>  
				                    <c:forEach var="noticeItem" items="${allList }" varStatus="status">  
				                        <li><a href="NoticeServlet?noticeID=${allList[startIndex - status.index].noticeID }" title="${allList[startIndex - status.index].noticeTitle }">${allList[startIndex - status.index].noticeTitle }</a></li>
				                    </c:forEach>  
					  		</div> --%>
	<h2 class="major">最新通知</h2>
	<p class="notice text">

		<jsp:include page="${mainPage }"></jsp:include>
	</p>
	<h2 class="major">历史通知</h2>
	<nav> <%-- <ul>
						<c:set var="startIndex" value="${fn:length(allList)-1 }"></c:set>  
				                    <c:forEach var="noticeItem" items="${allList }" varStatus="status">  
				                        <li><a href="NoticeServlet?noticeID=${allList[startIndex - status.index].noticeID }" title="${allList[startIndex - status.index].noticeTitle }">${allList[startIndex - status.index].noticeTitle }</a></li>
				                    </c:forEach> 
					</ul>  --%>
	<ul>
		<c:forEach var="noticeItem" items="${allList }">
			<li>
				<a href="NoticeServlet?noticeID=${noticeItem.noticeID }" title="${noticeItem.noticeTitle }">${noticeItem.noticeTitle }</a>
			</li>
		</c:forEach>

	</ul>
	</nav>

</body>
</html>
