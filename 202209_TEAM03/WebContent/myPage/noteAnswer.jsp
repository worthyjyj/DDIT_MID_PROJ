<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int answer=(int)request.getAttribute("answer");
	int bo_num=(int)request.getAttribute("bo_num");
%>


<script>
<%
	if(answer==1){
%>		
	alert("쪽지보내기에 성공하셨습니다!");
	window.close("<%=request.getContextPath()%>/myPage/noteAnswer.jsp");
	location.href="<%=request.getContextPath()%>/freeboard/freeboardArticle.do?bo_num=<%=bo_num%>";
<%}%>
</script>	

</body>
</html>