<%@page import="vo.FreeReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
 
  <!--  부트스트랩 모달 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  
<title>자유게시판 상세보기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	
<script src="../js/jquery-3.6.1.min.js"></script>

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
	/* 	margin: 5px auto; */
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

.dmBtn{
   color : gray;
}

.dmBtn:visited{
   color : gray;
}

.dmBtn:hover {
   color : gray;
}


/* 쪽지창 */
/* 아이디 출력란 */
.input-inner{
	margin-left:180px;
	padding : 10px;
	border-radius: 30px;
	border: 1px solid #e9e9e9;
}

/* 쪽지제목입력란 */
.input-innerNote{
	margin-left:20px;
	padding : 10px;
	border: 1px solid #e9e9e9;
}

/* 쪽지내용 입력란 */
.edit_input[type="text"]:read-only {
    background-color: #fff;
    color: #252525;
}

#myModal button, input, optgroup, select, textarea, span {
    font-family: inherit;
    font-size: 100%;
    line-height: 1.15;
    margin: 0px;
} 

#myModal textarea {
	position: relative;
    resize: none;
    display: block;
    width: 100%;
    padding: 16px 20px;
    box-sizing: border-box;
    border: 1px solid var(--color-whiteGray);

}

#myModal textarea{
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
    -webkit-appearance: none;
     font-weight: 400;
}

.list-group-item{

 	margin-top: 20px;
    padding: 20px;
   	border : 1px solid green;
    border-radius: 20px;
    
}

/* ul */

.hello {
	padding: 0px;
}

/* 첫번째 li요소 */

.hello:first-child{
	border-radius:20px;
	
} 

#replyTextarea{
	border : 1px solid #DCDCDC;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	width: 900px;
	height: 40px;
}




</style>

<% String name=(String)session.getAttribute("name");%>
<% String id=(String)session.getAttribute("id");%>
<% String pname = (String)session.getAttribute("PNAME");%>

<% FreeBoardVO getArticle = (FreeBoardVO)request.getAttribute("getArticle");%>
<% List<FreeReplyVO> replyList = (List<FreeReplyVO>)request.getAttribute("reply");%>
<% int replyCount = (int)request.getAttribute("replyCount"); %>


</head>
<script type="text/javascript">
$(function(){
	var replyBtn = $("#replyBtn");
	replyBtn.on("click", function(){
		$("#replyTextarea").css("display","block");
		$("#insertReply").css("display","block");
		$("#cancelBtn").css("display","block");
	});
	
	var cancelBtn = $("#cancelBtn");
	cancelBtn.on("click", function(){
		$("#replyTextarea").css("display","none");
		$("#insertReply").css("display","none");
		$("#cancelBtn").css("display","none");
	})
	
	var modifyBtn = $("#modifyBtn");	
	modifyBtn.on("click", function(){
		$("#replyTextarea").css("display","block");
		$("#insertReply").css("display","block");
		$("#cancelBtn").css("display","block");
	})
	
	
	
	$("#btnUpdate").on("click", function(){
		location.href="<%=request.getContextPath()%>/freeboard/updateBoard.do?bo_num=<%=getArticle.getFb_no()%>"
	})	
	
	$("#btnDelete").on("click", function(){
		if(confirm("정말 삭제하시겠습니까 ?") == true){
	        alert("삭제되었습니다");
	    }
	    else{
	        return ;
	    }
		
		location.href="<%=request.getContextPath()%>/freeboard/deleteBoard.do?bo_num=<%=getArticle.getFb_no()%>"
	})
});
	
