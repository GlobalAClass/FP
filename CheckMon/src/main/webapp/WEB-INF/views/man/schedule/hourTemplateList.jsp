<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<!-- BEGIN CSS for this page -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<!-- END CSS for this page -->

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
						<h1 class="card-header" align="center">근무 시간 템플릿 관리</h1>
						<div class="card-body">
							<div align="right" style="margin-bottom: 10px;">
								<input type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg" value="템플릿 만들기" onclick="position()">
							</div>
							<table class="table table-bordered">
								<thead>
									<tr align="center">
										<th scope="col"><input type="checkbox" id="ck_all"></th>
										<th scope="col">템플릿명</th>
										<th scope="col">근무 시간</th>
										<th scope="col">직책명</th>
									</tr>
								</thead>
								<tbody>
								<c:set var="list" value="${list }" />
								<c:if test="${empty list }">
									<tr align="center">
										<td colspan="4">템플릿이 존재하지 않습니다. 템플릿을 만들어주세요.</td>
									</tr>
								</c:if>
								<c:forEach var="list" items="${list }">
									<tr align="center">
										<td><input type="checkbox" name="checkRow" value="${list.hour_template_ix }"></td>
										<td>${list.template_name }</td>
										<td>${list.hour_start_time } - ${list.hour_end_time}</td>
										<td>${list.template_position }</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<div align="left">
								<input type="button" id="delete" class="btn btn-danger" value="템플릿 삭제하기">
							</div>
							<div id="paging">
								${paging }
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">근무 시간 템플릿 만들기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form class="form-inline" name="template" onsubmit="return checked()" action="javascript:insertTemp()">
					<div class="modal-body">
						<table class="table">
							<tr>
								<th>템플릿 명</th>
								<td><input class="form-control" type="text" name="template_name" placeholder="내용을 입력해주세요"></td>
							</tr>
							<tr>
								<th>근무 시간대</th>
								<td>
								<input type="hidden" name="hour_start_time">
								<input type="hidden" name="hour_end_time">
								<div class="form-group">
									<select class="form-control" id="start_m">
										<option value="AM">AM</option>
										<option value="PM">PM</option>
									</select>
									&nbsp;
									<input type="text" class="form-control" name="start_hour" maxlength="2" size="5">&nbsp;:&nbsp;<input type="text" class="form-control" name="start_min" maxlength="2" size="5">
									&nbsp;~&nbsp;
									<select class="form-control" id="end_m">
										<option value="AM">AM</option>
										<option value="PM">PM</option>
									</select>
									&nbsp;
									<input type="text" class="form-control" name="end_hour" maxlength="2" size="5">&nbsp;:&nbsp;<input type="text" class="form-control" name="end_min" maxlength="2" size="5">
								</div>
								</td>
							</tr>
							<tr>
								<th>직책명</th>
								<td>
									<select class="form-control" id="loc_position" name="template_position">
									</select>
								</td>
							</tr>
							<tr align="right">
								<td colspan="2">
									<input class="btn btn-success" type="submit" value="스케줄 추가하기">
								</td>
							</tr>
						</table>
					</div>
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
<script src="assets/js/jquery-ui.min.js"></script>
<script type="text/javascript">
	//스케줄 시작 시간, 마감 시간 계산하는 함수
	function setTempTime() {

		var m1 = document.getElementById('start_m');
		var m2 = document.getElementById('end_m');

		var start_hour = template.start_hour.value;
		var end_hour = template.end_hour.value;

		if (m1.options[m1.selectedIndex].value == 'PM') {
			start_hour = parseInt(start_hour) + 12;
		}
		if (m2.options[m2.selectedIndex].value == 'PM') {
			end_hour = parseInt(end_hour) + 12;
		}

		template.hour_start_time.value = start_hour + ':'
				+ template.start_min.value;
		template.hour_end_time.value = end_hour + ':' + template.end_min.value;
	}

	//Submit 전에 유효성 검사
	function checked() {

		if (template.template_name.value == '') {
			alert('템플릿 명을 입력해주세요.');
			return false;
		} else if (template.start_hour.value == ''
				|| template.start_min.value == ''
				|| template.end_hour.value == ''
				|| template.end_min.value == '') {
			alert('근무 시간을 모두 입력해주세요.');
			return false;
		} else if (template.template_position.value == '') {
			alert('직책명을 선택해주세요.');
			return false;
		} else {
			setTempTime();
			return true;
		}

	}

	//ajax 이용하여 값 전송후 메세지 결과와 이동 화면값 받아와서 이동 및 메세지 출력(실패할때만)
	function insertTemp() {

		var param = 'template_name=' + template.template_name.value
				+ '&hour_start_time=' + template.hour_start_time.value
				+ '&hour_end_time=' + template.hour_end_time.value
				+ '&template_position=' + template.template_position.value;
		sendRequest('hourTemplateAdd.do', param, resultAdd, 'POST');
	}

	function resultAdd() {
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

	//전체선택 및 선택 한 값 삭제
	$(document).ready(function() {

		//템플릿 삭제하기 버튼 숨기기
		$('#delete').hide();

		//체크 박스 개별 선택&해제시 삭제버튼 숨기고 나타내는 코드
		$('input[name=checkRow]').click(function() {
			if ($('input[name="checkRow"]').is(":checked") == true) {
				$('#delete').show();
			} else {
				$('#delete').hide();
			}
		})

		//체크박스 전체 선택&해제 and 삭제버튼 숨기고 나타내는 코드
		$('#ck_all').click(function() {
			if ($('#ck_all').prop('checked')) {
				$("input[type=checkbox]").prop('checked', true);
				$('#delete').show();
			} else {
				$('input[type=checkbox]').prop('checked', false);
				$('#delete').hide();
			}
		});

		//삭제 버튼 클릭 시 삭제할것이냐는 알림과 삭제 진행
		$('#delete').click(function() {
			if (confirm("삭제하시겠습니까?")) {
				$("input[name=checkRow]:checked").each(function() {
					var tr_value = $(this).val();
					deleteTemplate(tr_value); //삭제 진행하는 함수
				});
			} else {
				return false;
			}
		});

	});

	//ajax 이용하여 템플릿 삭제 구현
	function deleteTemplate(tr_value) {
		var params = 'hour_template_ix=' + tr_value;
		sendRequest('hourTemplateDel.do', params, resultDel, 'POST');
	}

	//템플릿 삭제 후 삭제 실패하면 메세지 출력 & list로 location 설정
	function resultDel() {
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

	
	function position(){
		sendRequest('getPositionList.do',null,resultPosition,'POST');
	}

	function resultPosition(){
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = eval('(' + XHR.responseText + ')');
				var tempList = data.data;
				
 				//템플릿이 존재하지 않는 경우, 근무시간 템플릿 만드는 화면으로 이동
				if(tempList.length==0){
					alert('직책을 생성해주세요.');
					location.href="goPosition.do";
				}else{
					
					var loc_position = document.getElementById('loc_position');
					
					for(var i=0;i<tempList.length;i++){
						list=tempList[i];
						
						var opt = document.createElement('option');
						opt.text = list.e_position;
						opt.value = list.e_position;
						
						loc_position .options.add(opt);
					}
				} 
			}
		}
	}
	
</script>
</html>