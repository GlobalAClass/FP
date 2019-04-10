<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CheckMon</title>
<meta name="description" content="Free Bootstrap 4 Admin Theme | Pike Admin">
<meta name="author" content="Pike Web Development - https://www.pikephp.com">
<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">
	
<!-- Bootstrap CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<!-- Font Awesome CSS -->
<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<!-- Custom CSS -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
		
<!-- BEGIN CSS for this page -->
<link href="assets/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" />
<style>
#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
}

#calendar {
	width: 100%;
}

.fc-event {
	font-size: 1em;
	border-radius: 2px;
	border: none;
	padding: 5px;
}

.fc-day-grid-event .fc-content {
	color: #fff;
}

.fc-button {
	background: #eaeaea;
	border: none;
	color: #666b6f;
	margin: 0 3px !important;
	padding: 5px 12px !important;
	text-transform: capitalize;
	height: auto !important;
	box-shadow: none !important;
	border-radius: 3px !important;
}

.fc-state-down, .fc-state-active, .fc-state-disabled {
	background-color: #009ffc !important;
	color: #ffffff !important;
	text-shadow: none !important;
}

.fc-toolbar h2 {
	font-size: 20px;
	font-weight: 600;
	line-height: 28px;
	text-transform: uppercase;
}

.fc th.fc-widget-header {
	background: #e6e6e6;
	font-size: 13px;
	text-transform: uppercase;
	line-height: 18px;
	padding: 0px;
}

.fc-unthemed th, .fc-unthemed td, .fc-unthemed thead, .fc-unthemed tbody,
	.fc-unthemed .fc-divider, .fc-unthemed .fc-row, .fc-unthemed .fc-popover
	{
	border-color: #eff1f3;
}
</style>
</head>
<body class="adminbody">
	<div id="main">
	<%@include file="/WEB-INF/views/emp/header.jsp" %>
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
				
				<div class="row">
						<div class="col-xl-12">
							<div class="breadcrumb-holder">
								<h1 class="main-title float-left">- 스케줄 -</h1>
								<ol class="breadcrumb float-right">
									<li class="breadcrumb-item">Home</li>
									<li class="breadcrumb-item active">스케줄</li>
									<li class="breadcrumb-item active">월별 스케줄 관리</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				
				
					<div class="card col-12">
						<h1 class="card-header" align="center">월별 스케줄 관리</h1>
						<div align="right" style="display:lnline-block;margin:20px;">
							<span style="background:#5858FA;color:#ffffff;"><b>근무 예정 스케줄</b></span>&nbsp;&nbsp;<span style="background:#DF7401;color:#ffffff;"><b>대리 근무 요청일</b></span>
						</div>
						<div>
							<div id="calendar"></div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="vacationModal" class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
 		 <div class="modal-dialog">
   			 <div class="modal-content">
		   		<div class="modal-header">
			        <h5 class="modal-title" id="vacationModalLabel">휴가 신청서 작성하기</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
				     	 </div>
				<form class="form-inline" name="apply" onsubmit="return checked()">
				<div class="modal-body">
					<table class="table">
						<tr>
							<th>휴가 신청 날짜</th>
						</tr>
						<tr>
							<td>
								<div id="loc_date" align="center" style="display:lnline-block"></div>
							</td>
						</tr>
						<tr>
							<th>신청 사유</th>
						</tr>
						<tr>
							<td>
								<select class="form-control" name="v_reason_main">
									<option selected value="">신청 사유 선택</option>
									<option value="병가">병가</option>
									<option value="집안 사정">집안 사정</option>
									<option value="기타">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" placeholder="상세 사유 작성" rows="3" cols="55" name="v_reason_detail"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<h4 style="color:red;">주의!</h4>
								<h5>휴가 신청 날짜 기준으로 <br><b>12시간 이전</b> 까지 휴가 승인이 처리가 되지 않으면 <br>자동적으로 <b style="color:red;">휴가 반려</b> 처리됩니다.</h5>
							</td>
						</tr>
						<tr align="center">
							<td>
								<input type="hidden" id="schedule_ix" name="schedule_ix">
								<input class="btn btn-success" type="submit" value="휴가 신청하기" onclick="applyVacation()">
							</td>
						</tr>
					</table>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="subModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		   		<div class="modal-header">
			        <h5 class="modal-title" id="subModalLabel">대리 근무 요청 확인</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
				     	 </div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th>대리 근무 일정</th>
						</tr>
						<tr>
							<td>
							<div id="loc_sub_date" align="center"></div>
							<div align="center">승인 하시겠습니까?</div>
							</td>
						</tr>
						<tr align="center">
							<td>
							<input type="hidden" id="substitute_req_ix" name="substitute_req_ix">
							<input type="hidden" id="sub_date" name="sub_date">
							<input type="hidden" id="sub_time" name="sub_time">
							<input class="btn btn-success" type="button" value="대리 근무 승인하기" onclick="subAgree()">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="btn btn-danger" type="button" value="거절" onclick="subDeny()">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>	
	
