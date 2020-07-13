<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// post 방식 전송했을 때 한글이 깨지지 않도록
    	//request.setCharacterEncoding("utf-8"); // 필터에서 처리하기 때문에 주석처리 가능
    	// logic 처리 하는 부분 
    	// msg 라는 파라미터명으로 전송된 문자열을 읽어온다. (index.jsp 안에 있는 form > input > msg 의 name)
    	String msg=request.getParameter("msg");
    	// 서버측 콘솔창에 출력해보기
    	System.out.println("msg:" + msg);
    %>
    <!-- reponse -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/index.jsp</title>
</head>
<body>
	<h1>요청을 처리했습니다.</h1>
	<p>당신이 전송한 문자열 : <strong><%=msg %></strong></p>
</body>
</html>