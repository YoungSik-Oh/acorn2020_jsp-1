<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String nick=request.getParameter("nick");
	
	//HttpSession 객체에 담는다.
	session.setAttribute("nick", nick);
	// 60초 동안 새로운 요청을 하지 않았을 때 삭제 되도록 설정...
	session.setMaxInactiveInterval(60);// default 60초
	/*
		session 영역에 담은 데이터가 삭제되는 경우
		- 새로운 요청을 하지않고 30분이 경과 했을 때 (default)
		- 웹브라우저를 닫았을 때
		- HttpSession 객체의 메소드를 이용해서 제거 했을 때
	*/

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/save.jsp</title>
</head>
<body>
	<p><strong><%=nick %> 이라는 닉네임 저장 성공!</strong></p>
	<p> 60 초 동안 아무런 요청도 하지 않으면 삭제 됩니다.</p>
	<a href="../index.jsp">인덱스로 이동하기</a>
</body>
</html>