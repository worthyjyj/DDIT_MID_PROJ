<%@page import="java.net.URLEncoder"%>
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
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
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
	NoteVO vo=(NoteVO)request.getAttribute("vo"); 
	int num=(int)request.getAttribute("num");
	String sdate = vo.getNote_sdate();
	%>
	
<script>
$(document).ready(function(){
	$("#packspance1").on("click",function(){
		self.close();
	})
	
	$("#noteReply").on('click',function(){
		window.open("<%=request.getContextPath()%>/myPage/noteReply.jsp?sendPeople1="+$("#sendPeople").val(),"답변하기","width=700 height=500");
	})
	
	$("#withmeinsert").on('click',function(){
		 p_name = $('.edit_input').val();
		 withme_code = $('.input-innerNote').val();
		
		console.log('어어엇?' + p_name)
		console.log('어어엇?' + withme_code)
		
	 	$.ajax({
	 		  url: "<%=request.getContextPath()%>/member/withmeinsert.do", 
	 	      data: {
	 	    	  "p_name" : p_name,
	 	    	  "withme_code" : withme_code,
	 	      },
	 	      type: 'post',
	 	  	dataType : 'text',
	 		success: function(res){
	 			if(res == "성공"){ 
	 				alert('승인처리되었습니다!');
	 				
	 				/* $(this).value('승인처리완료'); //중복 막도록 처리할려고 햇는데... 이거 안됌... */ 
	 			}else if(res == "실패"){ 
	 				alert('승인실패하였습니다.');
	 			}
	 			window.close();
	 			}
	 	   }) 
	})
	
	
})






</script>




