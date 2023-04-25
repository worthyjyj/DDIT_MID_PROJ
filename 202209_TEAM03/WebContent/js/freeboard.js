/**
 * 
 */


ListServer = function(page) {

   vword = $('#sword').val().trim();

   $.ajax({
      url: "http://localhost/202209_TEAM03/freeboard/freeBoardList.do",
      data: {
         page: page,
         sword: vword
      },
      type: 'post',
      success: function(res) {

         console.log(res);
         code = '';
	
         $.each(res, function(i, v) {

            code += '<div class="col-md-6">';
            code += ' <div class="card" style="width: 560px; margin-left: 35px; margin-top: 10px; margin-bottom: 10px;">';
            code += '   <div class="card-header">';
            code += '      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">';
            code += '       <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />';
            code += '       <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />';
            code += '      </svg>';
            code += '      <input type="hidden" name="bo_num" value="'+ v.fb_no +'"/> ';
            code += '      <p>' + v.fb_reg +'</p>';
            code += '   </div>';
            code += '   <div class="card-body">';
            code += '      <blockquote class="blockquote mb-0">';
            code += '         <p><a href="" class="ft">'  +  v.fb_title  +  '</a></p>';
            code += '         <footer class="">';
            code += '            <a><img alt="" src="../../images/프사.png" width="30" height="30" style="margin-left: auto;"> <span> ' + v.p_name+'</span>';
            code += '            </a>';
            code += '            <svg style="margin-left: 50px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">';
            code += '         <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z" />';
            code += '          <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z" />';
            code += '         </svg>';
            code += '            <span>' + v.fb_hit +'</span>';
            code += '         </footer>';
            code += '      </blockquote>';
            code += '   </div>';
            code += ' </div>';
            code += '</div>';
         })//each문 끝
            code += '</div>';
            
            $('#write1').html(code);
            
      },      //success 끝
      error: function(xhr) {
         alert("상태 : " + xhr.status);
      },
      dataType: 'json'
   })//ajax 끝
}//ListServer 끝


DetailServer = function(page){
	
	$.ajax({
		
		url : "http://localhost/202209_TEAM03/freeboard/freeBoardView.do",
		data : {
			bnum : bo_num
		},
		type : 'get',
		dataType : 'json',
		success : function(res){
			
			console.log(res);
		},
		error : function(xhr){
			alert("상태 : " +  xhr.status);
		}
	})
	
	
	
}








