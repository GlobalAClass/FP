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
<!-- END CSS for this page -->
</head>
<body class="adminbody">

	<div id="main">
	<%@include file="/WEB-INF/views/emp/header.jsp" %>
	
		<div class="content-page">
		
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="card col-12">
						<h1 class="card-header" align="center">월별 근태 관리</h1>
						<div align="right" style="display:inline-block;margin:20px;">
							<span style="background:#5858FA;color:#ffffff;">정상 출근</span>&nbsp;&nbsp;<span style="background:#FF4000;color:#ffffff;">지각 / 결근</span>
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
	
	<div id="myModal" class="modal fade" tabindex="-1"
         role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-header">
                  <h2 class="modal-title" id="exampleModalLabel" style="font-weight:bold;">근태 변경 신청서</h2>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <form class="form-inline" name="commuteapply" onsubmit="return checked()" action="javascript:updateCommute()">
                  	<input type="hidden" name="progress" value="승인대기">
                  	<input type="hidden" name="emp_commute_ix">
                  	<input type="hidden" name="c_worktime">
                  	<input type="hidden" name="c_leavetime">
                  	<table class="table">
                  		<tr>
                  			<th>변경 요구 날짜</th>
                  			<td><div id="loc_workday"></div></td>
                  		</tr>
                  		<tr>
                  			<th>현재 근태 시간</th>
                  			<td>
                  			<div class="form-group">
							&nbsp;
							<input type="text" class="form-control" name="loc_workhours" maxlength="2" size="5" readonly="readonly">
							&nbsp;:&nbsp;
							<input type="text" class="form-control" name="loc_workminutes" maxlength="2" size="5" readonly="readonly">
							&nbsp;~&nbsp;
							<input type="text" class="form-control" name="loc_leavehours" maxlength="2" size="5" readonly="readonly">
							&nbsp;:&nbsp;
							<input type="text" class="form-control" name="loc_leaveminutes" maxlength="2" size="5" readonly="readonly">
                  			</div>
                  			</td>
                  		</tr>
                  		<tr>
                  			<th>변경 요청 시간</th>
                  			<td>
                  			<div class="form-group">
                  			<select class="form-control" id="start_m" required="required">
								<option value="AM">AM</option>
								<option value="PM">PM</option>
							</select>
							&nbsp;
							<input type="text" class="form-control" name="cha_workhours" maxlength="2" size="5" required="required">
							&nbsp;:&nbsp;
							<input type="text" class="form-control" name="cha_workminutes" maxlength="2" size="5" required="required">
							&nbsp;~&nbsp;
							<select class="form-control" id="end_m" required="required">
								<option value="AM">AM</option>
								<option value="PM">PM</option>
							</select>
							&nbsp;
							<input type="text" class="form-control" name="cha_leavehours" maxlength="2" size="5" required="required">
							&nbsp;:&nbsp;
							<input type="text" class="form-control" name="cha_leaveminutes" maxlength="2" size="5" required="required">
                  			</div>
                  			</td>
                  		</tr>
                  		<tr>
                  			<th>제목</th>
                  			<td>
                  			<div class="form-group">
                  			<select class="form-control" name="title" required="required">
								<option value="지각->정상출근 요청합니다.">지각->정상출근 요청합니다.</option>
								<option value="결근->정상출근 요청합니다.">결근->정상출근 요청합니다.</option>
							</select>
                  			</div>
                  			</td>
                  		</tr>
                  		<tr>
                  			<th>사유</th>
                  			<td>
                  			<div class="form-group">
                  			<textarea class="form-control" name="reason" cols="60" rows="5" required="required"></textarea>
                  			</div>
                  			</td>
                  		</tr>
                  		<tr>
                  			<td colspan="3" align="center">
                  			<input type="submit" class="btn btn-primary" value="제출하기">
                  			</td>
                  		</tr>
                  	</table>
                  </form>
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
<script src='assets/plugins/fullcalendar/locale-all.js'></script>
<script src="assets/js/jquery.qtip.min.js"></script>
<script type="text/javascript" src="assets/js/httpRequest.js"></script>
<script>
var date = new Date();
var d = date.getDate();
	m = date.getMonth()+1;
	y = date.getFullYear();

//mm형식으로 바꿔주기
if (m < 10) { m = '0' + m; }

