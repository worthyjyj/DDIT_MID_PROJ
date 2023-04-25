/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {

    $('#deleteEvent').data('sch_no', event.sch_no); //클릭한 이벤트 ID
    $('#deleteEvent').data('username', event.username); 

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === '1') {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === '1' && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
//    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {
	
		if(event.username !== username) {
			alert('본인이 작성한 스케줄만 수정 가능합니다.');
			return false;
		}

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
//            displayDate = endData;
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');
			
        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();

        $("#calendar").fullCalendar('updateEvent', event);
			
			
		var status = {
			allDay : statusAllDay,
	        title : editTitle.val(),
	        start : startDate,
	        end : displayDate,
	        type : editType.val(),
	        backgroundColor : editColor.val(),
	        description : editDesc.val(),
			id : event._id,
			sch_no: event.sch_no
		};	
			
        //일정 업데이트
        $.ajax({
//			url : "http://localhost/202209_TEAM03/updateData.do",
			url : "http://192.168.145.11/202209_TEAM03/updateData.do",
            type: "post",
            //url: "http://localhost/FullCalendar/updateData.do",
            data: status,
			dataType : "json",
            success: function (response) {
				
	
                alert('수정되었습니다.');
 				location.reload();
            },
			error : function(xhr){
				alert(xhr.status);
			}
        });
    });

// 삭제버튼
$('#deleteEvent').unbind();
$('#deleteEvent').on('click', function () {
    
    $("#calendar").fullCalendar('removeEvents', $(this).data('sch_no'), $(this).data('username'));
    eventModal.modal('hide');

		if($(this).data('username') !== username) {
			alert('본인이 작성한 스케줄만 삭제 가능합니다.');
			return false;
		}
		
		var no = {
		sch_no: $(this).data('sch_no')
		};	

    //삭제시
    $.ajax({
        type: "get",
        url: "http://192.168.145.11/202209_TEAM03/deleteData.do",
//        url: "http://localhost/202209_TEAM03/deleteData.do",
        data: no,
		dataType: "json",
        success: function (response) {
            alert('삭제되었습니다.');
			location.reload();
        }
    });

});


};
