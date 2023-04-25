<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>안녕~~~</h1>

<%String no=request.getParameter("id"); %>

<span><%=Integer.parseInt(no) %></span>
</body>
</html>