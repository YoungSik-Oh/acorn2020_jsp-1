<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String nick=request.getParameter("nick");
    	// session 영역에 "nick" 이라는 키값으로 저장된 값 삭제하기
    	session.removeAttribute("nick");
    	//session.invalidate();// 세션 영역에 저장된 모든 값 삭제하기
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/delete.jsp</title>
</head>
<body>
	<script>
		alert(<%=nick%>+ "닉네임이 삭제 되었습니다.");
		location.href="../index.jsp";
	</script>
</body>
</html>