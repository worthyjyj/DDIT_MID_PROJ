/**
 *
 */


mainListServer = function() {
	 
   $.ajax({
      url: "http://192.168.145.11/202209_TEAM03/mainboard/mainBoardListN.do",
//      url: "http://localhost/202209_TEAM03/mainboard/mainBoardListN.do",
      data: {
      },
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
      type: 'post',
      success: function(res) {
		
		
         console.log(res);
         code = '';

		
		
		// 메인 인덱스에는 8개의 카드만 출력되도록 
         for (var i = 0; i < res.length ; i++) {

		 cont = res[i].mb_content.replaceAll("\r", "").replaceAll("<br>", " ");
								
	     if(cont.length > 40){ // 글자수 구하기
		 cont = cont.substring(0, 30)+"...";	
		}
		
			if(i >= 8){break;}
			if(/*i%4==0 ||*/ i==0){ // 한행에 4개씩 출력 되도록 

		
			code += '<div class="row" style="width:1300px; margin-left: 350px; margin-right: auto; border-radius: 5px;">';
			}
			code += '<div mainidx='+res[i].mb_no+' class="card" style="width: 18rem; margin-left: 10px; margin-top:10px; margin-bottom: 10px;">';
			code += '	<img style="margin-left:15px;  margin-top:10px; width:240px; height:160px;" src="http://192.168.145.11/202209_TEAM03/images/imageView.do?mb_no='+res[i].mb_no+'" style="margin-top:10px; margin-bottom: 10px; margin-top: 8px;" ';
			code += '		/*class="card-img-top"*/ alt="..."> ';
			code += '      <input type="hidden" name="mb_no" value="'+ res[i].mb_no +'"/> ';
			code += '	<div class="card-body"> ';
			code += '		<a /*href=""*/><h5 class="card-title" >'+ res[i].mb_title +'</h5></a>';
			code += '		<p class="card-text" >'+ cont +'</p>';
			code += '	</div>';
			code += '	<ul class="list-group list-group-flush">';
			code += '		<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">';
			code += '		  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_status +'</li>';
			code += '							<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">';
			code += '		  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>';
			code += '		  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>';
			code += '		</svg>&nbsp;'+ res[i].reg_name +'</li>'; 
			code += '							<li class="list-group-item" style="font-size:0.9em;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">';
			code += '		  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>';
			code += '		  <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_sdate + ' ~ '+ res[i].mb_edate +'  </li>';
			code += '	</ul>';
			code += '	<div class="card-body">';
			code += '		<span><button style="border:none; background: none; width:auto;"> <img alt="" src="http://192.168.145.11/202209_TEAM03/images/imageView2.do?mb_no='+res[i].mb_no+'" width="30" height="30" style=" border-radius: 30px;">';
			code += '			<span>&nbsp; '+ res[i].p_name + '</span>';
			code += '		</button> </span><br>';
			code += '		<svg style="margin-left: 50px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">';
	  		code += '				<path';
			code += '					d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />';
	 		code += '				 <path';
			code += '					d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />';
			code += '				</svg>';
			code += '			<span>&nbsp;'+ res[i].mb_hit + '</span>';
			code += '			<span>';
			/*code += '		<button type="button" style="border:none; background: none; width:auto; margin-left:10px;"> ';
			code += '			 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<span>찜하기</span>';
			code += '		</button></span>';
			code += '		</div>';*/
			code += '		&nbsp';
			code += '		&nbsp';
			code += '		<svg id="heart' + res[i].mb_no + '" class="heart" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<svg id="heart2' + res[i].mb_no + '" class="heart2" style="color : red; display : none; "  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">';
			code += '		 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>';
			code += '		</svg>';
			
			code += '		<button class="pick" type="button" style="border:none; background: none; width:auto; margin-left:"> ';
			code += '		찜하기';
			code += '		</button></span>';
			code += '		</div>';
			
			
			code += '</div>'; 
		
		
         }//each문 끝

            
            $('#cardList').html(code);
            
	      PickList();
      },      //success 끝
      error: function(xhr) {
         console.log("상태 : " + xhr.status);
      },
      dataType: 'json'
   })//ajax 끝
}//ListServer 끝


