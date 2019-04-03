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

<!-- Modernizr -->
<script src="assets/js/modernizr.min.js"></script>

<!-- jQuery -->
<script src="assets/js/jquery.min.js"></script>

<!-- Moment -->
<script src="assets/js/moment.min.js"></script>
		
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
				
			</div>
			<div class="modal-footer" align="center">
				<!-- 스케줄 추가 시 넘겨주어야 하는 값 hidden으로 저장 -->
				<input class="btn btn-success" type="button" value="스케줄 추가하기" onclick="">
			</div>
		</div>
	</div>
</div>
</body>

<script src="assets/js/modernizr.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/moment.min.js"></script>

<script src="assets/js/jquery-1.10.2.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/httpRequest.js"></script>

<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<script src="assets/js/detect.js"></script>
<script src="assets/js/fastclick.js"></script>
<script src="assets/js/jquery.blockUI.js"></script>
<script src="assets/js/jquery.nicescroll.js"></script>

<!-- App js -->
<script src="assets/js/pikeadmin.js"></script>

<!-- BEGIN Java Script for this page -->
<script src="assets/js/jquery-ui.min.js"></script>
<script src="assets/plugins/fullcalendar/fullcalendar.min.js"></script>
<script>
$(document).ready(function() {

		/* 달력 초기화 하는 부분
		-----------------------------------------------------------------*/
		var date = new Date();
		var d    = date.getDate();
        m    = date.getMonth();
        y    = date.getFullYear();
		
		$('#calendar').fullCalendar({
			header: {
				left: 'today',
				center: 'prev title  next',
				right: 'month,agendaWeek'
			},
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				var title = prompt('Event Title:');
				var eventData;
				if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				}
				$('#calendar').fullCalendar('unselect');
			},
			editable: false, //수정 가능 여부 설정하는 부분
			eventLimit: true, // allow "more" link when too many events
			events: [
					{
					  title          : 'All Day Event',
					  start          : new Date(y, m, 2),
					  className: 'bg-primary',
					},
					{
					  title          : 'Long Event',
					  start          : new Date(y, m, d - 4),
					  end            : new Date(y, m, d - 2),
					  className: 'bg-info',
					},
					{
					  title          : 'Meeting John',
					  start          : new Date(y, m, d, 15, 20),
					  allDay         : false,
					  className: 'bg-primary',
					},
					{
					  title          : 'New Task',
					  start          : new Date(y, m, d, 12, 0),
					  end            : new Date(y, m, d, 16, 0),
					  allDay         : false,
					  className: 'bg-danger',
					},
					{
					  title          : 'Birthday Party',
					  start          : new Date(y, m, d + 2, 15, 0),
					  end            : new Date(y, m, d + 2, 20, 40),
					  allDay         : false,
					  className: 'bg-warning',
					},
					{
					  title          : 'Alice Birthday',
					  start          : new Date(y, m, d + 4, 15, 0),
					  end            : new Date(y, m, d + 4, 18, 30),
					  allDay         : false,
					  className: 'bg-info',
					},
					{
					  title          : 'Click for Google',
					  start          : new Date(y, m, 27),
					  end            : new Date(y, m, 28),
					  url            : 'http://google.com/',
					  className: 'bg-danger', 
					}
				
			],
			droppable: false
		});
});
</script>
<!-- END Java Script for this page -->
</html>