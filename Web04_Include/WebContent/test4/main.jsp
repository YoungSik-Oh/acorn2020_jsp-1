<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
		//header.jsp 페이지와 별개의 main.jsp 페이지이기 때문에
		// tjfh coding 내용에 영향을 받지 않는다.
		String name="해골";
	%>
	<h1>main.jsp 페이지 입니다.</h1><%=name %>
	
	
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus qui illum deleniti excepturi sunt praesentium blanditiis dignissimos omnis quia in exercitationem magnam alias cupiditate tempore assumenda eos dolor. Omnis corporis.</p>
		<a href="other.jsp">다른 페이지</a>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>