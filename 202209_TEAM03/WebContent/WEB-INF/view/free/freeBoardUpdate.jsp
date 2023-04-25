<%@page import="vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자유게시판 수정삭제</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	
<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js" type="text/javascript"></script>

<style type="text/css">
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

ul, li, h2, h3, button, span, input, label, textarea, a, div {
	font-family: 'NanumSquareNeo-Variable';
}

section div {
	margin: 5px auto;
	background: white;
}

header {
	border-bottom: 1px solid #DCDCDC;
	background: white;
}

.container-fluid img {
	width: 190px;
	height: 100px;
	margin-left: 300px;
}

.nav-item {
	font-size: 1.2em;
}

form input {
	margin-top: 20px;
	height: 45px;
	width: 400px;
	border: 1px solid #DCDCDC;
	border-radius: 3px;
}

.searchForm{
	margin-left: 40px;
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
	width: auto;
	height: auto;
	background: white;
	margin-top: 30px;
	margin-left: 20px;
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

.gotop:visited, .replystate {
	color: #3CB371;
}


</style>


<%
	String name=(String)session.getAttribute("name");

	FreeBoardVO getBoard = (FreeBoardVO)request.getAttribute("board"); /* 원래 상세조회게시글 */

	Object grade = session.getAttribute("grade");
	int gradeNum = (int) grade;
%>

<script>
$(function(){
	
var cityName = ""; //전연변수는  $(function())안에 var 변수명으로 선언 해주어야한다.

	
	$.ajax({
		// 페이지를 열자마자 대륙리스트를 띄운다.
		url : '<%=request.getContextPath()%>/freeContinent.do',
		type : 'get',
		/* data : 'data', */
		success : function(res){
			//console.log(res[0].conti_no);
			//alert("응답상태 : " + res[0].conti_no);
			var htmlCode = '';
			
			
			$.each(res, function(i, v){
				htmlCode +='<li class="conti"><a idx='+v.conti_no+' class="dropdown-item" href="#">'+ v.conti_name +'</a></li> ';
				/* htmlCode += '<option status="' + v.conti_no + '" value="' + v.conti_name + '">'+ v.conti_name +'</option>'; */
				
	     	})
			
	     	$('#ContinentList').html(htmlCode);
			
		},
		error: function(xhr){
			alert("실패상태 : " + xhr.status);
		},
		dataType : 'json'
	}) 

	// 대륙리스트에서 선택을 하면 국가리스트가 뜬다.
 	$(document).on('click','.conti',function(){
		 var idx = $('a',this).attr('idx'); //대륙 conti_no //문자열 상태 
		 console.log(idx);
	 
		 conti = $('a', this).text()
	 
		 $(this).parents('.btn-group').find('#conti').html(conti);
		
		$.ajax({
			url : '<%= request.getContextPath()%>/freeboard/countryList.do',
			type : 'get',
			data : { "contiNo" : idx },
			dataType : 'json',
			success : function(res){
				console.log(res);
							
				var htmlCode = "";
				$.each(res, function(i, v){
					htmlCode +='<li class="country"><a idx='+v.coun_no+' class="dropdown-item" href="#">'+ v.coun_name +'</a></li> ';
					
				})
				
				$('#CountryList').html(htmlCode);

			},
			error : function(xhr){
				alert("상태 : " +  xhr.status);
			}
		})
		
	})  
	
	// 국가리스트를 선택하면 도시리스트가 뜬다.
	$(document).on('click','.country',function(){
	 var idx = $('a',this).attr('idx'); //나라 coun_no //문자열 상태 
	 console.log(idx);
	 
	 coun = $('a', this).text()
	 
	 $(this).parents('.btn-group').find('#country').html(coun);
		
		$.ajax({
			url : '<%= request.getContextPath()%>/freeboard/regionList.do',
			type : 'get',
			data : { "counNo" : idx },
			dataType : 'json',
			success : function(res){
				
				//alert("응답상태 :" + res[0].coun_no)
				
				var htmlCode = "";
				
				$.each(res, function(i, v){
		
					htmlCode +='<li class="region"><a idx='+v.reg_no+' class="dropdown-item" href="#">'+ v.reg_name +'</a></li> ';
				})
				
				$('#RegionList').html(htmlCode);
				
			},
			error : function(xhr){
				alert("상태 : " +  xhr.status);
			}
		})
	})
	
		
	// 도시를 선택하면 <span>도시명<span>값이 바뀐다.
	$(document).on('click','.region',function(){
	 idx = $('a',this).attr('idx'); //도시 region_no //문자열 상태 
	 
	 console.log(idx);
	 $('#reg_no').val(idx);
	 
	 region = $('a', this).text()
	
	 $(this).parents('.btn-group').find('#region').html(region);
	 
	cityName = $('a', this).text(); // 도시명에 선택한 도시를 뜨게한다. -> 선택자.text()
	console.log(cityName);
	$('#cityName').html(cityName);
	$('#cityHidden').val(cityName);
		
	})
		
})
</script>
</head>

<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>




	<!-- 로그인 이후 헤더 -->
	<header class="sticky-top">
		<nav class="navbar navbar-expand-lg" style="background: white;">
			<div class="container-fluid">
				<a href="<%=request.getContextPath()%>/mainIndex.jsp"><img src="<%= request.getContextPath() %>/images/로고5.png"></a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
				<a href=""><svg style="color: #3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
				  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
				</svg></a> 
				<a href="<%=request.getContextPath()%>/mypageHome.do"><svg style="color: #3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
				</svg></a>
				
				<%		
					}
				%>
				 
				<%
				String PNAME = (String) session.getAttribute("PNAME");
				
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
               		<button type="submit" id="logout" class="mainbtn" style="margin-right:300px;">로그아웃</button>
                </form>   
			</div>
		</nav>
		<br>
		<nav class="nav">
			<a class="nav-link" href="<%=request.getContextPath()%>/mainIndex.jsp">홈</a>
			<a class="nav-link" href="<%= request.getContextPath()%>/mainboard/mainBoardList.do">동행게시판</a>
			<a class="nav-link" href="<%= request.getContextPath()%>/freeboard/freeBoardList.do">자유게시판</a>
			<a class="nav-link" href="<%= request.getContextPath()%>/reviewboard/reviewBoardList.do">후기게시판</a>
			<a class="nav-link" href="<%= request.getContextPath()%>/noticeBoardList.do" style="margin-left: 680px; margin-right: none; color: black; font-size: 1.0em;">공지사항</a>
		</nav>
	</header>

	<!-- 사진 섹션 (이 섹션의 사진은 고정값입니다) -->
	<section>
		<div class="col-md-6" style="margin-top: 20px; margin-left: 310px;">
			<img alt="" src="../../images/자게2.png" style="width: 1300px; heigth: 300px;">
		</div>
	</section>

	
	<!-- 수정폼 -->
	<section>
		<form id="freeBoardForm"  action="<%=request.getContextPath()%>/freeboard/updateBoard.do" name="form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pname" value="<%= name %>"/>
		
		<!-- 지역선택 섹션 -->
		<!-- 여행 지역을 선택해서 지역코드를 넘겨야하는 부분 -->
		<!-- 대륙, 국가, 도시를 선택. (현재 대륙코드가 없으므로 만들어야함) / 토글 형태로 각 코드 별로 값이 나와야 함. -->
		<div class="col-md-6" style="width: 1000px; margin-left: 480px; margin-top: 20px; border: 1px solid #DCDCDC; border-radius: 5px;">
			<span style="margin-left: 15px; margin-right: 30px;">여행지역 선택</span>
			<div class="btn-group">
				<button id="conti" type="button" class="btn btn-danger dropdown-toggle" style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371"
					data-bs-toggle="dropdown" aria-expanded="false">대륙 선택</button>
				<ul class="dropdown-menu">

						<div id="ContinentList">
						
						</div>
						
					</ul>
			</div>
			
			<div class="btn-group">
				<button id="country" type="button" class="btn btn-danger dropdown-toggle" style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371"
					data-bs-toggle="dropdown" aria-expanded="false">국가 선택</button>
				<ul class="dropdown-menu">
					
						<div id="CountryList">
						
						</div>
					</ul>
			</div>
			
			<div class="btn-group">
				<button id="region" type="button" class="btn btn-danger dropdown-toggle" style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371"
					data-bs-toggle="dropdown" aria-expanded="false">도시 선택</button>
				<ul class="dropdown-menu">
					
					     <div id="RegionList">
						
						</div>
						
					</ul>
			</div>			

			<!-- 3개의 옵션값을 선택하면 마지막 도시명만 출력하거나 아니면 전체를 출력하거나  -->
			<span name="cityNameee" id="cityName" style="width: 150px; height: 30px; margin-left: 15px; border: 1px solid #DCDCDC">도시명</span>
			<input style="border : 1px solid red;" id="cityHidden" type="hidden" name="cityNameee" value="">
		</div>
	

	<hr style="color: #DCDCDC; width: 1000px; margin-left: 480px;">

	<!-- 글작성 섹션 -->
		<div class="col-md-6" style="margin-left: 480px;">
			<!-- 게시판 번호 -->
			<input type="hidden" name="free_num" value="<%=getBoard.getFb_no()%>" >
			
			<!-- 질문게시판 제목 -->
			<input value="<%= getBoard.getFb_title()%>"  name="f_title" id="f_title" type="text" style="width: 1000px;" class="form-control" placeholder="여행에 관한 무엇이든 물어보세요!">	
			
		</div>
		
		<hr style="color: #DCDCDC; width: 1000px; margin-left: 480px;">

		<!-- 질문게시판 내용 -->
		<div class="col-md-6" style="margin-left: 480px;">
			<textarea name="f_content" id="f_content" style="width: 1000px;" class="form-control" rows="10" placeholder="내용을 자유롭게 입력해주세요."><% String modicont = getBoard.getFb_content(); 
			modicont = modicont.replaceAll("/\r/g", "").replaceAll("<br>", "\n");%><%= modicont %></textarea>
		</div>
		<br>
	
		<div class="col-md-6" style="margin-left:475px;">
		<!-- 사진 업로드 -->		
			<%
			if(getBoard.getFb_pic() == null){
			%>
			
			<input type="file"   name="free_pic" id="f_pic"  style="width:1000px" class="form-control" value="">
			
			<% } else { %>
			<!-- 기존 게시글에 사진이 있으면 -->
			<input type="hidden" name="old_photo" value="<%= getBoard.getFb_pic()%>">
			<input type="file"   name="free_pic" id="f_pic"  style="width:1000px" class="form-control" value="">
			
			<%} %>
		</div>
		
		<div class="col-md-6">
			<!-- 클릭시 이전화면으로 이동 -->
			<button style="font-family: 'NanumSquareNeo-Variable'; width: 300px; margin-left: 180px; border: 1px solid #9F9D9D; background: #9F9D9D;" class="btn btn-success" type="button" 
			onclick="location.href='<%=request.getContextPath()%>/freeboard/freeboardArticle.do?bo_num=<%= getBoard.getFb_no()%>'; ">뒤로가기</button>
			
			<!-- 클릭시 질문게시판리스트에 추가되고, 질문게시판리스트로 이동 -->
			<button style="font-family: 'NanumSquareNeo-Variable'; width: 300px; border: 1px solid #3CB371; background: #3CB371;" class="btn btn-success" id="modifyBtn" type="submit">수정하기</button>
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
				<img src="<%= request.getContextPath() %>/images/로고5.png" style="width: 110px; height: 70px;">
				<p style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.2em;" class="mb-1">동행 - 동준이와 행복한 2차 프로젝트 !</p>
				<p style="font-family: 'NanumSquareNeo-Variable';" class="mb-1">박지은 신동준 정수영 이영진 이효미 장성규</p>
				<p style="font-family: 'NanumSquareNeo-Variable';" class="mb-1">[대덕인재개발원 2022.09. 405호 2차 프로젝트 3팀]</p>
			</div>
		</form>
	</footer>



</body>
</html>