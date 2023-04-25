<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	// 이미지 미리보기
  	var sel_file;
	
	$(document).ready(function(){
		$("#file1").on("change", handleImgFileSelect); // 파일 선택버튼을 누르면 이미지 파일을 선택할 수 있도록 바뀐다.
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files; // 이미지를 업로드할 파일들 변수를 선언
		var filesArr = Array.prototype.slice.call(files); // 각 파일들을 배열로 바뀌게 한다.
		
/* 		Array -> 배열을 생성할 때 사용하는 리스트 형태의 고수준 객체입니다. (MDN)
		* Array.prototype -> Array객체의 메서드를 prototype을 통하여 가져옵니다.
		* Array.prototype.slice() -> begin부터 end까지 얕은 복사로 배열 객체를 반환합니다. (MDN)
		slice MDN에서 주의 깊게 보셔야 할 부분이 아래 사진입니다. */
		
		var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
		
		filesArr.forEach(function(f){
			if(!f.type.match(reg)){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
		    sel_file = f;
		    
		    var reader = new FileReader();
		    reader.onload = function(e){
		    	 $("#img").attr("src", e.target.result);
		    }
		    reader.readAsDataURL(f);
		});
	}

</script>

<script>
//파일 업로드
function fn_submit(){
        
        var form = new FormData();
        form.append( "file1", $("#file1")[0].files[0] );
        
         jQuery.ajax({
             url : "<%= request.getContextPath()%>/myapp/result"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
               alert("성공하였습니다.");
               console.log(response);
           }
           ,error: function (jqXHR) 
           { 
               alert(jqXHR.responseText); 
           }
       });
}
</script>
<body>

<div>
    <label for="file1">파일</label> 
    <input type="file" id="file1" name="file1"> 
    <button id="btn_submit" onclick="javascript:fn_submit()">전송</button>    
</div>

<div>
       <div class="img_wrap">
           <img id="img" />
       </div>
</div>

</body>
</html>