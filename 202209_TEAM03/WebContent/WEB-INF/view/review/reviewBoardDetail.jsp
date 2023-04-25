<%@page import="vo.ReviewBoardVO2"%>
<%@page import="vo.ReviewReplyVO"%>
<%@page import="java.util.List"%>
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

<!--  부트스트랩 모달 -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



<style type="text/css">
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
	font-weight: normal;
	font-style: normal;
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

<% String name=(String)session.getAttribute("name");%>
<% String id=(String)session.getAttribute("id");%>
<% String pname = (String)session.getAttribute("PNAME");%>

<% ReviewBoardVO rvo = (ReviewBoardVO)request.getAttribute("rvo"); %>
<%-- <% ReviewBoardVO2 rvo = (ReviewBoardVO2)request.getAttribute("rvo2"); %>  --%>
<% List<ReviewReplyVO> replyList = (List<ReviewReplyVO>)request.getAttribute("replyList");  %> 
<% int replyCount = (int)request.getAttribute("replyCount"); 
   int rev_no = Integer.parseInt(request.getParameter("rev_no"));
   
%>  

	
<script type="text/javascript">
	$(function(){
		$("#modifyForm").css("visibility" , "hidden");
		
		
		modicont="";
		// 글삭제 클릭 시
		$("#btnDelete").on("click", function(){
			var form = document.getElementById("buttonForm");
			form.method = "get";
			form.action = "<%=request.getContextPath()%>/reviewboard/reviewBoardDelete.do";
			form.submit();
		})
		
		// 글수정 클릭 시
		$("#btnModify").on("click", function(){
			var form = document.getElementById("buttonForm");
			form.method = "get";
			form.action = "<%=request.getContextPath()%>/reviewboard/reviewBoardModify.do"
			form.submit();	
		})
		
		// 댓글 수정 클릭 시
		$(document).on("click", ".modifyBtn", function(){
			$("#modifyForm").css("visibility" , "visible");
			event.preventDefault;
			
			vidx = $(this).parents('.list-group-item').find('input').attr('idx');
			
			// 댓글 편집창이 열려있는지 체크
/*  		 	 if($("#modifyForm").css("display") != "none"){
					// 어딘가에 편집창이 열려있다.
 				replyReset();
			} */
			
			
 	/* 	 	if($("#modifyForm").css("display","block")){
				// 어딘가에 편집창이 열려있다.
				replyReset();
		}    */
			
			replybody = $(this).parents(".list-group-item").find(".replybody");
			
			// 원래 내용 가져오기
			modicont = $(replybody).html().trim();
			// 원래 내용 가져오기
			mcont = modicont.replace(/<br>/g, "\n");
			$("#modifyForm textarea").val(mcont);
			
			$(replybody).empty();
			$(replybody).append($("#modifyForm"));
				
		})
		$("#btnok").on("click", function(){
			modicont = $("#modifyForm textarea").val(); //이게 수정한 값
			console.log('modicont', modicont);
			
			modi = modicont.replace(/\r/g, "").replace(/\n/g, "<br>");
			
			vidx = $(this).closest(".list-group-item").find('input[name="rcom_no"]').val();
			console.log(vidx);
			
			// replybody 찾기
			vreplybody = $(this).parents("#parent").find(".replybody"); // ???
			console.log('vreplybody', vreplybody)
			$("body").append($("#modifyForm"));
			$('#modifyForm').hide();
			
			$.ajax({
				
				url : "<%=request.getContextPath()%>/updateReviewReply.do",
				data : {
					
					"rcom_no" : vidx,
					"rcom_content" : modi
					
				},
				type : "post",
				dataType : "text",
				success : function(res){
					
					location.href = "<%=request.getContextPath()%>/reviewboard/reviewBoardDetail.do?rev_no="+<%=rev_no%>;
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				}
			})
		})
		
			// 댓글 삭제
			$(".deleteBtn").on("click", function(){
		
		
				vidx = $(this).parents('.list-group-item').find('input').attr('idx'); // 수정할 댓글 넘버
				vcnt = $('#replyCount span').text();
				console.log(vidx);	
				console.log(vcnt);
				$.ajax({
			
					url : '<%=request.getContextPath()%>/deleteReviewReply.do',
					type : 'get',
					data : {
								"idx" :  vidx
							},
					dataType : 'text',
					success : function(res){
					console.log(res);	
					if(res == "댓글삭제성공"){
					alert("성공상태 : " + res );
					//성공하면 화면에서 삭제 
					$(".deleteBtn").parents('.list-group-item').remove();
					}
					$('#replyCount span').text(vcnt-1);
					location.href="<%=request.getContextPath()%>//reviewboard/reviewBoardDetail.do?rev_no=<%=rvo.getRev_no()%>";
					},
					error : function(xhr){
					alert("댓글 삭제 실패! : " + xhr.status);
					}
				})
			
			})
		
		replyReset = function(){
			
			// 원래 내용 가져오기 - 댓글 수정 클릭 시 이미 가져옴 - modicont
			vreplybody = $("#modifyForm").parent();
			console.log("vreplybody", vreplybody);
			$("body").append($("#modifyForm"));
// 			$("body").append($("#modifyForm"));
			
			console.log("modicont", modicont)
			//p3에 원래 내용 출력
			vreplybody.html(modicont);
			
		}
		
		// 댓글 수정 취소
		$('#btnreset').on("click", function(){
			replyReset();
		})
		
	// 댓글 등록
	$('#insertReply').on("click", function(){
		
	// 내용, 게시글번호, 닉네임
	vnum =  "<%= rvo.getRev_no()%>";
	vcontent = $('#replyTextarea').val();
	pname = "<%= pname %>";
	
	console.log(vnum);
	console.log(vcontent);
	console.log(pname);
		
		$.ajax({
			url : '<%=request.getContextPath()%>/freeboard/insertReply.do',
			type : 'post',
			data : {
				bonum : vnum,   // 게시글 번호
				vc : vcontent,  // 댓글 내용
				pname : pname   // 댓글 작성자
			},
			
			success : function(res){
				console.log(res);
				alert("성공상태 : " + res[0]); //상태가 200이면 등록성공
				location.href = "<%= request.getContextPath()%>/reviewboard/reviewBoardDetail.do?bo_num=" +vnum;
					
			}, 
			error : function(xhr){
				alert("실패상태 : " + xhr.status);
			}
		})
	})
	})
