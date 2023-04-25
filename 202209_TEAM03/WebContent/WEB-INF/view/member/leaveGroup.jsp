<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int answer=(int)request.getAttribute("answer");
	System.out.println("answer jsp(삭제된갯수) " + answer);
		
	
	%>
		{
			"answer" : <%=answer %>
		}
	