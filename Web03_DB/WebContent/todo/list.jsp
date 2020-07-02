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
<h1>Todo List</h1>	
	<form class="form-inline" action="insert.jsp" method="post">
		<div class="form-group ">
			<label for="todo">할일</label>
			<input class="form-control col-auto" type="text" name="work" id="todo" /> <!-- name 값을 getParameter() 로전달 -->
			<button class="btn btn-primary" type="submit">입력</button>
			
			
			<small class="form-text text-muted">입력해보슈</small>
		</div>
	</form>
	<table class="table table-dark">
		<thead>
			<tr>
				<th>번호</th>
				<th>할일</th>
				<th>날짜</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		
		<%for(TodoDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWork() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>
</body>
</html>