</script>
<body>


  <!--  쪽지보내기 모달창 -->
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">쪽지보내기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <div style="text-align: center;">
			<img style="width:100px;" alt="" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg">
		</div>
		<br>
		<input type="text" class="input-inner" placeholder="아이디를 입력해주세요" style="width:400px; text-align: center;" value="<%= id %>">
		<br>
		<br>
						<form action="<%=request.getContextPath()%>/sendNote2.do" method="post">
								<label style="font-size: 1.2em; margin-left:20px;">쪽지제목
								
									<span style="margin-left:285px;">받는사람</span>
									<input type="text" name="sendPeople" style="width:150px; border:1px solid #e9e9e9;" placeholder="아이디 입력" value="<%= getArticle.getP_name()%>">
									<input type="hidden" name="sendPeople"  value="<%= getArticle.getP_name()%>">								
								</label>
									<br>
									<input type="text" class="input-innerNote" placeholder="제목을 입력해주세요.(30자 이내)" maxlength="30" name="sendTitle" style="width:630px;">
									<br>										
									<br>
								<label style="font-size: 1.2em; margin-left:20px; float:left;">쪽지내용</label>
								<div style="margin-left: 20px; clear : both;">	
								<textarea type="text" class="edit_input" name="sendContent" placeholder="내용을 입력해주세요.(2000자 이내)" 
												maxlength="2000" style="width:630px; height:300px; border: 1px solid #e9e9e9;"></textarea>
								</div>
								<br>
								<br>
							  <div style="text-align: center; padding-bottom: 30px;">
									<button id="note" type="submit" class="btn btn-light">전송</button>
									<button type="reset" class="btn btn-light">취소</button>
							  </div>			
							</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!--  쪽지보내기 모달창 끝 -->

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

	<!-- 로그인 이후 헤더 -->
	<header class="sticky-top">
		<nav class="navbar navbar-expand-lg" style="background: white;">
			<div class="container-fluid">
				<img src="../images/로고5.png">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="d-flex" role="search">
						<!-- 여기서 검색버튼을 클릭시 모든 게시글을 검색 가능..? -->
						<input class="" type="search" placeholder="  동행을 찾아보세요!" aria-label="Search">

						<!-- 검색버튼 -->
						<button class="shbtn" type="submit">
							<svg style="color: #3CB371" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
							</svg>
						</button>
					</form>
				</div>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border: none; background: white; margin-top: 27px;">
						<svg style="color: #3CB371;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
						  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
						  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
						</svg>
					</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">동행게시판글쓰기</a></li>
						<li><a class="dropdown-item" href="#">후기게시판글쓰기</a></li>
						<li><a class="dropdown-item" href="<%= request.getContextPath()%>/freeboard/WriteBoard.do">자유게시판글쓰기</a></li>
					</ul>
				</div>
				<a href=""><svg style="color: #3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
				  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
				</svg></a> 
				<a href=""><svg style="color: #3CB371; margin-top: 30px; margin-right: 30px;" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
				</svg></a> 
				<span style="margin-top: 30px;"><%= name %>님! 환영합니다!</span>
				<button type="button" class="mainbtn" style="margin-right: 300px;">로그아웃</button>
			</div>
		</nav>
		<br>
		<nav class="nav">
			<a class="nav-link" href="#">홈</a> <a class="nav-link" href="#">동행게시판</a>
			<a class="nav-link" href="#">후기게시판</a> 
			<a class="nav-link" href="<%= request.getContextPath()%>/freeboard/freeboardArticle.do?bo_num=<%= getArticle.getFb_no() %>">자유게시판</a>
			<a class="nav-link" href="#" style="margin-left: 680px; margin-right: none; color: black; font-size: 1.0em;">공지사항</a>
		</nav>
	</header>

	<!-- 하단 게시글 상세보기 섹션 -->
	<section>
		<div class="row"
			style="margin-left: auto; margin-right: auto; margin-top: 35px;">
			<div style="height: auto; width: 900px; margin-left: 320px;">
				<svg></svg>
				<div style="height: 30px;">
					
					<h3 style="margin-top: 20px; margin-left: 20px;">
					               <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat-right-quote" viewBox="0 0 16 16">
                 <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
                 <path d="M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z"/>
               </svg><span>&nbsp;&nbsp;</span>
					<%= getArticle.getFb_title() %></h3>
					<input type="hidden" name="f_num" value="<%= getArticle.getFb_no()%>">
					<input type="hidden" name="f_title" value="<%= getArticle.getFb_title()%>">
					<input type="hidden" name="f_content" value="<%= getArticle.getFb_content()%>">
					<input type="hidden" name="f_reg" value="<%= getArticle.getFb_reg()%>">
					<input type="hidden" name="pname" value="<%= name %>">
				</div>
				<br>
				<div
					style="border: 1px solid #DCDCDC; border-radius: 5px; width: 750px; height: 100px;">
					<br> <a style="font-size: 1.2em; margin-left: 25px;">상태 : </a>
					
					<span class="replystate">
					<%
					if(replyList == null || replyList.size() == 0 ){
					%>
					답변 대기</span>
					<%
					}else {
					%>
					<span>답변 완료!</span>
					<%
					}
					%>
					<br>
					<a style="font-size: 1.2em; margin-left: 25px; color:black;">지역 : </a>
					<%
						if(getArticle.getFb_reg() == null){
						%>
						<span style="color: black;">지역선택 안함</span>
						<%
						}else {
						%>
						<span style="color: black;"><%= getArticle.getFb_reg()%></span>
						<%
						}
						%>
					<br>
				</div>
				
				<!-- 게시글 사진 -->
				<img src="<%=request.getContextPath() %>/freeboard/imageView.do?bonum=<%= getArticle.getFb_no()%>" onerror="this.style.display='none'" style="margin-left:10px; width:500px; height: auto; margin-top : 10px;"><br><br>
				
				<br>
				<div id="content" style="/* border: 1px solid #DCDCDC; */ margin-top : 2px; border-radius: 5px ; width: 750px; height:auto; /* height: 500px; */ display : block;">
				<p name="f_content" style="width:750px; height:auto; display:block;"><%= getArticle.getFb_content()%></p>
				</div>
				<br>
				<div style="border-radius: 5px; width: 750px; height: auto;"> 
		           게시날짜 : <span><%=getArticle.getFb_date() %></span>&nbsp;&nbsp;&nbsp;
		           조회수 : <span><%= getArticle.getFb_hit() %></span>
		           <%
		          	 if( pname.equals( getArticle.getP_name()) ){
		           %>
		           <span style="margin-left:290px; color: gray;"><input id="btnUpdate"  class="dmBtn" type="button" value="수정"></span>
		           <span style="color:gray;">&nbsp; ㅣ &nbsp;</span>
		           <span style="color:gray;"><input id="btnDelete" class="dmBtn"  type="submit" value="삭제"></span>
		  
		           
		           <%
		          	 } 
		           %>
	           </div>
	      
	           
				<!-- 댓글등록창 -->
			   <textarea placeholder=" 답변을 달아주세요!" id="replyTextarea" style="width: 600px; height: 40px; border:1px solid #DCDCDC; border-radius: 5px; display:none;"></textarea><br>
               <button type="button" id="insertReply" style="border: 1px solid #3CB371; display:none; background: #3CB371; color:white; border-radius: 5px; height: 40px; margin-left:650px;">등록</button>
               <button type="button" id="cancelBtn" style="border: 1px solid #DCDCDC; display:none; background: #DCDCDC; color:white; border-radius: 5px; height: 40px; margin-right:none;">취소</button>
				<br>
	           
				<!-- 댓글 리스트 -->
				<div style="width: 750px;">
				<ul class="hello">
					<% 	
					if(replyList == null || replyList.size() == 0){
					%> 

					  <div style="width: 750px;">
						<li class="list-group-item" style="border-top: 1px solid green; border-radius: 20px;">아직 답변이 없습니다.</li>
					  </div>
					<% }else { %>
						<p style="margin-left : 5px;"><span style="color:green"><%= replyCount %></span> 개의 답변이 달렸습니다</p>
					<%	
						for(FreeReplyVO reply : replyList){
					%>	
						<li class="list-group-item" style="border-top: 1px solid green;"><span><img alt="" src="../images/프으사아.jpg" style="width: 40px; height: 40px; border-radius: 30px;"></span> 
						<span><%= pname %></span>
						<span style="font-size: 0.8em;">&nbsp;&nbsp;&nbsp;&nbsp;<%= reply.getFcom_date() %></span>
						<%
							if( id != null ) {
						%>
						<span style="font-size: 0.8em; color:gray; margin-left:338px;"><a class="dmBtn" id="modifyBtn" href="">수정</a></span>
     		            <span style="font-size: 0.8em; color:gray;">&nbsp; ㅣ &nbsp;</span>
            		    <span style="font-size: 0.8em; color:gray;"><a class="dmBtn" href="">삭제</a></span>
						<% 		
							}
						%>
						<br>
						<%=reply.getFcom_content() %></li>						
					<%
						}
					}
					%>
					
					
					<br>
					</ul>
				</div>
			</div>

			<div style="height: 1000px; width: 400px; margin-right: auto;">
				<div
					style="border: 1px solid #DCDCDC; border-radius: 5px; width: 350px; height: 300px; margin-left: 10px; margin-top: 80px;">
					<div style="width: 330px;">
						<div style="margin-left: 30px; margin-top: 20px;">
							<span><img alt="" src="../images/프으사아.jpg" style="width: 50px; height: 50px; border-radius: 30px;"></span> <span><%= getArticle.getP_name() %></span>
						</div>
						<span></span>
					</div>
					<hr style="color: #DCDCDC; width: 300px; margin-left: 25px;">
					<br>
					<div style="margin-left: 25px;">
					   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
  						<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
						</svg> 
						  <!-- 쪽지보내기 모달 띄우기 !!!! Button to Open the Modal -->
						  <button type="button" class="btn btn" data-toggle="modal" data-target="#myModal">
						    쪽지보내기
							
						<button style="width: 300px; border: 1px solid #3CB371; margin-top: 10px; background: #3CB371;" class="btn btn-success" type="button" id="replyBtn">답변하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	</section> <!-- 글작성 메인 -->

	<!-- 푸터 -->
	<footer style="margin-bottom: none; border-top: 1px solid #DCDCDC" class="text-muted py-5">
		<form>
			<div class="container">
				<p class="float-end mb-1">
					<a class="gotop" href="#">위로 올라가기</a>
				</p>
				<img src="../images/로고5.png" style="width: 110px; height: 70px;">
				<p style="font-family: 'NanumSquareNeo-Variable'; font-size: 1.2em;" class="mb-1">동행 - 동준이와 행복한 2차 프로젝트 !</p>
				<p style="font-family: 'NanumSquareNeo-Variable';" class="mb-1">박지은 신동준 정수영 이영진 이효미 장성규</p>
				<p style="font-family: 'NanumSquareNeo-Variable';" class="mb-1">[대덕인재개발원 2022.09. 405호 2차 프로젝트 3팀]</p>
			</div>
		</form>
	</footer>



</body>
</html>