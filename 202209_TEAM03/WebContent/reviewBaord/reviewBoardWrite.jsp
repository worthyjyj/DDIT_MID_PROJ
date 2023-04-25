<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>후기게시판 글 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"crossorigin="anonymous">
	
<!-- <script type="text/javascript" src = "./js/mainboard.js"></script> -->
<script src="./js/jquery-3.6.1.min.js"></script>

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


</style>

<script type="text/javascript">
	$(function(){
		
		var cityName = "";
		
		$.ajax({
			
			url: "<%=request.getContextPath()%>/reviewContinent.do",
			target: "get",
			success: function(res){
				
				var htmlCode = "";
				htmlCode += "<option value="대륙선택">대륙선택</option>";
				
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

	
	<!-- 사진 섹션 (이 섹션의 사진은 고정값입니다) -->
	<section>
	<div class="col-md-6" style="margin-top:20px; margin-left: 310px;">
	<img alt="" src="../images/후기작성.png" style="width:1300px; heigth:300px;">
	</div>
	</section>
	
	<!-- 지역선택 섹션 -->
	<!-- 여행 지역을 선택해서 지역코드를 넘겨야하는 부분 -->
	<!-- 대륙, 국가, 도시를 선택. (현재 대륙코드가 없으므로 만들어야함) / 토글 형태로 각 코드 별로 값이 나와야 함. -->
	
	<section>
	 <form id="reviewBoardInsertForm"  name="form" method="post" enctype="multipart//form-data" action="<%=request.getContextPath()%>/reviewBoardInsert.do">
		<div class="col-md-6" style="width:1000px;  margin-left:auto; margin-right:auto; margin-top:20px; border: 1px solid #DCDCDC; border-radius: 5px;">
			<span style="margin-left:15px; margin-right:30px;">여행지역 선택</span>
			<div class="btn-group">
<!-- 				<button type="button" class="btn btn-danger dropdown-toggle" style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371" -->
<!-- 					data-bs-toggle="dropdown" aria-expanded="false">대륙 선택</button> -->
				<select id="continent" style="font-size:  5px;">
				  <option value="대륙선택">대륙선택</option>
				  
				</select>
<!-- 				<ul class="dropdown-menu"> -->
<!-- 					예시				 -->
<!-- 					<li><a name="" id="" class="dropdown-item">아시아</a></li> -->
<!-- 					<li><a class="dropdown-item">유럽</a></li> -->
<!-- 					<li><a class="dropdown-item">아메리카</a></li> -->
<!-- 					<li><a class="dropdown-item">오세아니아</a></li> -->
<!-- 				</ul> -->
			</div>
			
			<div class="btn-group">
<!-- 				<button type="button" class="btn btn-danger dropdown-toggle" style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371" -->
<!-- 					data-bs-toggle="dropdown" aria-expanded="false">국가 선택</button> -->
<!-- 				<ul class="dropdown-menu"> -->
<!-- 					<li><a class="dropdown-item">대한민국</a></li> -->
<!-- 					<li><a class="dropdown-item">일본</a></li> -->
<!-- 					<li><a class="dropdown-item">중국</a></li> -->
<!-- 					<li><a class="dropdown-item">베트남</a></li> -->
<!-- 				</ul> -->
			  <select id="country"  style="font-size:  5px;">
			    <option value="국가선택">국가선택</option>
			  </select>
			</div>
			
			<div class="btn-group">
<!-- 				<button type="button" class="btn btn-danger dropdown-toggle" style="font-family: 'NanumSquareNeo-Variable'; background: #3CB371; border: 1px solid #3CB371" -->
<!-- 					data-bs-toggle="dropdown" aria-expanded="false">도시 선택</button> -->
<!-- 				<ul class="dropdown-menu"> -->
<!-- 					<li><a class="dropdown-item">서울</a></li> -->
<!-- 					<li><a class="dropdown-item">강원</a></li> -->
<!-- 					<li><a class="dropdown-item">대전</a></li> -->
<!-- 					<li><a class="dropdown-item">부산</a></li> -->
<!-- 				</ul> -->
			  <select id="city" style="font-size:  5px;">
			    <option value="도시선택">도시선택</option>
			  </select>
			</div>
			
			<!-- 3개의 옵션값을 선택하면 마지막 도시명만 출력하거나 아니면 전체를 출력하거나  -->
			<span name="citynameee" id="cityName" style="width:150px; height:30px; margin-left:15px; border:1px solid #DCDCDC">도시명출력</span>
			<input style="border : 1px solid red;" id="cityHidden" type="hidden" name="cityNameee" value="">
		</div>
	</section>
	
	<hr style="color: #DCDCDC; width:1000px; margin-left: 460px;">


	<!-- 글작성 섹션 -->
	<section>
	  
		<div class="col-md-6" style=" margin-left:460px;">
			
			<!-- 제목 -->
			<input name="rev_title" id="" type="text" style="width: 1000px;" class="form-control" placeholder="ex) 가을엔 꼭 설악산으로 단풍구경하러 가세요~">
		</div>
		<hr style="color: #DCDCDC; width: 1000px; margin-left: 400px;">
		
		<div class="col-md-6" style=" margin-left:460px;">
			<!-- 내용 -->
			<textarea name="rev_content" id="" style="width: 1000px;  margin-left:auto; margin-right:auto;" class="form-control" rows="10" placeholder="설악산 단풍은 10월 말이 제일 예쁜 것 같아요!"></textarea>
		</div>
		
		<hr style="color: #DCDCDC; width: 1000px;  margin-left:auto; margin-right:auto;">
		
		<div class="col-md-6" style=" margin-left:460px;">
			<!-- 사진 업로드 -->
			<input name="rev_pic" id="" type="file" style="width:1000px" class="form-control" >
		</div>
		<br>
		<div class="col-md-6" style=" margin-left:460px;">
			<!-- 이전화면으로 돌아가기 -->
			<button style="font-family: 'NanumSquareNeo-Variable'; width: 300px; margin-left:180px; border: 1px solid #9F9D9D; background: #9F9D9D;" class="btn btn-success" type="submit">취소하기</button>
			<!-- 글 등록 이후 후기게시판리스트에 포함되며, 후기게시판리스트로 이동 -->
			<button id="sendBtn" style="font-family: 'NanumSquareNeo-Variable'; width: 300px; border: 1px solid #3CB371; background: #3CB371;" class="btn btn-success" type="submit">등록하기</button>
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
				<img src="../images/로고5.png" style="width:110px; height: 70px;"> 
				<p style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.2em;" class="mb-1">동행 - 동준이와 행복한 2차 프로젝트 !</p>
				<p style="font-family: 'NanumSquareNeo-Variable'; " class="mb-1">박지은 신동준 정수영 이영진 이효미 장성규</p>
				<p style="font-family: 'NanumSquareNeo-Variable'; " class="mb-1">[대덕인재개발원 2022.09. 405호 2차 프로젝트 3팀]</p>
			</div>
		</form>
	</footer>



</body>
</html>