function PickList(){
	$.ajax({
	  url: "http://192.168.145.11/202209_TEAM03/mainboard/pickList.do", 
//	  url: "http://localhost/202209_TEAM03/mainboard/pickList.do", 
      data: {
      },
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
      type: 'post',
	dataType : 'json',
	success: function(res){
		console.log(res)
			$.each(res, function(i,v){
//				document.getElementById('heart2' + 'res[i].MB_NO')
			$('#heart2' + v.MB_NO).css('display', 'inline');
			$('#heart' + v.MB_NO).css('display', 'none');
		 })
	
	  }
   })
}


ReplyServer = function(mb_no,session_pname,p_name){
	
	$.ajax({
		
		url : "http://192.168.145.11/202209_TEAM03/mainboard/mainReplyList.do",
//		url : "http://localhost/202209_TEAM03/mainboard/mainReplyList.do",
		data : {
			"mb_no" : mb_no
		},
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = '';
			console.log(res);
			console.log(session_pname);
			console.log(p_name);
			console.log(res)
			
		if(res.size==0 || res == null){
			code += '	  <ul class="list-group list-group-flush">';
			code += '	  <li class="list-group-item">아직 댓글이 없습니다.</li>';				
		}else{
		 	$.each(res, function(i, v) {
//			res[i]=v
			 vcont = v.mcom_content;
			
			vcont = vcont.replace(/\r/g, "").replace(/\n/g, "<br>"); //띄어쓰기 적용되게 만듬
			
			if(session_pname == (v.p_name)){
				code += '	  <div class="replysection">';
				code += '	  <ul class="list-group list-group-flush">';
				code += '	  <li class="list-group-item">';
				code += '      <input idx='+ v.mcom_no +' type="hidden" name="mcom_no" value="'+ v.mcom_no +'"/> ';
				code += '      <input type="hidden" name="p_name" value="'+ v.p_name +'"/> ';
				code += '	  <span><img alt="" src="http://192.168.145.11/202209_TEAM03/images/imageView2.do?mb_no='+mb_no+'" style="width: 40px; height: 40px; border-radius: 30px;"></span>';
				code += '	  <span>'+v.p_name+'</span><span style="font-size: 0.8em;">&nbsp;&nbsp;&nbsp;&nbsp;'+v.mcom_date+'</span><br>';
				code += '	  <div class="replybody">';
				code += '	  '+vcont+'';
				code += '	  </div>';
				code += '	  </li>';
				code += '	</ul>';
			}else{
				code += '	  <ul class="list-group list-group-flush">';
				code += '	  <li class="list-group-item">';
				code += '      <input type="hidden" name="mcom_no" value="'+ v.mcom_no +'"/> ';
				code += '      <input type="hidden" name="p_name" value="'+ v.p_name +'"/> ';
				code += '	  <span><img alt="" src="http://192.168.145.11/202209_TEAM03/images/imageView2.do?mb_no='+mb_no+'" style="width: 40px; height: 40px; border-radius: 30px;"></span>';
				code += '	  <span>'+v.p_name+'</span><span style="font-size: 0.8em;">&nbsp;&nbsp;&nbsp;&nbsp;'+v.mcom_date+'</span><br>';
				code += '	  <div class="replybody">';
				code += '	  '+v.mcom_content+'';
				code += '	  </div>';
				code += '	  </li>';
				code += '	</ul>';
			}
			
				// 세션이랑 맞으면 출력 되도록 
 				if(session_pname == (v.p_name)){
                 code += ' <span style="font-size: 0.8em; color:gray; margin-left:550px;"><a class="dmBtn">수정</a></span>';
                 code += ' <span style="font-size: 0.8em; color:gray;">&nbsp; ㅣ &nbsp;</span>';
                 code += ' <span style="font-size: 0.8em; color:gray;"><a class="dmBtn2">삭제</a></span>';
				 code += '	  </div>';
 				}
				 code += '	  <hr/ style="height: 0.3px;background-color:  ;">'; //구분선 스타일 주기 
			})	
		}
//		$('#replyList').empty();
//		$('#replyList').append(code);
		$('#replyList').html(code);
			
		},
		error : function(xhr){
			console.log("상태 : " +  xhr.status);
			}
		})
}


