<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int answer=(int)request.getAttribute("answer");
	System.out.println("ConfirmPw answer :  " + answer);
%>
		{
			"answer" : <%=answer %>
		}
	