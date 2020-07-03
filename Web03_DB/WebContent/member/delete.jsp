<%@page import="javax.swing.JOptionPane"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int num=Integer.parseInt(request.getParameter("num"));
	MemberDao.getInstance().delete(num);
	// redirect move를 시키기 위해 context path를 먼저 읽어온다.
	String cPath=request.getContextPath(); //ContextPath = 절대경로
	// 회원 목록 보기 요청하도록 강요하는 응답을한다. (redirect move)
	JOptionPane.showMessageDialog(null, "선택하신 목록이 삭제 되었습니다.");
	response.sendRedirect(cPath+"/member/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
	<!-- <script>
		alert("선택하신 정보가 삭제 되었습니다.");
		// javascript 를 이용해서 클라이언트에게 특정 경료로 요청을 강제로 다시 하도록 강요하기(redirect move )
		location.href="list.jsp";
	</script> -->
</body>
</html>