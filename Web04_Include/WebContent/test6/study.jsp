<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="container">	
	<jsp:include page="../Include/navbar3.jsp">
		<jsp:param value="study" name="thisPage"/>
	</jsp:include>
	
	<h1>study.jsp Page</h1>
	<p>hahaha</p>
</div>
</body>
</html>