<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int count=Integer.parseInt(request.getParameter("count"));
    %>
    
    
    
    {
    	"count" : <%=count %>
	}