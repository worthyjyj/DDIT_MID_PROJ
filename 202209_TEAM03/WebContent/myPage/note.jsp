<%@page import="vo.NoteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="../bower_components/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet" href="../bower_components/fullcalendar/dist/fullcalendar.print.min.css" media="print">
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style>
section {
	margin-left: 5%;
}

.list-group {
	margin-top: 200px;
	border: 1px solid #e9e9e9;
	padding-left: 30px;
	width:350px;
	margin-left: 500px;
	background: white;
}

.list-group2 {
	margin-top: 200px;
	border: 1px solid #e9e9e9;
	padding-left: 30px;
	width:800px;
	margin-left: 50px;
	background: white;
}

.list-group2-inner{
	border: 1px solid #e9e9e9;
	width: 670px;
	margin-left: 50px;
	border-radius: 5px;
}



.list-group-item {
	width: 250px;
	border-radius: 15px;
	border: 1px solid #e9e9e9;
	background-color: #fafafa;
}

.input-inner{
	margin-left:130px;
	padding : 10px;
	border-radius: 30px;
	border: 1px solid #e9e9e9;
}

.input-innerNote{
	margin-left:20px;
	padding : 10px;
	border: 1px solid #e9e9e9;
}

.input-inner-pw{
	margin-left:130px;
	padding : 10px;
	border: 1px solid #e9e9e9;
}


.edit_input[type="text"]:read-only {
    background-color: #fff;
    color: #252525;
}

button, input, optgroup, select, textarea, span {
    font-family: inherit;
    font-size: 100%;
    line-height: 1.15;
    margin: 0px;
}

textarea {
    position: relative;
    resize: none;
    display: block;
    width: 100%;
    padding: 16px 20px;
    box-sizing: border-box;
    border: 1px solid var(--color-whiteGray);
}

textarea {
    writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-stretch: ;
    text-rendering: auto;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    text-align: start;
    -webkit-rtl-ordering: logical;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    column-count: initial !important;
}

input, textarea {
    -webkit-appearance: none;
}

body, input, button, textarea, select {
    font-weight: 400;
}

span{
	font-weight: bold;
}
</style>

<%
String name=(String)session.getAttribute("name");
String id=(String)session.getAttribute("id");
%>

<script>
$(function(){
	id=<%=request.getAttribute("answer")%>
	
	
	if(id==1){
		alert("쪽지 보내기 성공!");
		window.close("<%=request.getContextPath()%>/myPage/note.jsp");
		window.close("<%=request.getContextPath()%>/myPage/noteReply.jsp");
		window.reload("/myPage/message.jsp");
	}
})



</script>
<title>Insert title here</title>
</head>
<body>

	<div class="list-group2" style="float :left;">
				<div style="margin-top:15px;">
				<div style="text-align: center;">
					<span style="font-size: 25px;">
						쪽지보내기
					</span>
				</div>	
					<hr style="margin-right: 50px; margin-left: 50px;">
					
					<div class="list-group2-inner">
						<br>
						<br>
						<br>
						
							<div style="text-align: center;">
								<img style="width:100px;" alt="" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg">
							</div>
							<br>
							<input type="text" class="input-inner" placeholder="아이디를 입력해주세요" style="width:400px; text-align: center;" value="asdg">
							<br>
							<br>
							
							<form action="<%=request.getContextPath()%>/sendNote.do" method="post">
								<label style="font-size: 1.2em; margin-left:20px;">쪽지제목
								
									<span style="margin-left:285px;">받는사람</span>
									<input type="text" name="sendPeople" style="width:150px; border:1px solid #e9e9e9;" placeholder="아이디 입력" value="<%=id %>">
								</label>
									<br>
									<input type="text" class="input-innerNote" placeholder="제목을 입력해주세요.(30자 이내)" maxlength="30" name="sendTitle" style="width:600px;">
									<br>
									<br>
								<label style="font-size: 1.2em; margin-left:20px; float:left;">쪽지내용</label>
								<div style="margin-left: 20px; clear : both;">	
								<textarea type="text" class="edit_input" name="sendContent" placeholder="내용을 입력해주세요.(2000자 이내)" 
												maxlength="2000" style="width:600px; height:300px; border: 1px solid #e9e9e9;"></textarea>
								</div>
								<br>
								<br>
							  <div style="text-align: center; padding-bottom: 30px;">
									<button id="note" type="submit" class="btn btn-light">전송</button>
									<button type="reset" class="btn btn-light">취소</button>
							  </div>			
							</form>
					
					</div>
					<br><br>
				</div>
			</div>
			<br>
			<br>
			
</body>
</html>