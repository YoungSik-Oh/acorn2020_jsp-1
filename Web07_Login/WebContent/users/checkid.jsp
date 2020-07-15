<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ajax 전송 파라미터를 읽어온다. (data: "checkId="+checkId) 
	String inputId=request.getParameter("inputId");
	//UserDao 를 이용해서 해당 아이디가 존재하는지
	boolean isExist=UsersDao.getInstance().isExist(inputId); // 존재하면 true 존재하지 않으면 false 
%>
{"isExist":<%=isExist %>}