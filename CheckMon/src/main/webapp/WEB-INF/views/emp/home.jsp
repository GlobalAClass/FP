<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
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
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
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
												<li class="breadcrumb-item active">근무자</li>
										</ol>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
						<!-- end row -->
						
						<div class="visible-xs-block" align="center">
							<button class="btn btn-primary btn-lg" onclick="javascript:location.href='loadingGPS.do';">
								<c:if test="${false eq working}">출근하기</c:if>
								<c:if test="${true eq working}">퇴근하기</c:if>
							</button>
						</div>
						
						<div class="card mb-3" align="center">
						<h1 class="card-header" align="center">휴가 신청 목록</h1>
						<div align="right"><a href="vacationListEmp.do"><input type="button" class="btn btn-secondary" value="휴가 신청 목록 바로가기"></a></div>
							<div class="card-body">
								<table class="table table-bordered">
								<thead>
									<tr align="center">
										<th scope="col">휴가 날짜</th>
										<th scope="col">근무 시간대</th>
										<th scope="col">진행상황</th>
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
											<td>${list.V_DATE}</td>
											<td>${list.V_TIME}</td>
											<td><input type="text" style="border:none" readonly value="${list.V_PROGRESS}"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="paging">
									${paging }
							</div>
						</div>
					</div>
			
					
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

<!-- END Java Script for this page -->
<script>
$('input[value=승인]').css({'color':'green','font-weight':'bold','font-size':'15px'});
$('input[value=반려]').css({'color':'red','font-weight':'bold','font-size':'15px'});
$('input[value^=관]').css({'color':'gray','font-weight':'bold','font-size':'15px'});
$('input[value^=대]').css({'color':'blue','font-weight':'bold','font-size':'15px'});
</script>
</body>
</html>