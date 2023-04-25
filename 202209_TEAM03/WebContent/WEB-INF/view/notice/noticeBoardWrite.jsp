<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 공지사항 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"crossorigin="anonymous">

<style type="text/css">
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
	font-weight: normal;
	font-style: normal;
}

ul, li, h2, button, span, input, label, textarea, a{
	font-family: 'NanumSquareNeo-Variable';
}

section div {
	margin: 5px auto;
	background: white;
}

header{
	border-bottom: 1px solid #DCDCDC;
	background: white;
}

.container-fluid img{
	width : 190px;
	height: 100px;
	margin-left: 300px;
}

.nav-item {
	font-size: 1.2em;
}

form input{
	margin-left:  40px;
	margin-top: 20px;
	height: 45px;
	width: 400px;
	border: 1px solid #DCDCDC;
	border-radius: 3px;
}
.shbtn {
	width : 55px;
	height : 45px;
	margin-left : 5px;
	margin-top : 21px;
	border : 1px solid #3CB371;
	border-radius: 5px;
	background: white;
}

.mainbtn{
	font-family: 'NanumSquareNeo-Variable'; 
	background-color: #3CB371; 
	border: none;
	color : #3CB371;
	border-radius: 5px;
	width : auto;
	height: auto;
	background: white;
	margin-top: 30px;
	margin-left: 20px;
}

.nav{
	width : 1300px;
	margin-left: 300px;
}

.nav-link{
	color : #3CB371;
	font-size: 1.2em;
	margin-right: 20px;
	
}

.nav-link:visited {
	color : #3CB371;
}

.gotop{
	text-decoration: none;
	color : #3CB371;
}

.gotop:visited{
	color : #3CB371;
}

svg{
	color : #3CB371;
}


</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#insertBtn').on('click', function(){
		location.href="<%= request.getContextPath()%>/noticeBoardWrite.do";
	});
	
});

</script>

</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


		<!-- 관리자 로그인 이후 헤더 -->
	<header class="sticky-top">
		<nav class="navbar navbar-expand-lg" style="background: white;">
			<div class="container-fluid">
				<a href="<%=request.getContextPath()%>/mainIndex.jsp"><img src="<%= request.getContextPath() %>/images/로고5.png"></a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="d-flex" role="search"
						action="<%= request.getContextPath()%>/searchAllList.do"
						method="get">
						<!-- 여기서 검색버튼을 클릭시 모든 게시글을 검색 가능..? -->
						<input class="sdata" name="sdata" id="sdata" type="search"
							placeholder="  동행을 찾아보세요!" aria-label="Search">

						<!-- 검색버튼 -->
						<button class="shbtn" id="shbtn" type="submit">
							<svg style="color: #3CB371" xmlns="http://www.w3.org/2000/svg"
								width="25" height="25" fill="currentColor" class="bi bi-search"
								viewBox="0 0 16 16">
							  <path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
							</svg>
						</button>
					</form>
				</div>
				<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border:none; background: white; margin-top:27px;">
    <svg style="color:#3CB371;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="<%= request.getContextPath()%>/noticeBoardWrite.do">공지사항 글쓰기</a></li>
    <li><a class="dropdown-item" href="#">쪽지보내기</a></li>
  </ul>
</div>
				<a href=""><svg style="margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
</svg></a>
<a href=""><svg style="margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-card-text" viewBox="0 0 16 16">
  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
  <path d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8zm0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
</svg></a>
<a href=""><svg style="margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-menu-down" viewBox="0 0 16 16">
  <path d="M7.646.146a.5.5 0 0 1 .708 0L10.207 2H14a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h3.793L7.646.146zM1 7v3h14V7H1zm14-1V4a1 1 0 0 0-1-1h-3.793a1 1 0 0 1-.707-.293L8 1.207l-1.5 1.5A1 1 0 0 1 5.793 3H2a1 1 0 0 0-1 1v2h14zm0 5H1v2a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2zM2 4.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
</svg></a>

