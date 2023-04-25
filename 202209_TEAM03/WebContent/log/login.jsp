<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="../js/jquery-3.6.1.min.js"></script>

<%
String error = (String)request.getAttribute("error");

if(error!=null){
	error="로그인 정보가 일치하지 않습니다";
%>
<script type="text/javascript">
	alert("<%=error%>");
</script>
<%} %>

<script>
$(document).ready(function(){
	$('#searchId').on('click',function(){
		window.location="searchId.jsp";
	})//searchId끝
	
	$('#searchPw').on('click',function(){
		window.location="searchPw.jsp";
	})//searchPw끝
	
	$('#signUp').on('click',function(){
		window.location="join.jsp";
	})//searchPw끝
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

	<header class="sticky-top">
		<nav class="navbar navbar-expand-lg"style="background:white; border-bottom: 1px solid #DCDCDC">
			<div class="container-fluid">
			<img alt="로고.png" src="../images/로고2.png" style="width:200px; height:50px; margin-left:50px;">

				<a class="navbar-brand" href="#" style="margin-left: 10px">프로젝트</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="#">동행게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">후기게시판</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 글쓰기 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">동행글쓰기</a></li>
								<li><a class="dropdown-item" href="#">자유글쓰기</a></li>
								<li><a class="dropdown-item" href="#">후기글쓰기</a></li>
							</ul></li>
						<form class="d-flex" role="search">
							<input style="margin-left: 17px; width: 400px;"
								class="form-control me-2" type="search" placeholder="동행을 찾아보세요!"
								aria-label="Search">
							<button style="width: 70px; border:1px solid #3CB371;" class="btn btn-outline-success"type="submit">검색</button>
						</form>
					</ul>
				</div>
				<button style="background-color:#3CB371; border:1px solid #3CB371;" type="button" class="btn btn-success">로그인</button>
				<button style="background-color:#3CB371; border:1px solid #3CB371; margin-left: 15px; margin-right:50px;" type="button" class="btn btn-success">회원가입</button>
			</div>
		</nav>
	</header>
<section style="margin: 10% auto;">
	<div
		style="border: 1px solid #DCDCDC; width: 500px; height: 500px; margin: auto;">
		<form action="<%=request.getContextPath()%>/join.do" method="post">
			<div class="mb-3">
				<h2 style="text-align: center; padding-top: 20px">로그인</h2>
				<br>
				<br> 
				<label for="exampleInputEmail1" class="form-label" style="margin-left:70px;">아이디</label>
				
				<%
					String idcheck=(String)session.getAttribute("idcheck");
					if(idcheck !=null && idcheck.length()>0){				
				%>
				<input type="text" class="form-control" name="id" id="idvalue" 
				aria-describedby="emailHelp" style="width:350px; margin-left:70px;" value="<%=idcheck %>" >
				<%}else{ %>
				<input type="text" class="form-control" name="id" id="idvalue" 
				aria-describedby="emailHelp" style="width:350px; margin-left:70px;" placeholder="아이디를 입력해주세요" >
				<%} %>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label" style="margin-left:70px;">비밀번호</label> 
				<input type="password" placeholder="비밀번호를 입력해주세요" class="form-control" name="pw" id="pwvalue" style="width:350px; margin-left:70px;">
			</div>
			<div class="mb-3 form-check">
				<%
				String onoff=(String)session.getAttribute("onoff");
				if(onoff=="on"){				
				%>
				<input type="checkbox" class="form-check-input" name="checkbox" style="margin-left:60px;" checked>
				<%} else{%>
				<input type="checkbox" class="form-check-input" name="checkbox" style="margin-left:60px;">
				<%} %>
				<label class="form-check-label" for="exampleCheck1">ID저장</label>
			</div>
			<button type="submit" id="button1"class="btn btn-success" style="background-color:#3CB371; border:1px solid #3CB371; margin-left:160px; width:150px;">로그인</button>
			<br><br><br>
 </form>
			<button type="button" class="btn btn" style="margin-left:90px; font-size: 0.8em;" id="searchId">아이디찾기</button>
			<button type="button" class="btn btn" style="font-size: 0.8em;" id="searchPw">비밀번호찾기</button>
			<button type="button" class="btn btn" style="font-size: 0.8em;" id="signUp">회원가입하기</button>

	</div>
</section>
	<footer style="margin-bottom: none; border-top:1px solid #DCDCDC" class="text-muted py-5">
		<form>
			<div class="container">
				<p class="float-end mb-1">
					<a href="#">Back to top</a>
				</p>
				<p class="mb-1">Album example is © Bootstrap, but please download
					and customize it for yourself!</p>
				<p class="mb-0">
					New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a
						href="/docs/5.2/getting-started/introduction/">getting started
						guide</a>.
				</p>
		</div>
	</form>	
	</footer>



</body>
</html>