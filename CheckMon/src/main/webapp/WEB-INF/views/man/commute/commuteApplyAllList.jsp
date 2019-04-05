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
                  <h1 class="card-header" align="center">근무 변경 목록</h1>
                  <div class="card-body">
                     <table class="table table-bordered">
                        <thead>
                           <tr align="center">
                              <th scope="col">근태 변경 신청 날짜</th>
                              <th scope="col">신청자</th>
                              <th scope="col">기록된 근태 시간</th>
                              <th scope="col">변경 요청 시간</th>
                              <th scope="col">제목</th>
                              <th scope="col">사유</th>
                              <th scope="col">처리 상태</th>
                              <th scope="col">관리</th>
                           </tr>
                        </thead>
                        <tbody>
                        <c:set var="list" value="${list}"/>
                        <c:if test="${empty list}">
                        	<td colspan="8" align="center">근무 변경 신청 목록이 존재하지 않습니다.</td>
                        </c:if>
                        <c:forEach var="dto" items="${list}">
                           <tr align="center">
                              <td width="70">${dto.workday}</td>
                              <td width="70">${dto.e_name}</td>
                   			  <td width="70"><span>${dto.worktime}</span>&nbsp;-&nbsp;<span>${dto.leavetime}</span></td>
                   			  <td width="70"><span>${dto.c_worktime}</span>&nbsp;-&nbsp;<span>${dto.c_leavetime}</span></td>
                   			  <td width="130">${dto.title}</td>
                   			  <td width="160">${dto.reason}</td>
							  <c:choose>
							  	<c:when test="${dto.progress=='승인'}">
							  		<td width="80" style="color:green;font-weight:bold;">승인</td>
							  	</c:when>
							  	<c:when test="${dto.progress=='반려'}">
							  		<td width="80" style="color:red;font-weight:bold;">반려</td>
							  	</c:when>
							  	<c:otherwise>
							  		<td width="80" style="font-weight:bold;">${dto.progress}</td>
							  	</c:otherwise>
							  </c:choose>
                   			  <td width="140">
								<c:url var="successUrl" value="commuteApplyReturn.do">
                   			  		<c:param name="emp_change_ix">${dto.emp_change_ix}</c:param>
                   			  		<c:param name="c_return">${dto.c_return}</c:param>
                   			  	</c:url>
                   			  	<a href="${successUrl}"><input type="button" name="success" class="btn btn-success" value="승인"></a>
                   			  	<input type="button" name="b_fail" data-toggle="modal" 
                   			  	data-emp_change_ix_s="${dto.emp_change_ix}" data-target="#myModal" class="btn btn-danger" value="반려">
                   			  </td>
                   		   </tr>
                   		</c:forEach>
                        </tbody>
                     </table>
                     <div id="paging">
                        ${paging}
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <div id="myModal" class="modal fade" tabindex="-1"
         role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-header">
                  <h2 class="modal-title" id="exampleModalLabel" style="color:red;">근태 변경 반려하기</h2>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <form name="ca_return" action="javascript:insertInfo()">
                  	<input type="hidden" name="emp_change_ix">
                  	<table class="table">
                  		<tr>
                  			<td align="center" style="font-weight:bold;font-size:25px;">반려 사유 작성하기</td>
                  		</tr>
                  		<tr>
                  			<td align="center">
                  			<div class="form-group">
                  			<textarea class="form-control" name="c_return" rows="5" cols="80" required="required"></textarea>
                  			</div>
                  			</td>
                  		</tr>
                  		<tr>
                  			<td align="center" style="font-size:10px;">반려 사유를 근무자 에게 전송합니다.</td>
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
	$('#myModal').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget)
	var emp_change_ix_s = button.data('emp_change_ix_s')
	document.ca_return.emp_change_ix.value=emp_change_ix_s;
	})
});

function insertInfo(){
	var params = 'emp_change_ix=' + ca_return.emp_change_ix.value
				+ '&c_return=' + ca_return.c_return.value;
	sendRequest('commuteApplyReturn.do',params,showResult,'GET');
}

function showResult(){
	if (XHR.readyState == 4) {
		if(XHR.status==200){
			var data=eval('(' + XHR.responseText + ')');
			var msg = data.msg;
			if(msg!=""){
				alert(msg);
			}
			
			var loc=data.loc;
			location.href = loc;
		}
	}
}

</script>

</html>