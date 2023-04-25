<%@page import="freeBoard.controller.FreeBoardList"%>
<%@page import="freeBoard.service.FreeBoardServiceImpl"%>
<%@page import="freeBoard.service.IFreeBoardService"%>
<%@page import="vo.FreeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>동행</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<script type="text/javascript" src="./js/mainboard.js"></script>
<!-- 메인게시판 외부스크립트 -->
<script src="./js/jquery-3.6.1.min.js"></script>
<!-- 제이쿼리 외부 스크립트 -->

<style type="text/css">
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

ul, li, h2, button, span, input, label, textarea, a {
	font-family: 'NanumSquareNeo-Variable';
}

section div {
	/* 	margin: 5px auto; */
	
}

header {
	border-bottom: 1px solid #DCDCDC;
}

.container-fluid img {
	width: 190px;
	height: 100px;
	margin-left: 300px;
}

/* .nav-item { */
/* 	font-size: 1.2em; */
/* } */
form input {
	margin-left: 40px;
	margin-top: 20px;
	height: 45px;
	width: 400px;
	border: 1px solid #DCDCDC;
	border-radius: 3px;
}

.shbtn {
	width: 55px;
	height: 45px;
	margin-left: 5px;
	margin-top: 21px;
	border: 1px solid #3CB371;
	border-radius: 5px;
	background: white;
}

.mainbtn {
	font-family: 'NanumSquareNeo-Variable';
	background-color: #3CB371;
	border: none;
	color: #3CB371;
	border-radius: 5px;
	width: 80px;
	height: 45px;
	background: white;
	margin-top: 30px;
}

.nav {
	width: 1300px;
	margin-left: 300px;
}

.nav-link {
	color: #3CB371;
	font-size: 1.2em;
	margin-right: 20px;
}

.nav-link:visited {
	color: #3CB371;
}

.gotop {
	text-decoration: none;
	color: #3CB371;
}

.gotop:visited {
	color: #3CB371;
}

