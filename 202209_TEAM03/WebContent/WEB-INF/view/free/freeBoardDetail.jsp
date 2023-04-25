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
	
<!-- <script src="../js/jquery-3.6.1.min.js"></script> -->

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

 	margin-top: 10px;
    padding: 10px;
	border : none;
}

/* ul */

.list-group-flush {
	padding: 0px;
	border-radius : 20px;
}

/* 첫번째 li요소 */

/* .list-group-flush:first-child{
	border-radius:20px;
	 */
} 

#replyTextarea{
	border : 1px solid #DCDCDC;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	width: 900px;
	height: 40px;
}

#modifyForm{
  display : none; /*처음 화면에는 안보이다가 댓글 수정을 누르면 나옴 */    
}

.replybody{
	padding : 20px;
}

.replysection{
	padding : 0px;
}



</style>

<% String name=(String)session.getAttribute("name");%>
<% String id=(String)session.getAttribute("id");%>
<% String pname = (String)session.getAttribute("PNAME");%>

<% FreeBoardVO getArticle = (FreeBoardVO)request.getAttribute("getArticle");%>
<% List<FreeReplyVO> replyList = (List<FreeReplyVO>)request.getAttribute("reply");%>
<% int replyCount = (int)request.getAttribute("replyCount"); 
	String answer = request.getParameter("answer");
	int bo_num= Integer.parseInt(request.getParameter("bo_num"));
	FreeBoardVO writerInfo = (FreeBoardVO)request.getAttribute("writerInfo");
	
	Object grade = session.getAttribute("grade");
	int gradeNum = (int) grade;
%>


<%
	if(answer!=null){
%>

	<script>
	alert("쪽지보내기 성공하였습니다!");
	
	</script>
		
	<% }%>


<script>
      $(document).ready(function(){
         $('#logout').on('click',function(){
            alert("<%=name%>님 로그아웃 합니다!");
         })//회원 로그아웃 끝
         
         $('#adminLogout').on('click',function(){
            alert("<%=name%>님 로그아웃 합니다!");
         })//관리자 로그아웃 끝
      })

</script>





