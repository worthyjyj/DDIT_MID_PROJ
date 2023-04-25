<%@page import="vo.Profile"%>
<%@page import="vo.ReviewBoardVO2"%>
<%@page import="vo.MainReplyVO"%>
<%@page import="vo.ReviewReplyVO"%>
<%@page import="vo.FreeReplyVO"%>
<%@page import="vo.MainBoardVO"%>
<%@page import="vo.FreeBoardVO"%>
<%@page import="vo.ReviewBoardVO"%>
<%@page import="vo.NoteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>

<meta charset="utf-8">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"crossorigin="anonymous">
<link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="../bower_components/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet" href="../bower_components/fullcalendar/dist/fullcalendar.print.min.css" media="print">
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery-3.6.1.min.js"></script>

<!-- <link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">
<script type="text/javascript" charset="utf8" src="/DataTables/datatables.js"></script> -->
<link rel="stylesheet"href="//cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
<script src="//cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>


<style>

@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
	font-weight: normal;
	font-style: normal;
}

ul, li, h2, button, span, input, label, textarea, a, form{
	font-family: 'NanumSquareNeo-Variable';
}



section {
	margin-left: 5%;
}

.list-group {
	margin-top: 100px;
	border: 1px solid #e9e9e9;
	padding-left: 30px;
	width:350px;
	margin-left: 350px;
	background: white;
}

.list-group2 {
	margin-top: 100px;
	border: 1px solid #e9e9e9;
	padding-left: 30px;
	width:850px;
	margin-left: 50px;
	background: white;
}

.list-group2-inner{
	border: 1px solid #e9e9e9;
	width: 750px;
	margin-left: 50px;
	border-radius: 5px;
}

.list-group-item {
	width: 250px;
	border-radius: 15px;
	border: 1px solid #e9e9e9;
	background-color: #fafafa;
}

.input-inner{
	margin-left: 170px;
	padding : 10px;
	border-radius: 30px;
	border: 1px solid #e9e9e9;
}

.input-inner-pw{
	margin-left:130px;
	padding : 10px;
	border: 1px solid #e9e9e9;
}


.edit_input[type="text"]:read-only {
    background-color: #fff;
    padding-right: 44px;
    color: #252525;
}

button, input, optgroup, select, textarea {
    font-family: inherit;
    font-size: 100%;
    line-height: 1.15;
    margin: 0px;
}

textarea {
    position: relative;
    resize: none;
    display: block;
    width: 100%;
    padding: 16px 20px;
    box-sizing: border-box;
    border: 1px solid var(--color-whiteGray);
}

textarea {
    writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-stretch: ;
    text-rendering: auto;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    text-align: start;
    -webkit-rtl-ordering: logical;
    cursor: text;
    white-space: pre-wrap;
    overflow-wrap: break-word;
    column-count: initial !important;
}

input, textarea {
  /*   -webkit-appearance: none; */
}

body, input, button, textarea, select {
    font-weight: 400;
}

span{
	font-weight: bold;
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

#sdata {
	margin-left: 40px;
	margin-top: 20px;
	height: 45px;
	width: 400px;
	border: 1px solid #DCDCDC;
	border-radius: 3px;
}

