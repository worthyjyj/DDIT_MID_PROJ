<%@page import="vo.ReviewBoardVO2"%>
<%@page import="vo.ReviewBoardVO"%>
<%@page import="java.util.List"%>
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

<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.js"" type="text/javascript"></script>

<style type="text/css">
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
	font-weight: normal;
	font-style: normal;
}

ul, li, h2, button, span, input, label, textarea, a, h7{
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

<script type="text/javascript">
	$(function(){
		
		var cityName = "";
		
		$.ajax({
			
			url: "<%=request.getContextPath()%>/reviewContinent.do",
			target: "get",
			success: function(res){
				
				var htmlCode = "";
				htmlCode += "<option value='대륙선택'>대륙선택</option>";
				
				$.each(res, function(i, v){
					
					htmlCode += '<option status="' + v.conti_no + '" value="' + v.conti_name + '">'+ v.conti_name +'</option>';
				})
				
				htmlCode += "</select>";
				
				$("#continent").html(htmlCode);
				
			},
			error: function(xhr){
				alert("실패상태 : " + xhr.status);
			},
			dataType: "json"
		})
		
		$('#continent').on('change', function(){
			
			$.ajax({
				url : '<%= request.getContextPath()%>/reviewCountry.do',
				type : 'get',
				data : { "contiNo" : $('#continent option:selected').attr('status') },
				success : function(res){
					
					//alert("응답상태 :" + res[0].coun_no)
					
					var htmlCode = "";
					htmlCode += '<option  value="국가선택">국가선택</option>';
					
					$.each(res, function(i, v){
						htmlCode += '<option status="'+v.coun_no+'" value="'+v.coun_name+'">'+v.coun_name+'</option>';
					})
					
					$('#country').html(htmlCode);
					//$('#country').trigger('change');
					
				}
			})
		})  
		
		$('#country').on('change', function(){
		
		$.ajax({
			url : '<%= request.getContextPath()%>/reviewRegion.do',
			type : 'get',
			data : { "counNo" : $('#country option:selected').attr('status') },
			success : function(res){
				
				//alert("응답상태 :" + res[0].coun_no)
				
				var htmlCode = "";
				htmlCode += '<option value="도시선택">도시 선택</option>'; 
				
				$.each(res, function(i, v){
					htmlCode += '<option status="'+v.reg_no+'" value="'+v.reg_name+'">'+v.reg_name+'</option>';
					
				})
				
				$('#city').html(htmlCode);
				//$('#city').trigger('change');
				
			}
		})
	})
	
		$('#city').on('change',function(){
		
		
		cityName = $('#city option:selected').attr('value');
		
		$('#cityName').html(cityName);
		$('#cityHidden').val(cityName);
		
		cityNo = $('#city option:selected').attr('status');
		$('#cityNoHidden').val(cityNo);
	})
	
	
	})
</script>

</head>
<body>
<% 
	List<ReviewBoardVO2> reviewList = (List<ReviewBoardVO2>)request.getAttribute("reviewList");
// 	List<ReviewBoardVO2> reviewList2 = (List<ReviewBoardVO2>)request.getAttribute("reviewList2");
%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<!-- 로그인 이후 헤더 -->
	<header class="sticky-top">
		<nav class="navbar navbar-expand-lg" style="background: white;">
			<div class="container-fluid">
				<img src="<%=request.getContextPath()%>/images/로고5.png"> 
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
    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/mainboard/mainBoardWrite.do">동행게시판글쓰기</a></li>
	<li><a class="dropdown-item" href="<%=request.getContextPath()%>/reviewboard/reviewBoardWrite.do">후기게시판글쓰기</a></li>
	<li><a class="dropdown-item" href="<%=request.getContextPath()%>/freeboard/WriteBoard.do">자유게시판글쓰기</a></li>
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
  			<a class="nav-link" href="<%=request.getContextPath()%>/mainIndex.jsp">홈</a> 
			<a class="nav-link" href="<%=request.getContextPath()%>/mainboard/mainBoardList.do">동행게시판</a>
			<a class="nav-link" href="<%=request.getContextPath()%>/reviewboard/reviewBoardList.do">후기게시판</a>
			<a class="nav-link" href="<%=request.getContextPath()%>/freeboard/freeBoardList.do">자유게시판</a>
			<a class="nav-link" href="<%=request.getContextPath()%>/noticeBoardList.do" style="margin-left: 680px; margin-right: none; color: black; font-size: 1.0em;">공지사항</a>
</nav>
	</header>


	<!-- 사진 섹션 -->
	<section>
		<div class="col-md-6" style="margin-top:20px; margin-left: 310px;">
			<img alt="" src="../images/여행후기.png" style="width:1300px; heigth:300px;">
		</div>
	</section>

	<!-- 지역선택 섹션 -->
	<section>
		<div class="col-md-6"
			style="width: 1300px; height: 220px; margin-left: auto; margin-right: auto; margin-top: 20px; border: 1px solid #DCDCDC; border-radius: 5px;">
			<div class="col-md-6" style="width: 1000px; margin-top: 20px;">
				<span style="margin-left: 15px; margin-right: 30px;">검색지역 선택</span>
				<div class="btn-group">
<!-- 				<select id="selectBtn">
					
					<option value="continent">아시아</option>
					<option value="continent">유럽</option>
					<option value="continent">아메리카</option>
					<option value="continent">오세아니아</option>
				</select>
<!-- 					<button type="button" class="btn btn-danger dropdown-toggle" -->
<!-- 						style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371" -->
<!-- 						data-bs-toggle="dropdown" aria-expanded="false">대륙 선택</button> -->
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li><a class="dropdown-item" href="#">아시아</a></li> -->
<!-- 						<li><a class="dropdown-item" href="#">유럽</a></li> -->
<!-- 						<li><a class="dropdown-item" href="#">아메리카</a></li> -->
<!-- 						<li><hr class="dropdown-divider"></li> -->
<!-- 						<li><a class="dropdown-item" href="#">오세아니아</a></li> -->
<!-- 					</ul> -->
				  <select id="continent" style="font-size: 5px;">
				    <option value="대륙선택">대륙선택</option>
				  </select>
				</div>
				
				<div class="btn-group">
<!-- 					<button type="button" class="btn btn-danger dropdown-toggle" -->
<!-- 						style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371" -->
<!-- 						data-bs-toggle="dropdown" aria-expanded="false">국가 선택</button> -->
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li><a class="dropdown-item" href="#">아시아</a></li> -->
<!-- 						<li><a class="dropdown-item" href="#">유럽</a></li> -->
<!-- 						<li><a class="dropdown-item" href="#">아메리카</a></li> -->
<!-- 						<li><hr class="dropdown-divider"></li> -->
<!-- 						<li><a class="dropdown-item" href="#">오세아니아</a></li> -->
<!-- 					</ul> -->
				  <select id="country" style="font-size:  5px;">
				    <option value="국가선택">국가선택</option>
				  </select>
				</div>
				
				<div class="btn-group">
<!-- 					<button type="button" class="btn btn-danger dropdown-toggle" -->
<!-- 						style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371" -->
<!-- 						data-bs-toggle="dropdown" aria-expanded="false">도시 선택</button> -->
<!-- 					<ul class="dropdown-menu"> -->
<!-- 						<li><a class="dropdown-item" href="#">아시아</a></li> -->
<!-- 						<li><a class="dropdown-item" href="#">유럽</a></li> -->
<!-- 						<li><a class="dropdown-item" href="#">아메리카</a></li> -->
<!-- 						<li><hr class="dropdown-divider"></li> -->
<!-- 						<li><a class="dropdown-item" href="#">오세아니아</a></li> -->
<!-- 					</ul> -->
				  <select id="city" style="font-size: 5px;">
				    <option value="도시선택">도시선택</option>
				  </select>
				</div>
				
				<input type="hidden" id="cityHidden" name="cityNameee" value="">
			</div>
			<div class="col-md-6"
				style="width: 1300px; margin-top: 20px; height: 40px;">
				<span style="margin-left: 15px; margin-right: 30px;">검색날짜 선택</span>
				
				<form action="<%=request.getContextPath() %>/reviewboard/reviewBoardList.do" method="post">
						<input type="date" style="border: none" name="startDate"> 
								<span> - </span> 
						<input type="date" style="border: none" name="endDate">
						<button id="searchBtn"
							style="font-family: 'NanumSquareNeo-Variable'; width: 200px; margin-left: 1000px; border: 1px solid #3CB371; background: #3CB371;"
							class="btn btn-success" type="submit">검색하기</button>
							
							<input type="hidden" id="cityNoHidden" name="cityNoHidden" value="">
				</form>
			</div>
			<hr style="color: #DCDCDC; width: 1300px;">
		</div>
	</section>
	<br>
	
			<!-- 정렬 섹션 -->
	<section>
		<ul class="nav nav-tabs" style="width:1300px; margin-left:auto; margin-right: auto;">
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/reviewboard/reviewBoardList.do" >정렬</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/reviewBoardListRecent.do">등록순</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">조회수순</a></li>
		</ul>
	</section><br>

		<!-- 동행찾기 카드형식 섹션 -->
	<section>
		<div class="row" style="width: 1300px; margin-left: auto; margin-right: auto; border: 1px solid #DCDCDC; border-radius: 5px;">
<%-- 		
		<% if(reviewList3 !=null || reviewList3.size() > 0 ) {
			
			
					for(ReviewBoardVO rvo2 : reviewList3){
			%>
					<div class="card mb-3" style="width: 410px; margin-left: 18px; margin-top:10px; margin-bottom: 10px">
				<div class="row g-0">
					<div class="col-md-4">
						<img src="../images/한라산설산.jpg" class="img-fluid rounded-start"
							alt="..." style="margin-top: 10px; margin-bottom:10px; height: 170px;">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h7 class="card-title">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  					<path
									d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
  					<path
									d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
					</svg><%=rvo2.getReg_no() %></h7> <!-- 이놈이 지금 지역이름이 나와야함!! -->
							<br>
							<br>
							<a href="<%=request.getContextPath()%>/reviewboard/reviewBoardDetail.do?rev_no=<%=rvo2.getRev_no() %>"><p id="listTitle" class="card-text" style="font-family: 'NanumSquareNeo-Variable';"><%=rvo2.getRev_title() %></p></a><br>

							<p class="card-text">
													<a> <img alt="" src="../images/프으사아.jpg" width="30" height="30" style="margin-left: auto; border-radius: 30px;"> 
					<span><%=rvo2.getP_name() %></span>
					</a>
					<svg style="margin-left:80px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  						<path
							d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
 						 <path
							d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
						</svg>
					<span><%=rvo2.getRev_hit() %></span>
							</p>
						</div>
					</div>
				</div>
			
			</div>
			
		<%
					}
			}
		%>
--%>		
	<%
		if(reviewList==null || reviewList.size()==0){
	%>
	<script type="text/javascript">
	$(function(){
		alert("게시글이 존재하지 않습니다.")
		
	})
	</script>
		
	<%}else{
					for(ReviewBoardVO2 rvo : reviewList){
	%>	
	
			<div class="card mb-3" style="width: 410px; margin-left: 18px; margin-top:10px; margin-bottom: 10px">
				<div class="row g-0">
					<div class="col-md-4">
						<img src="../images/한라산설산.jpg" class="img-fluid rounded-start"
							alt="..." style="margin-top: 10px; margin-bottom:10px; height: 170px;">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h7 class="card-title">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
  <path
									d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
  <path
									d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg><%=rvo.getReg_no() %></h7> <!-- 이놈이 지금 지역이름이 나와야함!! -->
							<br>
							<br>
							<a href="<%=request.getContextPath()%>/reviewboard/reviewBoardDetail.do?rev_no=<%=rvo.getRev_no() %>"><p id="listTitle" class="card-text" style="font-family: 'NanumSquareNeo-Variable';"><%=rvo.getRev_title() %></p></a><br>

							<p class="card-text">
													<a> <img alt="" src="../images/프으사아.jpg" width="30" height="30" style="margin-left: auto; border-radius: 30px;"> 
					<span><%=rvo.getP_name() %></span>
					</a>
					<svg style="margin-left:80px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  						<path
							d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />
 						 <path
							d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />
						</svg>
					<span><%=rvo.getRev_hit() %></span>
							</p>
						</div>
					</div>
				</div>
			
			</div>
			
	
	
	<%
					}
		}
	%>
		</div>
	</section><br>
<!-- 	<!-- 동행찾기 카드형식 섹션 --> -->
<!-- 	<section> -->
<!-- 		<div class="row" style="width: 1300px; margin-left: auto; margin-right: auto; border: 1px solid #DCDCDC; border-radius: 5px;"> -->
<!-- 			<div class="card mb-3" style="width: 410px; margin-left: 18px; margin-top:10px; margin-bottom: 10px"> -->
<!-- 				<div class="row g-0"> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<img src="../images/한라산설산.jpg" class="img-fluid rounded-start" -->
<!-- 							alt="..." style="margin-top: 10px; margin-bottom:10px; height: 170px;"> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-8"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h7 class="card-title"> -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" -->
<!-- 								fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16"> -->
<!--   <path -->
<!-- 									d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" /> -->
<!--   <path -->
<!-- 									d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" /> -->
<!-- </svg>여행지역</h7> -->
<!-- 							<br> -->
<!-- 							<br> -->
<!-- 							<p class="card-text" style="font-family: 'NanumSquareNeo-Variable';">후기게시판 제목</p><br> -->

<!-- 							<p class="card-text"> -->
<!-- 													<a> <img alt="" src="../images/프으사아.jpg" width="30" height="30" style="margin-left: auto; border-radius: 30px;">  -->
<!-- 					<span>닉네임</span> -->
<!-- 					</a> -->
<!-- 					<svg style="margin-left:80px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16"> -->
<!--   						<path -->
<!-- 							d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" /> -->
<!--  						 <path -->
<!-- 							d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" /> -->
<!-- 						</svg> -->
<!-- 					<span>0</span> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			
<!-- 			</div> -->
			
<!-- 		</div> -->
<!-- 	</section><br> -->


		<!-- 푸터 -->
		<footer style="margin-bottom: none; border-top: 1px solid #DCDCDC" class="text-muted py-5">
		<form>
			<div class="container">
				<p class="float-end mb-1">
					<a class="gotop" href="#">위로 올라가기</a>
				</p>
				<img src="<%=request.getContextPath()%>/images/로고5.png" style="width:110px; height: 70px;"> 
				<p style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.2em;" class="mb-1">동행 - 동준이와 행복한 2차 프로젝트 !</p>
				<p style="font-family: 'NanumSquareNeo-Variable'; " class="mb-1">박지은 신동준 정수영 이영진 이효미 장성규</p>
				<p style="font-family: 'NanumSquareNeo-Variable'; " class="mb-1">[대덕인재개발원 2022.09. 405호 2차 프로젝트 3팀]</p>
			</div>
		</form>
	</footer>



</body>
</html>