updateReply = function(){
	 
	console.log(vidx);
	console.log(modicont);
	console.log(modi);
	
	$.ajax({
		url : "http://192.168.145.11/202209_TEAM03/mainboard/updatereply.do",
//		url : "http://localhost/202209_TEAM03/mainboard/updatereply.do",
		data : {
			
			"mcom_no" : vidx, 
			"mcom_content" : modicont //디비에 업데이트할 때는 html언어로 변환하지 않은 modicont로 보내고 
		   
		},
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'post',
		dataType : 'text',
		success : function(res){
			
			// 성공이면 화면을 수정 
					if(res == "댓글수정성공"){
					  $(vreplybody).html(modi); // 출력할 때는 공백, 띄어쓰기가 적용되서 나와야하니까 modi로,,!
					}
		

		},
		error : function(xhr){
			console.log("상태 : " +  xhr.status);
			}
		})
}

replyDelete = function(target){ // target : 댓글삭제 버튼 

  console.log(vidx);

	$.ajax({
		url : 'http://192.168.145.11/202209_TEAM03/mainboard/deletereply.do', 
//		url : 'http://localhost/202209_TEAM03/mainboard/deletereply.do', 
		data : { "mcom_no" : vidx  }, 
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'post', 
		dataType : 'text',
		success : function(res){
			
			if(res == "댓글삭제성공"){
				
			//성공하면 화면에서 삭제 
			$(target).parents('.replysection').remove();
			}
			
			
		}, 
		error : function(xhr){
			console.log("상태 : "+ xhr.status);
		}
	})
	
}



SelectContinent = function(){
	
	$.ajax({
		
		url : "http://192.168.145.11/202209_TEAM03/mainboard/selectcontinent.do",
//		url : "http://localhost/202209_TEAM03/mainboard/selectcontinent.do",
		data : {

		},
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = '';
			console.log(res);
		
		 $.each(res, function(i, v) {
			
			code +='<li class="conti"><a idx='+v.conti_no+' class="dropdown-item" href="#">'+ v.conti_name +'</a></li> ';
			
			
		})
		
		$('#ContinentList').html(code);

		},
		error : function(xhr){
			console.log("상태 : " +  xhr.status);
			}
		})
}



SelectCountry = function(conti_no){
	
	$.ajax({
		
		url : "http://192.168.145.11/202209_TEAM03/mainboard/selectcountry.do",
//		url : "http://localhost/202209_TEAM03/mainboard/selectcountry.do",
		data : {
			// 위에서 받아와야함 idx
			"conti_no" : conti_no
		},
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = '';
			console.log(res);
		
		 $.each(res, function(i, v) {
			
			code +='<li class="country"><a idx='+v.coun_no+' class="dropdown-item" href="#">'+ v.coun_name +'</a></li> ';
			
			
		})
		
		$('#CountryList').html(code);

		},
		error : function(xhr){
			console.log("상태 : " +  xhr.status);
			}
		})
}

SelectRegion = function(coun_no){
	
	$.ajax({
		
		url : "http://192.168.145.11/202209_TEAM03/mainboard/selectregion.do",
//		url : "http://localhost/202209_TEAM03/mainboard/selectregion.do",
		data : {
			// 위에서 받아와야함 idx
			"coun_no" : coun_no
		},
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = '';
			console.log(res);
		
		 $.each(res, function(i, v) {
			
			code +='<li class="region"><a idx='+v.reg_no+' class="dropdown-item" href="#">'+ v.reg_name +'</a></li> ';
			
		})
		
		$('#RegionList').html(code);

		},
		error : function(xhr){
			console.log("상태 : " +  xhr.status);
			}
		})
}


