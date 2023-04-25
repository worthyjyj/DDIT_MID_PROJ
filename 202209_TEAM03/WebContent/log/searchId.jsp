<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="../js/jquery-3.6.1.min.js"></script>


<script>
$(document).ready(function(){
	$('#backPage').on('click',function(){
		window.location="loginMain.jsp";
	});
	$('#searchPw').on('click',function(){
		window.location="searchPw.jsp";
	});
})


</script>

<script>
$(function(){
	$("#searchId").on("click",function(){
		name = $("#idvalue").val();
		phone = $("#pwvalue").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/SearchId.do",
			data : {name : name,
					phone : phone},
			type : "post",
			success : function(res){
				if(res.mem_id !=null){
					alert("회원님의 아이디 : "+res.mem_id);
				}else{
					alert("회원 정보가 존재하지 않습니다...");
				}
			},
			error : function(xhr){
				 alert("상태 : "+xhr.status); 
			},
			dataType : "json"	
		})
	})//searci 끝
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
		<form action="<%=request.getContextPath()%>/SearchId.do" method="post">
			<div class="mb-3">
				<h2 style="text-align: center; padding-top: 20px">아이디찾기</h2>
				<br>
				<br> <label for="exampleInputEmail1" class="form-label" style="margin-left:70px;">이름</label>
				<input type="text" class="form-control" name="name" id="idvalue"
					aria-describedby="emailHelp" style="width:350px; margin-left:70px;">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label" style="margin-left:70px;">전화번호</label> 
				<input type="text" placeholder="- 포함" class="form-control" name="phone" id="pwvalue" style="width:350px; margin-left:70px;">
			</div>
			
			<br>
			<br>
			<br>
			<div style="margin-left:50px;">
				<button type="button" class="btn btn" style="margin-left:55px; font-size: 0.8em;" id="searchId">아이디찾기</button>
				<button type="button" class="btn btn" style="font-size: 0.8em;" id="searchPw">비밀번호찾기</button>
				<button type="button" class="btn btn" style="font-size: 0.8em;" id="backPage">뒤로가기</button>
			
			</div>
		</form>

	</div>
</section>

</body>
</html>