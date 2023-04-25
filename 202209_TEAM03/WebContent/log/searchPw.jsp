<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="../js/jquery-3.6.1.min.js"></script>


<%
String ans=request.getParameter("answer");

if(ans!=null){
int answer=Integer.parseInt(ans);
	if(answer==1){%>
	
		<script>
			$(function(){
				alert("해당 메일로 비밀번호를 발송하였습니다!");
			})
		</script>
		
	<%}else{%>
	<script>
		alert("올바르지 않은 회원 정보입니다. 다시 확인해주시기 바랍니다");
	</script>
	<%} 
}%>


<script>
$(document).ready(function(){
	$('#backLogin').on('click',function(){
		window.location="loginMain.jsp";
	})
	
	$('#login').on('click',function(){
		
		window.location="loginMain.jsp";
	})//searchId끝
})
</script>


<title>프로젝트 로그인창</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>


<section style="margin: 10% auto;">
	<div
		style="border: 1px solid #DCDCDC; width: 500px; height: 500px; margin: auto;">
		<form action="<%=request.getContextPath()%>/MailTest2.do" method="post">
			<div class="mb-3">
				<h2 style="text-align: center; padding-top: 20px">비밀번호찾기</h2>
				<br>
				<br> <label for="exampleInputEmail1" class="form-label" style="margin-left:70px;">아이디</label>
				<input type="text" class="form-control" name="id" id="idvalue" placeholder="아이디를 입력해주세요."
					aria-describedby="emailHelp" style="width:350px; margin-left:70px;">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label" style="margin-left:70px;">이메일주소</label> 
				<input type="text" placeholder="이메일을 입력해주세요" class="form-control" name="email" id="pwvalue" style="width:350px; margin-left:70px;">
			</div>
			
			<br>
			<br>
			<br>
			<div style="margin-left:60px;">
			
			<button type="submit" class="btn btn" style="font-size: 0.8em;" id="searchPw">비밀번호찾기</button>
			<button type="button" class="btn btn" style="font-size: 0.8em;" id="login">로그인이동</button>
			</div>
		</form>

	</div>
</section>
	


</body>
</html>