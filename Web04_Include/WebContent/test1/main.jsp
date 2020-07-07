<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>
	
	<div style="height: 200px; background-color:yellow;">
		header
	</div>
	
	<h1>main.jsp 페이지 입니다.</h1>
	
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus qui illum deleniti excepturi sunt praesentium blanditiis dignissimos omnis quia in exercitationem magnam alias cupiditate tempore assumenda eos dolor. Omnis corporis.</p>
		<a href="other.jsp">다른 페이지</a>
	
	<%@include file="footer.jsp" %>
	
	<div style="height:200px; background-color:pink;">
		footer
	</div>

</body>
</html>