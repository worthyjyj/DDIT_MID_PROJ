<%@page import="vo.ReviewBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>후기게시판 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"crossorigin="anonymous">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.js"" type="text/javascript"></script>

<style type="text/css">
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
	font-weight: normal;
	font-style: normal;
}

ul, li, h2, h3, button, span, input, label, textarea, a, div{
	font-family: 'NanumSquareNeo-Variable';
}

section div {
/* 	margin: 5px auto; */
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

.gotop:visited, .replystate{
	color : #3CB371;
}

.replytext{
	border : 1px solid #DCDCDC;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	width: 900px;
	height: 40px;
}

.replybtn{
	font-family: 'NanumSquareNeo-Variable'; 
	background-color: #3CB371; 
	border: none;
	width : 70px;
	height: 40px;
	color: white;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

</style>


</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<!-- 로그인 이후 헤더 -->
	<header class="sticky-top">
		<nav class="navbar navbar-expand-lg" style="background: white;">
			<div class="container-fluid">
				<img src="../images/로고5.png"> 
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<form class="d-flex" role="search">
							<!-- 여기서 검색버튼을 클릭시 모든 게시글을 검색 가능..? -->
							<input class="" type="search" placeholder="  동행을 찾아보세요!" aria-label="Search">
							
							<!-- 검색버튼 -->
							<button class="shbtn" type="submit">
							<svg style="color:#3CB371" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
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
    <li><a class="dropdown-item" href="#">동행게시판글쓰기</a></li>
    <li><a class="dropdown-item" href="#">후기게시판글쓰기</a></li>
    <li><a class="dropdown-item" href="#">자유게시판글쓰기</a></li>
  </ul>
</div>
				<a href=""><svg style="color:#3CB371; margin-top: 30px; margin-right: 30px;"  xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
</svg></a>
<a href=""><svg style="color:#3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
</svg></a>
				<span style="margin-top: 30px;">이효미님! 환영합니다!</span>
				<button type="button" class="mainbtn" style="margin-right:300px;">로그아웃</button>
			</div>
		</nav><br>
		<nav class="nav">
  <a class="nav-link" href="#">홈</a>
  <a class="nav-link" href="#">동행게시판</a>
  <a class="nav-link" href="#">후기게시판</a>
  <a class="nav-link" href="#">자유게시판</a>
  <a class="nav-link" href="#" style="margin-left: 680px; margin-right:none; color:black; font-size: 1.0em;">공지사항</a>
</nav>
	</header>
	
	<% 
		ReviewBoardVO rvo = (ReviewBoardVO)request.getAttribute("rvo");
	%>
	
	<!-- 상단 사진 섹션 -->
	<!-- 후기게시글에 업로드된 사진으로 변경 -->
	<section>
		<div style="margin-top:20px; margin-left:310px;">
			<img alt="" src="<%=request.getContextPath() %>/reviewBoardimageView.do?rev_no=<%= rvo.getRev_no() %>" style="width: 1300px; height: 300px;">
		</div>
	</section>
	
	<!-- 하단 게시글 상세보기 섹션 -->
	<section>
		<div class="row" style="margin-left: auto; margin-right: auto; margin-top:35px;">
			<div style="height: auto; width: 900px; margin-left:320px;">
				<div>
					<!-- 게시글 제목출력 -->
					<h3 name="" id="" style="margin-top:20px; margin-left:10px;"><%=rvo.getRev_title() %></h3>
				</div>
				<br>
				<div style="border:1px solid #DCDCDC; border-radius: 5px; width:750px; height: 60px; padding-top:15px;">
					<!-- 후기를 쓴 지역(도시명)을 스판태그에 출력 -->
					<a style="font-size:1.2em; margin-left:25px; margin-top: 30px;">여행지역 : </a><span id="">제주도</span><br>
				</div><br>
				<!-- 게시글 내용출력 -->
				<div style="border:1px solid #DCDCDC; border-radius: 5px; width:750px; height: 500px;">
					<span id=""><%=rvo.getRev_content() %></span>
				</div><br>
				<div style="border-radius: 5px; width:750px; height: auto;">
				
				<button type="button" class="btnDm">수정</button> <button type="button" class="btnDm">삭제</button>
				
					<!-- 게시날짜, 조회수 스판태그에 출력 -->
					게시날짜 : <span id=""><%=rvo.getRev_date() %></span><br>
					조회수 : <span id=""><%=rvo.getRev_hit() %></span>
				</div><br>
				<div>
					<input class="replytext" type="text" placeholder="댓글을 입력해주세요." style="width:600px; border:1px solid #DCDCDC;">
					<button class="replybtn" type="button" id="">등록</button>
				</div><br>
				<div style="width:700px;">
				<ul class="list-group list-group-flush">
				  <li class="list-group-item">아직 댓글이 없습니다.</li>
				  <li class="list-group-item">
				  <span><img alt="" src="../images/프으사아.jpg" style="width: 40px; height: 40px; border-radius: 30px;"></span>
				  <span>프로필닉넴</span><span style="font-size: 0.8em;">&nbsp;&nbsp;&nbsp;&nbsp;게시날짜</span><br>
				  한라산 등산 멋져요~~ 
				  </li>
				  <li class="list-group-item">
				  <span><img alt="" src="../images/프으사아.jpg" style="width: 40px; height: 40px; border-radius: 30px;"></span>
				  <span>프로필닉넴</span><span style="font-size: 0.8em;">&nbsp;&nbsp;&nbsp;&nbsp;게시날짜</span><br>
				  한라산 등산 멋져요~~ 
				  </li>
				</ul>
				<br>
				</div>
				</div>

			<!-- 오른쪽 프로필확인 섹션 -->
			<div style="height: 1000px; width: 400px; margin-right: auto;">
				<div style="border: 1px solid #DCDCDC; border-radius:5px; width:350px; height: 300px; margin-left: 10px; margin-top: 80px;">
					<div style="width:330px;">
						<div style="margin-left:30px; margin-top:20px;">
							<span><img alt="" src="../images/프으사아.jpg" style="width: 50px; height: 50px; border-radius: 30px;"></span>
							<span>프로필닉넴</span>
						</div>
						<span></span>
					</div>
					<hr style="color: #DCDCDC; width:300px; margin-left: 25px;"><br>
				<div style="margin-left:25px;">
					<a href="">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
  						<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
					</svg>
					쪽지보내기
					</a>
					<button style="width: 300px; border: 1px solid #3CB371; margin-top:10px; background: #3CB371;" class="btn btn-success" type="submit">답변하기</button>
				</div>					
				</div>
			</div>
		</div>
	</section>

		<!-- 푸터 -->
		<footer style="margin-bottom: none; border-top: 1px solid #DCDCDC" class="text-muted py-5">
		<form>
			<div class="container">
				<p class="float-end mb-1">
					<a class="gotop" href="#">위로 올라가기</a>
				</p>
				<img src="../images/로고5.png" style="width:110px; height: 70px;"> 
				<p style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.2em;" class="mb-1">동행 - 동준이와 행복한 2차 프로젝트 !</p>
				<p style="font-family: 'NanumSquareNeo-Variable'; " class="mb-1">박지은 신동준 정수영 이영진 이효미 장성규</p>
				<p style="font-family: 'NanumSquareNeo-Variable'; " class="mb-1">[대덕인재개발원 2022.09. 405호 2차 프로젝트 3팀]</p>
			</div>
		</form>
	</footer>



</body>
</html>