<script type="text/javascript">
$(function(){
	
	
	
	// 답변하기 이벤트
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
	}) //답변하기 이벤트 끝
		
	
	
	// 댓글 등록
	$('#insertReply').on("click", function(){
		
	// 내용, 게시글번호, 닉네임
	vnum =  "<%= getArticle.getFb_no()%>";
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
				//alert("성공상태 : " + res[0]); //상태가 200이면 등록성공
				location.href = "<%= request.getContextPath()%>/freeboard/freeboardArticle.do?bo_num=" +vnum;
					
			}, 
			error : function(xhr){
				//alert("실패상태 : " + xhr.status);
			}
		})
	})
	
	
	
	
	// 댓글 수정 클릭시
	$(document).on("click", ".modifyBtn", function(){
		event.preventDefault; //버튼이 a태그이기 때문에 콘솔창에 찍혔다가 사라지니까 그걸 막음. 그리고 a태그의 href="#" 삭제해야함 
		
		
		vidx = $(this).parents('.list-group-item').find('input').attr('idx'); // 수정할 댓글 넘버
		//console.log(vidx);
		
		// 댓글 편집창이 열려있는지 체크
		if($('#modifyForm').css('display') != "none"){
			// 어딘가에 편집창이 열려있다.
			replyReset();  // 함수 따로 만들기
		}
		
		replybody = $(this).parents('.list-group-item').find('.replybody'); // 수정할 댓글 내용
		//console.log(replybody);
		
		// 원래 내용 가져오기 - 수정할 것
		modicont =  $(replybody).html().trim(); // 게시글 내용엔 br태그가 있다
		
		// 원래내용 가져오기 - 수정할 것
		mcont = modicont.replace(/<br>/g, "\n");
		$('#modifyForm #text').val(mcont);
		
		// 편집창 보이게하기
		$(replybody).empty();
		$(replybody).append($('#modifyForm'));
		$('#modifyForm').show();
	
	});
	
	
	// 댓글 수정 편집창에서 확인버튼 클릭
  	$('#btnok').on("click", function(){
		modicont =  $('#modifyForm #text').val(); //엔터가 포함 // 새로 쓴 댓글 내용 
		console.log(modicont);
		
		modi = modicont.replace(/\r/g,"").replace(/\n/g, "<br>");
		
		vidx = $(this).parents('.list-group-item').find('input').attr('idx'); // 수정할 댓글 넘버
		
		//replybody 찾기 
		vreplybody = $(this).parents('.replybody');  //이걸 못 찾는 거 같음...!!!!!! 
		
		//편집창을 body로 이동 - 안보이게 설정
		$('body').append($('#modifyForm'));
		$('#modifyForm').hide(); 
		<%-- vnum =  "<%= getArticle.getFb_no()%>"; --%>
		$.ajax({
			
			url : "<%=request.getContextPath()%>/freeboard/updateReply.do",
			data : {
				
				"fcom_no" : vidx,
				"fcom_content" : modi
			},
			type : 'post',
			dataType : 'text',
			success : function(res){
				//alert("댓글수정성공!" + res); 
				location.href="<%=request.getContextPath()%>/freeboard/freeboardArticle.do?bo_num=<%=getArticle.getFb_no()%>";					
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
			
			url : '<%=request.getContextPath()%>/freeboard/delReply.do',
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
				location.href="<%=request.getContextPath()%>/freeboard/freeboardArticle.do?bo_num=<%=getArticle.getFb_no()%>";
			},
			error : function(xhr){
				alert("댓글 삭제 실패! : " + xhr.status);
			}
		})
			
	})
	
	// 댓글 수정 취소
	$('#btnreset').on("click", function(){
		replyReset();
	})
	
	
	// 게시글 수정
	$(".btnUpdate").on("click", function(){
		location.href="<%=request.getContextPath()%>/freeboard/updateBoard.do?bo_num=<%=getArticle.getFb_no()%>"
	})	
	
	
	
	// 게시글 삭제
	$(".btnDelete").on("click", function(){
		if(confirm("정말 해당 게시글을 삭제하시겠습니까?\n삭제 후에는 복구할 수 없습니다!") == true){
	        alert("삭제되었습니다");
	    }
	    else{
	        return ;
	    }
		
		location.href="<%=request.getContextPath()%>/freeboard/deleteBoard.do?bo_num=<%=getArticle.getFb_no()%>"
	})
	
	replyReset = function(){
		
		// 원래 내용 가져오기 - 댓글 수정 클릭시 이미 가져왔다 - modicont
		vreplybody = $('#modifyForm').parent();   
		
		//편집창을 body로 이동
		$('body').append( $('#modifyForm'));
		$('#modifyForm').hide(); 
		
		//p3에 원래 내용 출력한다. 
		vreplybody.html(modicont);
	}
})
	
