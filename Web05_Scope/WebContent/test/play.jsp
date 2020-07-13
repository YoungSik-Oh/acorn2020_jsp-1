<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/play.jsp</title>
</head>
<body>
	<%
		// session 영역에 "nick" 이라는 키 값으로 저장된 String type 읽어오기
		String nick=(String)session.getAttribute("nick"); // 없으면 null
	%>
	<p> <strong><%=nick %>님이 놀러 옴</strong></p>
	<p> 신나게 놀아봐 혼자서</p>
</body>
</html>