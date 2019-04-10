<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta charset="utf-8">
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

<!-- BEGIN CSS for this page -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<!-- END CSS for this page -->
<style>
table th{
	background: #F2F2F2;
}
</style>
</head>
<body class="adminbody">

<div id="main">

	<!-- 헤더 및 네비게이션 가지고 있는 header.jsp -->
	<%@include file="header.jsp" %>

    <div class="content-page">
	
		<!-- Start content -->
        <div class="content">
            
			<div class="container-fluid">
					
						<div class="row">
									<div class="col-xl-12">
											<div class="breadcrumb-holder">
													<h1 class="main-title float-left">메인화면</h1>
													<ol class="breadcrumb float-right">
														<li class="breadcrumb-item">Home</li>
														<li class="breadcrumb-item active">관리자</li>
													</ol>
													<div class="clearfix"></div>
											</div>
									</div>
						</div>
						<!-- end row -->
					
					<div class="col-xl-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
						<div class="card mb-3">
							<div class="card-header">
								<h2 align="left">근태 변경 신청 목록</h2>
								<div align="right"><a href="commuteApplyAllList.do"><input type="button" class="btn btn-secondary" value="근태 변경 신청 목록 바로가기"></a></div>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="ReqTable"
										class="table table-bordered table-hover display">
										<thead>
											<tr align="center">
												<th>근태 변경 날짜</th>
												<th>신청자</th>
												<th>기록된 근태 시간</th>
												<th>변경 요청  시간</th>
												<th>처리상태</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${empty list}">
											<td colspan="5" align="center">근무 변경 신청 목록이 존재하지 않습니다.</td>
										</c:if>
										<c:forEach var="dto" items="${list}">
											<tr align="center">
												<td>${dto.workday}</td>
												<td>${dto.e_name}</td>
												<td>${dto.worktime}</td>
												<td>${dto.c_worktime}</td>
												 <c:choose>
							  						<c:when test="${dto.progress=='승인'}">
							  							<td style="color:green;font-weight:bold;">승인</td>
							  						</c:when>
							  						<c:when test="${dto.progress=='반려'}">
							  							<td style="color:red;font-weight:bold;">반려</td>
							  						</c:when>
							  						<c:otherwise>
							  							<td style="font-weight:bold;">${dto.progress}</td>
							  						</c:otherwise>
							 					 </c:choose>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- end card-->
					
					<!-- end card-->
					
            </div>
			<!-- END container-fluid -->

		</div>
		<!-- END content -->

    </div>
	<!-- END content-page -->
    
	<footer class="footer">
		<span class="text-right">
		Copyright CheckMon
		</span>
	</footer>

</div>
<!-- END main -->

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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

	<!-- Counter-Up-->
	<script src="assets/plugins/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="assets/plugins/counterup/jquery.counterup.min.js"></script>			
</body>
</html>