//검색어가 있는 경우의 정렬탭
SortServer = function(){ 
	 
	reg_no = $('#reg_no').val();
	sdate = $('#sdate').val();
	edate = $('#edate').val();

	$.ajax({
		url : "http://192.168.145.11/202209_TEAM03/mainboard/sortList.do",
//		url : "http://localhost/202209_TEAM03/mainboard/sortList.do",
		data : {
			  reg_no : reg_no ,
			  sdate : sdate,
			  edate : edate
		},
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = '';
			console.log(res);
		
		 $.each(res, function(i, v) {
			
		cont = res[i].mb_content.replaceAll("\r", "").replaceAll("<br>", " ");
								
	     if(cont.length > 40){ // 글자수 구하기
		 cont = cont.substring(0, 30)+"...";	
		}
		
			if(/*i%4==0 ||*/ i==0){ // 한행에 4개씩 출력 되도록 
			code += '<div class="row" style="width:1300px; margin-left: auto; margin-right: auto; border-radius: 5px;">';
			}
			
			
			code += '<div mainidx='+res[i].mb_no+' class="card" style="width: 18rem; margin-left: 10px; margin-top:10px; margin-bottom: 10px;">';
			code += '	<img style="margin-left:15px;  margin-top:10px; width:240px; height:160px;" src="http://192.168.145.11/202209_TEAM03/images/imageView.do?mb_no='+res[i].mb_no+'" style="margin-top:10px; margin-bottom: 10px; margin-top: 8px;" ';
			code += '		/*class="card-img-top"*/ alt="..."> ';
			code += '      <input type="hidden" name="mb_no" value="'+ res[i].mb_no +'"/> ';
			code += '	<div class="card-body"> ';
			code += '		<a /*href=""*/><h5 class="card-title" >'+ res[i].mb_title +'</h5></a>';
			code += '		<p class="card-text" >'+ cont +'</p>';
			code += '	</div>';
			code += '	<ul class="list-group list-group-flush">';
			code += '		<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">';
			code += '		  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_status +'</li>';
			code += '							<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">';
			code += '		  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>';
			code += '		  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>';
			code += '		</svg>&nbsp;'+ res[i].reg_name +'</li>'; 
			code += '							<li class="list-group-item" style="font-size:0.9em;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">';
			code += '		  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>';
			code += '		  <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_sdate + ' ~ '+ res[i].mb_edate +'  </li>';
			code += '	</ul>';
			code += '	<div class="card-body">';
			code += '		<span><button style="border:none; background: none; width:auto;"> <img alt="" src="http://192.168.145.11/202209_TEAM03/images/imageView2.do?mb_no='+res[i].mb_no+'" width="30" height="30" style=" border-radius: 30px;">';
			code += '			<span>&nbsp; '+ res[i].p_name + '</span>';
			code += '		</button> </span><br>';
			code += '		<svg style="margin-left: 50px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">';
	  		code += '				<path';
			code += '					d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />';
	 		code += '				 <path';
			code += '					d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />';
			code += '				</svg>';
			code += '			<span>&nbsp;'+ res[i].mb_hit + '</span>';
			code += '			<span>';
			/*code += '		<button type="button" style="border:none; background: none; width:auto; margin-left:10px;"> ';
			code += '			 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<span>찜하기</span>';
			code += '		</button></span>';
			code += '		</div>';*/
			code += '		&nbsp';
			code += '		&nbsp';
			code += '		<svg id="heart' + res[i].mb_no + '" class="heart" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<svg id="heart2' + res[i].mb_no + '" class="heart2" style="color : red; display : none; "  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">';
			code += '		 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>';
			code += '		</svg>';
			
			code += '		<button class="pick1" type="button" style="border:none; background: none; width:auto; margin-left:"> ';
			code += '		찜하기';
			code += '		</button></span>';
			code += '		</div>';
			
			
			code += '</div>'; 
		
			
		})
		
		$('#sortList').html(code);
		
		 PickList();

		},
		error : function(xhr){
			console.log("상태 : " +  xhr.status);
			}
		})
}

