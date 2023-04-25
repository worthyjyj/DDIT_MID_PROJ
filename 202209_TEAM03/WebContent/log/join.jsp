<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>프로젝트 회원가입창</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"crossorigin="anonymous">

<script src="../js/jquery-3.6.1.min.js"></script>
<script src="../js/jquery.serializejson.js"></script>

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
}

header{
   border-bottom: 1px solid #DCDCDC;
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


<script>
$(document).ready(function(){
	$("#email").on("keyup",function(){
		mailvalue = $(this).val().trim();
		mailreg = /^([a-z][a-z0-9]+)@([a-z][a-zA-Z0-9]+)(\.[a-z]+){1,2}$/
		
		if(mailreg.test(mailvalue)){
			$(this).css('border', '2px solid blue');
		}else{
			$(this).css('border', '2px solid red');
		}
	})
	
	
 	$("#reg").on("keyup",function(){
		regvalue=$(this).val().trim();
		
		if(regvalue.length==7){
			reg=regvalue.slice(0,6);
			rreg=reg+"-"+regvalue.slice(-1)+"******";
			
			$("#reg").val(rreg);
		}
	}) 
	
	$("#pw").on("keyup",function(){
		pwdvalue = $(this).val().trim();
		
		pwdreg = /^[a-z][a-zA-Z0-9](?=.*[!@#$%^&*()+]).{8,12}$/;
	    if(pwdreg.test(pwdvalue)){
			$(this).css('border', '2px solid blue');
		}else{
			$(this).css('border', '2px solid red');
		} 
	})
	
	$("#pwConfirm").on("keyup",function(){
		pwdvalue2 = $(this).val().trim();
		pwdreg = /^[a-z][a-zA-Z0-9](?=.*[!@#$%^&*()+]).{8,12}$/;
		/* pwdreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()+]).{8,12}$/; */
		if(pwdreg.test(pwdvalue2)){
			$(this).css('border', '2px solid blue');
		}else{
			$(this).css('border', '2px solid red');
		}
	})
	
	$("#inputName").on("keyup",function(){
		 namevalue=$(this).val();
		 
		 namereg=/^[가-힣]{2,5}$/;    	 
    	 if(namereg.test(namevalue)){
    		 $(this).css('border','2px solid blue');
    	 }else{
    		 $(this).css('border','2px solid red');
    	 }
	})
	
	$("#tel").on("keyup",function(){
		hpvalue = $(this).val().trim();
		hpreg = /^[0-9]{3,4}-[0-9]{4}-[0-9]{4}$/
		
			
		if(hpreg.test(hpvalue)){
			$(this).css('border', '2px solid blue');
		}else{
			$(this).css('border', '2px solid red');
		} 
	})
	
	$("#vid").on("keyup",function(){
		idvalue = $(this).val().trim();
		if(idvalue.length < 1){
			alert("id입력하세요");
			return;
		}
		
		
		
		// 데이타 체크 형식 - 정규식 
		idreg = /^[a-z][a-zA-Z0-9]{3,9}$/;
		if(idreg.test(idvalue)){
			$(this).css('border', '2px solid blue');
			$('#idchk').prop('disabled', true);  /* 사용가능 */
		}else{
			$(this).css('border', '2px solid red');
			$('#idchk').prop('disabled', false);   /* 사용불가능 */
		} 
		//regtest(idreg, idvalue);
	})
	
	
	$('#duplication').on('click',function(){
		
		id=$("#vid").val();
		//alert(id); 
		$.ajax({
			url : "<%=request.getContextPath()%>/duple.do",
			data : { "id" : id },
			type : "get",
			success : function(res){
				confirm="";
				if(res.answer==1){
					confirm="중복된 아이디입니다.";
					$('#duplee').empty();
					$('#duplee').append(confirm).css('color','red');
				}else if(res.answer==0){
					confirm="사용할수 있는 아이디입니다.";
					$('#duplee').empty();
					$('#duplee').append(confirm).css('color','blue');
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : "json"
		})//ajax끝
	})//duple끝
	
	$('#duplicationPw').on('click',function(){
		confirm=$('#pwConfirm').val();
		pw=$('#pw').val();
		
		name="";
		if(confirm!=pw){
			name="비밀번호가 다릅니다!"
			$('#dupleePw').empty();
			$('#dupleePw').append(name).css('color','red');
		}
		else{
			name="비밀번호 체크 완료!"
			
			$('#dupleePw').empty();
			$('#dupleePw').append(name).css('color','blue');
		}
	})//duplicationPw 끝
	
	
	$("#button1").on('click',function(){
		console.log($("asdfasdf").serializeJSON());
	})
	
	
})
</script>

<%
	String answer=(String)request.getAttribute("answer");

	if(answer!=null){
		if(answer=="1"){
%>			
		<script>
		alert("회원가입을 성공하였습니다!");
		alert("프로필 작성으로 넘어갑니다");
		window.location="log/profil.jsp";
		</script>
		<% }else{%>
		<script>
		alert("회원가입이 실패하였습니다...");
		</script>	
		<% }
	}
%>


</head>
<body>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

   
   <section>
   
      <div id="dataForm"
         style="border: 1px solid #DCDCDC; width: 700px; height:auto; margin: auto; margin-top: 70px; margin-bottom: 70px;">
         <!-- 여기있는 폼이 데이터 넘기는 진짜 폼!! -->
         <form action="<%=request.getContextPath()%>/signUp.do" method="post">
            <h2 style="text-align: center; padding-top: 20px">회원가입</h2>
            <br> <br>
            <div class="col-md-6" style="margin-right:218px">
            	<label style="margin-left: 50px;">이름</label>
                <input type="text" style="width:350px;" class="form-control" name="nameval" id="inputName" placeholder="한글 2~5자리">
            </div>
            <br>
            
            <!-- 여기지우면 폼 깨짐;; -->
         	
		
		
		
		
            <div class="col-md-6" style="margin-right:218px">
            	<label style="margin-left: 50px;">아이디</label>
            	<br>
               <button type="button" id="duplication" 
               	style="background: white; border:1px solid #DCDCDC; margin-left:42px;">중복확인</button>
               	
               <span style="width:120px;" id="duplee"></span> 
               <input type="text" style="width:350px; margin-top:2px;" class="form-control" name="idval" id="vid" placeholder="영어 숫자 포함 9자리 이내">
            </div>
            
            <!-- 여기지우면 폼 깨짐 끝 -->
            
            <br>
             <div class="col-md-6" style="margin-right:218px">
             	<label style="margin-left: 50px;">비밀번호</label>
             	<br>
               <button type="button" id="duplicationPw" 
               	style="background: white; border:1px solid #DCDCDC; margin-left:42px;">비밀번호확인</button>
               	
               <span style="width:120px;" id="dupleePw"></span> 
            </div>
            <div class="col-md-6"  style="margin-right:218px">
               <input type="password" style="width:350px;" class="form-control" id="pw" name="pwval" placeholder="특수문자 포함 12자리 이하">
            </div>
            <div class="col-md-6"  style="margin-right:218px">
               <input type="password" style="width:350px;" class="form-control" id="pwConfirm" placeholder="특수문자 포함 12자리 이하">
            </div>
            
            <label style="margin-left: 180px;">주민번호</label>
            <div class="col-md-6"  style="margin-right:218px">
            <!-- maxlength="7" -->
               <input type="text"   style="width:350px;" class="form-control" id="reg" name="regval" placeholder="ex) 9310241 ">
            </div>
            
            <label style="margin-left: 180px;">이메일</label>
            <br>
            <div class="col-md-6"  style="margin-right:218px">
               <input type="email" style="width:350px;" class="form-control" id="email" name="emailval" placeholder="9자리이내@9자리이내.com">
            </div>
            
            <label style="margin-left: 180px;">전화번호</label>
            <br>
            <div class="col-md-6"  style="margin-right:218px">
               <input type="text" style="width:350px;" class="form-control" id="tel" name="telval" placeholder="'-' 포함 숫자">
            </div>
            
            <br>
            <br>
          
            <div class="col-md-6">
               <button type="submit" id="button1" style="margin-bottom:10px; border:none; font-family: 'NanumSquareNeo-Variable'; margin-left:100px; background-color:#3CB371; " class="btn btn-success">회원가입하기</button>
            </div>
	</form>

      </div>
   </section>


</body>
</html>