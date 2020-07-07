<%@page import="java.util.ArrayList"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%

	TodoDao dao=TodoDao.getInstance();
	List<TodoDto> list=dao.getList();
	
	
%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Web03_DB/css/bootstrap.css" />
<title>할일 목록</title>
</head>

<body>
	<div class="container">
	<div class="navbar navbar-expand-sm navbar-dark bg-primary">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
		</ul>

	</div>
<h1>Todo List</h1>	
	<form class="form-inline" action="insert.jsp" method="post">
		<div class="form-group ">
			<label for="todo">할일</label>
			<input class="form-control col-auto" type="text" name="work" id="todo" /> <!-- name 값을 getParameter() 로전달 -->
			<button class="btn btn-primary" type="submit">입력</button>
			
			<small class="form-text text-muted">입력해보슈</small>
		</div>
	</form>
	<table class="table table-hover table-sm">
		<thead class="thead-dark">
			<tr class="d-flex">
				<th class="col-2">번호</th>
				<th class="col-5">할일</th>
				<th class="col-3">날짜</th>
				<th class="col-1">수정</th>
				<th class="col-1">삭제</th>
			</tr>
		</thead>
		<tbody>

		<%for(TodoDto tmp:list){ %>
			<tr class="d-flex">
				<td class="col-2"><%=tmp.getNum() %></td>
				<td class="col-5"><%=tmp.getWork() %></td>
				<td class="col-3"><%=tmp.getRegdate() %></td>
				<td class="col-1"><a href="modify.jsp?num<%=tmp.getNum()%>">수정</a></td>
				<td class="col-1"><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
				<!-- <td><a href="delete.jsp?num=999">삭제</a></td> -->
			</tr>
			<%} %>
		</tbody>
	</table>
</div>
</body>
</html>






