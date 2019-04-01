<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CheckMon</title>
<meta name="Content" content="직원관리">
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
<style>
td.details-control {
	background: url('assets/plugins/datatables/img/details_open.png')
		no-repeat center center;
	cursor: pointer;
}

tr.shown td.details-control {
	background: url('assets/plugins/datatables/img/details_close.png')
		no-repeat center center;
}

img {
	cursor: pointer;
}

#modal_table td{
	border-left: 1px solid black
}
</style>
<!-- END CSS for this page -->
</head>
<body class="adminbody">

	<div id="main">

		<!-- 헤더 및 네비게이션 가지고 있는 header.jsp -->
		<%@include file="../header.jsp"%>

		<div class="content-page">

			<div class="container-fluid">
				<!-- Start content -->
				<div class="content">
					<div class="row">
						<div class="col-xl-12">
							<div class="breadcrumb-holder">
								<h1 class="main-title float-left">- 직원 관리 -</h1>
								<ol class="breadcrumb float-right">
									<li class="breadcrumb-item">Home</li>
									<!-- <li class="breadcrumb-item active">Data Tables</li>  -->
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="col-xl-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
						<div class="card mb-3">
							<div class="card-header">
								<h3>직원 승인 요청</h3>
							</div>

							<div class="card-body">

								<div class="table-responsive">
									<table id="ReqTable"
										class="table table-bordered table-hover display">
										<thead>
											<tr>
												<th>사진</th>
												<th>이름</th>
												<th>생년월일</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th width=90px style="text-align: center">승인 / 거절</th>
											</tr>
										</thead>
									</table>
								</div>

							</div>
						</div>
						<!-- end card-->
					</div>

					<div class="col-xl-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
						<div class="card mb-3">
							<div class="card-header">
								<h3>직원 목록</h3>
							</div>

							<div class="card-body">

								<div class="table-responsive">
									<form name="RunTable" action="" method="get">
									<table id="RunTable"
										class="table table-bordered table-hover display">
										<thead>
											<tr>
												<th></th>
												<th>그룹</th>
												<th></th>
												<th>직원이름</th>
												<th>직책</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th width=40px style="text-align: center">수정</th>
											</tr>
										</thead>
									</table>
									</form>
								</div>

							</div>
						</div>
						<!-- end card-->
					</div>
				</div>
				
			<input type="text" class="form-control" id="s_name" required="required" size="50" placeholder="찾기 버튼을 눌러주세요." readonly="readonly">&nbsp;
			<input type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg" value="매장 찾기">
			<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			   		<div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">직원 상세 정보</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
			     	 </div>
			     	 <div class="modal-body">
			     		 <!-- 검색 진행하여 db에서 가져온 매장 목록 출력 -->
			     			<div class="col-12" style="text-align: center">
			     				<div >
			     					<img src="img/profile_default.jpg" width="90px" height="100px">
			     					<h2 id=name>윤지훈</h2>
			     				</div>
			     				<div class="table-responsive">
									<table class="table" id="modal_table">
										<tr>
											<th>직원번호</th>
											<td id="emp_Ix"></td>
										</tr>
										<tr>
											<th>이름</th>
											<td><input type="text" id="e_name"></td>
										</tr>
										<tr>
											<th>직책</th>
											<td><input type="text" id="e_position"></td>
										</tr>
										<tr>
											<th>그룹</th>
											<td><input type="text" id="e_group"></td>
										</tr>
										<tr>
											<th>권한</th>
											<td><input type="text" id="authorization"></td>
										</tr>
										<tr>
											<th>핸드폰 번호</th>
											<td><input type="text" id="e_tel"></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><input type="text" id="e_email"></td>
										</tr>
										<tr>
											<th>생년월일</th>
											<td><input type="text" id="e_birthDay"></td>
										</tr>
										<tr>
											<th colspan="2"><!-- table의 마지막선 추가를 위한 빈공간 --></th>
										</tr>
									</table>
								</div>
							</div>
					</div>
					<div class="modal-footer" align="center">
					<!-- 클릭한 매장 정보 -->
						<input type="hidden" id="choose_store" name="man_ix" value="">
						<input type="hidden" id="store_name" value="">
						<input class="btn btn-success" type="button" value="매장 등록하기" onclick="checkStore();">
					</div>
					</div>
			    </div>
			  </div>
			  
			</div>
			<!-- END content -->

		</div>
		<!-- END content-page -->

		<footer class="footer">
			<span class="text-right"> Copyright <a target="_blank"
				href="#">Your Website</a>
			</span> <span class="float-right"> Powered by <a target="_blank"
				href="https://www.pikeadmin.com"><b>Pike Admin</b></a>
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
	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

	<!-- Counter-Up-->
	<script src="assets/plugins/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="assets/plugins/counterup/jquery.counterup.min.js"></script> 

	<script>
		// START CODE FOR Child rows (show extra / detailed information) DATA TABLE 
		function format(d) {
			// `d` is the original data object for the row
			return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px; margin: 0px auto">'
						+ '<tr>'
							+ '<th>생년월일</th>'
							+ '<th>직원 승인일</th>'
							+ '<th>근무일수</th>'
						+ '</tr>'
						+ '<tr>'
							+ '<td>' + d.name + '</td>'
							+ '<td>' + d.extn + '</td>'
							+ '<td>...</td>'
						+ '</tr>'
					+ '</table>';
		}

		$(document).ready(function() {
			var table = $('#ReqTable').DataTable({
				"ajax" : "assets/data/dataTablesObjects.txt",
				"columns" : [ 
					{"data" : "name"}, 
					{"data" : "position"}, 
					{"data" : "office"},
					{"data" : "salary"},
					{"data" : "start_date"},
					{
						"className" : null,
						"orderable" : false,
						"data" : null,
						"defaultContent" : '&nbsp;<img src="assets/images/empReqRunList/add-user.svg" onclick="addEmp()" width=30px height=30px> &emsp; <img src="assets/images/empReqRunList/remove-user.svg" onclick="refuseEmp()" width=30px height=30px>'
					}
				],
				"order" : [ [ 1, 'asc' ] ]
			});

			// Add event listener for opening and closing details
			$('#ReqTable tbody').on('click', 'td.details-control1', function() {
				var tr = $(this).closest('tr');
				var row = table.row(tr);
				
				if (row.child.isShown()) {
					// This row is already open - close it
					row.child.hide();
					tr.removeClass('shown');
				} else {
					// Open this row
					row.child(format(row.data())).show();
					tr.addClass('shown');
				}
			});
			
			
			var table = $('#RunTable').DataTable({
				//"ajax" : "assets/data/dataTablesObjects.txt",
				"data": [
						    {
						      "id": "1",
						      "name": "Tiger Nixon",
						      "position": "System Architect",
						      "salary": "$320,800",
						      "start_date": "2011/04/25",
						      "office": "Edinburgh",
						      "extn": "5421"
						    },
						    {
						      "id": "2",
						      "name": "Garrett Winters",
						      "position": "Accountant",
						      "salary": "$170,750",
						      "start_date": "2011/07/25",
						      "office": "Tokyo",
						      "extn": "8422"
						    },
						    {
						      "id": "3",
						      "name": "Ashton Cox",
						      "position": "Junior Technical Author",
						      "salary": "$86,000",
						      "start_date": "2009/01/12",
						      "office": "San Francisco",
						      "extn": "1562"
						    }
						],
				"columns" : [ 
					{
						"className" : 'check',
						"orderable" : false,
						"data" : null,
						"defaultContent" : '<input type="checkbox">'
					},
					{"data" : null},
					{"orderable" : false, "defaultContent" : '<img src="WEB-INF/img/emp/profile_default.jpg" width=60px height=50px>'},
					{"data" : "name"},
					{"data" : "position"},
					{"data" : "office"},
					{"data" : "salary"},
					{
						"className" : 'details',
						"orderable" : false,
						"data" : null,
						"defaultContent" : '<img src="assets/images/empReqRunList/edit.svg" width="40px" height="40px" class="btn btn-info" data-toggle="modal" data-target=".bd-example-modal-lg" style="background : white">'
					},
				],
				"order" : [ [ 1, 'asc' ] ]
			});

			// 직원 체크
			$('#RunTable tbody').on('click', 'td.check input', function() {
				var tr = $(this).closest('tr');
				var row = table.row(tr);
				
				alert(row.data().id);
			});
			
			// 직원 수정
			$('#RunTable tbody').on('click', 'td.details img', function() {
				var tr = $(this).closest('tr');
				var row = table.row(tr);
				
				//json객체에 맞게 이름 수정하기
				var m_t = $('#modal_table');
				m_t.find('#emp_Ix').text(row.data().id);
				m_t.find('#e_name').val(row.data().name);
				m_t.find('#e_position').val(row.data().position);
				m_t.find('#e_group').val(row.data().group);
				m_t.find('#authorization').val(row.data().authorization);
				m_t.find('#e_tel').val(row.data().tel);
				m_t.find('#e_birthDay').val(row.data().birthDay);
				
				
			});
		});
		// END CODE FOR Child rows (show extra / detailed information) DATA TABLE
	</script>

	<script>
		//직원 승인 이미지 클릭 시
		function addEmp(){
			alert('승인');
		}
		//직원 거절 이미지 클릭 시
		function refuseEmp(){
			alert('거절');
		}
	</script>
	<!-- END Java Script for this page -->

</body>
</html>