<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include 디렉티브를 이용해서 jsp 페이지를 include 하면
	해당 페이지에 include 된 jsp 페이지가 합쳐져서 jsp 페이지가 만들어진다.
	결국 실행시점에 사용되는 jsp 페이지는 1개만 사용된다.

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/other.jsp</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<h1>other.jsp 페이지</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem blanditiis quaerat perferendis cupiditate minus perspiciatis voluptates qui dolores odio quod asperiores mollitia assumenda amet temporibus impedit. Ipsam numquam nemo obcaecati.</p>
	<a href="main.jsp">Main Page</a>
	<%@include file="footer.jsp" %>
</body>
</html>