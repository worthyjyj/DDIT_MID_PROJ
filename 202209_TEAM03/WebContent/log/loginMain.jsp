<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>동행 로그인창</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"crossorigin="anonymous">



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

body{
   background: #F0FFF0;
}

.maindiv{
/*    border : 1px solid black; */
   margin-left : auto;
   margin-right : auto;
   margin-top : 80px;
   width: 1500px;
   height: 800px;
   
}

.leftdiv{
   float : left;
/*      border: 1px solid red;   */
   width: 650px;
   height: 700px;
   margin-left : 120px;
   margin-right: auto;
   
}

.rightdiv{
/*      border : 1px solid blue;   */
   width : 500px;
   height: 700px;
   margin-left: 800px;
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

.logbtn{
   font-family: 'NanumSquareNeo-Variable'; 
   margin-left:35px; 
   font-size: 0.8em;
   border : none;
   background: white;
   width: auto;
}


</style>


<script src="../js/jquery-3.6.1.min.js"></script>

<%
String error = (String)request.getAttribute("error");

if(error!=null){
	error="로그인 정보가 일치하지 않습니다";
%>
<script type="text/javascript">
	alert("<%=error%>");
</script>
<%} %>


<script>
$(document).ready(function(){
	$('#searchId').on('click',function(){
		window.location="searchId.jsp";
	})//searchId끝
	
	$('#searchPw').on('click',function(){
		window.location="searchPw.jsp";
	})//searchPw끝
	
	$('#signUp').on('click',function(){
		window.location="join.jsp";
	})//searchPw끝
})

</script>


</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

   <section>
      <div class="maindiv">
      
         <div class="leftdiv">
            <img src="<%= request.getContextPath() %>/images/loginmain2.png" style="margin-left:30px;">
         </div>
         
         
         <div class="rightdiv" style="padding-top: 30px;">
         
            <section style="margin: 10% auto;">
               <div
                  style="border: 1px solid #DCDCDC; border-radius:5px; width: 500px; height: 520px; margin: auto; background: white;">
                  <form action="<%=request.getContextPath()%>/join.do" method="post">
                     <div class="mb-3">
                        <h2 style="text-align: center; padding-top: 20px">로그인</h2>
                        <br>
                        <br> <label for="exampleInputEmail1" class="form-label" style="margin-left:70px;">아이디</label>
                        <%
							String idcheck=(String)session.getAttribute("idcheck");
							if(idcheck !=null && idcheck.length()>0){				
						%>
                        <input type="text" class="form-control" value="<%=idcheck %>" name="id" id="exampleInputEmail1"
                           aria-describedby="emailHelp" style="width:350px; margin-left:70px; ">
                       <%}else{ %> 
						<input type="text" class="form-control" name="id" id="exampleInputEmail1"
                           aria-describedby="emailHelp" style="width:350px; margin-left:70px;">                       
                       <%} %>   
                     </div>
                     <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label" style="margin-left:70px;">비밀번호</label> 
                        <input type="password" class="form-control"  name="pw" id="exampleInputPassword1" style="width:350px; margin-left:70px;">
                     </div>
                     <div class="mb-3 form-check">
                        <%
						String onoff=(String)session.getAttribute("onoff");
						if(onoff=="on"){				
						%>
						<input type="checkbox" class="form-check-input" name="checkbox" style="margin-left:60px;" checked>
						<%} else{%>
						<input type="checkbox" class="form-check-input" name="checkbox" style="margin-left:60px;">
						<%} %>
						<label class="form-check-label" for="exampleCheck1">ID저장</label>
                     </div>
                     <button type="submit" class="btn btn-success" style="font-family: 'NanumSquareNeo-Variable'; background-color:#3CB371; border:1px solid #3CB371; margin-left:160px; width:150px;'">로그인</button>
                     <br><br><br>
                     
	                 	<button type="button" class="btn btn" style="margin-left:90px; font-size: 0.8em;" id="searchId">아이디찾기</button>
						<button type="button" class="btn btn" style="font-size: 0.8em;" id="searchPw">비밀번호찾기</button>
						<button type="button" class="btn btn" style="font-size: 0.8em;" id="signUp">회원가입하기</button>
                  </form>
            
               </div>
            </section>
         
         
         
         </div>
      </div>
   </section>
   
      <footer style="margin-bottom: none; border-top: 1px solid #DCDCDC; background: white;" class="text-muted py-5">
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