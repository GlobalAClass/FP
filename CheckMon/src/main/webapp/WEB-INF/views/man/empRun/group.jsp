<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CheckMon</title>
<meta name="Content" content="그룹관리">
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
								<h1 class="main-title float-left">- 그룹 관리 -</h1>
								<ol class="breadcrumb float-right">
									<li class="breadcrumb-item">Home</li>
									<li class="breadcrumb-item active">직원관리</li> 
									<li class="breadcrumb-item active">그룹관리</li> 
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="col-xl-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
						<div class="card mb-3">
							<div class="card-header">
								<h3 style="display: inline; margin : auto;">그룹 목록</h3>
								<button id="add_g_btn" class="btn btn-primary" style="float: right;">그룹 추가</button>
								<input id="add_g_name" type="text" class="form-control" placeholder="추가할 그룹 이름" width=200px style="width: 200px; float:right;">
							</div>

							<div class="card-body">

								<div class="table-responsive">
									<table id="GroupTable"
										class="table table-bordered table-hover display">
										<thead>
											<tr>
												<th><input type="checkbox" id="ck_all" value=""></th>
												<th>그룹 명</th>
											</tr>
										</thead>
									</table>
								</div>

								<input type="button" id="delete" class="btn btn-danger" value="그룹 삭제" style="margin-top: 20px;float: right;">
							</div>
						</div>
						<!-- end card-->
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
		
		//그룹 삭제 함수 - ajax
		function deleteGroup(str_group_ix){
			var str_group_ix = 'str_group_ix='+str_group_ix;
			sendRequest('delGroup.do', str_group_ix, resMsg,'POST');
		}
		
		//그룹 추가 함수- ajax
		function addGroup(arr_group_ix){
			var pram = 'e_group='+$('#add_g_name').val();
			sendRequest('addGroup.do', pram, resMsg,'POST');
		}
		function resMsg(){
			if(XHR.readyState==4){
				if(XHR.status==200){
					var data = eval('('+XHR.responseText+')');
				    var msg=data.msg;
				    
				    alert(msg);
				    location.href='goGroup.do';
				}
			}
		}
		
		$(document).ready(function() {
			$('#add_g_btn').on('click', function(){
				addGroup();
			});
			
			$('#add_g_name').keydown(function(evt) { 
				if (evt.keyCode == 13) addGroup();
			}); 
		
			var GroupTable = $('#GroupTable').DataTable({
			    "ajax": {
		        	'url' : '/CheckMon/getGroupList.do',
		       	 	'type' : 'POST'
			    	},
				"columns" : [
					{
						"className" : 'check_group',
						"orderable" : false,
						"data" : null,
						"defaultContent" : '<input type="checkbox" name="checkRow" value="">',
					},
					{"data" : "e_group"}, 
				],
				"order" : [ [ 1, 'asc' ] ]
			});
			
			//템플릿 삭제하기 버튼 숨기기
			$('#delete').hide();
			
			//체크 박스 개별 선택&해제시 삭제버튼 숨기고 나타내는 코드
			$('#GroupTable').on('click','input[name=checkRow]',function(){
				if($('input[name="checkRow"]').is(":checked")==true){
					$('#delete').show();
				}else{
					$('#delete').hide();
				}
			})
			
		    //체크박스 전체 선택&해제 and 삭제버튼 숨기고 나타내는 코드
		    $('#ck_all').click(function(){
		         if($('#ck_all').prop('checked')){
		            $("input[type=checkbox]").prop('checked',true);
		            $('#delete').show();
		        }else{
		            $('input[type=checkbox]').prop('checked',false);
		            $('#delete').hide();
		        }
		    });

			//삭제 버튼 클릭 시 삭제할것이냐는 알림과 삭제 진행
		    $('#delete').click(function(){
		        if(confirm("삭제하시겠습니까?")){
		        	var str_group_ix = "";
		        	var len = $("input[name=checkRow]:checked").size();
		            $("input[name=checkRow]:checked").each(function(i){
						if(i>0 && i< len){
							str_group_ix += ',';
		            	}
						var row = GroupTable.row($(this).closest('tr'));
		            	str_group_ix += row.data().group_ix;
		            });
		            deleteGroup(str_group_ix); //그룹 삭제 함수
		        }else{
		            return false;
		        }
		    });
		});
		// END CODE FOR Child rows (show extra / detailed information) DATA TABLE
	</script>

	<!-- END Java Script for this page -->
	<script>

	</script>

</body>
</html>