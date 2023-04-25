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
   
</head>   
<body>
<%
	Profile pVo = (Profile) session.getAttribute("profile");
	String pName = pVo.getP_name();

	String room = (String) request.getAttribute("room");
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function () {
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
		objs.setAttribute('value', <%=room%>);
		form.appendChild(objs);

		form.setAttribute('method', 'post');

		form.setAttribute('action', "<%= request.getContextPath()%>/withMeMain.do");

		document.body.appendChild(form);

		form.submit();
	});
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
<!--             <div class="category"><input type="button" class="btnWmPage" value="공지사항"></div> -->
         </div>
         
         
         <div class="rightdiv">
         <div style="width:400px; height: auto; margin-top: 50px; margin-left:50px;">
         <h3><%=pName %> 님!</h3>
         <p>WITH ME에 입장하셨습니다.</p>
         <p>이 공간에서 여행 이야기를 자유롭게 나눠보세요 !</p>
         </div>
         </div>
   </section>


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