<title>Insert title here</title>
</head>
<body>

	<div class="list-group2" style="float :left;">
				<div style="margin-top:15px;">
				<div style="text-align: center;">
					<span style="font-size: 25px;">
						쪽지상세정보
					</span>
				</div>	
					<hr style="margin-right: 50px; margin-left: 50px;">
					
					<div class="list-group2-inner">
						<br>
						<br>
						<br>
					
						
						
						<%
						if(num==1)
						{  %>
						
							<div style="text-align: center;">
								<img style="width:100px;" alt="" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg">
							</div>
							<br>
							
							<form action="myPage/noteReply.jsp" method="post">
									<label style="font-size: 1.2em; margin-left:20px; ">
									<span style="margin-left:370px;">받는사람</span>
									<input type="text" name="receivePeople"  readonly style="text-align: center; width:150px;   border:1px solid #e9e9e9;" placeholder="아이디 입력" value="<%=vo.getMem_id()%>(나)">
									<span style="margin-left:370px;">보낸사람</span>
									
									<%if(vo.getNote_send().equals("SYSTEM")){%>
										<input type="text"  name="sendPeople1" id="receive" readonly style="color:blue; text-align: center; width:150px;  border:1px solid #e9e9e9;" placeholder="아이디 입력" value="시스템봇">
									<%}else{%>
										<input type="text" name="sendPeople1" id="receive" readonly style="text-align: center; width:150px;  border:1px solid #e9e9e9;" placeholder="아이디 입력" value="<%=vo.getNote_send()%>">
									<%} %>
									
									<%-- <input type="text" name="sendPeople1" id="receive" readonly style="text-align: center; width:150px;  border:1px solid #e9e9e9;" placeholder="아이디 입력" value="<%=vo.getNote_send() %>"> --%>
									<span style="margin-left:370px;">보낸시간</span>
									<input type="text" class="sendDate" name="sendPeople"  readonly style="font-size:16px; center; width:150px;  border:1px solid #e9e9e9;"  value="<%=vo.getNote_sdate() %>">
								</label>
									<br>
									<label style="font-size: 1.2em; margin-left:20px; float:left;">쪽지제목</label>
									<%if(vo.getNote_send().equals("SYSTEM")){%>
										<input type="text" value="<%=vo.getNote_title()%>번 게시물에서 동행신청 글 입니다." readonly class="input-innerNote" placeholder="제목을 입력해주세요.(30자 이내)" maxlength="30" name="sendTitle" style="width:600px;">
									<%} else{%>
										<input type="text" value="<%=vo.getNote_title() %>" readonly class="input-innerNote" placeholder="제목을 입력해주세요.(30자 이내)" maxlength="30" name="sendTitle" style="width:600px;">
									<%} %>
									<br>
									<br>
								<label style="font-size: 1.2em; margin-left:20px; float:left;">쪽지내용</label>
								<div style="margin-left: 20px; clear : both;">
								<%if(vo.getNote_send().equals("SYSTEM")){%>
								<textarea class="edit_input" name="sendContent" readonly placeholder="내용을 입력해주세요.(2000자 이내)" 
												maxlength="2000" style="width:600px; height:300px; border: 1px solid #e9e9e9;"><%=vo.getNote_content() %>님께서 동행신청 쪽지입니다 승인하시겠습니까?</textarea>
								<%} else{%>	
								<textarea class="edit_input" name="sendContent" readonly placeholder="내용을 입력해주세요.(2000자 이내)" 
												maxlength="2000" style="width:600px; height:300px; border: 1px solid #e9e9e9;"><%=vo.getNote_content() %></textarea>
								<%} %>				
								</div>
								<br>
								<br>
							  <div style="text-align: center; padding-bottom: 30px;">
<!-- 								form안에서 form을 불러올 수 없기 때문에  내부스크립트에서 ajax로 처리함-->
								<% if(vo.getNote_send().equals("SYSTEM")){ %>
									<button type="button"  class="btn btn-light" id="withmeinsert" value="승인하기">승인하기</button>
									<button type="button" id="packspance1" class="btn btn-light">뒤로가기</button>
								<% } else {%>
									<button id="note" type="submit" class="btn btn-light">답변하기</button>
									<button type="button" id="packspance1" class="btn btn-light">뒤로가기</button>
								<%} %>
							  </div>			
							</form>
						
							
						<% } else if(num==2) {%>
										<div style="text-align: center;">
								<img style="width:100px;" alt="" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg">
							</div>
							<br>
							
							<form action="myPage/noteReply.jsp" method="post">
									<label style="font-size: 1.2em; margin-left:20px; ">
									<span style="margin-left:370px;">받는사람</span>										  														
									<input type="text" name="receivePeople" readonly style="text-align: center; width:150px;   border:1px solid #e9e9e9;" placeholder="아이디 입력" value="<%=vo.getMem_id() %>">
									<span style="margin-left:370px;">보낸사람</span>
									<input type="text" name="sendPeople"  id="sendPeople" readonly style="text-align: center; width:150px;  border:1px solid #e9e9e9;" placeholder="아이디 입력" value="<%=vo.getNote_send() %>(나)">
									<span style="margin-left:370px;">보낸시간</span>
									<input type="text"  name="sendPeople"  readonly style="font-size:16px; center; width:150px;  border:1px solid #e9e9e9;"  value="<%=vo.getNote_sdate() %>">
								</label>
									<br>
									<label style="font-size: 1.2em; margin-left:20px; float:left;">쪽지제목</label>
									<input type="text" value="<%=vo.getNote_title() %>" readonly class="input-innerNote" placeholder="제목을 입력해주세요.(30자 이내)" maxlength="30" name="sendTitle" style="width:600px;">
									<br>
									<br>
								<label style="font-size: 1.2em; margin-left:20px; float:left;">쪽지내용</label>
								<div style="margin-left: 20px; clear : both;">	
								<textarea class="edit_input" name="sendContent" readonly placeholder="내용을 입력해주세요.(2000자 이내)" 
												maxlength="2000" style="width:600px; height:300px; border: 1px solid #e9e9e9;"><%=vo.getNote_content() %></textarea>
								</div>
								<br>
								<br>
							  <div style="text-align: center; padding-bottom: 30px;">
									<button id=noteReply type="button" class="btn btn-light">답변하기</button>
									<button id="packspance1" type="button" class="btn btn-light">뒤로가기</button>
							  </div>			
							</form>
						
						<%} %>
							
					
					</div>
					<br><br>
				</div>
			</div>
			<br>
			<br>
			
</body>
</html>