</body>

<script src="assets/js/modernizr.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/moment.min.js"></script>

<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<script src="assets/js/detect.js"></script>
<script src="assets/js/fastclick.js"></script>
<script src="assets/js/jquery.blockUI.js"></script>
<script src="assets/js/jquery.nicescroll.js"></script>

<!-- App js -->
<script src="assets/js/pikeadmin.js"></script>

<!-- BEGIN Java Script for this page -->
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<!-- Counter-Up-->
<script src="assets/plugins/waypoints/lib/jquery.waypoints.min.js"></script>
<script src="assets/plugins/counterup/jquery.counterup.min.js"></script>

<!-- BEGIN Java Script for this page -->
<script src="assets/plugins/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="assets/js/httpRequest.js"></script>
<script>
var date = new Date();
var d = date.getDate();
	m = date.getMonth()+1;
	y = date.getFullYear();

//mm,dd형식으로 바꿔주기
if (m < 10) { m = '0' + m; }
if (d < 10) { d = '0' + d; }
	
//달력 생성
$('#calendar').fullCalendar(
		{
		header : {
		left : 'today',
		center : 'prev title next',
		right : ''
		},
		//selectable : true,
		//selectHelper : true,
		editable : false, //수정 가능 여부 설정하는 부분
		eventLimit : 5, // allow "more" link when too many events
		droppable : false,
		height: 700,
		eventClick: function(event) {
			if(event.color=='#5858FA'){
				$('#vacationModal').modal('show');
				var loc_date = document.getElementById('loc_date');
				var moment = event.start;
				loc_date.innerHTML='<h4 style="font-weight:bold;">'+moment.format('YYYY')+'년 '+moment.format('MM')+'월 '+moment.format('DD')+'일'
									+'<h5>'+event.title+'</h5>';
				document.all.schedule_ix.value=event.id;
				
			}else if(event.color=='#DF7401'){
				$('#subModal').modal('show');
				var loc_sub_date = document.getElementById('loc_sub_date');
				var moment = event.start;
				loc_sub_date.innerHTML='<h4 style="font-weight:bold;">'+moment.format('YYYY')+'년 '+moment.format('MM')+'월 '+moment.format('DD')+'일'
										+'<h5>'+event.title+'</h5>';
				document.all.substitute_req_ix.value=event.id;
				document.all.sub_date.value=moment.format('YYYY-MM-DD');
				document.all.sub_time.value=event.title;
			}
			
		},
		eventRender: function(event, $el) {
			$el.popover({
		      content : event.description,
		      trigger :'hover',
		      placement : 'top'
		    });
		}
		
});


//첫 화면 세팅 시 오늘 날짜 이후의 스케줄 가져옴
renderCalcEvent(y,m,d);

