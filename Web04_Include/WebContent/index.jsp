<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%-- include 된 페이지에 필요한 css 도 여기서 로딩을 해야한다. --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<jsp:include page="Include/navbar3.jsp">
			<jsp:param value="index" name="thisPage"/>
		</jsp:include>
			<ul>
				<li><a href="test1/main.jsp">include 디렉티브</a></li>
				<li><a href="test2/main.jsp">include 디렉티브2</a></li>
				<li><a href="test3/main.jsp">jsp include</a></li>
				<li><a href="test4/main.jsp">jsp include2</a></li>
				<li><a href="test5/home.jsp">home include</a></li>
				<li><a href="test5/game.jsp">game include</a></li>
				<li><a href="test5/study.jsp">study include</a></li>
				<li><a href="test6/home.jsp">navbar include exaple</a><li>
			</ul>
	</div>
</body>
</html>