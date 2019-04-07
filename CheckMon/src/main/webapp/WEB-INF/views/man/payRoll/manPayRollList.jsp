<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CheckMon</title>
<meta name="Content" content="급여관리">
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
								<h1 class="main-title float-left">- 급여관리 -</h1>
								<ol class="breadcrumb float-right">
									<li class="breadcrumb-item">Home</li>
									<li class="breadcrumb-item active">급여관리</li>
									<li class="breadcrumb-item active">급여관리</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="col-xl-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
						<div class="card mb-3">
							<div class="card-header">
								<h3>직원 급여 관리</h3>
							</div>

							<div class="card-body">

								<div class="table-responsive">
									<table id="ReqTable"
										class="table table-bordered table-hover display">
										<thead>
											<tr>
												<th width="55px" style="border-right: none;"></th>
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

			
			<!-- 페이지에 쓰이는 modal 모음 -->	
			
			<!-- 직원 상세 정보, 수정 modal -->
			<div id="myModal" class="modal fade bd-detail-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			   		<div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">직원 상세 정보</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
			     	 </div>
			     	 <form name="modEmp" action="modEmp.do" method="post">
			     	 <div class="modal-body">
			     		 <!-- 검색 진행하여 db에서 가져온 매장 목록 출력 -->
			     			<div class="col-12" style="text-align: center">
			     				<div >
			     					<div id="div_e_img"></div>
			     					<h2 id="e_name">이름</h2>
			     				</div>
			     				<div class="table-responsive">
									<table class="table" id="modal_table">
										<tr>
											<th>직원번호</th>
											<td id="emp_ix"></td>
										</tr>
										<tr>
											<th>이름</th>
											<td><input type="text" id="ae_name" class="form-control"></td>
										</tr>
										<tr>
											<th>직책</th>
											<td><select id="e_position" class="form-control"></select></td>
										</tr>
										<tr>
											<th>그룹</th>
											<td><select id="e_group" class="form-control"></select></td>
										</tr>
										<tr>
											<th>권한</th>
											<td><select id="authorization" class="form-control">
												<option value="false">부여하지 않음</option>
												<option value="true">관리자 권한 부여</option>
											</select></td>
										</tr>
										<tr>
											<th>번호</th>
											<td><input type="text" id="e_tel" class="form-control"></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><input type="text" id="e_email" class="form-control"></td>
										</tr>
										<tr>
											<th>생년월일</th>
											<td><input type="text" id="e_birthday" class="form-control"></td>
										</tr>
										<tr>
											<th>직원 승인일</th>
											<td id="regit_day"></td>
										</tr>
										<tr>
											<th colspan="2"><!-- table의 마지막선 추가를 위한 빈공간 --></th>
										</tr>
									</table>
								</div>
							</div>
					</div>
					<div class="modal-footer" align="center">
						<input id="req_ix" type="hidden" >
						<input id="btn-mod" class="btn btn-primary" type="submit" value="수정하기">
					</div>
					</form>
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
	<script type="text/javascript" src="assets/js/httpRequest.js"></script>

	<script>
		$(function() { 
			$("input:text").keydown(function(evt) { 
				if (evt.keyCode == 13) return false; 
			}); 
		});
		
		//직원 수정하기
		function modEmp(){
			var params = 'emp_ix='+$('#emp_ix').text()
						+'&e_name='+$('#ae_name').val()
						+'&e_position='+$('#e_position').val()
						+'&e_group='+$('#e_group').val()
						+'&authorization='+$('#authorization').val()
						+'&e_tel='+$('#e_tel').val()
						+'&e_email='+$('#e_email').val()
						+'&e_birthday='+$('#e_birthday').val();
			sendRequest('modEmp.do', params, resMsg,'POST');
		}
		
		
		function resMsg(){
			if(XHR.readyState==4){
				if(XHR.status==200){
					var data = eval('('+XHR.responseText+')');
				    var msg=data.msg;
				    
				    alert(msg);
				    location.href='empReqRunList.do';
				}
			}
		}
		
		//그룹명 가져오는 - ajax
		function getPGNames(){
			sendRequest('getPGNameList.do', null, setPG,'POST');
		}
		function setPG(){
			if(XHR.readyState==4){
				if(XHR.status==200){
					var data = eval('('+XHR.responseText+')');
				    var pg_names=data.pg_names;

				    var p_select = $('#add_e_position');
				    var e_p_select = $('#e_position');
				    var g_select = $('#add_e_group');
				    var e_g_select = $('#e_group');
				    
				    //프로퍼티 개수 구하기. - 객체 하나 넘어옴. 리스트형식이 아니기 때문에 length로 구할수 없음. 따라서 개수 따로 구해야함.
				    var p_len = Number(pg_names.p_len);
				   	var len = p_len + Number(pg_names.g_len);
				    
				    for(var i=0; i< len;i++){
				    	if(i<p_len){
					    	var opt = document.createElement("OPTION");
					    	opt.text = pg_names['e_position'+i];
					    	opt.value = pg_names['e_position'+i];
					    	p_select.append(opt);
					    	var opt1 = document.createElement("OPTION");
					    	opt1.text = pg_names['e_position'+i];
					    	opt1.value = pg_names['e_position'+i];
					    	e_p_select.append(opt1);
				    	}else{
				    		var opt = document.createElement("OPTION");
					    	opt.text = pg_names['e_group'+(i-p_len)];
					    	opt.value = pg_names['e_group'+(i-p_len)];
					    	g_select.append(opt);
					    	var opt1 = document.createElement("OPTION");
					    	opt1.text = pg_names['e_group'+(i-p_len)];
					    	opt1.value = pg_names['e_group'+(i-p_len)];
					    	e_g_select.append(opt1);
				    	}
				    }
				}
			}
		}
		
		$(document).ready(function() {
			//select에 사용될 직책, 그룹 세팅
			getPGNames();
			
			//직원 수정하기 onclick 함수
			$('#btn-mod').on('click', function(){
				modEmp();
			});
			
			//직원 요청 테이블
			var ReqTable = $('#ReqTable').DataTable({
			    "ajax": {
		        	'url' : '/CheckMon/getReqList.do',
		       	 	'type' : 'POST'
			    	},
				"columns" : [ 
					{"data" : "imgpath", "orderable" : false}, 
					{"data" : "e_name"}, 
					{"data" : "e_birthday"},
					{"data" : "e_tel"},
					{"data" : "e_email"},
					{
						"className" : 'add_refuse',
						"orderable" : false,
						"data" : null,
						"defaultContent" : '&nbsp;<img src="assets/images/empReqRunList/add-user.svg" class="addEmp" data-toggle="modal" data-target=".bd-add-modal" width=30px height=30px> &emsp; <img src="assets/images/empReqRunList/remove-user.svg" class="refuseEmp" data-toggle="modal" data-target=".bd-refuse-modal" width=30px height=30px>'
					}
				],
				"order" : [ [ 1, 'asc' ] ]
			});
			
			//modal 이미지 세팅 함수
			function setImg(row, modal, id){
				var div_img = modal.find(id);
				div_img.empty();
				div_img.append(row.data().imgpath);
				div_img.find('img').attr("width",'75px');
				div_img.find('img').attr("height",'80px');
			}
			
			//직원 요청 승인 modal
			$('#ReqTable tbody').on('click', 'td.add_refuse img.addEmp', function() {
				var row = ReqTable.row($(this).closest('tr'));
				var add_modal = $('.bd-add-modal');
				
				setImg(row, add_modal, '#add_e_img');
				add_modal.find('#add_e_name').text(row.data().e_name);
				add_modal.find('#add_emp_ix').val(row.data().emp_ix);
				add_modal.find('#add_req_ix').val(row.data().req_ix);
			});
			
			//직원 요청 거절 modal
			$('#ReqTable tbody').on('click', 'td.add_refuse img.refuseEmp', function() {
				var row = ReqTable.row($(this).closest('tr'));
				var ref_modal = $('.bd-refuse-modal');
				
				setImg(row, ref_modal, '#ref_e_img');
				ref_modal.find('#ref_e_name').text(row.data().e_name);
				ref_modal.find('#ref_r_ix').val(row.data().req_ix);
			});

			//직원 목록 테이블
			var RunTable = $('#RunTable').DataTable({
				"ajax": {
		        	'url' : '/CheckMon/getRunList.do',
		       	 	'type' : 'POST'
			    	},
				"columns" : [ 
					{
						"className" : 'check',
						"orderable" : false,
						"data" : null,
						"defaultContent" : '<input type="checkbox">'
					},
					{"data" : "e_group"},
					{"data" : "imgpath", "orderable" : false},
					{"data" : "e_name"},
					{"data" : "e_position"},
					{"data" : "e_tel"},
					{"data" : "e_email"},
					{
						"className" : 'details',
						"orderable" : false,
						"data" : null,
						"defaultContent" : '<img src="assets/images/empReqRunList/edit.svg" width="40px" height="40px" class="btn btn-info" data-toggle="modal" data-target=".bd-detail-modal-lg" style="background : white">'
					},
				],
				"order" : [ [ 1, 'asc' ] ]
			});

			
			// 직원 수정 modal form
			$('#RunTable tbody').on('click', 'td.details img', function() {
				var tr = $(this).closest('tr');
				var row = RunTable.row(tr);
				var m_t = $('#modal_table');
				
				setImg(row, $('.bd-detail-modal-lg'), '#div_e_img');
				$('#e_name').text(row.data().e_name);
				$('#req_ix').val(row.data().req_ix);
				m_t.find('#emp_ix').text(row.data().emp_ix);
				m_t.find('#ae_name').val(row.data().e_name);
				m_t.find('#e_position').val(row.data().e_position);
				m_t.find('#e_group').val(row.data().e_group);
				m_t.find('#authorization').val(row.data().authorization);
				m_t.find('#e_tel').val(row.data().e_tel);
				m_t.find('#e_email').val(row.data().e_email);
				m_t.find('#e_birthday').val(row.data().e_birthday);
				m_t.find('#regit_day').text(row.data().regit_day);
			});
		});
		// END CODE FOR Child rows (show extra / detailed information) DATA TABLE
	</script>

	<!-- END Java Script for this page -->


</body>
</html>