//달력 생성
$('#calendar').fullCalendar(
		{
		header : {
		left : '',
		center : 'prev title next',
		right : '',
		},
		locale : 'ko',
		//selectable : true,
		//selectHelper : true,
		editable : false, //수정 가능 여부 설정하는 부분
		eventLimit : 5, // allow "more" link when too many events
		droppable : false,
		height: 700,
		eventClick:function(event){
			$('#myModal').modal('show');
			var loc_workday = document.getElementById('loc_workday');
			var workday = event.start;
			
			//근무 변경 날짜 세팅
			loc_workday.innerHTML = workday.format('YYYY')+'년'+workday.format('MM')+'월'+workday.format('DD')+'일';
			
			var worktime = event.title;
			//출근 시간 = 시
			var workhours=worktime.substring(0,2);
			//출근 시간 = 분
			var workminutes=worktime.substring(3,5);
			//퇴근 시간 = 시
			var leavehours=worktime.substring(8,10);
			//퇴근 시간 = 분
			var leaveminutes=worktime.substring(11,13);
			
			//기존 출/퇴근 시간 값 세팅
			commuteapply.loc_workhours.value = workhours;
			commuteapply.loc_workminutes.value = workminutes;
			commuteapply.loc_leavehours.value = leavehours;
			commuteapply.loc_leaveminutes.value = leaveminutes;
			
			//근태 변경 인덱스 세팅
			document.all.emp_commute_ix.value = event.id;
			
		},
		eventRender: function(event, $el) {
	         $el.popover({
	            content : event.description,
	            trigger :'hover',
	            placement : 'top'
	          });
	      }
});

//첫 화면 세팅 시 스케줄 가져옴
renderCalcEvent();

//뒤로 가거나 앞으로 갈 때 달력 년,월에 해당하는 스케줄값 다시 가져오기
$(".fc-prev-button").click( function() {
	renderCalcEvent();
});
$(".fc-next-button").click( function() {
	renderCalcEvent();
});
$(".fc-today-button").click( function() {
	renderCalcEvent();
});


//현재 일,월에 존재하는 근무자 출/퇴근 값 모두 가져오는 ajax
function renderCalcEvent(){
	sendRequest('empCommute.do',null,resultEvent,'GET');
}

function resultEvent(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = eval('(' +XHR.responseText+ ')');
			
			var eventList = data.list;
			var eventsList = data.slist;		
			
			for(var i=0;i<eventList.length;i++){
				var list=eventList[i];
				var slist=eventsList[i];
				var date = list.workday;
				if(list.leavetime==null){
					list.leavetime='';
				}
				var s_workday = slist.s_year+'-'+slist.s_month+'-'+slist.s_day;
				var worktimes = list.worktime.replace(/:/gi, "");
				var worktime = parseInt(worktimes);
				
				var starttimes = slist.s_start_time.replace(/:/gi, "");
				var starttime = parseInt(starttimes);
				
				if(date==s_workday){
					if(worktime<=starttime){
						var event ={
							id : list.emp_commute_ix,
							title : list.worktime+' - '+list.leavetime,
							start : date,
							backgroundColor : '#5858FA',
							description :'',
							allDay: true
								
						};$('#calendar').fullCalendar('renderEvent',event);
					}else{
						var event ={
							id : list.emp_commute_ix,
							title : list.worktime+' - '+list.leavetime,
							start : date,
							backgroundColor : '#FF4000',
							description : '클릭시 근태 변경 신청 가능',
							allDay: true
								
						};$('#calendar').fullCalendar('renderEvent',event);
					}
				}
			}
		} 
	}
}


function checked(){
	if(commuteapply.cha_workhours.value==''
		||commuteapply.cha_workminutes.value==''
		||commuteapply.cha_leavehours.value==''
		||commuteapply.cha_leaveminutes.value==''){
		alert('변경 근무 시간을 모두 입력해주세요.');
		return false;
	}else if(document.all.title.value==''){
		alert('제목을 선택 해주세요');
		return false;
	}else if(document.all.reason.value==''){
		alert('사유를 작성해주세요');
		return false;
	}else{
		setWorkTime();
		return true;
	}
}

function setWorkTime(){
	
	var m1 = document.getElementById('start_m');
	var m2 = document.getElementById('end_m');
	
	var cha_workhours = commuteapply.cha_workhours.value;
	var cha_leavehours = commuteapply.cha_leavehours.value;
	
	if (m1.options[m1.selectedIndex].value == 'PM') {
		cha_workhours = parseInt(cha_workhours) + 12;
	}
	if (m2.options[m2.selectedIndex].value == 'PM') {
		cha_leavehours = parseInt(cha_leavehours) + 12;
	}
	
	if(m1.options[m1.selectedIndex].value == 'AM'){
		commuteapply.c_worktime.value = "0"+cha_workhours+':'+commuteapply.cha_workminutes.value;	
	}
	
	commuteapply.c_leavetime.value = cha_leavehours+':'+commuteapply.cha_leaveminutes.value;
}

//ajax 이용하여 근무 수정
function updateCommute(){
	var params = 'emp_commute_ix='+commuteapply.emp_commute_ix.value
				+'&c_worktime='+commuteapply.c_worktime.value
				+'&c_leavetime='+commuteapply.c_leavetime.value
				+'&title='+commuteapply.title.value
				+'&reason='+commuteapply.reason.value
				+'&progress='+commuteapply.progress.value
	sendRequest('addCommuteApply.do',params,resultUp,'POST');
}

//근무 수정 후
function resultUp(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = eval('(' + XHR.responseText + ')');
			var msg = data.msg;
			alert(msg);
			location.href='empCommuteForm.do';
			
		}
	}
}

</script>

<!-- END Java Script for this page -->
</html>