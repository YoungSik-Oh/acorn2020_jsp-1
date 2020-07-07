<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include/navbar2.jsp --%>
<%
	// 파라미터로 전달되는 thisPage 의 value 값 읽어내기
	String thisPage=request.getParameter("thisPage");
	if(thisPage.equals("home")){
		
	}else if(thisPage.equals("game")){
		
	}else if(thisPage.equals("study")){
		
	}
%>
<div class="navbar navbar-expand-sm navbar-dark bg-primary">
	<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>
	<ul class="navbar-nav  ">
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">Game</a></li>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">Study</a></li>
	</ul>
</div>