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
b{

}
</style>
</head>
<body class="adminbody">
	<div id="main">
		<!-- 헤더 및 네비게이션 가지고 있는 header.jsp -->
		<%@include file="/WEB-INF/views/emp/header.jsp"%>
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="card mb-3" align="center">
						<h1 class="card-header" align="center">휴가 신청 목록</h1>
							<div class="card-body">
								<table class="table table-bordered">
								<thead>
									<tr align="center">
										<th scope="col">휴가 날짜</th>
										<th scope="col">근무 시간대</th>
										<th scope="col">진행상황</th>
										<th scope="col">상세 확인</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="list" value="${list }" />
									<c:if test="${empty list }">
										<tr align="center">
											<td colspan="4">휴가 신청 목록이 존재하지 않습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="list" items="${list }">
										<tr align="center">
											<td>${list.S_YEAR }년 ${list.S_MONTH }월 ${list.S_DAY }일</td>
											<td>${list.S_START_TIME } - ${list.S_END_TIME }</td>
											<td><input type="text" style="border:none" readonly value="${list.V_PROGRESS}"></td>
											<td>
											<c:set var="v_progress" value="${list.V_PROGRESS }"/>	
											<c:choose>
												<c:when test="${v_progress eq '승인' }">
												<input type="button" name="agree" data-toggle="modal" data-vacation_date="${list.S_YEAR }년 ${list.S_MONTH }월 ${list.S_DAY }일"
												data-v_progress="${v_progress }" data-v_reason_m="${list.V_REASON_MAIN }" data-emp_ix="${list.V_SUBSTITUTE_EMP_IX }"
												data-target="#agreeModal" class="btn btn-primary" value="휴가 상세정보 확인">
												</c:when>
												<c:when test="${v_progress eq '반려' }">
												<input type="button" name="deny" data-toggle="modal" data-vacation_date="${list.S_YEAR }년 ${list.S_MONTH }월 ${list.S_DAY }일" 
												data-v_progress="${v_progress }" data-v_deny_reason="${list.V_DENY_REASON }"
												data-target="#denyModal" class="btn btn-primary" value="휴가 상세정보 확인">
												</c:when>
												<c:otherwise>
												<input type="button" name="agree" data-toggle="modal" data-vacation_date="${list.S_YEAR }년 ${list.S_MONTH }월 ${list.S_DAY }일" 
												data-v_progress="${v_progress }" data-v_reason_m="${list.V_REASON_MAIN }" data-emp_ix=""
												data-target="#agreeModal" class="btn btn-primary" value="휴가 상세정보 확인">
												</c:otherwise>
											</c:choose>
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
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h2 class="modal-title" id="exampleModalLabel" style="font-weight:bold;">휴가 상세 정보</h2>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                <table class="table">
                	<tr>
                		<th>휴가 날짜</th>
                	</tr>
                	<tr>
                		<td><span id="vacation_date"></span></td>
                	</tr>
                	<tr>
                		<th>진행 상황</th>
                	</tr>
                	<tr>
                		<td><input type="text" style="border:none" readonly id="v_progress"></td>
                	</tr>
                	<tr>
                		<th>신청 사유</th>
                	</tr>
                	<tr>
                		<td><span id="v_reason_m"></span></td>
                	</tr>
                	<tr class="sub_loc">
                		<th>대리 근무자 정보</th>
                	</tr>
                	<tr class="sub_loc">
                		<td><div id="sub_emp"></div></td>
                	</tr>
                </table>
               </div>
            </div>
         </div>
      </div>
	
	<div id="denyModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabe2" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h2 class="modal-title" id="exampleModalLabe2" style="font-weight:bold;">휴가 상세 정보</h2>
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
	                		<th>휴가 날짜</th>
	                	</tr>
	                	<tr>
	                		<td><span id="vacation_date"></span></td>
	                	</tr>
	                	<tr>
	                		<th>진행 상황</th>
	                	</tr>
	                	<tr>
	                		<td><input type="text" style="border:none" readonly id="v_progress"></td>
	                	</tr>
	                	<tr>
	                		<th>반려 사유</th>
	                	</tr>
	                	<tr>
	                		<td><span id="v_deny_reason"></span></td>
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
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>


<script type="text/javascript" src="assets/js/httpRequest.js"></script>
<script>

function getSubEmp(emp_ix){
	param = 'emp_ix='+emp_ix;
	sendRequest('getSubstituteEmp.do',param,resultSub,'GET')
}

function resultSub(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = eval('('+XHR.responseText+')');
		    $('#agreeModal').find('#sub_emp').text(data.name+'\n'+data.tel);
		}
	}
}

$(document).ready(function() {
	
	$('#agreeModal').on('show.bs.modal', function (event) {
		
		var button = $(event.relatedTarget)
		var vacation_date = button.data('vacation_date');
		var v_progress = button.data('v_progress');
		var v_reason_m = button.data('v_reason_m');
		var emp_ix = button.data('emp_ix');
		
		if(emp_ix==''){
			$('.sub_loc').hide();
		}else{
			$('.sub_loc').show();
		}
		
		getSubEmp(emp_ix);
		
		var modal=$(this);
		modal.find('#vacation_date').text(vacation_date);
		modal.find('#v_progress').val(v_progress);
		modal.find('#v_reason_m').text(v_reason_m);
	});
	
	$('#denyModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget)
		var vacation_date = button.data('vacation_date');
		var v_progress = button.data('v_progress');
		var v_deny_reason = button.data('v_deny_reason');
		
		var modal=$(this);
		modal.find('#vacation_date').text(vacation_date);
		modal.find('#v_progress').val(v_progress);
		modal.find('#v_deny_reason').text(v_deny_reason);
	});

	$('input[value=승인]').css({'color':'green','font-weight':'bold','font-size':'15px'});
	$('input[value=반려]').css({'color':'red','font-weight':'bold','font-size':'15px'});
	$('input[value^=관]').css({'color':'gray','font-weight':'bold','font-size':'15px'});
	$('input[value^=대]').css({'color':'blue','font-weight':'bold','font-size':'15px'});
});
</script>
</html>