<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. get 방식 파라미터로 전달되는 수정할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB에서 해당회원 한명의 정보를 읽어온다.
	MemberDao dao=MemberDao.getInstance();
	MemberDto dto=dao.getData(num);
	//3. 읽어온 회원 한명의 정보를 form 에 출력해서 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>회원정보 수정 폼</h1>
		<form action="update.jsp" method="post">
			<%-- form 을 제출했을 때 회원 번호가 전송되도록 input type="hidden" 에 회원 번호를 출력 해 놓는다.  (jsp 주석은 보이지 않음) 웹(html) 브라우저가 해석하지 않는 주석 --%>
			<input type="hidden" name="num" value="<%= dto.getNum() %>" />
			<label for="num" > 번호</label>
			<!-- disabled 속성이 추가 된 input 요소는 수정이 불가하고 form을 제출했을때 전송도 되지 않는다.   -->
			<input type="text" id="num" value="<%=dto.getNum() %>" disabled/>
			<label for="name">이름</label>
			<input type="text"  name="name" id="name" value="<%=dto.getName() %>"/>
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr" value="<%=dto.getAddr() %>"/>
			<button type="submit">수정</button>
			<button type="reset"><a href="list.jsp">취소</a></button>
		</form>
	</div>
</body>
</html>