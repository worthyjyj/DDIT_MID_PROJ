<%@page import="vo.Profile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>withme 메인창</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/withmeChat.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/withmeBasic.css">

<style type="text/css">
.modal_input{
	width: 400px;
}
.vote_date{
	font-size: 0.5em;
	vertical-align: bottom;
	position: relative;
	left: 12px;
	top: 3px;
}
.vote_item{
	width: 400px;
	margin-bottom: 5px;
}
.card_btn{
	width: 40%;
	display: inline-block;
	vertical-align: top;
	margin: 10px;
	margin-right: 3%;
	text-align: left;
	border: none;
	background: none;
	border-radius: 2%;
	padding: 0px;
}
.card_btn:hover{
	transition-duration: 0.4s;
	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
.card-footer:hover{
	background-color: #e7e7e7;
}

.vote_info {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	z-index: 1050;
}
.vote_info_dialog{
	background: rgba( 69, 139, 197, 0.70 );
	box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
	backdrop-filter: blur( 13.5px );
	-webkit-backdrop-filter: blur( 13.5px );
	border-radius: 10px;
	border: 1px solid rgba( 255, 255, 255, 0.18 );
	width: 600px;
	height: auto;
	position: relative;
	left: 35%;
	padding: 30px 50px;
}
.info_title{
	display: inline-block;
	width: 350px;
}
.info_close {
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: white;
    font-size: 1.5em;
}
.info_body{
	height: auto;
}
.info_footer{
	vertical-align: bottom;
}
.info_btn{
	text-align: right;
}
.mdVotebtn, .modi_btn{
	display: inline;
}
.vote_modi, .vote_del{
	padding: 3px;
}

.users {
	display:flex;
	justify-content:center;
	flex-direction: row;
}
.users {
	display:flex;
	flex-direction: column;
	width: 200px;
	text-align:center;
	margin-top:50px
}
.length {
	position: relative;
	float: right;
}
.length .users {
	visibility: hidden;
	width: 120px;
	background-color: black;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	
	position: absolute;
	z-index: 1;
}
.length:hover .users {
	visibility: visible;
}
.length .users::after {
  content: " ";
  position: absolute;
  border-style: solid;
  border-width: 5px;
}
.length .users-right {
  top: -50px;
  left: 105%;
}
.length .users-right::after {
  top: 50%;
  right: 100%;
  margin-top: -5px;
  border-color: transparent black transparent transparent;
}
</style>

</head>   
<body>
<%
	Profile pVo = (Profile) session.getAttribute("profile");
	String pName = pVo.getP_name();
	
	// 윗미 번호 >> withme_code
	String room = (String) request.getAttribute("room");
	
	// 방 등급 >> 방장 : 1 / 그 외 : 0
	String grade2 = (String) session.getAttribute("grade2");
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
var room = <%=room%>;
var grade = <%=grade2%>;
var pName = "<%=pName%>";

$(function () {
	voteList();
	
	origin_modal = $('#myModal').html();
	
	// 페이지 이동
	$('.btnWmPage').on('click', function() {
		var form = document.createElement('form');
		var objs;
		
		objs = document.createElement('input');
		objs.setAttribute('type', 'hidden');
		objs.setAttribute('name', 'page');
		objs.setAttribute('value', $(this).val());
		console.log($(this).val());
		form.appendChild(objs);
		
		objs = document.createElement('input');
		objs.setAttribute('type', 'hidden');
		objs.setAttribute('name', 'room');
		objs.setAttribute('value', room);
		form.appendChild(objs);

		form.setAttribute('method', 'post');

		form.setAttribute('action', "<%= request.getContextPath()%>/withMeMain.do");

		document.body.appendChild(form);

		form.submit();
	});
	
	// 투표버튼 클릭
	$(document).on('click', '.btnVote', function() {
		var vo_no = $(this).closest('.vote_info').prev().find($('.vote_no')).val();
		var vi_no = $(this).closest('.info_content').find($('input[name=vRadio' + vo_no + ']:checked')).val();
		
		
		$.ajax({
			url: "<%=request.getContextPath()%>/insertVoteUser.do",
			data: {
				"vo_no" : vo_no,
				"vi_no" : vi_no,
				"pName" : pName
				},
			type: "get",
			success: function(res) {
				alert('투표 완료!');
				voteList();
			},
			error: function(xhr) {
				alert(xhr.status);
			}
		});
	});
	
	headerCode = "";
	
	// 투표 수정
	$(document).on('click', '.vote_modi', function() {
		var hTag = $(this).closest('.info_header');
		headerCode = hTag.html();
		
		$('.vote_modi').css('display', 'none');
		$('.vote_del').css('display', 'none');
		
		var code = "<input id='mtitle' style='width: 350px;' type='text' placeholder='" + hTag.find('.info_title').text() + "'>";
		code += "<div class='modi_btn'><input type='button' class='btn mbtn modi_title' value='등록'>";
		code += "<input type='button' class='btn mbtn modi_cancel' value='취소'></div>";
		hTag.html(code);
	});
	
	// 투표 수정 취소
	$(document).on('click', '.modi_cancel', function() {
		$(this).closest('.info_header').html(headerCode);
	});
	
	// 투표 수정 등록
	$(document).on('click', '.modi_title', function() {
		var vo_no = $(this).closest('.vote_info').prev().find($('.vote_no')).val();
		var mtitle = $(this).parent().prev().val();
		
		$.ajax({
			url: "<%=request.getContextPath()%>/updateVote.do",
			data: { "vo_no" : vo_no,
				"mtitle" : mtitle },
			type: 'post',
			success: function(res) {
				alert('수정 완료');
				voteList();
			},
			error: function(xhr) {
				alert(xhr.status);
			}
		})
	});
	
	// 투표 삭제버튼
	$(document).on('click', '.vote_del', function() {
		var vo_no = $(this).closest('.vote_info').prev().find($('.vote_no')).val();
		
		if(confirm('정말 삭제 하시겠습니까?')){
			$.ajax({
				url: '<%=request.getContextPath()%>/deleteVote.do',
				data: { "vo_no" : vo_no },
				type: 'post',
				success: function() {
					alert('삭제 완료');
					voteList();
				},
				error: function(xhr) {
					alert(xhr.status);
				}
			});
		}
	});
	
	// 창 띄우기
	$(document).on('click', '.card_btn', function() {
		$(this).next().css('display', 'flex');
	});
	
	// 창 닫기
	$(document).on('click', '.info_close', function() {
		$('.modi_cancel').click();
		$(this).parents('.vote_info').css('display', 'none');
	})
	$(document).on('click', '.btnClose', function() {
		$('.modi_cancel').click();
		$(this).parents('.vote_info').css('display', 'none');
	})
	
});


function insert_vote() {
	$.ajax({
		url: "<%=request.getContextPath()%>/insertVote.do",
		type: "post",
		data: {
			"title" : modal_title,
			"date" : modal_date,
			"room" : room,
			"items" : modal_items
		},
		success: function(res) {
			alert("투표가 추가되었습니다")
			voteList();
			reset();
		},
		error: function(xhr) {
			alert(xhr.status);
		}
	});
}

// 투표추가 모달창에서 항목 추가
function add_item() {
	var inputCode = '<input class="vote_item" type="text" placeholder="항목 입력">';
	$('#vitem_div').append(inputCode);
}

//투표 저장/취소 후 모달창 초기화
function reset() {
	$('#myModal').html(origin_modal);
}

//모달창에서 값이 입력되었는지 체크
function inputCheck() {
	var inputClass = document.getElementsByClassName('modal_input');
	modal_title = inputClass[0].value;
	modal_date = inputClass[1].value;

	var itemClass = document.getElementsByClassName('vote_item');
	modal_items = "";
	for(var i = 0; i < itemClass.length; i++){
		var val = itemClass[i].value;
		if(val != '' && val != null){
			modal_items += val + "||";
		}
	}
	
	var dateObj = new Date();
	var today = dateObj.getFullYear() + "-" + ("0" + (1 + dateObj.getMonth())).slice(-2) + "-" + ("0" + dateObj.getDate()).slice(-2);
	
	var input = new Date(modal_date);
	var comp = new Date(today);
	
	if(modal_title != '' && modal_date != '' && (modal_items.split("||").length > 2) && (input > comp)){
		$('#submit').attr('disabled', false);
	}else{
		$('#submit').attr('disabled', true);
	}
}

window.addEventListener("keyup", inputCheck, false);
window.addEventListener("mouseup", inputCheck, false);

function voteList() {
	$.ajax({
		url: "<%=request.getContextPath()%>/voteList.do",
		type: "post",
		data: { "room" : room },
		dataType: "json",
		success: function(res) {
			var code = '<div class="vote_Adiv">';
			$.each(res, function(i, v) {
				code += '	<button id="btn_card' + v.vote_no + '" type="button" class="card_btn">';
				code += '		<div class="card">   ';
				code += ' <input type="hidden" class="vote_no" value="' + v.vote_no + '">';
				code += '		<div class="card-header">' + v.vote_title + '</div>';
				var sum = 0;
				$.each(v.viList, function(j, vi) {
					var vuLength = vi.vuList.length;
					if(vi.vuList[0].vu_id == '-999999') vuLength = 0;
					sum += vuLength;
					code += '		<div class="card-body">';
					code += '		<span>' + vi.vi_content + '</span>';
					code += '		<span style="float: right;">' + vuLength + ' 명</span>';
					code += '		</div> ';
				})
				code += '		<div class="card-footer">투표하러 가기</div>';
				code += '	</div></button>';
				
				code += '<div class="vote_info" id="voteModal' + v.vote_no + '">';
				code += '	<div class="vote_info_dialog">';
				code += '		<div class="info_content">';
							
				code += '			<div class="info_header">';
				code += '				<h4 class="info_title">' + v.vote_title + '</h4>';
				
				if(grade == 1){
					code += '				<div class="mdVotebtn"><input type="button" class="btn vote_modi" value="수정">';
					code += '				<input type="button" class="btn vote_del" value="삭제"></div>';
				}
				code += '				<div class="info_close">X</div>'
				code += '				<div class="vote_date">' + v.vote_sdate.split(" ")[0] + ' - ' + v.vote_edate.split(" ")[0] + '</div>'
				code += '			</div><br>';
							
				code += '			<div class="info_body">';
				

				var dis = '';
				var text = '';
				var dateObj = new Date();
				var today = dateObj.getFullYear() + "-" + ("0" + (1 + dateObj.getMonth())).slice(-2) + "-" + ("0" + dateObj.getDate()).slice(-2);
				
				var edate = new Date(v.vote_edate);
				var comp = new Date(today);
				if(edate < comp) {
					dis = "disabled";
					text = '투표 기한이 만료되었습니다.';
				}
				
				$.each(v.viList, function(j, vi) {
					var vuLength = vi.vuList.length;
					if(vi.vuList[0].vu_id == '-999999') vuLength = 0;
					
					var ch = '';
					var users = '';
					if(vuLength != 0){
						$.each(vi.vuList, function(k, vu) {
							users += '<p>' + vu.vu_id + '</p>';
							if(vu.vu_id == pName) ch = 'checked';
						})
					}
					code += '			<div><label><input type="radio" name="vRadio' + v.vote_no + '" class="vRadio" value="' + vi.vi_no + '" ' + ch + ' ' + dis + '>&nbsp;&nbsp;' + vi.vi_content + '</label>';
					code += '			<span class="length">' + vuLength + ' 명 &nbsp;<div class="users users-right">' + users + '</div></span></div>';
					code += '			<div class="progress">';
				    code += '			<div class="progress-bar bg-success" style="width:' + vuLength/sum * 100 + '%"></div></div><br>';
				})
				code += '			</div>';
				
				code += '			<div class="info_footer">';
				code += '				<span style="margin-right: 80px;">' + text + '</span>';
				code += '				<div class="info_btn"><input type="button" class="btn btnVote" ' + dis + ' value="투표">';
				code += '				<button type="button" class="btn btnClose">닫기</button></div>';
				code += '			</div>';
							
				code += '		</div>';
				code += '	</div>';
				code += '</div>';
				
			})
			code += '</div>';
			
			$('#voteList').html(code);
		},
		error: function() {
			
		}
	})
}
</script>
<header class="sticky-top">
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
            <a class="btnWmPage"><img src="<%=request.getContextPath() %>/images/withme.png"></a>
            <div style="margin-right: 20px; margin-top:90px;">
            <a href="<%=request.getContextPath()%>/mainIndex.jsp" ><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
  			<path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146ZM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5Z"/>
			</svg>
            홈으로 돌아가기</a></div>
		</div>
	</nav>
	<br>
</header><br>
   
<section>
	<div class="row">
		<div class="leftdiv">
         	<div id="prof_div" class="profile">
         	<%
         	if(pVo.getP_pic() != null && !"".equals(pVo.getP_pic())){
         	%>
            	<img id="prof_img" src="<%=request.getContextPath() %>/profileImg.do">
            <%
            }else{
            %>
            	<img id="prof_img" src="https://tripsoda.com/images/common/profile/vector_profile_willy.svg">
            <%
            }
         	%>
         		<div><%=pName %></div>
            </div>
			<div class="category"><input type="button" class="btnWmPage" value="withme friends"></div>
			<div class="category"><input type="button" class="btnWmPage" value="스케줄러"></div>
			<div class="category"><input type="button" class="btnWmPage" value="투표"></div>
			<div class="category"><input type="button" class="btnWmPage" value="가계부"></div>
<!-- 			<div class="category"><input type="button" class="btnWmPage" value="공지사항"></div> -->
		</div>
         
		<div class="rightdiv">
			<div style="width:calc(90% - 1%); height: auto; margin-top: 50px; margin-left:50px;">
				<h3 style="display: inline;">투표</h3>
				<div class="container mt-3" style="display: inline; position: relative; left: calc(85% - 1%);">
					<% 
					if("1".equals(grade2)){
					%>
						<button id="btn_add" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
							투표 추가
						</button>
					<%
					}
					%>
				</div>
				<hr>
				
				<div id="voteList" style="margin-left: 10%;"></div>

			</div>
		</div>
	</div>
</section>

<!-- The Modal -->
<div class="modal" id="myModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">새 투표 만들기</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" onclick="reset()"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body" style="padding-left: 50px;">
				<input class="modal_input" type="text" id="title" name="title" placeholder="투표 제목"><br><br>
				<label>마감 날짜</label>
				<input class="modal_input" type="date" id="date" name="date">
				<hr style="width: 400px;">
				<div id="vitem_div">
					<input class="vote_item" type="text" placeholder="항목 입력">
					<input class="vote_item" type="text" placeholder="항목 입력">
				</div>
				<input id="btn_item" type="button" value="항목 추가" style="text-align: left;" onclick="add_item()">
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" id="submit" class="btn btn-primary" data-bs-dismiss="modal" disabled="false" onclick="insert_vote()">저장</button>
				<button type="button" id="cancel" class="btn btn-danger" data-bs-dismiss="modal" onclick="reset()">취소</button>
			</div>

		</div>
	</div>
</div>

<!-- 채팅 아이콘 버튼 -->
<img id='chat' class="chat" src="<%=request.getContextPath()%>/images/on.png">

<div id="main-container" style="display: none;">
	<div id="chat-container"></div>
	<div id="bottom-container">
	
		<!-- 송신 메시지 텍스트박스 -->
		<input id="messageText" type="text">
		
		<!-- 송신 버튼 -->
		<input type="button" value="전송" id="btn_sendText" onclick="sendMessage()">
		
		<label for="file" style="margin-left: 10px; border: 1px solid gray; padding: 3px;">사진전송</span>
		
		<!-- 파일 송신 -->
		<input type="file" id="file" style="display:none;" accept="image/*">
		<input id="send" type="button" value="send" style="display:none;">
	</div>
</div>

<!-- 채팅 스크립트 -->
<script type="text/javascript">
var messageTextArea = document.getElementById("chat-container");
var messageText = document.getElementById("messageText");
var room = <%=room%>;
// var imgPath = "d:/d_other/연습용/";
var imgPath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/";

$(function (){
	//웹소켓 초기화
	webSocket = new WebSocket("ws://192.168.145.10/202209_TEAM03//withMeChatServer.do");
	
	// 아이콘 클릭 시 채팅방 켜짐, 꺼짐
	$("#chat").on("click", function() {
        if($(this).attr("src") == "<%=request.getContextPath()%>/images/on.png") {
            $("#chat").attr("src", "<%=request.getContextPath()%>/images/off.png");
            $("#main-container").css("display", "block");
            $('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+100);
        } else if ($(this).attr("src") == "<%=request.getContextPath()%>/images/off.png") {
            $("#chat").attr("src", "<%=request.getContextPath()%>/images/on.png");
            $("#main-container").css("display", "none");
        }
	});
	
	// 파일 전송
	$('#send').on('click', function() {
        var file = document.getElementById('file').files[0];
        console.log(file.name);
		
        if(file == null || file == ""){
			return;
		}
		
        console.log("파일전송 시작");
		//webSocket.send('{"room" : "' + "전체" + '", "message" : "' + messageText.value + '"}' );
		webSocket.send( createMessage("file", room, file.name) );
        
        var reader = new FileReader();
        var rawData = new ArrayBuffer();

        reader.loadend = function() {    }
        
        reader.onload = function(e) {
            rawData = e.target.result;
            webSocket.send( rawData );		// 파일 내용 데이터 전송
            webSocket.send( createMessage("file", room, 'end') );		// 'end' 문자열 전송
        }
        reader.readAsArrayBuffer(file);
        $('#file').val("");
        console.log("파일전송 끝");
    });
		
	// 처음 접속 성공하면 // 방 입장시
	webSocket.onopen = function onOpen(event){
		webSocket.binaryType="arraybuffer";
		webSocket.send( createMessage("connect", room, "<%=pName %>") );
	}
		
	//메시지가 오면 messageTextArea요소에 메시지를 추가한다.
	webSocket.onmessage = function processMessge(message){
		//Json 풀기
		var jsonData = JSON.parse(message.data);
		
		var message = jsonData.message.split(" : ");	// 이름과 내용 분리
		var name = message[0];	// 이름
		var cont = message[1];	// 내용
		var date = message[2];	// 시간
		
		if(jsonData.message != null){
			if(cont.indexOf(imgPath) != -1){
				if(name == "<%=pName%>"){
					var $chat = $("<div class='my-chat-box'><span class='chat-info chat-box'>"+ date +"</span><img style='margin-right: 5px;' src='<%=request.getContextPath() %>/withMeChatImg.do?path=" + cont + "' alt='이미지를 찾을 수 없습니다.' width='200px'></div><br>");
				}else{
					var $chat = $("<div class='chat-box'><div>" + name + "</div><img style='margin-left: 5px;' src='<%=request.getContextPath() %>/withMeChatImg.do?path=" + cont + "' alt='이미지를 찾을 수 없습니다.' width='200px'><span class='chat-info chat-box'>"+ date +"</span></div><br>");
				}
			}else{
				if(name == "<%=pName%>"){
					var $chat = $("<div class='my-chat-box'><span class='chat-info chat-box'>"+ date +"</span><span class='chat my-chat'>" + cont + "</span></div><br>");
				}else{
					var $chat = $("<div class='chat-box'><div>" + name + "</div><span class='chat'>" + cont + "</span><span class='chat-info chat-box'>"+ date +"</span></div><br>");
				}
			}
			$('#chat-container').append($chat);
		}
			
		// 스크롤 아래로 유지
		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+100);
	}
       
	webSocket.onerror = function showErrorMsg(event) {
		alert("오류 : " + event.data);
	}

	webSocket.onclose = function(event){
		messageTextArea.value = "";
		messageText.value = "";
	}
	
	$('#messageText').keydown(function(key){
		if(key.keyCode == 13){
			$('#messageText').focus();
			sendMessage();
		}
	})
	
	$("#file").on('change',function(){
		var fileName = $("#file").val().toString().split('/').pop().split('\\').pop();
		$("#messageText").val(fileName);
	});
	
})

// 메시지 구조  {"command" : "명령종류", "room" : "채팅방이름", "message" : "메시지" }
// 명령 종류 : "create" - 채팅방 만들기, "change" - 채팅방 이동, "message" - 메시지 전송, "connect" - 처음 접속 
    	
//메시지 보내기
function sendMessage(){
	if(messageText.value.trim()==""){
		messageText.focus();
		return;
	}

	
	var file = document.getElementById('file').files[0];
	if(file == null || file == ""){
		//webSocket.send('{"room" : "' + "전체" + '", "message" : "' + messageText.value + '"}' );
		webSocket.send( createMessage("message", room, messageText.value) );
	}else{
		$('#send').click();
	}
	
	messageText.value = "";
}
	
    	
// 전송할 메시지를 작성하는 함수
function createMessage(command, room, message){
	return '{"command" : "' + command + '", "room" : "' + room + '", "message" : "' + message + '"}'
}

function closing(){
	webSocket.close();
}

window.onbeforeunload = function(){
	closing();
}
</script>

</body>   
</html>