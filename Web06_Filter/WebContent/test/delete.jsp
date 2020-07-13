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
 		//로그아웃 처리하기
 		session.invalidate(); // 세션 초기화
 		// ContextPath
 		String cpath=request.getContextPath();
 		// 리다이렉트 응답
 		response.sendRedirect(cpath+"/index.jsp");
    	/* String id= request.getParameter("id");
    	session.removeAttribute("id"); */
    %>
	<script>
	<%-- 	alert(<%=id%>+ "님 로그아웃 되었습니다."); --%>
	location.href="../index.jsp"
	</script>
</body>
</html>	