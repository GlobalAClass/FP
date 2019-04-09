<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CheckMon</title>
<meta name="description"
	content="Free Bootstrap 4 Admin Theme | Pike Admin">
<meta name="author"
	content="Pike Web Development - https://www.pikephp.com">

<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Bootstrap CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<!-- Font Awesome CSS -->
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<!-- Custom CSS -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<style>
#paging {
  display: table;
  margin-left: auto;
  margin-right: auto;
}
table th{
	background: #F2F2F2;
}
</style>
</head>
<body class="adminbody">
	<div id="main">
		<!-- 헤더 및 네비게이션 가지고 있는 header.jsp -->
		<%@include file="/WEB-INF/views/man/header.jsp"%>
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="card mb-3" align="center">
						<h1 class="card-header" align="center">휴가 요청 관리</h1>
							<div class="card-body">
								<table class="table table-bordered">
								<thead>
									<tr align="center">
										<th scope="col">휴가 신청서 제출 날짜</th>
										<th scope="col">신청자</th>
										<th scope="col">직책</th>
										<th scope="col">휴가 날짜</th>
										<th scope="col">휴가 신청일 근무 시간</th>
										<th scope="col">사유</th>
										<th scope="col">관리</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="list" value="${list }" />
									<c:if test="${empty list }">
										<tr align="center">
											<td colspan="4">휴가 요청이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="list" items="${list }">
										<tr align="center">
											<td>${list.V_APPLY_DATE }</td>
											<td>${list.E_NAME }</td>
											<td>${list.E_POSITION }</td>
											<td><b>${list.S_YEAR }년 ${list.S_MONTH }월 ${list.S_DAY}일</b></td>
											<td>${list.S_START_TIME } - ${list.S_END_TIME }</td>
											<td>${list.V_REASON_MAIN}<br>${list.V_REASON_DETAIL }</td>
											<td>						
											<input type="button" name="agree"  data-toggle="modal" 
											data-vacation_ix="${list.VACATION_IX}" data-date="${list.S_YEAR }/${list.S_MONTH }/${list.S_DAY }"
											data-target="#agreeModal" class="btn btn-success" value="승인">
											<input type="button" name="deny" data-toggle="modal" data-vacation_ix="${list.VACATION_IX}" data-target="#denyModal" class="btn btn-danger" value="반려">
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="paging">
									${paging }
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="agreeModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-header">
                  <h2 class="modal-title" id="exampleModalLabel" style="color:green;font-weight:bold;">휴가 승인하기</h2>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
               		<p>직원의 이름, 그룹, 직책명으로 검색 후 <b>체크박스를 선택해주세요</b><b style="color:red;"> (최대 5명)</b></p>
                	<%@include file="/WEB-INF/views/module/search.jsp" %>
               </div>
            </div>
         </div>
      </div>
	
	<div id="denyModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-header">
                  <h2 class="modal-title" id="exampleModalLabel" style="color:red;font-weight:bold;">휴가 반려하기</h2>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <form name="ca_return" action="javascript:denyVacation()">
                  	<input type="hidden" name="vacation_ix">
                  	<table class="table">
                  		<tr>
                  			<td align="center" style="font-weight:bold;font-size:25px;">반려 사유 작성하기</td>
                  		</tr>
                  		<tr>
                  			<td align="center">
                  			<div class="form-group">
                  			<textarea class="form-control" name="deny_reason" rows="5" cols="80" required="required"></textarea>
                  			</div>
                  			</td>
                  		</tr>
                  		<tr>
                  			<td align="center" style="font-size:20px;">반려 사유를 근무자 에게 전송합니다.</td>
                  		</tr>
                  		<tr>
                  			<td align="center">
                  				<input type="submit" class="btn btn-danger" value="반려">
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

<script type="text/javascript" src="assets/js/httpRequest.js"></script>
<script type="text/javascript">
//모달 버튼 이벤트 처리 
$(document).ready(function() {
	
	$('#denyModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		var vacation_ix = button.data('vacation_ix');
		document.ca_return.vacation_ix.value=vacation_ix;
	});
	
	$('#agreeModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);
		var vacation_ix = button.data('vacation_ix');
		document.ca_return.vacation_ix.value=vacation_ix;
		
		var date = button.data('date');
		agreeVacation(date);
		
	});
});

//휴가 요청 승인 시 Modal에서 사용 되는 메소드
function agreeVacation(date){
	alert(date);
}

//휴가 요청 반려 선택 Modal에서 사용되는 ajax
function denyVacation()	{
	var param = 'vacation_ix='+ca_return.vacation_ix.value
				+'&deny_reason='+ca_return.deny_reason.value;
	sendRequest('denyVacation.do',param,resultDeny,'POST');
}
</script>
</html>