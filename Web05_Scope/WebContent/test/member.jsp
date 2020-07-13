<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//request 영역에 "dto" 라는 키값으로 담긴 MemberDto 객체의 참조값 얻어내기
    	MemberDto dto=(MemberDto)request.getAttribute("dto");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member.jsp</title>
</head>
<body>
	<p><%=dto.getNum() + " | " + dto.getName() +" | "+ dto.getAddr() %></p>
	<p>번호 : <strong><%=dto.getNum() %> </strong></p>
	<p>이름 : <strong><%=dto.getName() %> </strong></p>
	<p>주소 : <strong><%=dto.getAddr() %> </strong></p>
</body>
</html>