a {
	text-decoration: none;
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

.ninkname, .hit {
	font-size: 0.9em;
}

.nav-item, .ninkname {
	font-size: 0.8em;
}

/* .heart2{  */
/*     display : none; /*처음 화면에는 안보이다가 댓글 수정을 누르면 나옴 */ */
/*  }  */
</style>


<%
	String PNAME = (String) session.getAttribute("PNAME");

	Object grade = session.getAttribute("grade");
	int gradeNum = (int) grade;
	
	IFreeBoardService service = FreeBoardServiceImpl.getInstance();
	List<FreeBoardVO> FreeBoardList = service.getAllFreeBoard();
%>
<!-- 내부 스크립트 영역 -->


<!-- 외부 스크립트도 첨부해서 사용, 각자 외부 스크립트 쓸 때 이름 겹치지 않게 주의 -->
<script type="text/javascript">

function deletePick(p_name,mb_no){
					
	$.ajax({
	    url: "<%=request.getContextPath()%>/mainboard/pickcancel.do", 
	    data: {
	     "p_name" : p_name,
	     "mb_no" : mb_no
	      },
	    type: 'post',
		dataType : 'text',
		success: function(res){
		if(res == "성공"){ 
			mainListServer(); 
		}else if(res == "실패"){ 
		    alert("찜 취소에 실패했습니다!")
		}
		 }
	   })
}


function insertPick(p_name,mb_no){
			
	$.ajax({
	   url: "<%=request.getContextPath()%>/mainboard/pick.do", 
	   data: {
		"p_name" : p_name,
		"mb_no" : mb_no
	    },
	    type: 'post',
		dataType : 'text',
	success: function(res){
	  if(res == "성공"){ 
	  mainListServer(); 
      }else if(res == "실패"){ 
		alert("찜하기에 실패했습니다!")
	  }
	    }
		   })
}

$(function(){

	//메인동행구하기 카드형 출력 
	mainListServer(); 
	
	//찜하기를 클릭하면 
	$(document).on('click','.pick', function(){
	 var mb_no = $(this).parents('.card').attr('mainidx');
		
	  $.ajax({
	  url: "<%=request.getContextPath()%>/mainboard/pick2.do", 
      data: {
    	  "mb_no" : mb_no
      },
      type: 'post',
  	dataType : 'text',
	success: function(res){
		if(res == "중복"){ //이미 찜하기 되어 있으면 
			deletePick("<%=PNAME%>",mb_no); //프로필이름, 게시물 넘버
		}else if(res == "중복아님"){ // 찜하기 안되어 있으면 
			insertPick("<%=PNAME%>",mb_no); //프로필이름, 게시물 넘버
		}
		 }
      })
	});
		
	
	//메인 네브바 더보기 - 리스트 창 이동 
	$('#mainmore').parent('.navbar-nav').on('click', function(){
		location.href="<%=request.getContextPath()%>/mainboard/mainBoardList.do" 
	})
	
	//메인 카드 클릭이벤트 - 해당 게시글 상세보기 창 이동 
	
	 $(document).on('click','.card-title', function(){
       var mainidx = $(this).parents('.card').attr('mainidx');
		 

	    //카드 클릭시 조회수 올리기 
	     location.href="<%=request.getContextPath()%>/mainboard/mainBoardUphit.do?mb_no="+mainidx
	     
	    // 해당 카드 클릭시 해당 게시글 상세보기창으로 이동  
	     location.href="<%=request.getContextPath()%>/mainboard/mainBoardDetail.do?mb_no="+mainidx
	  }) 
	  
	//자유게시판 네브바 더보기 - 리스트 창 이동 
	$('#freemore').parent('.navbar-nav').on('click', function(){
		location.href="<%=request.getContextPath()%>/freeboard/freeBoardList.do"; 
	})
	 
<%-- 	$.ajax({
	
		url : '<%=request.getContextPath()%>/freeboard/freeboardListN.do',
		type : 'post',
		success : function(res){

			alert("성공상태 : " + res); //상태가 200이면 등록성공
		$.each(function(i,v){
				
			})
			  $('.freeboardrow').html(code); 
		},
		error : function(xhr){
			alert("메인실패 : " + xhr.status);	 
		}
		
	
	}) --%>
	
	  
})



</script>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

	<!-- 로그인 이후 헤더 -->
	<header class="sticky-top" style="background: white;">
		<nav class="navbar navbar-expand-lg" style="background: white;">
			<div class="container-fluid">
				<a href="<%=request.getContextPath()%>/mainIndex.jsp"><img src="<%= request.getContextPath() %>/images/로고5.png"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
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
				
				<%
					if(gradeNum == 1) {
				%>
				
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
								<a href=""><svg style="color:#3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
				  <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
				</svg></a>
				<a href=""><svg style="color:#3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-card-text" viewBox="0 0 16 16">
				  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
				  <path d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8zm0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
				</svg></a>
				<a href=""><svg style="color:#3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-menu-down" viewBox="0 0 16 16">
				  <path d="M7.646.146a.5.5 0 0 1 .708 0L10.207 2H14a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h3.793L7.646.146zM1 7v3h14V7H1zm14-1V4a1 1 0 0 0-1-1h-3.793a1 1 0 0 1-.707-.293L8 1.207l-1.5 1.5A1 1 0 0 1 5.793 3H2a1 1 0 0 0-1 1v2h14zm0 5H1v2a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2zM2 4.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
				</svg></a>
				
				<%		
					}else{
				%>
				
				
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border: none; background: white; margin-top: 27px;">
						<svg style="color: #3CB371;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
						  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
						  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
						</svg>
					</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/mainboard/mainBoardWrite.do">동행게시판글쓰기</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/freeboard/WriteBoard.do">자유게시판글쓰기</a></li>
						<li><a class="dropdown-item" href="<%=request.getContextPath()%>/reviewboard/reviewBoardWrite.do">후기게시판글쓰기</a></li>
					</ul>
				</div>
				<a href="<%=request.getContextPath()%>/mainboard/mainBoardpickList.do"><svg style="color: #3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
				  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
				</svg></a> 
				<a href="<%=request.getContextPath()%>/mypageHome.do"><svg style="color: #3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
				</svg></a>
				
				<%		
					}
				%>
				<!-- 이게 내정보함으로 넘어가는곳 끝-->

				<!-- 여기서부터는 그냥 작업용!!  -->

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


				<%
					if (PNAME != null && gradeNum == 0) {
				%>
				<span style="margin-top: 30px;"><%=PNAME%>님! 환영합니다!</span>
				<%
					} else if (gradeNum == 1){
				%>
				<span style="margin-top: 30px;">관리자 모드로 로그인 하셨습니다.</span>
				<%
					}
				%>
				<form action="<%=request.getContextPath()%>/logout.do" method="post">
					<button type="submit" id="logout" class="mainbtn"
						style="margin-right: 300px;">로그아웃</button>
				</form>
			</div>
		</nav>
		<br>
		<nav class="nav">
			<a class="nav-link" href="<%=request.getContextPath()%>/mainIndex.jsp">홈</a> 
			<a class="nav-link"
				href="<%=request.getContextPath()%>/mainboard/mainBoardList.do">동행게시판</a>
			<a class="nav-link"
				href="<%=request.getContextPath()%>/freeboard/freeBoardList.do">자유게시판</a>
			<a class="nav-link"
				href="<%=request.getContextPath()%>/reviewboard/reviewBoardList.do">후기게시판</a>
			<a class="nav-link" 
			   href="<%=request.getContextPath()%>/noticeBoardList.do"
				style="margin-left: 680px; margin-right: none; color: black; font-size: 1.0em;">공지사항</a>
		</nav>
	</header><br>

	<!-- 메인 슬라이드 사진 섹션 -->
	<section>
		<div id="carouselExampleControls"
			style="width: 1300px; margin-left: auto; margin-right: auto;"
			class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/main1.png" style="height: 500px;"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="images/main2.png" style="height: 500px;"
						class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="images/main3.png" style="height: 500px;"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>

	<!-- 동행찾기 네브바 섹션 -->
	<section>
		<nav style="margin-top: 20px;" class="navbar navbar-expand-lg">
			<div
				style="width: 1300px; margin-left: auto; margin-right: auto; border-bottom: 1px solid #DCDCDC;"
				class="container-fluid">
				<a class="navbar-brand" href="#">취향 저격 동행찾기</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div style="margin-left: 1000px;" class="navbar-nav">
						<a class="nav-link disabled" id="mainmore">더보기</a>
					</div>
				</div>
			</div>
		</nav>
	</section>

	<!-- 동행찾기 카드형식 섹션 -->
	<section>
		<div id="cardList"></div>
	</section>
	<br>
	<br>


	<!-- 중간 슬라이드 사진 섹션 -->
	<section>
		<div class="row">
			<div style="width: 550px; height: 300px; margin-left: 360px;">
				<img alt="" src="images/m.main1.png">
			</div>
			<div style="width: 550px; height: 300px; margin-left: 100px;">
				<img alt="" src="images/m.main2.png">
			</div>
		</div>
	</section>
	
		<!-- 자유게시판 네브바 섹션 -->
	<section>
		<nav style="margin-top: 20px;" class="navbar navbar-expand-lg">
			<div
				style="width: 1300px; margin-left: auto; margin-right: auto; border-bottom: 1px solid #DCDCDC;"
				class="container-fluid">
				<a class="navbar-brand" href="#">여행에 대한 모든 것을 물어봐요!</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div style="margin-left: 890px;" class="navbar-nav">
						<a class="nav-link disabled" id="freemore">더보기</a>
					</div>
				</div>
			</div>
		</nav>
	</section>

	<section>
		<div class="row" class="freeboardrow"
		 style="width: 1300px; height: auto; margin-left: auto; margin-right: auto; margin-top: 20px; border-radius: 5px;">
		<% 
		if(FreeBoardList == null || FreeBoardList.size() == 0) {
		%>
			<p>존재하는 게시글이 없습니다.</p>
		</div>	
		
		<%
		} else { 
			for(int i = 0; i < 2 && FreeBoardList.size() > i; i++){
		%>
		
		<!-- 자유게시글 리스트2개 띄우는 곳 -->
			<div class="col-md-6">
				<div class="card"
					style="width: 560px; margin-left: 35px; margin-top: 10px; margin-bottom: 10px;">
					<div class="card-header"
						style="font-family: 'NanumSquareNeo-Variable';">
						<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
							fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
 					 	<path
								d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
  					 	<path
								d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
						</svg>
						<%
						if(FreeBoardList.get(i).getFb_reg() == null || FreeBoardList.get(i).getFb_reg().length() <= 1){
						%>
						<span>선택안함</span>
						<%
						}else {
						%>
						<span><%= FreeBoardList.get(i).getFb_reg()%></span>
						<%
						}
						%>
					</div>

					<div class="card-body">
						<blockquote class="blockquote mb-0">
							<a href="<%= request.getContextPath()%>/freeboard/freeboardArticle.do?bo_num=<%= FreeBoardList.get(i).getFb_no() %>"><p style="font-family: 'NanumSquareNeo-Variable';"><%=FreeBoardList.get(i).getFb_title()%></p></a>
							<footer class="">
							
								<a><img alt="" src="<%=request.getContextPath()%>/freeboard/imageView2.do?p_pic=<%=FreeBoardList.get(i).getP_pic()%>" width="40" height="40"
									style="margin-left: auto; border-radius: 30px;"> <span
									class="ninkname"><%= FreeBoardList.get(i).getP_name() %></span> </a>
								<svg style="margin-left: 350px;"
									xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
		  						<path
										d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
		 					    <path
										d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
								</svg>
								<span class="hit"><%=FreeBoardList.get(i).getFb_hit()%></span>
							</footer>
						</blockquote>
					</div>
				</div>
			</div>
			
	<%  	
			}
		}
	%>	
	</div> <!-- 자유게시글 리스트2개 띄우는 곳 끝 -->
	</section>
	<br>
	
	

	<!-- 후기게시판 네브바 섹션 -->
	<section>
		<nav style="margin-top: 20px;" class="navbar navbar-expand-lg">
			<div
				style="width: 1300px; margin-left: auto; margin-right: auto; border-bottom: 1px solid #DCDCDC;"
				class="container-fluid">
				<a class="navbar-brand" href="#">좋은 여행지를 살펴볼까요?</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div style="margin-left: 930px;" class="navbar-nav">
						<a class="nav-link disabled" id="reviewmore">더보기</a>
					</div>
				</div>
			</div>
		</nav>
	</section>
	
	<!-- 후기게시판 카드형식 섹션 -->
	<section>
		<div class="row"
			style="width: 1300px; margin-left: auto; margin-right: auto; border-radius: 5px;">
			<div class="card mb-3"
				style="width: 410px; margin-left: 18px; margin-top: 10px; margin-bottom: 10px">
				<div class="row g-0">
					<div class="col-md-4">
						<img src="images/후쿠오카마린월드.jpg" class="img-fluid rounded-start"
							alt="..."
							style="margin-top: 10px; margin-bottom: 10px; height: 170px;">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h7 class="card-title"> <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  <path
									d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
  <path
									d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg>후쿠오카</h7>
							<br> <br> <a href=""><p class="card-text"
									style="font-family: 'NanumSquareNeo-Variable';">후쿠오카 마린월드 동행후기입니다:)</p></a><br>

							<p class="card-text">
								<a> <img alt="" src="images/프으사아.jpg" width="30" height="30"
									style="margin-left: auto; border-radius: 30px;"> <span>jyh453</span>
								</a>
								<svg style="margin-left: 60px;"
									xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  						<path
										d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
 						 <path
										d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
						</svg>
								<span>36</span>
							</p>
						</div>
					</div>
				</div>

			</div>
			<div class="card mb-3"
				style="width: 410px; margin-left: 18px; margin-top: 10px; margin-bottom: 10px">
				<div class="row g-0">
					<div class="col-md-4">
						<img src="images/치앙마이후기.jpg" class="img-fluid rounded-start"
							alt="..."
							style="margin-top: 10px; margin-bottom: 10px; height: 170px;">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h7 class="card-title"> <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  <path
									d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
  <path
									d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg>치앙마이</h7>
							<br> <br> <a href=""><p class="card-text"
									style="font-family: 'NanumSquareNeo-Variable';">동행찐후기남겨요!!! 정말좋았어요!</p></a><br>

							<p class="card-text">
								<a> <img alt="" src="images/라이언.jpg" width="30" height="30"
									style="margin-left: auto; border-radius: 30px;"> <span>syusyu</span>
								</a>
								<svg style="margin-left: 80px;"
									xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  						<path
										d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
 						 <path
										d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
						</svg>
								<span>17</span>
							</p>
						</div>
					</div>
				</div>

			</div>
			<div class="card mb-3"
				style="width: 410px; margin-left: 18px; margin-top: 10px; margin-bottom: 10px">
				<div class="row g-0">
					<div class="col-md-4">
						<img src="images/제주도에서의인연.jpg" class="img-fluid rounded-start"
							alt="..."
							style="margin-top: 10px; margin-bottom: 10px; height: 170px;">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h7 class="card-title"> <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  <path
									d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
  <path
									d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg>제주도</h7>
							<br> <br>
							<p class="card-text"
								style="font-family: 'NanumSquareNeo-Variable';">인연을 만나게해준 동행:)</p>
							<br>

							<p class="card-text">
								<a> <img alt="" src="images/제주도에서의인연.jpg" width="30" height="30"
									style="margin-left: auto; border-radius: 30px;"> <span>thas10</span>
								</a>
								<svg style="margin-left: 80px;"
									xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  						<path
										d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
 						 <path
										d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
						</svg>
								<span>8</span>
							</p>
						</div>
					</div>
				</div>

			</div>

		</div>
	</section>
	<br>





	<!-- 푸터 -->
	<footer style="margin-bottom: none; border-top: 1px solid #DCDCDC"
		class="text-muted py-5">
		<form>
			<div class="container">
				<p class="float-end mb-1">
					<a class="gotop" href="#">위로 올라가기</a>
				</p>
				<img src="<%= request.getContextPath() %>/images/로고5.png" style="width: 110px; height: 70px;">
				<p style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.2em;"
					class="mb-1">동행 - 동준이와 행복한 2차 프로젝트 !</p>
				<p style="font-family: 'NanumSquareNeo-Variable';" class="mb-1">박지은
					신동준 정수영 이영진 이효미 장성규</p>
				<p style="font-family: 'NanumSquareNeo-Variable';" class="mb-1">[대덕인재개발원
					2022.09. 405호 2차 프로젝트 3팀]</p>
			</div>
		</form>
	</footer>



</body>
</html>