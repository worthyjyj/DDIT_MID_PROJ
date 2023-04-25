<%@page import="vo.AccountVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.Profile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>withme 가계부</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/withmeChat.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/withmeBasic.css">
<style type="text/css">
#accountTable{
	text-align: center;
}
#inputTr, .btn_del, .btn_modi{
	display: none;
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
$(function () {
	accList();
	
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
	
	// 방장일 경우 추가/삭제 버튼 보이기
	if(<%=grade2%> == '1'){
		$(document).on('mouseenter', '#inBalance', function() {
			$('#inBaltd').html('<input id="btn_inputBal" type="button" value="예산 입력" onclick="insertBal()">');
		});
		$(document).on('mouseleave', '#inBalance', function() {
			$('#inBaltd').html('<div>내역이 없습니다.</div>');
		});
		
		
		$(document).on('mouseenter', '.accTr', function() {
				$(this).find('.btn_del').css('display', 'inline');
				$(this).find('.btn_modi').css('display', 'inline');
		});
		$(document).on('mouseleave', '.accTr', function() {
			$(this).find('.btn_del').css('display', 'none');
			$(this).find('.btn_modi').css('display', 'none');
		});
	}
	
// 	$(document).on('mouseout', '#inBalance', function() {
});

// 가계부 행 수정 >> 저장버튼
$(document).on('click', '.btn_modiOk', function() {
	var trTag = $(this).parents('tr');
	
	var vno = trTag.find('.acc_no').val();
	var vdate = trTag.find('.date').val();
	var vcont = trTag.find('.cont').val();
	var vdraw = trTag.find('.draw').val();
	
	$.ajax({
		url: "<%=request.getContextPath()%>/updateAcc.do",
		data: {
			"acc_no" : vno,
			"acc_date" : vdate,
			"acc_cont" : vcont,
			"acc_draw" : vdraw
		},
		type: "post",
		success: function(res) {
			accList();
		},
		error: function(xhr) {
			alert(xhr.status);
		}
	});
});

// 가계부 행 수정 >> 취소버튼
$(document).on('click', '.btn_modiReset', function() {
	var trTag = $(this).parents('tr');
	
	var vno = trTag.find('.acc_no').val();
	var vdate = trTag.find('.date').val();
	var vcont = trTag.find('.cont').val();
	var vdraw = trTag.find('.draw').val();
	
	var code = '<input class="acc_no" type="hidden" value="' + vno + '">'
			 + '<td><div class="date" name="date">' + vdate + '</div></td>'
			 + '<td><div class="cont" name="cont">' + vcont + '</div></td>'
			 + '<td><div class="draw" name="draw">' + vdraw + ' 원</div></td>'
			 + '<td><input class="btn_modi" name="" type="button" value="수정">&nbsp'
			 + '<input class="btn_del" type="button" value="삭제"></td>';
			 
	var in_tr = code;
	console.log(in_tr);
	trTag.html(in_tr);
})

// 가계부 행 수정 버튼
$(document).on('click', '.btn_modi', function() {
	var trTag = $(this).parents('tr');
	
	var vno = trTag.find('.acc_no').val();
	var vdate = trTag.find('.date').text();
	var vcont = trTag.find('.cont').text();
	var vdraw = trTag.find('.draw').text();
	var vdraw = vdraw.substr(0, vdraw.indexOf(" "));
	
	var code = '<input class="acc_no" type="hidden" value="' + vno + '">'
			 + '<td><input class="date" type="date" value="' + vdate + '"></td>'
			 + '<td><input class="cont" type="text" value="' + vcont + '"></td>'
			 + '<td><input class="draw" type="text" value="' + vdraw + '"></td>'
			 + '<td><input class="btn_modiOk" type="button" value="저장">&nbsp;'
			 + '<input class="btn_modiReset" type="button" value="취소"></td>';
	
	var in_tr = code;
	trTag.html(in_tr);
});

// 가계부 행 삭제 버튼
$(document).on('click', '.btn_del', function() {
	var trTag = $(this).parents('tr')
	var vno = trTag.find('.acc_no').val();
	
	$.ajax({
		url: "<%=request.getContextPath()%>/deleteAcc.do",
		type: "get",
		data: { "acc_no" : vno },
		success: function() {
			accList();
		},
		error: function(xhr) {
			alert(xhr.status);
		}
	})
})

// 처음 예산 입력칸
function insertBal() {
	$('#inBalance').css('display', 'none');
	var code = '<tr><td><div>-</div></td>'
			+ '<td><div name="cont">예산</div></td>'
			+ '<td><input id="draw" name="draw" type="text" style="margin-left: 50px;"> 원</td>'
			+ '<td><input class="btn_fir" name="first" type="button" value="저장">&nbsp;'
			+ '<input class="btnReset" type="button" value="취소"></td></tr>';
	$('#accTbody').append(code);
}