// 검색어가 없는 정렬탭
SortServerN = function(){
	 
	$.ajax({
		url : "http://192.168.145.11/202209_TEAM03/mainboard/mainBoardListN.do",
//		url : "http://localhost/202209_TEAM03/mainboard/mainBoardListN.do",
		data : {
			
		},
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'post',
		dataType : 'json',
		success : function(res){
			code = '';
			console.log(res);
		
		 $.each(res, function(i, v) {
			
		cont = res[i].mb_content.replaceAll("\r", "").replaceAll("<br>", " ");
								
	     if(cont.length > 40){ // 글자수 구하기
		 cont = cont.substring(0, 30)+"...";	
		}
			
			if(/*i%4==0 ||*/ i==0){ // 한행에 4개씩 출력 되도록 
			code += '<div class="row" style="width:1300px; margin-left: auto; margin-right: auto; border-radius: 5px;">';
			}
			
			
			code += '<div mainidx='+res[i].mb_no+' class="card" style="width: 18rem; margin-left: 10px; margin-top:10px; margin-bottom: 10px;">';
			code += '	<img style="margin-left:15px;  margin-top:10px; width:240px; height:160px;" src="http://192.168.145.11/202209_TEAM03/images/imageView.do?mb_no='+res[i].mb_no+'" style="margin-top:10px; margin-bottom: 10px; margin-top: 8px;" ';
			code += '		/*class="card-img-top"*/ alt="..."> ';
			code += '      <input type="hidden" name="mb_no" value="'+ res[i].mb_no +'"/> ';
			code += '	<div class="card-body"> ';
			code += '		<a /*href=""*/><h5 class="card-title" >'+ res[i].mb_title +'</h5></a>';
			code += '		<p class="card-text" >'+ cont +'</p>';
			code += '	</div>';
			code += '	<ul class="list-group list-group-flush">';
			code += '		<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">';
			code += '		  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_status +'</li>';
			code += '							<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">';
			code += '		  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>';
			code += '		  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>';
			code += '		</svg>&nbsp;'+ res[i].reg_name +'</li>'; 
			code += '							<li class="list-group-item" style="font-size:0.9em;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">';
			code += '		  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>';
			code += '		  <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_sdate + ' ~ '+ res[i].mb_edate +'  </li>';
			code += '	</ul>';
			code += '	<div class="card-body">';
			code += '		<span><button style="border:none; background: none; width:auto;"> <img alt="" src="http://192.168.145.11/202209_TEAM03/images/imageView2.do?mb_no='+res[i].mb_no+'" width="30" height="30" style=" border-radius: 30px;">';
			code += '			<span>&nbsp; '+ res[i].p_name + '</span>';
			code += '		</button> </span><br>';
			code += '		<svg style="margin-left: 50px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">';
	  		code += '				<path';
			code += '					d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />';
	 		code += '				 <path';
			code += '					d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />';
			code += '				</svg>';
			code += '			<span>&nbsp;'+ res[i].mb_hit + '</span>';
			code += '			<span>';
			/*code += '		<button type="button" style="border:none; background: none; width:auto; margin-left:10px;"> ';
			code += '			 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<span>찜하기</span>';
			code += '		</button></span>';
			code += '		</div>';*/
			code += '		&nbsp';
			code += '		&nbsp';
			code += '		<svg id="heart' + res[i].mb_no + '" class="heart" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<svg id="heart2' + res[i].mb_no + '" class="heart2" style="color : red; display : none; "  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">';
			code += '		 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>';
			code += '		</svg>';
			
			code += '		<button class="pick" type="button" style="border:none; background: none; width:auto; margin-left:"> ';
			code += '		찜하기';
			code += '		</button></span>';
			code += '		</div>';
			
			
			code += '</div>'; 
		
			
		})
		
		$('#sortList').html(code);

		PickList();
		},
		error : function(xhr){
			console.log("상태 : " +  xhr.status);
			}
		})
}


// 조회수순 정렬탭
HitServer = function(){
	 
	$.ajax({
		url : "http://192.168.145.11/202209_TEAM03/mainboard/hitList.do",
//		url : "http://localhost/202209_TEAM03/mainboard/hitList.do",
		data : {
			
		},
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = '';
			console.log(res);
		
		 $.each(res, function(i, v) {
			
		cont = res[i].mb_content.replaceAll("\r", "").replaceAll("<br>", " ");
								
	     if(cont.length > 40){ // 글자수 구하기
		 cont = cont.substring(0, 30)+"...";	
		}
			
			if(/*i%4==0 ||*/ i==0){ // 한행에 4개씩 출력 되도록 
			code += '<div class="row" style="width:1300px; margin-left: auto; margin-right: auto; border-radius: 5px;">';
			}
			
			
			code += '<div mainidx='+res[i].mb_no+' class="card" style="width: 18rem; margin-left: 10px; margin-top:10px; margin-bottom: 10px;">';
			code += '	<img style="margin-left:15px;  margin-top:10px; width:240px; height:160px;" src="http://192.168.145.11/202209_TEAM03/images/imageView.do?mb_no='+res[i].mb_no+'" style="margin-top:10px; margin-bottom: 10px; margin-top: 8px;" ';
			code += '		/*class="card-img-top"*/ alt="..."> ';
			code += '      <input type="hidden" name="mb_no" value="'+ res[i].mb_no +'"/> ';
			code += '	<div class="card-body"> ';
			code += '		<a /*href=""*/><h5 class="card-title" >'+ res[i].mb_title +'</h5></a>';
			code += '		<p class="card-text" >'+ cont +'</p>';
			code += '	</div>';
			code += '	<ul class="list-group list-group-flush">';
			code += '		<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">';
			code += '		  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_status +'</li>';
			code += '							<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">';
			code += '		  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>';
			code += '		  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>';
			code += '		</svg>&nbsp;'+ res[i].reg_name +'</li>'; 
			code += '							<li class="list-group-item" style="font-size:0.9em;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">';
			code += '		  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>';
			code += '		  <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_sdate + ' ~ '+ res[i].mb_edate +'  </li>';
			code += '	</ul>';
			code += '	<div class="card-body">';
			code += '		<span><button style="border:none; background: none; width:auto;"> <img alt="" src="http://192.168.145.11/202209_TEAM03/images/imageView2.do?mb_no='+res[i].mb_no+'" width="30" height="30" style=" border-radius: 30px;">';
			code += '			<span>&nbsp; '+ res[i].p_name + '</span>';
			code += '		</button> </span><br>';
			code += '		<svg style="margin-left: 50px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">';
	  		code += '				<path';
			code += '					d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />';
	 		code += '				 <path';
			code += '					d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />';
			code += '				</svg>';
			code += '			<span>&nbsp;'+ res[i].mb_hit + '</span>';
			code += '			<span>';
			/*code += '		<button type="button" style="border:none; background: none; width:auto; margin-left:10px;"> ';
			code += '			 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<span>찜하기</span>';
			code += '		</button></span>';
			code += '		</div>';*/
			code += '		&nbsp';
			code += '		&nbsp';
			code += '		<svg id="heart' + res[i].mb_no + '" class="heart" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<svg id="heart2' + res[i].mb_no + '" class="heart2" style="color : red; display : none; "  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">';
			code += '		 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>';
			code += '		</svg>';
			
			code += '		<button class="pick2" type="button" style="border:none; background: none; width:auto; margin-left:"> ';
			code += '		찜하기';
			code += '		</button></span>';
			code += '		</div>';
			
			
			code += '</div>'; 
		
			
		})
		
		$('#sortList').html(code);

		PickList();
		},
		error : function(xhr){
			console.log("상태 : " +  xhr.status);
			}
		})
}

