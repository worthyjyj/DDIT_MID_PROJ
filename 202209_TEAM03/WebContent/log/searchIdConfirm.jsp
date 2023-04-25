<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
   <%
   	String mem_id = (String)request.getAttribute("mem_id");
   	int answer= (int)request.getAttribute("answer");
   	
   	out.print("answer입니당 : "+answer);
   	out.print("mem_id : "+mem_id);
   %>
    
    
{
	"mem_id" : <%=mem_id %>,
	"answer" : <%=answer %>
}    