</script>

<% String PNAME=(String)session.getAttribute("PNAME"); %>
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

</head>
<body>
<!-- modal.#myModal -->
  <!--  쪽지보내기 모달창 -->
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">쪽지보내기</h4>
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
						<form action="<%=request.getContextPath()%>/sendNote2.do?bo_num=<%=rvo.getRev_no() %>" method="post">
								<label style="font-size: 1.2em; margin-left:20px;">쪽지제목
								
									<span style="margin-left:285px;">받는사람</span> 
									<input type="text" name="sendPeople" style="width:150px; border:1px solid #e9e9e9;" placeholder="아이디 입력" value="<%=rvo.getP_name()%>">
									<%-- <input type="hidden" name="sendPeople"  value="<%= getArticle.getP_name()%>"> --%>								
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
									<button id="note" type="submit" class="btn btn-light" style="width: 250px;">전송</button>
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
				<span style="margin-top: 30px;"><%=pname %>님 환영합니다!</span>
				<form action="<%=request.getContextPath()%>/logout.do" method="post">
					<button type="submit" id="logout" class="mainbtn" style="margin-right: 300px;">로그아웃</button>
				</form>
			</div>
		</nav><br>
		<nav class="nav">
  			<a class="nav-link" href="<%=request.getContextPath()%>/mainIndex.jsp">홈</a> 
 			<a class="nav-link"
				href="<%=request.getContextPath()%>/mainboard/mainBoardList.do">동행게시판</a>
			<a class="nav-link"
				href="<%=request.getContextPath()%>/reviewboard/reviewBoardList.do">후기게시판</a>
			<a class="nav-link"
				href="<%=request.getContextPath()%>/freeboard/freeBoardList.do">자유게시판</a>
			<a class="nav-link" 
			   href="<%=request.getContextPath()%>/noticeBoardList.do"
				style="margin-left: 680px; margin-right: none; color: black; font-size: 1.0em;">공지사항</a>