<%
String PNAME = (String) session.getAttribute("PNAME");
%>
				<script>
				$(document).ready(function(){
					$('#logout').on('click',function(){
						alert("<%=PNAME%>님 로그아웃 합니다!");
					})//회원 로그아웃 끝
					
					$('#adminLogout').on('click',function(){
						alert("<%=PNAME%>님 로그아웃 합니다!");
										})//관리자 로그아웃 끝
					})
				</script>
				
				<span style="margin-top: 30px;">관리자모드로 로그인하셨습니다.</span>
				<form action="<%=request.getContextPath()%>/logout.do" method="post">
					<button type="submit" id="logout" class="mainbtn"
						style="margin-right: 300px;">로그아웃</button>
				</form>				
			</div>
		</nav><br>
		<nav class="nav">
  			<a class="nav-link" href="<%=request.getContextPath()%>/mainIndex.jsp">홈</a> 
			<a class="nav-link" href="<%=request.getContextPath()%>/mainboard/mainBoardList.do">동행게시판</a>
			<a class="nav-link" href="<%=request.getContextPath()%>/freeboard/freeBoardList.do">자유게시판</a>
			<a class="nav-link" href="<%=request.getContextPath()%>/reviewboard/reviewBoardList.do">후기게시판</a>
			<a class="nav-link" href="<%=request.getContextPath()%>/noticeBoardList.do" style="margin-left: 680px; margin-right: none; color: black; font-size: 1.0em;">공지사항</a>
</nav>
	</header>
	<br>
	
	
	<div>
	<h2 style="margin-left: 300px;">공지사항 작성</h2>
	<hr style="width:1300px; margin-left: 300px;">
	</div>
	
		<section>
		<form  id="noticeBoardInsertForm" method="post" enctype="multipart/form-data" action="<%= request.getContextPath()%>/noticeBoardWrite.do">
		<div class="col-md-6" style="margin-left: 450px;">
			<!-- 제목 -->
			<input name="notice_title" id="notice_title" type="text" style="width: 1000px; margin-left:3px;" class="form-control" placeholder="ex) 2023년부터 새로운 서비스가 시작됩니다.">
		</div>
		<hr style="color: #DCDCDC; width: 1000px; margin-left: 480px; margin-left:auto; margin-right:auto;">
		
		<div class="col-md-6" style="margin-left:450px;">
			<!-- 내용 -->
			<textarea name="notice_content" id="notice_content" style="width: 1000px;" class="form-control" id="" rows="10" placeholder="음성통화가 가능한 채팅창을 경험해보세요!"></textarea>
		</div>
		
		<hr style="color: #DCDCDC; width: 1000px; margin-left:auto; margin-right:auto;">
		
		<div class="col-md-6" style="margin-left:450px;">
			<!-- 사진 업로드 -->
			<input name="notice_pic" id="notice_pic" type="file" style="width:1000px; margin-left:3px;" class="form-control" >
		</div>
		<br>
		<div class="col-md-6" style="margin-left:450px;">
			<!-- 이전화면으로 돌아가기 -->
			<button style="font-family: 'NanumSquareNeo-Variable'; width: 300px; margin-left:180px; border: 1px solid #9F9D9D; background: #9F9D9D;" class="btn btn-success" type="submit">취소하기</button>
			<!-- 글 등록 이후 동행게시판리스트에 포함되며, 동행게시판리스트로 이동 -->
			<button id="insertBtn" style="font-family: 'NanumSquareNeo-Variable'; width: 300px; border: 1px solid #3CB371; background: #3CB371;" class="btn btn-success" type="submit">등록하기</button>
		</div>
	</form>	
	</section>
	<br>
	
	
		
		<!-- 푸터 -->
		<footer style="margin-bottom: none; border-top: 1px solid #DCDCDC" class="text-muted py-5">
		<form>
			<div class="container">
				<p class="float-end mb-1">
					<a class="gotop" href="#">위로 올라가기</a>
				</p>
				<img src="<%= request.getContextPath() %>/images/로고5.png" style="width:110px; height: 70px;"> 
				<p style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.2em;" class="mb-1">동행 - 동준이와 행복한 2차 프로젝트 !</p>
				<p style="font-family: 'NanumSquareNeo-Variable'; " class="mb-1">박지은 신동준 정수영 이영진 이효미 장성규</p>
				<p style="font-family: 'NanumSquareNeo-Variable'; " class="mb-1">[대덕인재개발원 2022.09. 405호 2차 프로젝트 3팀]</p>
			</div>
		</form>
	</footer>



</body>
</html>