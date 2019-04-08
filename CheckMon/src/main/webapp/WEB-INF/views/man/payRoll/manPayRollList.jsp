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

<!-- Switchery css -->
<link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />
	

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
	<link href="assets/plugins/datetimepicker/css/daterangepicker.css" rel="stylesheet" />s
<style>
img {
	cursor: pointer;
}
#modal_table td{
	border-left: 1px solid black
}
td.details-control {
	background: url('assets/plugins/datatables/img/details_open.png') no-repeat center center;
	cursor: pointer;
}
tr.shown td.details-control {
	background: url('assets/plugins/datatables/img/details_close.png') no-repeat center center;
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
								<div class="text-center" style="margin: 10px auto; text-align: center;">
									<input type="text" class="form-control text-center" id="daterange" name="daterange"
										 value="" style="width: 250px; margin: 10px auto"/>
								</div>

								<div class="table-responsive">
									<table id="PayRollTable"
										class="table table-bordered table-hover display">
										<thead>
											<tr>
												<th width="55px" style="border-right: none;"></th>
												<th>이름</th>
												<th>직책</th>
												<th>그룹</th>
												<th>지급총액</th>
												<th>공제총액</th>
												<th>총실지급여액</th>
											</tr>
										</thead>
									</table>
								</div>

							</div>
						</div>
						<!-- end card-->
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
		
	<script src="assets/plugins/datetimepicker/js/daterangepicker.js"></script>
 
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
		
		function format ( d ) {
		    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
		        '<tr>'+
		            '<th>기본 수당:</td>'+
		            '<th>추가 수당</td>'+
		            '<th>야근 수당</td>'+
		            '<th>주휴 수당</td>'+
		            '<th>공휴일 수당</td>'+
		        '</tr>'+
		        '<tr>'+
		            '<td>'+d.extn+'</td>'+
		            '<td>'+d.extn+'</td>'+
		            '<td>'+d.extn+'</td>'+
		            '<td>'+d.extn+'</td>'+
		            '<td>'+d.extn+'</td>'+
		        '</tr>'+
		    '</table>'+
		    '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
		        '<tr>'+
		            '<th>소득세</td>'+
		            '<th>주민세</td>'+
		            '<th>국민 연금</td>'+
		            '<th>건강 보험</td>'+
		        '</tr>'+
		        '<tr>'+
		            '<td>'+d.extn+'</td>'+
		            '<td>'+d.extn+'</td>'+
		            '<td>'+d.extn+'</td>'+
		            '<td>'+d.extn+'</td>'+
		        '</tr>'+
		    '</table>';
		}
		 
		
		$(document).ready(function() {
			//select에 사용될 직책, 그룹 세팅
			getPGNames();
			
			//직원 수정하기 onclick 함수
			$('#btn-mod').on('click', function(){
				modEmp();
			});
			

			
			//기간 선택용 달력
			$('#daterange').daterangepicker({ 
						startDate: '03/05/2005', 
						endDate: '03/06/2005',
						opens: "center"
			});
			
			//현재 달력 시간 맞추기.
			var cur_date = new Date();
			var start_date = cur_date.getMonth() + "/" +cur_date.getDate()+ "/"+ cur_date.getFullYear();
			var end_date = (cur_date.getMonth()+1) + "/" +cur_date.getDate()+ "/"+ cur_date.getFullYear();
			$('#daterange').data('daterangepicker').setStartDate(start_date);
			$('#daterange').data('daterangepicker').setEndDate(end_date);
			
			//달력 조작
			$('#daterange').on('apply.daterangepicker', function(ev, picker) {
			  console.log(picker.startDate.format('YYYY-MM-DD'));
			  console.log(picker.endDate.format('YYYY-MM-DD'));
			});
			
			//직원 급여 테이블
			var PayRollTable = $('#PayRollTable').DataTable({
			    "ajax": {
		        	'url' : '/CheckMon/getReqList.do',
		       	 	'type' : 'POST'
			    	},
				"columns" : [ 
					{
		                "className":      'details-control',
		                "orderable":      false,
		                "data":           null,
		                "defaultContent": ''
		            }, 
					{"data" : "e_name"}, 
					{"data" : "e_birthday"},
					{"data" : "e_tel"}
				],
				"order" : [ [ 1, 'asc' ] ]
			});
			
			$('#PayRollTable tbody').on('click', 'td.details-control', function () {
			        var tr = $(this).closest('tr');
			        var row = PayRollTable.row( tr );
			 
			        if ( row.child.isShown() ) {
			            // This row is already open - close it
			            row.child.hide();
			            tr.removeClass('shown');
			        }
			        else {
			            // Open this row
			            row.child( format(row.data()) ).show();
			            tr.addClass('shown');
			        }
			} );
			
			//modal 이미지 세팅 함수
			function setImg(row, modal, id){
				var div_img = modal.find(id);
				div_img.empty();
				div_img.append(row.data().imgpath);
				div_img.find('img').attr("width",'75px');
				div_img.find('img').attr("height",'80px');
			}
			
			//직원 요청 승인 modal
			$('#PayRollTable tbody').on('click', 'td.add_refuse img.addEmp', function() {
				var row = PayRollTable.row($(this).closest('tr'));
				var add_modal = $('.bd-add-modal');
				
				setImg(row, add_modal, '#add_e_img');
				add_modal.find('#add_e_name').text(row.data().e_name);
				add_modal.find('#add_emp_ix').val(row.data().emp_ix);
				add_modal.find('#add_req_ix').val(row.data().req_ix);
			});
			
		});
		// END CODE FOR Child rows (show extra / detailed information) DATA TABLE
	</script>

	<!-- END Java Script for this page -->
	<script>
////////////////계산 관련 ///////////////////////////////////////////////////
	  
	  function comma_add(box) {
	      var i; 
	      var inits = "";
	      var num_len = box.value.length;
	    var hoy = box.value;
	      if(hoy == "" || hoy=="NaN") {
	      if(hoy=="NaN") {
	      alert('숫자만 입력가능합니다.');
	      box.value="";
	      return false;
	      }
	      box.value="";
	      return false;  
	      }
	      for(i=0; i<num_len; i++) {
	         var sect=box.value.substring(i,i+1);
	         if (sect != ",") {
	            inits += sect;
	         }  
	      }
	      box.value = parseInt(inits);
	      
	      ing=box.value.length % 3; 
	      num_len=(box.value.length - ing) / 3;
	      sect=box.value.substring(0,ing);
	  
	      for(i=0; i<num_len; i++) {
	      if((ing == 0) && (i == 0)) {
	        sect += box.value.substring(ing+(3*i),ing+3+(3*i));  
	      } else {
	          sect += ",";
	        sect += box.value.substring(ing+(3*i),ing+3+(3*i));  
	      }
	      }
	      box.value = sect; 
	  
	      return true; 
	  }
	  function comma_del(box) {
	      var i=0;
	      var d;
	      var outstr="";
	  
	      for(d = 0; d < box.value.length ; d++) {
	      var subt= box.value.substring(d,d+1);
	    if(subt != ",") {
	    outstr += subt;
	    }
	      }     
	      box.value=outstr;
	      return true;
	  }
	  
	  function value_check(value){
	    for(i=0 ; i< value.length ; i++){
	      if((value.substring(i,i+1)) < "0" || (value.substring(i,i+1) > "9" )){
	      return false;
	      }
	    }
	    return true;
	  }
	  
	  function drop(v) {
	    var str= new String(v);
	    var length = str.length;
	    str_l=str.substr(0,length-1);
	    str_r=0;
	    str=str_l+str_r;
	    return str;
	  }
	  
	  function drop3(v) {
	    var str= new String(v);
	    var length = str.length;
	    str_l=str.substr(0,length-3);
	    str=str_l+"000";
	    return str;
	  }
	  
	  function section(value){
	    if(value.length > 3){
	      mock = Math.floor(value.length / 3) ;
	      namuji = value.length % 3;
	      won = value.substring(0,namuji);
	      for(i=0 ; i < mock ; i++){
	        if(namuji != 0){
	          won = won + ",";
	        }   
	        won = won + value.substring(namuji,namuji +3);
	        namuji = namuji + 3;
	      }
	    }else{
	      won = value;
	    }
	    return won;
	  }
	  
	  function sosu(v,n) {
	    var str= new String(v);
	    str= str.split('.');
	    //소수점이 없으면, 인자를 반환하고 함수실행을 종료한다.
	    if(str.length!=2) {
	      return v; 
	    }
	    str[1]=str[1].substr(0,n);
	    str[0]=section(str[0]);
	    // str= str.join('.');
	    // str= parseFloat(str,10);
	    str=str[0]+"."+str[1];
	    return str;
	  }
	  
	  //연금보험료
	  function count1(){
	  
	    var frm = document.tax_table;
	    
	    //, 제거
	    for (i = 0 ; i < frm.elements.length ; i++) {
	      if (frm.elements[i].type == "text") {
	        comma_del(frm.elements[i]);
	      }
	    }
	  
	    var pay = 0;
	    var total01=0;
	    var total02=0;
	    var income_exempt3 = 0;
	    
	    if(frm.pay.value == "") {
	      alert("급여총액이 입력되지 않았습니다");
	      frm.pay.focus();
	      return false;
	    }
	  
	    if( value_check(frm.pay.value) == false ) {
	      alert("급여총액이 정상적인 숫자체계가 아님니다.\n공백 혹은 콤마(,)와 같은 특수 문자가 포함되었는지 확인하세요");
	      frm.pay.focus();
	      return false;
	    }
	  
	    var pay = drop3(frm.pay.value*1);
	    if (pay < 300000) pay = 300000;
	    else if (pay >= 4680000) pay = 4680000;
	  
	    total01=pay*0.045;
	    total=pay*0.045;
	  
	    total01 = new String(total01);
	    total = new String(total);
	  
	    //소수점 이하는 버린다.
	    if (total01.indexOf(".") !=-1) {
	      total01 = total01.split(".")[0];
	    }
	    if (total.indexOf(".") !=-1) {
	      total = total.split(".")[0];
	    }
	  
	    total01 = drop(total01);
	    total = drop(total);
	  
	    frm.pay.value = pay;
	  
	    frm.total.value=parseInt(total);
	    frm.total.value=section(sosu(frm.total.value));
	    frm.total01.value=parseInt(total01);
	    frm.total01.value=section(sosu(frm.total01.value));
	    frm.total02.value=parseInt(total)+parseInt(total01);
	    frm.total02.value=section(sosu(frm.total02.value));
	  
	  
	    //, 넣기
	    for (i = 0 ; i < frm.elements.length ; i++) {
	  
	      if (frm.elements[i].type == "text") {
	        comma_add(frm.elements[i]);
	      }
	    }
	  }
	  
	  //고용보험료
	  function count3(){
	  
	    var frm = document.tax_table3;
	    
	    //, 제거
	    for (i = 0 ; i < frm.elements.length ; i++) {
	      if (frm.elements[i].type == "text") {
	        comma_del(frm.elements[i]);
	      }
	    }
	  
	    var pay = 0, e3=0, total=0;
	    var total01=0, total02=0;
	  
	    if(frm.pay.value == ""){
	      alert("급여총액이 입력되지 않았습니다");
	      frm.pay.focus();
	      return false;
	    }
	  
	    if( value_check(frm.pay.value) == false ){
	      alert("급여총액이 정상적인 숫자체계가 아님니다.\n공백 혹은 콤마(,)와 같은 특수 문자가 포함되었는지 확인하세요");
	      frm.pay.focus();
	      return false;
	    }
	  
	    var pay = frm.pay.value*1;
	    if(frm.e3[0].checked==true) { total01=pay*(0.0065+0.0025); }
	    else if(frm.e3[1].checked==true) { total01=pay*(0.0065+0.0065); }
	    else if(frm.e3[2].checked==true) { total01=pay*(0.0065+0.0085); }
	    else {total01=pay*(0.0065+0.0045);}
	  
	    total=pay*0.0065;
	  
	  
	    // 반올림 두번하기 위한 변수수정
	    var total_s1= total.toFixed(1);
	      frm.total.value=total_s1;
	      var total_s2 = frm.total.value*1;
	  
	    var total01_s1= total01.toFixed(1);
	      frm.total01.value=total01_s1;
	      var total01_s2 = frm.total01.value*1;
	  
	      frm.total.value=total_s2.toFixed(0);
	    frm.total01.value=total01_s2.toFixed(0);
	    frm.total02.value=parseInt(total_s2.toFixed(0)*1 + total01_s2.toFixed(0)*1);
	  
	  //  alert("total=" + total);
	  //  alert("total01=" + total01);
	  //  alert("total+total01=" + (total+total01) );
	  
	  
	    //, 넣기
	    for (i = 0 ; i < frm.elements.length ; i++) {
	      if (frm.elements[i].type == "text") {
	        comma_add(frm.elements[i]);
	      }
	    }
	  
	  }
	  
	  //국민건강보험료
	  function count2(){
	  
	    var frm = document.tax_table2;
	    //, 제거
	    for (i = 0 ; i < frm.elements.length ; i++) {
	      if (frm.elements[i].type == "text") {
	        comma_del(frm.elements[i]);
	      }
	    }
	  
	    var pay = 0, e3=0, total=0;
	    var total01=0, total02=0;
	  
	    if(frm.pay.value == "") {
	      alert("급여총액이 입력되지 않았습니다");
	      frm.pay.focus();
	      return false;
	    }
	  
	    if( value_check(frm.pay.value) == false ){
	      alert("급여총액이 정상적인 숫자체계가 아님니다.\n공백 혹은 콤마(,)와 같은 특수 문자가 포함되었는지 확인하세요");
	      frm.pay.focus();
	      return false;
	    }
	  
	    var pay = frm.pay.value*1;
	    if(pay < 280000) pay = 280000;
	      if(pay > 78100000) pay = 78100000;
	      
	    total01=pay*(6.46/2*0.01); //2013
	    total=pay*(6.46/2*0.01); //2013
	    total01 = new String(total01);
	    total = new String(total);
	  
	    //소수점 이하는 버린다.
	    if (total01.indexOf(".") !=-1) {
	      total01 = total01.split(".")[0];
	    }
	    if (total.indexOf(".") !=-1) {
	      total = total.split(".")[0];
	    }
	  
	  
	    total01 = drop(total01);
	    total = drop(total);
	    
	    frm.total[0].value=parseInt(total);
	    frm.total01[0].value=parseInt(total01);
	    frm.total02[0].value=parseInt(total)+parseInt(total01);
	    
	  
	    //장기요양보험료
	    var jang_insure = parseInt(total)+parseInt(total01);    //건강보험료 총액
	    total01 = drop((jang_insure * 0.0851)/2); //장기요양보험료율 : 8.51
	    total = drop((jang_insure * 0.0851)/2); //장기요양보험료율 : 8.51

	    //소수점 이하는 버린다.
	    if (total01.indexOf(".") !=-1) {
	      total01 = total01.split(".")[0];
	    }
	    if (total.indexOf(".") !=-1) {
	      total = total.split(".")[0];
	    }
	    total01 = drop(total01);
	    total = drop(total);
	    
	    frm.total[1].value=parseInt(total);
	    frm.total01[1].value=parseInt(total01);
	    frm.total02[1].value=parseInt(total)+parseInt(total01);
	    
	    //건강+장기요양보험료
	    frm.total[2].value=parseInt(frm.total[0].value)+parseInt(frm.total[1].value);
	    frm.total01[2].value=parseInt(frm.total01[0].value)+parseInt(frm.total01[1].value);
	    frm.total02[2].value=parseInt(frm.total02[0].value)+parseInt(frm.total02[1].value);
	    
	    //, 넣기
	    frm.total[0].value=section(sosu(frm.total[0].value));
	    frm.total01[0].value=section(sosu(frm.total01[0].value));
	    frm.total02[0].value=section(sosu(frm.total02[0].value));
	    frm.total[1].value=section(sosu(frm.total[1].value));
	    frm.total01[1].value=section(sosu(frm.total01[1].value));
	    frm.total02[1].value=section(sosu(frm.total02[1].value));

	    frm.pay.value = pay;
	    
	    for (i = 0 ; i < frm.elements.length ; i++) {
	      if (frm.elements[i].type == "text") {
	        comma_add(frm.elements[i]);
	      }
	    }
	  }
	</script>

</body>
</html>