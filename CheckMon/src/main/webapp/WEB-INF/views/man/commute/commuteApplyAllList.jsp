<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix="c"%>
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

<!-- 링크창 맨 위에 아이콘 -->
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
						<h1 class="card-header" align="center">근무 변경신청 목록</h1>
						<div class="card-body">
							<table class="table table-bordered">
								<thead>
									<tr align="center">
										<th scope="col">근태 변경 신청 날짜</th>
										<th scope="col">신청자</th>
										<th scope="col">기록된 근태 시간</th>
										<th scope="co1">변경 요청 시간</th>
										<th scope="co1">제목</th>
										<th scope="co1">사유</th>
										<th scope="co1">처리 상태</th>
										<th scope="co1">관리</th>
									</tr>
								</thead>
								<tbody>
									<tr align="center">
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><input type="button" data-toggle="modal" data-target=".bd-example-modal-lg" class="btn btn-danger" value="반려확인"></td>
									</tr>
								</tbody>
							</table>
							<div id="paging">
								<!-- 페이징-->
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
						<h2 class="modal-title" id="exampleModalLabel">근태 변경 반려 하기</h2>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form class="form-inline" name="applyReturn" action="commuteApplyReturn.do">
							
						</form>
					</div>
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
</html>