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
				
					<div class="row">
						<div class="col-xl-12">
							<div class="breadcrumb-holder">
								<h1 class="main-title float-left">- 스케줄 관리 -</h1>
								<ol class="breadcrumb float-right">
									<li class="breadcrumb-item">Home</li>
									<li class="breadcrumb-item active">스케줄 관리</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				
					<div class="card col-12">
						<h1 class="card-header" align="center">스케줄 관리</h1>
						<div align="right" style="margin:20px;">
							<input type="button" class="btn btn-primary btn-lg" value="스케줄 추가하기" onclick="getTemplate();">
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
	
	<div id="addModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	   		<div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">스케줄 추가하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
			     	 </div>
			<div class="modal-body">
					<form name="add" onsubmit="return checked2()">
					<table class="table">
						<tr>
							<th>근무 시간 템플릿</th>
							<td>
								<div class="row">
									<input type="hidden">
									<div class="form-group">
										<select class="form-control" id="loc_sel" name="selectTemp">
											<option value="" selected>템플릿을 선택해주세요</option>
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>스케줄 배정할 직원</th>
							<td>
								<div class="col-12" id="loc_emp">
								<p>직원의 이름, 그룹, 직책명으로 검색 후 <b>체크박스를 선택해주세요</b><b style="color:red;"> (최대 5명)</b></p>
								<%@include file="/WEB-INF/views/module/search.jsp" %>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<p align="center" style="font-size:20px;">선택한 직원들의 스케줄을 <b>배정할 날짜</b>를 클릭해주세요</p>
								<div id="calendar2"></div>
								<div class="clearfix"></div>
							</td>
						</tr>
						<tr align="right">
							<td colspan="2"><input class="btn btn-success btn-lg" type="submit" value="스케줄 추가하기" onclick="addSchedule()"></td>
						</tr>
					</table>
					</form>
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
				<form class="form-inline" name="modify" onsubmit="return checked()" action="javascript:updateSchedule()">
				<div class="modal-body">
					<div id="loc_date"></div>
					<table class="table">
						<tr align="center">
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
						<tr align="center"> 
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
						<td>
							<input type="hidden" name="hour_start_time">
							<input type="hidden" name="hour_end_time">
							<input type="hidden" id="schedule_ix" name="schedule_ix" value="">
							<input class="btn btn-danger" type="button" value="스케줄 삭제하기" onclick="delSchedule()">
						</td>
						<td align="right">
							<input class="btn btn-success" type="submit" value="스케줄 수정하기">
						</td>
						</tr>
					</table>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script src="assets/js/modernizr.min.js"></script>
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
		left : 'today',
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
		eventClick: function(event) {
			$('#modModal').modal('show'); //모달 열어주는 jquery
			//스케줄 날짜 나타내는 코드
			var loc_date = document.getElementById('loc_date'); //스케줄 변경 선택한 년-월-일 나타낼 공간
			var moment = event.start;
			loc_date.innerHTML='<h4 align="center" style="font-weight:bold;">'+moment.format('YYYY')+'년 '+moment.format('MM')+'월 '+moment.format('DD')+'일</h4>';
			
			//해당 스케줄의 인덱스 세팅
			document.all.schedule_ix.value = event.id;
			
			//해당 스케줄의 근무자 이름 세팅
			document.getElementById('modModalLabel').innerHTML = '<b>'+event.title+'</b>님의 스케줄 수정/삭제하기';
		
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
renderCalcEvent(y,m);


//뒤로 가거나 앞으로 갈 때 달력 년,월에 해당하는 스케줄값 다시 가져오기
$(".fc-prev-button").click( function() {
	var moment = $('#calendar').fullCalendar('getDate');
	var year = moment.format('YYYY');
	var month = moment.format('MM');
	renderCalcEvent(year,month);
});
$(".fc-next-button").click( function() {
	var moment = $('#calendar').fullCalendar('getDate');
	var year = moment.format('YYYY');
	var month = moment.format('MM');
	renderCalcEvent(year,month);
});
$(".fc-today-button").click( function() {
	var moment = $('#calendar').fullCalendar('getDate');
	var year = moment.format('YYYY');
	var month = moment.format('MM');
	renderCalcEvent(year,month);
});


//현재 일,월에 존재하는 스케줄 값 모두 가져오는 ajax
function renderCalcEvent(year,month){
	var params = 'year='+year
				+'&month='+month;
	sendRequest('getScheduleAll.do',params,resultEvent,'GET');
}

function resultEvent(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = eval('(' +XHR.responseText+ ')');
			
			var eventList = data.list;
			
			for(var i=0;i<eventList.length;i++){
				var list=eventList[i];
				
				var date = list.S_YEAR+'-'+list.S_MONTH+'-'+list.S_DAY;
				
				var event ={
				id : list.SCHEDULE_IX,
				title : list.E_NAME+' '+list.S_START_TIME+' - '+list.S_END_TIME,
				start : date,
				color : list.E_COLOR,
				description : '클릭 시 스케줄 수정/삭제 가능',
				allDay: true
				
				};$('#calendar').fullCalendar('renderEvent',event);
			} 
			
		}
	}
}