//뒤로 가거나 앞으로 갈 때 달력 년,월에 해당하는 스케줄값 다시 가져오기
$(".fc-prev-button").click( function() {
	var moment = $('#calendar').fullCalendar('getDate');
	var year = moment.format('YYYY');
	var month = moment.format('MM');
	var date = momemt.format('DD');
	renderCalcEvent(year,month,date);
});
$(".fc-next-button").click( function() {
	var moment = $('#calendar').fullCalendar('getDate');
	var year = moment.format('YYYY');
	var month = moment.format('MM');
	var date = momemt.format('DD');
	renderCalcEvent(year,month,date);
});
$(".fc-today-button").click( function() {
	var moment = $('#calendar').fullCalendar('getDate');
	var year = moment.format('YYYY');
	var month = moment.format('MM');
	var date = momemt.format('DD');
	renderCalcEvent(year,month,date);
});


//현재 일,월에 존재하는 스케줄 값 모두 가져오는 ajax
function renderCalcEvent(year,month,date){
	var params = 'year='+year
				+'&month='+month
				+'&date='+date;	
	sendRequest('getScheduleEmp.do',params,resultEvent,'POST');
}

function resultEvent(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = eval('(' +XHR.responseText+ ')');
			
			var eventList = data.list;
			var subList = data.list_s;
			
			for(var i=0;i<eventList.length;i++){
				var list=eventList[i];
				
				var date = list.s_year+'-'+list.s_month+'-'+list.s_day;
				
				var event ={
				id : list.schedule_ix,
				title : list.s_start_time+' - '+list.s_end_time,
				start : date,
				color : '#5858FA',
				description : '클릭 시 휴가신청 가능',
				allDay: true
				
				};
				$('#calendar').fullCalendar('renderEvent',event);
			}
			
			for(var i=0;i<subList.length;i++){
				var list = subList[i];
				
				var event ={
				id : list.SUBSTITUTE_REQUEST_IX,
				title : list.S_TIME,
				start : list.S_DATE,
				color : '#DF7401',
				description : '클릭 시 대리근무 신청 확인',
				allDay: true
				
				};$('#calendar').fullCalendar('renderEvent',event);
			}
			
		}
	}
}



//-----------------------휴가 신청 Modal 에서 사용하는 함수------------------------//
//신청 Submit 전에 유효성 검사
function checked() {
	if (apply.v_reason_main.value == '') {
		alert('신청 사유를 선택해주세요.');
		return false;
	}else if(apply.v_reason_detail.value==''){
		alert('신청사유 세부사항을 작성해주세요.');
	}else {
		return true;
	}
}
//휴가 신청하기 위한 ajax
function applyVacation(){
	var params = 'schedule_ix='+apply.schedule_ix.value
				+'&v_reason_main='+apply.v_reason_main.value
				+'&v_reason_detail='+apply.v_reason_detail.value;
	
	sendRequest('applyVacation.do',params,resultApply,'POST');
	
}

function resultApply(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
				
			var data = eval('('+XHR.responseText+')');
		    var msg=data.msg;
		    
		    if(msg!=''){
		    	alert(msg);
		    }
		    
		    location.href='scheduleList.do';
			
		}
	}
}

//-----------------------대리 근무 요청 Modal 에서 사용하는 함수------------------------//
function subAgree(){
	params = 'substitute_req_ix='+document.all.substitute_req_ix.value
			+'&sub_date='+document.all.sub_date.value
			+'&sub_time='+document.all.sub_time.value
	
	sendRequest('agreeSubstitute.do',params,resultSubAgree,'POST');
}

function resultSubAgree(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
				
			var data = eval('('+XHR.responseText+')');
		    var msg=data.msg;
		    
		    if(msg!=''){
		    	alert(msg);
		    }
		    
		    location.href='scheduleList.do';
			
		}
	}
}

function subDeny(){
	param = 'substitute_req_ix='+document.all.substitute_req_ix.value;
	
	sendRequest('denySubstitute.do',param,resultSubDeny,'POST');
}

function resultSubDeny(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
				
			var data = eval('('+XHR.responseText+')');
		    var msg=data.msg;
		    
		    if(msg!=''){
		    	alert(msg);
		    }
		    
		    location.href='scheduleList.do';
			
		}
	}
}

</script>
</html>