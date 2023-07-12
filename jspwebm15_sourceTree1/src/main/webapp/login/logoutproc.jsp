<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>logoutproc</h2>
<%
//session 제거
session.invalidate();
response.sendRedirect("loginForm.jsp");
%>
</body>
</html>