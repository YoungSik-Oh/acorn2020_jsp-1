<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String fortuneToday=(String)request.getAttribute("fortuneToday"); //request - value , "fortuneToday"-key
%>

	<p> 오늘의 운세: <strong><%=fortuneToday %></strong></p>
</body>
</html>