</nav>
	</header>
	
	
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
					<a style="font-size:1.2em; margin-left:25px; margin-top: 30px;">여행지역 : </a><span id=""><%-- <%=rvo2.getReg_no() %> --%></span><br>
				</div><br>
				<!-- 게시글 내용출력 -->
				<div style="border:1px solid #DCDCDC; border-radius: 5px; width:750px; height: 500px;">
					<span id=""><%=rvo.getRev_content() %></span>
				</div><br>
				<div style="border-radius: 5px; width:750px; height: auto;">
				
				<% 
					if(pname.equals(rvo.getP_name())){
				%>
				
				<form name="buttonForm" id="buttonForm">
				<input type="hidden" name="revNo"  id="revNo" value="<%=rvo.getRev_no() %>">
				<button type="button" id="btnModify">수정</button> 
				<button type="button"  id="btnDelete">삭제</button>
				<br><br>
				</form>
				
				<% 
					}
				%>
				
					<!-- 게시날짜, 조회수 스판태그에 출력 -->
					게시날짜 : <span id=""><%=rvo.getRev_date() %></span><br>
					조회수 : <span id=""><%=rvo.getRev_hit() %></span>
				</div><br>
				
				<div>
				<form id="reviewReplyForm" name="form" method="post" action="<%=request.getContextPath()%>/reviewboard/insertReviewReply.do">
					<input name="cont" class="replytext" type="text" placeholder="댓글을 입력해주세요." style="width:600px; border:1px solid #DCDCDC;">
					<input type="hidden" name="pname" id="pname" value="<%=pname%>">
					<input type="hidden" name="rev_no" id="rev_no" value="<%=rvo.getRev_no() %>">
					<button class="replybtn" type="submit" id="insertReply">등록</button>
				</form>
				</div><br>
				<div style="width:700px;">
				
				<!-- 댓글이 없는 경우  -->
				<ul class="list-group list-group-flush">
				<% 
					if(replyList == null || replyList.size() == 0) {
				%>
				  <li class="list-group-item">등록된 댓글이 없습니다.</li>
				  
				  <!-- 댓글이 있으면 -->
				<%}else{%>
					<p id="replyCount" style="margin-left : 5px;"><span><%=replyCount%></span>개의 댓글이 있습니다.</p>
					
				<% 
						
					for(ReviewReplyVO reply : replyList){
						
						String vcont = reply.getRcom_content();
						
						vcont = vcont.replaceAll("\r", "").replaceAll("\n", "<br>");
				
				%>	
					
				  <li class="list-group-item">
				  <input idx="<%=reply.getRcom_no() %>" type="hidden" name="rcom_no" value="<%=reply.getRcom_no()%>">
				  <input type="hidden" name="p_name" value="<%=reply.getP_name() %>">
				  <span><img alt="" src="../images/프으사아.jpg" style="width: 40px; height: 40px; border-radius: 30px;"></span>
				  
				  <span><%=reply.getP_name() %></span>
				  <span style="font-size: 0.8em;">&nbsp;&nbsp;&nbsp;&nbsp;<%=reply.getRcom_date() %></span><br>
				
				 <%
					 if(pname.equals(reply.getP_name())) {
				 %>
				 <div id="parent">
				 <span style="font-size: 0.8em; color:gray; margin-left:338px;"><a class="modifyBtn">수정</a></span>
     		     <span style="font-size: 0.8em; color:gray;">&nbsp; ㅣ &nbsp;</span>
            	 <span style="font-size: 0.8em; color:gray;"><a class="deleteBtn">삭제</a></span>
				 <br>
				 <div class="replybody">
					<%=
						vcont
					%>
				</div>
				</div>
				  </li>
				  
				  <% 
					}else{
					%>
				  
				<div class="replybody">		
				  	<%=
				  	vcont
				  	%>
				  </div>
				  </li>
				  <% } %>
				  
				<%
					}
				}
				%>
				
				</ul>
				<br>
				</div>
				</div>

			<!-- 오른쪽 프로필확인 섹션 -->
			<div style="height: 1000px; width: 400px; margin-right: auto;">
				<div
					style="border: 1px solid #DCDCDC; border-radius: 5px; width: 350px; height: 300px; margin-left: 10px; margin-top: 80px;">
					<div style="width: 330px;">
						<div style="margin-left: 30px; margin-top: 20px;">
						<%
						ReviewBoardVO2 writerInfo = (ReviewBoardVO2)request.getAttribute("writerInfo");
						String imageFile = writerInfo.getRev_pic();
						
						if(imageFile == null || "".equals(imageFile)){
						%>
				
							<span><img alt="" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg" style="width: 50px; height: 50px; border-radius: 30px;"></span> <span><%= rvo.getP_name() %></span>
						<% }  else {%>
							<span><img alt="" src="<%= request.getContextPath()%>/freeboard/imageView2.do?p_pic=<%= imageFile %>" style="width: 50px; height: 50px; border-radius: 30px;"></span> <span><%= rvo.getP_name() %></span>
						<% } %>						
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
						
						<!-- 댓글등록 버튼 -->
						<button style="width: 300px; border: 1px solid #3CB371; margin-top: 10px; background: #3CB371;" class="btn btn-success" type="button"  id="replyBtn" data-bs-toggle="collapse" data-bs-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1"> 답변하기 </button>
					</div>
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

<!-- 댓글 수정 편집창  -->
<div id="modifyForm">
	  <textarea id="text" rows="3" cols="40"></textarea>
	  <input type="button" value="확인" id="btnok" style="border: 1px solid #3CB371;  background: #3CB371; color:white; border-radius: 5px; height: 40px; margin-left:10px; margin-right:1px;">
	  <input type="button" value="취소" id="btnreset" style="border: 1px solid #DCDCDC;  background: #DCDCDC; color:white; border-radius: 5px; height: 40px;">
</div>



</body>
</html>