PickServer = function(){
	 
	$.ajax({
		url : "http://192.168.145.11/202209_TEAM03/mainboard/pickkkk.do",
//		url : "http://localhost/202209_TEAM03/mainboard/pickkkk.do",
		data : {
			
		},
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = '';
			console.log(res);
		
		 $.each(res, function(i, v) {
			
		cont = res[i].mb_content.replaceAll("\r", "").replaceAll("<br>", " ");
								
	     if(cont.length > 40){ // 글자수 구하기
		 cont = cont.substring(0, 30)+"...";	
		}
			
			if(/*i%4==0 ||*/ i==0){ // 한행에 4개씩 출력 되도록 
			code += '<div class="row" style="width:1300px; margin-left: auto; margin-right: auto; border-radius: 5px;">';
			}
			
			
			code += '<div mainidx='+res[i].mb_no+' class="card" style="width: 18rem; margin-left: 10px; margin-top:10px; margin-bottom: 10px;">';
			code += '	<img style="margin-left:15px;  margin-top:10px; width:240px; height:160px;" src="http://192.168.145.11/202209_TEAM03/images/imageView.do?mb_no='+res[i].mb_no+'" style="margin-top:10px; margin-bottom: 10px; margin-top: 8px;" ';
			code += '		/*class="card-img-top"*/ alt="..."> ';
			code += '      <input type="hidden" name="mb_no" value="'+ res[i].mb_no +'"/> ';
			code += '	<div class="card-body"> ';
			code += '		<a /*href=""*/><h5 class="card-title" >'+ res[i].mb_title +'</h5></a>';
			code += '		<p class="card-text" >'+ cont +'</p>';
			code += '	</div>';
			code += '	<ul class="list-group list-group-flush">';
			code += '		<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16">';
			code += '		  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_status +'</li>';
			code += '							<li class="list-group-item"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">';
			code += '		  <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>';
			code += '		  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>';
			code += '		</svg>&nbsp;'+ res[i].reg_name +'</li>'; 
			code += '							<li class="list-group-item" style="font-size:0.9em;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar4-week" viewBox="0 0 16 16">';
			code += '		  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v1h14V3a1 1 0 0 0-1-1H2zm13 3H1v9a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V5z"/>';
			code += '		  <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-2 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>';
			code += '		</svg>&nbsp;'+ res[i].mb_sdate + ' ~ '+ res[i].mb_edate +'  </li>';
			code += '	</ul>';
			code += '	<div class="card-body">';
			code += '		<span><button style="border:none; background: none; width:auto;"> <img alt="" src="http://192.168.145.11/202209_TEAM03/images/imageView2.do?mb_no='+res[i].mb_no+'" width="30" height="30" style=" border-radius: 30px;">';
			code += '			<span>&nbsp; '+ res[i].p_name + '</span>';
			code += '		</button> </span><br>';
			code += '		<svg style="margin-left: 50px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">';
	  		code += '				<path';
			code += '					d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />';
	 		code += '				 <path';
			code += '					d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />';
			code += '				</svg>';
			code += '			<span>&nbsp;'+ res[i].mb_hit + '</span>';
			code += '			<span>';
			/*code += '		<button type="button" style="border:none; background: none; width:auto; margin-left:10px;"> ';
			code += '			 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<span>찜하기</span>';
			code += '		</button></span>';
			code += '		</div>';*/
			code += '		&nbsp';
			code += '		&nbsp';
			code += '		<svg id="heart' + res[i].mb_no + '" class="heart" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">';
			code += '		  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />';
			code += '		</svg>';
			code += '		<svg id="heart2' + res[i].mb_no + '" class="heart2" style="color : red; display : none; "  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">';
			code += '		 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>';
			code += '		</svg>';
			
			code += '		<button class="pick2" type="button" style="border:none; background: none; width:auto; margin-left:"> ';
			code += '		찜하기';
			code += '		</button></span>';
			code += '		</div>';
			
			
			code += '</div>'; 
		
			
		})
		
		$('#sortList').html(code);

		PickList();
		},
		error : function(xhr){
			console.log("상태 : " +  xhr.status);
			}
		})
}


