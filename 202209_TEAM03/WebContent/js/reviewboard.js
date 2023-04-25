/**
 * 
 */
WriteServer = function(){
	
	$.ajax({
//		url : "http://localhost/202209_TEAM03/reviewboard/reviewBoardWrite.do",
		url : "http://192.168.145.10/202209_TEAM03/reviewboard/reviewBoardWrite.do",
		data : $("writeform").serializeJSON(),
		type : "post",
		success : function(res){
			location.href= "http://192.168.145.10/202209_TEAM03/reviewboard/reviewBoardList.do"
//			location.href= "http://localhost/202209_TEAM03/reviewboard/reviewBoardList.do"
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : "json"
		
	})
}


