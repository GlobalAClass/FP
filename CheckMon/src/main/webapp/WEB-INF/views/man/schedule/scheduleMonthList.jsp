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
	<%@include file="/WEB-INF/views/man/header.jsp" %>
	
		<div class="content-page">
		
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="card col-12">
						<h1 class="card-header" align="center">스케줄 관리</h1>
						<div align="right" style="margin:20px;">
							<input type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target=".bd-example-modal-lg" value="스케줄 추가하기">
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
	
	<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	   		<div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">스케줄 추가하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
			     	 </div>
			<div class="modal-body">
					<table class="table">
						<tr>
							<th>근무 시간 템플릿</th>
							<td>
								<input type="hidden">
								<div class="form-group">
									<select class="form-control" id="loc_temp">
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>직책명</th>
							<td><select class="form-control" name="template_position">
									<option value="">직책을 선택해주세요</option>
									<option value="직원">직원</option>
									<option value="아르바이트">아르바이트</option>
							</select></td>
						</tr>
						<tr align="right">
							<td colspan="2"><input class="btn btn-success" type="submit"
								value="스케줄 추가하기"></td>
						</tr>
					</table>
				</div>
			<div class="modal-footer" align="center">
				<!-- 스케줄 추가 시 넘겨주어야 하는 값 hidden으로 저장 -->
				<input class="btn btn-success" type="button" value="스케줄 추가하기" onclick="">
			</div>
		</div>
	</div>
</div>

<div id="modModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	   		<div class="modal-header">
		        <h5 class="modal-title" id="modModalLabel"></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
			     	 </div>
			<div class="modal-body">
				<table>
					<tr>
						<th>시작 시간</th>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" name="start_hour" maxlength="2" size="5">&nbsp;:&nbsp;<input type="text" class="form-control" name="start_min" maxlength="2" size="5">
								&nbsp;
								<select class="form-control" id="start_m">
									<option value="AM">AM</option>
									<option value="PM">PM</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>마감 시간</th>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" name="end_hour" maxlength="2" size="5">&nbsp;:&nbsp;<input type="text" class="form-control" name="end_min" maxlength="2" size="5">
								&nbsp;
								<select class="form-control" id="end_m">
									<option value="AM">AM</option>
									<option value="PM">PM</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
					</tr>
				</table>
			</div>
			<div class="modal-footer" align="center">
				<!-- 클릭한 매장 정보 -->
				<input type="hidden" name="hour_start_time">
				<input type="hidden" name="hour_end_time">
				<input type="hidden" id="schedule_ix" name="schedule_ix" value="">
				<input class="btn btn-success" type="button" value="스케줄 수정하기" onclick="checkStore();">
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

$('#calendar').fullCalendar(
		{
		header : {
		left : 'today',
		center : 'prev title next',
		right : 'month,agendaWeek'
		},
		selectable : true,
		selectHelper : true,
		editable : false, //수정 가능 여부 설정하는 부분
		eventLimit : 5, // allow "more" link when too many events
		droppable : false,
		height: 700,
		eventClick: function(event) {
			$('#myModal').modal('show')
			document.all.schedule_ix.value = event.id;
			document.getElementById('modModalLabel').innerHTML = event.title+'님의 스케줄 수정하기';
		}
	});

//뒤로 가거나 앞으로 갈 때 달력값 다시 가져오기
$(".fc-prev-button").on("click", function() {
	renderCalcEvent();
});
$(".fc-next-button").on("click", function() {
	renderCalcEvent();
});
$(".fc-today-button").on("click", function() {
	renderCalcEvent();
});


	
renderCalcEvent();

//현재 스케줄 값 모두 가져오는 ajax
function renderCalcEvent(){
	sendRequest('getScheduleAll.do',null,resultEvent,'GET');
}

function resultEvent(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = eval('(' + XHR.responseText + ')');
			var eventList = data.list;
			
			for(var i=0;i<eventList.length;i++){
				list=eventList[i];
				
				var date = list.S_YEAR+'-'+list.S_MONTH+'-'+list.S_DAY;
				var colorcode = "#"+Math.round(Math.random()*0xffffff).toString(16);
				
				var event ={
				id : list.SCHEDULE_IX,
				title : list.E_NAME,
				start : date,
				color : colorcode,
				allDay: true
				
				};$('#calendar').fullCalendar('renderEvent',event);
				
			}
			
		}
	}
}

//현재 존재하는 근무시간 템플릿 가져오는 ajax
function getTemplate(){
	sendRequest('hourTemplateList.do',null,resultTemplate,'POST');
}

function resultTemplate(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = eval('(' + XHR.responseText + ')');
			var tempList = data.list;
			
			for(var i=0;i<tempList.length;i++){
				list=tempList[i];

			}
		}
	}
}

</script>

<!-- END Java Script for this page -->
</html>