form input{
    margin-left: 0;
    margin-top: 0;
    height: 12px;
    width: 20px;
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

<script>


$(function(){
	
	$(".detailNote").on("click", function(e){
		e.preventDefault();
		var no = $(this).data("no");
		var num = $(this).data("num");
		
		
		if(num==1){//리뷰게시판
			location.href="<%=request.getContextPath()%>/reviewboard/reviewBoardDetail.do?rev_no="+ no;
		}else if(num==2){//메인
			location.href="<%=request.getContextPath()%>/mainboard/mainBoardDetail.do?mb_no=" + no;
		}else if(num==3){//자유
			location.href="<%=request.getContextPath()%>/freeboard/freeboardArticle.do?bo_num="+ no;
		}
	});
	
	
	$('#select_value').change(function(){
		location.href="<%=request.getContextPath()%>/myWrite.do?num="+$("#select_value").val();
	})
	
	
	    $('#hyomi').DataTable();
	
})
</script>
</head>
<body style="background: #F6F6F6;">
<%

String num = (String)request.getAttribute("num");
String name=(String)session.getAttribute("name");
String id=(String)session.getAttribute("id");
%>

<script>
		$(document).ready(function(){
			$('#logout').on('click',function(){
				alert("<%=name%>님 로그아웃 합니다!");
			})//회원 로그아웃 끝
			
			$('#adminLogout').on('click',function(){
				alert("<%=name%>님 로그아웃 합니다!");
			})//관리자 로그아웃 끝
		

		
		
		$("#delete").on('click',function(){
		 checkArray = [];
		 
		 $('#allDelete').on('change', function(){
			 chk = $(this).prop('checked');
			 //alert(chk);
		$("input[name=checkbox12]").prop("checked", chk);
			 checkArray.push($(this).val());
		})
		 
		 $('input[name=checkbox12]:checked').each(function(i){//체크된 리스트 저장
			 checkArray.push($(this).val());
         });
		 
		 var params = {
				 checkArray  : checkArray
                 , num       : $("#select_value").val()
         }
		 
		 $.ajax({
			 url : "<%=request.getContextPath()%>/deleteReply.do",
			 data: params,
			 type : "get",
			 traditional : true, //필수
			 success : function(res){
				 location.reload();
			 },
			 error : function(xhr){
				location.reload();
			 },
			 dataType : "json"
		 })//ajax
	 })//delete 끝
	 
		})	 
</script>
 <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"></script>

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
					</form>>
				</div>
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
				<a href=""><svg style="color: #3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
				</svg></a> 
				<span style="margin-top: 30px;"><%=name %>님! 환영합니다!</span>
				<form action="<%=request.getContextPath()%>/logout.do" method="post">
					<button type="submit" id="logout" class="mainbtn" style="margin-right:300px;">로그아웃</button>
				</form>	
			</div>
		</nav>
		<br>
		<nav class="nav">
			<a class="nav-link" href="mainIndex.jsp">홈</a> 
			<a class="nav-link" href="<%=request.getContextPath()%>/mainboard/mainBoardList.do">동행게시판</a>
			<a class="nav-link" href="<%=request.getContextPath()%>/freeboard/freeBoardList.do">자유게시판</a>
			<a class="nav-link" href="<%=request.getContextPath()%>/reviewboard/reviewBoardList.do">후기게시판</a>  
			<a class="nav-link" href="<%=request.getContextPath()%>/noticeBoardList.do" style="margin-left: 680px; margin-right: none; color: black; font-size: 1.0em;">공지사항</a>
		</nav>
	</header>


		<div class="list-group" style="float :left;">
			<div style="margin-top : 20px;">
				<img style="width:50px;" alt="" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg">
				
					<span style="margin-left: 10px; font-weight: bold; font-size:18px;"><%=name %></span>
			</div>  
			<div style="margin-left:20px;"> 
				<a href="<%=request.getContextPath()%>/mypageHome.do"  class="list-group-item list-group-item-action" style="border-radius: 15px; margin-top : 50px;"><span>계정관리</span></a> 
				<br>
				 
				<a href="<%=request.getContextPath()%>/getId.do" class="list-group-item list-group-item-action">
						<span>쪽지함</span>
				</a>
				<br> <a href="<%= request.getContextPath()%>/withMeMain.do" class="list-group-item list-group-item-action"><span>WithMe</span></a>
				<br> <a href="<%= request.getContextPath()%>/myReply.do" class="list-group-item list-group-item-action"><span>내 코멘트</span></a> 
				<br> <a href="<%= request.getContextPath()%>/myWrite.do" class="list-group-item list-group-item-action"><span>내 게시글</span></a>
				<br> <a href="<%=request.getContextPath()%>/myPage/leaveGroup.jsp" class="list-group-item list-group-item-action"><span>회원 탈퇴</span></a>
				<br>
			</div>	
		</div>
		
			<div class="list-group2" style="float :left;">
				<div style="margin-top:15px;">
					<span style="font-size: 25px; margin-left:55px;">
						내가 쓴 게시글
					</span>
					
					<select id="select_value"style="margin-left:470px;">
						<option value="1"
						<%
							if(Integer.parseInt(num) == 1){
						%>
							selected
						<%
							}
						%>	
						>후기게시판</option>
						<option value="2"
						<%
							if(Integer.parseInt(num) == 2){
						%>	
							selected
						<%
							}
						%>
						>메인게시판</option>
						
						<option value="3"
						<%
							if(Integer.parseInt(num) == 3){
						%>	
							selected
						<%
							}
						%>
						>자유게시판</option>
					</select>
					<hr style="margin-right: 50px; margin-left: 50px;">
					<div class="list-group2-inner">
						<br>
						<br>
						<br>
						
						<form>
							<div style="text-align: center;">
															<%
						Profile pVo = (Profile) session.getAttribute("profile");
						String imageFile = pVo.getP_pic();
							
						if(imageFile == null || "".equals(imageFile)){
								%>
						<img style="width:150px;" alt="" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg">
						<%
						}else{
						%>
						<img style="width:150px; border-radius: 100%;" alt="" src="<%=request.getContextPath()%>/profileImg.do">
						<%
							}
							 %>
							</div>
							<br>
							<input type="text" class="input-inner" placeholder="아이디를 입력해주세요" style="width:400px; height : 50px; font-size:18px; text-align: center;" value="<%=id %>">
							<br>
							<br>
							
							<div class="container">
									  <table class="table table-bordered" id="hyomi" style="text-align: center; vertical-align: bottom;">
									    <thead>
									      <tr>
									      	<td><input type="checkbox" id="allDelete"></td>
									        <td>게시글번호</td>
									        <td>게시글제목</td>
									        <td>작성날짜</td>
									      </tr>
									    </thead>
									    <tbody id="noteTable">
	 										<%
									    		if(Integer.parseInt(num)==1){
									    			List<ReviewBoardVO2> list=(List<ReviewBoardVO2>)request.getAttribute("list");
									    			for(int i = 0; i < list.size(); i++){
									    				ReviewBoardVO2 noteVO = list.get(i);
									    				
									    				String content=noteVO.getRev_title();
									    				
									    				if(content.length()>10){
									    					content=(noteVO.getRev_title()).substring(0, 10)+"...";
									    				}
									    	%>
									    		<tr>
									    		
									    			<td><input type="checkbox" name="checkbox12" id="comment<%=noteVO.getRev_no()%>" value="<%=noteVO.getRev_no()%>"></td>
									    		    <td><%=noteVO.getRev_no()%></td>
									    			<td><a class="detailNote" href="#" data-no="<%=noteVO.getRev_no() %>" data-num="<%=num%>"><%=content %></a></td>
									    			<td><%=noteVO.getRev_date()%></td>
									    			 
									    		</tr>
									    	<%
									    		}
									    	%>									    
									    	<%
									    		}else if(Integer.parseInt(num)==3){
									    			List<FreeBoardVO> list=(List<FreeBoardVO>)request.getAttribute("list");
									    			for(int i = 0; i < list.size(); i++){
									    				FreeBoardVO noteVO = list.get(i);
									    			
									    			String content=noteVO.getFb_title();
								    				
								    				if(content.length()>10){
								    					content=(noteVO.getFb_title()).substring(0, 10)+"...";
								    				}
									    	%>
									    		<tr>
									    			<td><input type="checkbox" name="checkbox12" id="comment<%=noteVO.getFb_no()%>" value="<%=noteVO.getFb_no()%>"></td>
									    			<td><%=noteVO.getFb_no()%></td>
									    			<td><a class="detailNote" href="#" data-no="<%=noteVO.getFb_no() %>" data-num="<%=num%>"><%=content %></a></td>
									    			<td><%=noteVO.getFb_date()%></td>
									    		</tr>
									    	<%
									    		}
									    		}else if(Integer.parseInt(num)==2){
									    			List<MainBoardVO> list=(List<MainBoardVO>)request.getAttribute("list");
									    			for(int i = 0; i < list.size(); i++){
									    				MainBoardVO noteVO = list.get(i);
									    				
														String content=noteVO.getMb_title();
									    				
									    				if(content.length()>10){
									    					content=(noteVO.getMb_title()).substring(0, 10)+"...";
									    				}
									    		%>
									    		<tr>
									    			<td><input type="checkbox" name="checkbox12" id="comment<%=noteVO.getMb_no()%>" value="<%=noteVO.getMb_no()%>"></td>
									    			<td><%=noteVO.getMb_no()%></td>
									    			<td><a class="detailNote" href="#" data-no="<%=noteVO.getMb_no() %>" data-num="<%=num%>"><%=content %></a></td>
									    			<td><%=noteVO.getMb_date()%></td>
									    		</tr>
									    	<%}}%>
									    </tbody>
									  </table>
									  
									  <div style="text-align: center; padding-bottom: 30px;">
											<button type="button" id="delete" class="btn btn-light">삭제</button>
									  </div>
									</div>
									</form> 
					</div>
					<br><br>
				</div>
			</div>
		
	<div style="width : 100px; height:100px; clear:both;"></div>







































 	<!-- 푸터 -->
	<footer style="margin-bottom: none; border-top: 1px solid #DCDCDC; background: white;" class="text-muted py-5">
		<form>
			<div class="container">
				<p class="float-end mb-1">
					<a class="gotop" href="#">위로 올라가기</a>
				</p>
				<img src="<%= request.getContextPath() %>/images/로고5.png" style="width:110px; height: 70px;">
				<p style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.2em;" class="mb-1">동행 - 동준이와 행복한 2차 프로젝트 !</p>
				<p style="font-family: 'NanumSquareNeo-Variable';" class="mb-1">박지은 신동준 정수영 이영진 이효미 장성규</p>
				<p style="font-family: 'NanumSquareNeo-Variable';" class="mb-1">[대덕인재개발원 2022.09. 405호 2차 프로젝트 3팀]</p>
			</div>
		</form>
	</footer>



</body>
</html>