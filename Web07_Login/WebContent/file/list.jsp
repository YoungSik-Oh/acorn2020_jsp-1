<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id=(String)session.getAttribute("id");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
</head>
<body>
<%
	//파일목록
	List<FileDto> list=FileDao.getInstance().getList();
%>
<div class="container">
	<h1>파일 목록 입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>파일크기</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(FileDto tmp:list){%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<td><a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a></td>
				<td><%=tmp.getFileSize() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td>
					<% if(tmp.getWriter().equals(id)){ %>
						<a href="private/delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
					<% }%>
				</td>
			</tr>
		<% } %>
		</tbody>
	</table>
	<a href="private/upload_form.jsp">파일 업로드</a>
	<a href="${pageContext.request.contextPath}/index.jsp">돌아가기</a>
</div>
</body>
</html>