</script>
</head>
<body>


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
						<form action="<%=request.getContextPath()%>/sendNote2.do?bo_num=<%=bo_num %>" method="post">
								<label style="font-size: 1.2em; margin-left:20px;">쪽지제목
								
									<span style="margin-left:285px;">받는사람</span> 
									<input type="text" name="sendPeople" style="width:150px; border:1px solid #e9e9e9;" placeholder="아이디 입력" value="<%= getArticle.getP_name()%>">
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
					if (pname != null && gradeNum == 0) {
				%>
				<span style="margin-top: 30px;"><%=pname%>님! 환영합니다!</span>
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
			<a class="nav-link" href="../mainIndex.jsp">홈</a>
			<a class="nav-link" href="<%= request.getContextPath()%>/mainboard/mainBoardList.do">동행게시판</a>
			<a class="nav-link" href="<%= request.getContextPath()%>/freeboard/freeBoardList.do">자유게시판</a>
			<a class="nav-link" href="<%= request.getContextPath()%>/reviewboard/reviewBoardList.do">후기게시판</a> 
			<a class="nav-link" href="<%= request.getContextPath()%>/noticeBoardList.do" style="margin-left: 680px; margin-right: none; color: black; font-size: 1.0em;">공지사항</a>
		</nav>
	</header>

	<!-- 하단 게시글 상세보기 섹션 -->
	<section>
		<div class="row"
			style="margin-left: auto; margin-right: auto; margin-top: 35px;">
			<div style="height: auto; width: 900px; margin-left: 320px;">
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
					<span>답변 완료</span>
					<%
					}
					%>
					<br>
					<a style="font-size: 1.2em; margin-left: 25px; color:black;">지역 : </a>
					<%
						if(getArticle.getFb_reg() == null){
						%>
						<span style="color: black;">선택안함</span>
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
			
				<div id="content" style="/* border: 1px solid #DCDCDC; */ margin-top : 2px; border-radius: 5px ; width: 750px; height:auto; /* height: 500px; */ display : block;">
				
				<!-- 게시글 내용 -->
				<p name="f_content" style="width:750px; height:auto; display:block; margin-left:10px;">	
						<%
							String cont = getArticle.getFb_content();
							cont = cont.replaceAll("\r", "").replaceAll("\n", "<br>");
						%>
						<%= 
							 cont/* getArticle.getFb_content() */
						%>
				</p>
				</div>
				<br>
				<!-- 게시날짜 및 조회수 -->
				<div style="border-radius: 5px; width: 750px; height: auto;"> 
		           게시날짜 : <span><%=getArticle.getFb_date() %></span>&nbsp;&nbsp;&nbsp;
		           조회수 : <span><%= getArticle.getFb_hit() %></span>
		           <%
		          	 if( pname.equals( getArticle.getP_name()) ){
		           %>
		            
		           <!-- 로그인한 사용자가 게시글 작성자라면  수정 삭제가 가능 -->    
		           <span style="margin-left:290px; color: gray;"><a class="btnUpdate" >수정</a></span>
		           <span style="color:gray;">&nbsp; ㅣ &nbsp;</span>
		           <span style="color:gray;"><a class="btnDelete" >삭제</a></span>
		           
		           <%
		          	 } 
		           %>
	           </div>
	      	   <br><br>
  
	           <!--  댓글 달기 -->
			   <div class="collapse" id="collapseExample1">
				  <textarea placeholder="답변을 달아주세요!" id="replyTextarea" type="text" style="width: 600px; height: 40px; border:1px solid #DCDCDC; border-radius: 5px; display:none; float : left;" class="card card-body"></textarea>
			   <!-- float : left 속성 => textarea 옆으로 올 수 있게하기 -->
			   <button type="button" id="insertReply" style="border: 1px solid #3CB371; display:none; background: #3CB371; color:white; border-radius: 5px; height: 40px; margin-left:10px; margin-right:5px; float : left;">등록</button>
               <button type="button" id="cancelBtn" style="border: 1px solid #DCDCDC; display:none; background: #DCDCDC; color:white; border-radius: 5px; height: 40px;">취소</button>
				</div>
	   
				<br>
	           
				<!-- 댓글 리스트 -->
				 <ul class="list-group list-group-flush">
					<div class="" style="width: 750px;" >
				 	
				 	<!-- 댓글이 없으면 -->
					<% 	
					if(replyList == null || replyList.size() == 0){
					%> 
					  
						<!-- <li class="list-group-item" style="border-top: 1px solid green; border-radius: 20px;">아직 답변이 없습니다.</li> -->
						<li style="list-style: none;"><p style="margin-left : 5px;"><span style="color: #52E252"><%= replyCount %></span> 개의 답변</p></li>
					  
					</div>  
					<!-- 댓글이 있으면 -->
					<% }else { %>
						<p id="replyCount" style="margin-left : 5px;"><span style="color: #52E252"><%= replyCount %></span> 개의 답변</p>
						
					<%	
						
						for(FreeReplyVO reply : replyList){
							
							String vcont = reply.getFcom_content();
							
							vcont =  vcont.replaceAll("\r", "").replaceAll("\n", "<br>");
							
							String imageFile = reply.getP_pic();
							
							%>
								<li class="list-group-item">
								<input idx="<%= reply.getFcom_no()%>" type="hidden" name="fcom_no" value="<%= reply.getFcom_no()%>"/>
								<input type="hidden" name="p_name" value="<%=reply.getP_name()%>"/>
							<%
							
							if(imageFile == null || "".equals(imageFile)){
					
					%>
						<!-- <div class="replysection" style="width: 750px;" > -->
						
						
						
						<span><img alt="" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg" style="width: 40px; height: 40px; border-radius: 30px;"></span>
					<%
							}else{
					%>	
							<span><img alt="" src="<%=request.getContextPath()%>/freeboard/imageView2.do?p_pic=<%= imageFile %>" style="width: 40px; height: 40px; border-radius: 30px;"></span> 
					<%
							}
					%>	
						<span><%= reply.getP_name() %></span>
						<span style="font-size: 0.8em;">&nbsp;&nbsp;&nbsp;&nbsp;<%= reply.getFcom_date() %></span>
						<%
							if(pname.equals(reply.getP_name()) ) {    /*  로그인한 사용자(세션)와 댓글 작성자가 같으면 */
						%>
						
						
						<span style="font-size: 0.8em; color:gray; margin-left:338px;"><a class="modifyBtn" id="modifyBtn">수정</a></span>
     		            <span style="font-size: 0.8em; color:gray;">&nbsp; ㅣ &nbsp;</span>
            		    <span style="font-size: 0.8em; color:gray;"><a class="deleteBtn">삭제</a></span>
            		    <br>
						<div class="replybody">
							<%=
							vcont/* reply.getFcom_content() */ 
							%>
						</div>
						</li>
						<hr style="color:#DCDCDC; width= 750px; margin: 0;" >						
						<% 		
							}else {
						%>
						
						<div class="replybody">
							<%=
							vcont
							 %>
						</div>
						</li>			
						<%  } %>
<!-- 					</div> -->
					<%
						}
					}
					%>
					<hr style="color:#DCDCDC; width= 750px; margin: 0;" >	
					</ul>
				</div>

			<div style="height: 1000px; width: 400px; margin-right: auto;">
				<div
					style="border: 1px solid #DCDCDC; border-radius: 5px; width: 350px; height: 300px; margin-left: 10px; margin-top: 80px;">
					<div style="width: 330px;">
						<div style="margin-left: 30px; margin-top: 20px;">
						<%
							String imageFile = writerInfo.getP_pic();
						
							if(imageFile == null || "".equals(imageFile)){
						%>
							<span><img alt="" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg" style="width: 50px; height: 50px; border-radius: 30px;"></span> <span><%= getArticle.getP_name() %></span>
						<%
							}else {
						%>
							<span><img alt="" src="<%=request.getContextPath()%>/freeboard/imageView2.do?p_pic=<%= imageFile %>" style="width: 50px; height: 50px; border-radius: 30px;"></span> <span><%= getArticle.getP_name() %></span>
						<%
							}
						%>
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
				   </div>  <!-- 게시글 조회 끝 -->
	</form>
	</section> <!-- 글작성 메인 -->





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

<!-- 댓글 수정 편집창  -->
<div id="modifyForm">
  <textarea id="text" rows="3" cols="40"></textarea>
  <input type="button" value="확인" id="btnok" style="border: 1px solid #3CB371;  background: #3CB371; color:white; border-radius: 5px; height: 40px; margin-left:10px; margin-right:1px;">
  <input type="button" value="취소" id="btnreset" style="border: 1px solid #DCDCDC;  background: #DCDCDC; color:white; border-radius: 5px; height: 40px;">
</div>


</body>
</html>