<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>후기게시판 모아보기</title>
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

.nav-item, .ninkname {
	font-size: 0.8em;
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

.card-header{
 background: #F0FFF0;
}

.hit{
	font-size: 0.7em;
}

a{
	text-decoration: none;
	color : black;
}

a:visited {
	color : black;
}

a:hover {
	color : black;
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

	<br>
	
			<!-- 사진 섹션 -->
	<section>
		<div class="col-md-6" style="margin-top:20px; margin-left: 310px;">
			<img alt="" src="../images/동행친구찾기.png" style="width:1300px; heigth:300px;">
		</div>
	</section><br>
	
		<!-- 지역선택 섹션 -->
	<section>
		<div class="col-md-6"
			style="width: 1300px; height: 220px; margin-left: auto; margin-right: auto; margin-top: 20px; border: 1px solid #DCDCDC; border-radius: 5px;">
			<div class="col-md-6" style="width: 1000px; margin-top: 20px;">
				<span style="margin-left: 15px; margin-right: 30px;">검색지역 선택</span>
				<div class="btn-group">
					<button type="button" class="btn btn-danger dropdown-toggle"
						style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371"
						data-bs-toggle="dropdown" aria-expanded="false">대륙 선택</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">아시아</a></li>
						<li><a class="dropdown-item" href="#">유럽</a></li>
						<li><a class="dropdown-item" href="#">아메리카</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">오세아니아</a></li>
					</ul>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-danger dropdown-toggle"
						style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371"
						data-bs-toggle="dropdown" aria-expanded="false">국가 선택</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">아시아</a></li>
						<li><a class="dropdown-item" href="#">유럽</a></li>
						<li><a class="dropdown-item" href="#">아메리카</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">오세아니아</a></li>
					</ul>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-danger dropdown-toggle"
						style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371"
						data-bs-toggle="dropdown" aria-expanded="false">도시 선택</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">아시아</a></li>
						<li><a class="dropdown-item" href="#">유럽</a></li>
						<li><a class="dropdown-item" href="#">아메리카</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">오세아니아</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-6"
				style="width: 1300px; margin-top: 20px; height: 40px;">
				<span style="margin-left: 15px; margin-right: 30px;">검색날짜 선택</span>
				<input type="date" style="border: none"> <span> - </span> <input
					type="date" style="border: none">
			</div>
			<hr style="color: #DCDCDC; width: 1300px;">
			<button
				style="font-family: 'NanumSquareNeo-Variable'; width: 200px; margin-left: 1000px; border: 1px solid #3CB371; background: #3CB371;"
				class="btn btn-success" type="submit">검색하기</button>
		</div>
	</section>
	<br>
	
	
				<!-- 정렬 섹션 -->
	<section>
		<ul class="nav nav-tabs" style="width:1300px; margin-left:auto; margin-right: auto;">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">정렬</a></li>
			<li class="nav-item"><a class="nav-link" href="#">등록순</a></li>
			<li class="nav-item"><a class="nav-link" href="#">조회수순</a></li>
		</ul>
	</section><br>
	
		<!-- 동행찾기 카드형식 섹션 -->
	<section>
		<div class="row" style="width:1300px; margin-left: auto; margin-right: auto; border:1px solid #DCDCDC; border-radius: 5px;">
			<div class="card" style="width: 18rem; margin-left: 29px; margin-top:10px; margin-bottom: 10px;">
				<img src="../images/한라산설산.jpg" style="margin-top:10px; margin-bottom: 10px; margin-top: 8px;"
					class="card-img-top" alt="...">
				<div class="card-body">
					<a href=""><h5 class="card-title" style="font-family: 'NanumSquareNeo-Variable';">게시글 제목</h5></a>
					<p class="card-text" style="font-family: 'NanumSquareNeo-Variable';">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">
  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/>
</svg>&nbsp;모집 상태</li>
					<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg>&nbsp;여행 지역</li>
					<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>
  <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
</svg>&nbsp;여행 기간</li>
				</ul>
				<div class="card-body">
					<span><button style="border:none; background: none; width:auto;"> <img alt="" src="../images/프으사아.jpg" width="30" height="30" style=" border-radius: 30px;">
						<span>&nbsp;닉네임</span>
					</button> </span><br>
					<svg style="margin-left: 90px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  						<path
							d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
 						 <path
							d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
						</svg>
					<span>&nbsp;0</span>
					<span>
					<button style="border:none; background: none; width:auto; margin-left:10px;"> 
					 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
				  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
				</svg>
				<span>찜하기</span>
				</button></span>
				</div>
			</div>

		</div>
	</section><br>
	
	

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