// 처음 예산 저장버튼
$(document).on('click', '.btn_fir', function() {
	var trTag = $(this).parents('tr');

	vdate = trTag.find('#date').val();
	vcont = trTag.find('#cont').val();
	vdraw = trTag.find('#draw').val();
	
	var check = /^[0-9]+$/;
	
	if(vdraw == null || vdraw == ""){
		alert("사용금액을 입력해 주세요");
		return;
	}
	if(!check.test(vdraw)){
		alert("사용금액에는 숫자만 입력 가능합니다.");
		trTag.find('#draw').val("");
		return;
	}
	
	insertAccount();
});

// 예산 추가 >> 저장 버튼
$(document).on('click', '.btnOk', function() {
	var trTag = $(this).parents('tr');
	
	vdate = trTag.find('.date').val();
	vcont = trTag.find('.cont').val();
	vdraw = trTag.find('.draw').val();
	
	var check = /^[0-9]+$/;
	
	if(vdate == null || vdate == ""){
		alert("날짜를 입력해 주세요");
		return;
	}
	if(vcont == null || vcont == ""){
		alert("내용을 입력해 주세요");
		return;
	}
	if(vdraw == null || vdraw == ""){
		alert("사용금액을 입력해 주세요");
		return;
	}
	if(!check.test(vdraw)){
		alert("사용금액에는 숫자만 입력 가능합니다.");
		trTag.find('.draw').val().val("");
		return;
	}
	
	insertAccount();
	
});

// 예산 추가 >> 취소버튼
$(document).on('click', '.btnReset', function() {
	$(this).closest('tr').remove();
});

// 예산 저장 시 insert함수
function insertAccount() {
	$.ajax({
		url: "<%=request.getContextPath()%>/insertAcc.do",
		type: "get",
		data: {
			"date" : vdate,
			"cont" : vcont,
			"draw" : vdraw,
			"room" : room
		},
		success: function(res) {
			accList();
		},
		error: function(xhr) {
			alert(xhr.status);
		}
	})
};

// 예산 리스트를 출력하는 함수
function accList() {
	$.ajax({
		url: "<%=request.getContextPath()%>/getAccList.do",
		type : 'get',
		data : { "room" : room },
		dataType : 'json',
		success : function(data){
			$('#accTbody').empty();
			$('#tFooter').empty();
			var newRow = accountTable.insertRow();
			var balance = 0;
			var code = "";
			var footer = "";
			if(data.length == 0){
				code = '<tr id="inBalance"><td colspan="4" id="inBaltd"> <div>내역이 없습니다.</div></td></tr>';
			}else{
				$.each(data, function(i,v){
					code += '<tr class="accTr" style="display:none;">';
					code += '<td><input class="date" type="date"></td>';
					code += '<td><input class="cont" type="text"></td>';
					code += '<td><input class="draw" type="text"></td>';
					code += '<td><input class="btnOk" type="button" value="저장">&nbsp;';
					code += '<input class="btnReset" type="button" value="취소"></td></tr>';
					
					code += '<tr class="accTr"><input class="acc_no" name="no" type="hidden" value="' + v.acc_no + '">';
					var tmpDate = v.acc_date;
					if(tmpDate == null) tmpDate = "-";
					code += '<td><div class="date" name="date">' + tmpDate + '</div></td>';
					code += '<td><div class="cont" name="cont">' + v.acc_content + '</div></td>';
					code += '<td><div class="draw" id="draw" name="draw" type="text">' + v.acc_withdraw + ' 원</td>';
					if(i == 0){
						code += "<td></td></tr>";
					}else{
						code += '<td><input class="btn_modi" name="" type="button" value="수정">&nbsp<input class="btn_del" type="button" value="삭제"></td></tr>';
					}
					if(i == 0) balance = v.acc_withdraw;
					else balance = balance - v.acc_withdraw;
				});
				footer = '<tr style="height: 0.7em;"><td colspan="4" style="text-align: right;"><input id="addAcc" type="button" value="추가"></td></tr>';
				<%
				if("1".equals(grade2)){
				%>
					$('#tFooter').append(footer);
				<%
				}
				%>
			}
			$('#accTbody').append(code);
			$('#withDraw').empty();
			$('#withDraw').text(balance);
			
		},
		error : function(xhr){
			console.log("상태 : " + xhr.status);
		}
	})
}

// 추가버튼 클릭시 행 추가
$(document).on('click', '#addAcc', function() {
	var in_tr = "<tr>";
	in_tr += $('#accTbody').find('tr').html();
	in_tr += "</tr>";
	console.log(in_tr);
	$('#accTbody').append(in_tr);
})
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
			<h3>가계부</h3><hr>
			<div style="float: right;">잔액 : <div id="withDraw" style="display: inline;">0</div>원</div>
			<br><br>
		    <table class="table table-hover" id="accountTable">
				<thead>
					<tr>
						<th style="display: none;"></th>
						<th>날짜</th>
						<th>내용</th>
						<th>사용금액</th>
						<th style="width: auto;"></th>
					</tr>
				</thead>
				
				<tbody id="accTbody"></tbody>
				
				<tfoot id="tFooter">
					<tr style="height: 0.7em; display: none;">
						<td colspan="4" style="text-align: right;"><input id="addAcc" type="button" value="추가"></td>
					</tr>
				</tfoot>
				
			</table>
		</div>
	</div>
</section>

<div id=trDiv>
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