//-------------스케줄 수정 및 삭제하기 Modal에서 사용하는 함수---------------//
//수정 Submit 전에 유효성 검사
function checked() {
	if (modify.start_hour.value == ''
			|| modify.start_min.value == ''
			|| modify.end_hour.value == ''
			|| modify.end_min.value == '') {
		alert('근무 시간을 모두 입력해주세요.');
		return false;
	} else {
		setTempTime();
		return true;
	}
}

//스케줄 시작 시간, 마감 시간 계산하는 함수
function setTempTime() {

	var m1 = document.getElementById('start_m');
	var m2 = document.getElementById('end_m');

	var start_hour = modify.start_hour.value;
	var end_hour = modify.end_hour.value;

	if (m1.options[m1.selectedIndex].value == 'PM') {
		start_hour = parseInt(start_hour) + 12;
	}
	if (m2.options[m2.selectedIndex].value == 'PM') {
		end_hour = parseInt(end_hour) + 12;
	}

	modify.hour_start_time.value = start_hour+':'+modify.start_min.value;
	modify.hour_end_time.value = end_hour+':'+modify.end_min.value;
}

//ajax 이용하여 스케줄 수정
function updateSchedule(){
	var params = 'schedule_ix='+modify.schedule_ix.value
				+'&s_start_time='+modify.hour_start_time.value
				+'&s_end_time='+modify.hour_end_time.value;
	
	sendRequest('modSchedule.do',params,resultUp,'POST');
}

//스케줄 수정 후
function resultUp(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = eval('(' + XHR.responseText + ')');
			var msg = data.msg;
			var loc = data.loc;

			if (msg != '') {
				alert(msg);
			}

			location.href = loc;
		}
	}
}

//ajax 이용하여 스케줄 삭제
function delSchedule(){
	var res = confirm('스케줄을 삭제하시겠습니까?\n(주의! 복구할 수 없습니다.)')
	if(res){
		var param = 'schedule_ix='+modify.schedule_ix.value;
		sendRequest('delSchedule.do',param,resultDel,'POST');
	}
}
//스케줄 삭제 후
function resultDel(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = eval('(' + XHR.responseText + ')');
			var msg = data.msg;
			var loc = data.loc;

			if (msg != '') {
				alert(msg);
			}

			location.href = loc;
		}
	}
}

//-------------스케줄 추가하기 Modal에서 사용하는 함수---------------//
//현재 존재하는 근무시간 템플릿 가져오는 ajax
function getTemplate(){
	sendRequest('hourTemplateList.do',null,resultTemplate,'POST');
}

function resultTemplate(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = eval('(' + XHR.responseText + ')');
			var tempList = data.list;
			
			//템플릿이 존재하지 않는 경우, 근무시간 템플릿 만드는 화면으로 이동
			if(tempList.length==0){
				alert('근무 시간 템플릿을 생성해주세요.');
				location.href="hourTemplateList.do";
			}else{
				
				//스케줄 추가하는 모달 열기
				$('#addModal').modal('show');
				
				//select option 추가할 위치
				var loc_sel = document.getElementById('loc_sel');
				
				//option 항목 추가
				for(var i=0;i<tempList.length;i++){
					list=tempList[i];
					
					var opt = document.createElement('option');
					opt.text = list.hour_start_time+' ~ '+list.hour_end_time+' | '+list.template_position;
					opt.value = list.hour_start_time+','+list.hour_end_time;
					
					loc_sel.options.add(opt);
				}
			}
		}
	}
}
function checked2(){
var selectTemp = document.all.loc_sel.value;
	if(selectTemp==''){
		alert('템플릿을 선택해주세요.');
		return false;
	}
	return true;
}

//스케줄을 생성할 날짜를 집어넣을 배열
var arr = new Array();

$('#searchEmp').click(function() {
	
	var calendar2 = $('#calendar2').fullCalendar({
			header : {
				left : '',
				center : 'title',
				right : ''
			},
			locale : 'ko',
			selectable : true,
			selectHelper : true,
			editable : false, //수정 가능 여부 설정하는 부분
			eventLimit : 1,
			droppable : false,
			dragScroll : false,
 			dayClick: function(date,jsEvent,view){
 				
				if($(this).css('background-color')=='rgba(0, 0, 0, 0)'){
					$(this).css('background-color','#ff9f89');
					arr.push(date.format('YYYY-MM-DD')); //삽입 선택한 날짜 배열에 넣기
 				}else{
 					$(this).css('background-color','rgba(0, 0, 0, 0)');
 					var ix = arr.indexOf(date.format('YYYY-MM-DD')); //삭제 선택한 날짜와 일치하는 항목의 인덱스
 					arr.splice(ix,1);
 				}
				
			} 
			
	});
});

//ajax 이용하여 스케줄 추가하기
function addSchedule(){
	var params = 'selectTemp='+add.selectTemp.value+'&selectEmp='+selectEmp+'&selectDate='+arr.sort();
	sendRequest('addSchedule.do', params, resultAdd,'POST');
}

function resultAdd(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = eval('('+XHR.responseText+')');
		    var msg=data.msg;
		    
		    if(msg!=''){
		    	alert(msg);
		    }
		    
		    location.href='scheduleMonthList.do';
		}
	}
}

</script>

<!-- END Java Script for this page -->
</html>