<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>프로필 입력창</title>
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
	$('#duplication').on('click',function(){
		picval=$('#picval').val();
		
		$.ajax({
			url : "<%=request.getContextPath()%>/picduple.do",
			data : "picval="+picval,
			type : "post",
			success : function(res){
				if(res.answer==0){
					confirm="사용가능한 별명입니다.";
					$('#duplee').empty();
					$('#duplee').append(confirm).css('color','blue');
				}else{
					confirm="중복된 별명입니다.";
					$('#duplee').empty();
					$('#duplee').append(confirm).css('color','red');
				}
			},
			error : function(xhr){
				alert("상태 : "+xhr.status);
			},
			dataType : "json"
		})//ajax끝
	})//#duplication끝
})

</script>


<%
	String answer=(String)request.getAttribute("answer");
	
	if(answer!=null){
		int ans=Integer.parseInt(answer);

		if(ans==0){
%>			
		<script>
		alert("프로필을 성공하였습니다!");
		alert("로그인 페이지로 넘어갑니다!!");
		window.location="log/loginMain.jsp";
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
         <!-- 여기있는 폼이 데이터 넘기는 진짜 폼!!   -->
         <form action="<%=request.getContextPath()%>/proJoin.do" method="post" enctype="multipart/form-data">
            <h2 style="text-align: center; padding-top: 20px">프로필작성</h2>
            
            <!-- 여기지우면 폼 깨짐;; -->
         
            <div class="col-md-6" style="margin-right:218px">
               <label style="margin-left: 50px;">별명</label><br>
               <button type="button" id="duplication" 
               	style="background: white; border:1px solid #DCDCDC; margin-left:42px;">중복확인</button>
               <span style="width:120px;" id="duplee"></span> 
               <input type="text" style="width:350px; margin-top:2px;" class="form-control" name="picname" id="picval" placeholder="별명 입력">
            </div>
            <br>
            <label style="margin-left: 180px;">프로필사진</label>
            <div class="col-md-6"  style="margin-right:218px">
               <input type="file"  style="width:350px;" class="form-control" id="pictureval" name="picture">
            </div> 
            
            <label style="margin-left: 180px;">소개글</label>
            <br>
            <div class="col-md-6"  style="margin-right:218px">
               <textarea style="width:350px; margin-left:40px;" class="form-control" name="introduce"  placeholder="자기 소개를 입력해주세요"></textarea>
            </div>
            
            <label style="margin-left: 180px;">회원아이디</label>
            <br>
            <div class="col-md-6"  style="margin-right:218px">
                <input type="text" style="width:350px; margin-top:2px;" class="form-control" name="mem_id" id="mem_idval" value="<%=session.getAttribute("mem_id") %>" readonly>
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