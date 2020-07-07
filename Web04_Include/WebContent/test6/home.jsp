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
	<%-- include 될 jsp 페이지는 반드시 상대경로로 찾아가야한다. --%>
	<%-- thisPage 라는 파라미터 명으로 home 이라는 문자열 전달하기 --%>
	<jsp:include page="../Include/navbar3.jsp">
		<jsp:param value="home" name="thisPage "/>
	</jsp:include>
	<h1>home.jsp 입니다.</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta quibusdam consequuntur explicabo ad reiciendis sed optio voluptates dolore sequi ut possimus harum excepturi quae nobis quia nemo facilis laboriosam non!</p>
</div>
</body>
</html>