withmeapply = function(p_name,mb_no){ 


	$.ajax({
		url : 'http://192.168.145.11/202209_TEAM03/mainboard/withmeapply.do', 
//		url : 'http://localhost/202209_TEAM03/mainboard/withmeapply.do', 
		data : { "p_name" : p_name, 
		          "mb_no" : mb_no }, 
		type : 'post', 
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		dataType : 'text',
		success : function(res){
			
			if(res == "성공"){
				
			console.log('동행신청이 완료되었습니다!');
		}
			
		}, 
		error : function(xhr){
			console.log("상태 : "+ xhr.status);
		}
	})
	
}

pick = function(p_name,mb_no){  


	$.ajax({
		
		url : 'http://192.168.145.11/202209_TEAM03/mainboard/pick.do', 
//		url : 'http://localhost/202209_TEAM03/mainboard/pick.do', 
		data : { "p_name" : p_name, 
		          "mb_no" : mb_no }, 
		type : 'post', 
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		dataType : 'text',
		success : function(res){
			console.log(p_name);
			console.log(mb_no);
			
			if(res == "성공"){
				
			console.log('찜목록에 추가되었습니다!');
		}	
			
		}, 
		error : function(xhr){
			console.log("상태 : "+ xhr.status);
		}
	})
	
}

pickcancel = function(p_name,mb_no){  


	$.ajax({
		url : 'http://192.168.145.11/202209_TEAM03/mainboard/pickcancel.do', 
//		url : 'http://localhost/202209_TEAM03/mainboard/pickcancel.do', 
		data : { "p_name" : p_name, 
		          "mb_no" : mb_no }, 
		type : 'post', 
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		dataType : 'text',
		success : function(res){
			console.log(p_name);
			console.log(mb_no);
			
			if(res == "성공"){
				
			console.log('찜이 취소되었습니다!');
		}	
			
		}, 
		error : function(xhr){
			console.log("상태 : "+ xhr.status);
		}
	})
	
}

withmecheck = function(p_name, mb_no){  


	$.ajax({
		url : 'http://192.168.145.11/202209_TEAM03/mainboard/withmecheck', 
//		url : 'http://localhost/202209_TEAM03/mainboard/withmecheck', 
		data : { 
				  "p_name" : p_name, 
		          "mb_no" : mb_no }, 
	  headers:{
		"Access-Control-Allow-Origin" : "*"
		},
		type : 'post', 
		dataType : 'text',
		success : function(res){
			console.log(p_name);
			console.log(mb_no);
			
			if(res == "중복"){
				$("#withmeapply").hide(); 
				
				$("#withmecheck").html('동행신청완료');
		}	
			
		}, 
		error : function(xhr){
			console.log("상태 : "+ xhr.status);
		}
	})
	
}
