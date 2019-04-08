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
   <%@include file="/WEB-INF/views/emp/header.jsp"%>
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
                              <th scope="col">제목</th>
                              <th scope="col">처리상태</th>
                           </tr>
                        </thead>
                        <tbody>
                        <c:set var="list" value="${list}"/>
                        <c:if test="${empty list}">
                           <tr align="center">
                              <td colspan="4">근무 변경 목록이 존재하지 않습니다.</td>
                           </tr>
                        </c:if>
                        <c:forEach var="list" items="${list}">
                           <tr align="center">
                              <td>${list.workday}</td>
                              <td>${list.title}</td>
                              <c:choose>
                                 <c:when test="${list.progress=='반려'}">
                                    <td>
                                       <input type="button" data-toggle="modal" data-target="#myModal" 
                                       data-workday="${list.workday}" data-worktime="${list.worktime}" data-leavetime="${list.leavetime}" 
                                       data-c_worktime="${list.c_worktime}" data-c_leavetime="${list.c_leavetime}" 
                                       data-title="${list.title}" data-reason="${list.reason}" data-c_return="${list.c_return}" class="btn btn-danger" value="반려확인">
                                    </td>
                                 </c:when>
                                 <c:when test="${list.progress=='승인'}">
                                    <td><p style="color:green;font-weight:bold;">승인</p></td>
                                 </c:when>
                                 <c:otherwise>
                                    <td><p style="font-weight:bold;">승인대기</p></td>
                                 </c:otherwise>
                              </c:choose>
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
                  <h2 class="modal-title" id="exampleModalLabel">근태 변경 상세 내역</h2>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <table class="table">
                     <tr>
                        <th>변경요구 신청날짜</th>
                        <td><div id="workday"></div></td>
                     </tr>
                     <tr>
                        <th>해당날의 근태기록</th>
                        <td><span id="worktime"></span>&nbsp;-&nbsp;<span id="leavetime"></span></td>
                     </tr>
                     <tr>
                        <th>변경 요청 시간</th>
                        <td><span id="c_worktime"></span>&nbsp;-&nbsp;<span id="c_leavetime"></span></td>
                     </tr>
                     <tr>
                        <th>처리 상태</th>
                        <td><p style="color:red;font-weight:bold;">반려</p></td>
                     </tr>
                     <tr>
                        <th>제목</th>
                        <td><div id="title"></div></td>
                     </tr>
                     <tr>
                        <th>사유</th>
                        <td><div id="reason"></div></td>
                     </tr>
                     <tr>
                        <th>반려 사유</th>
                        <td><div id="c_return"></div></td>
                     </tr>
                  </table>
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

<script>
$(document).ready(function() {
   $('#myModal').on('show.bs.modal', function (event) {
     var button = $(event.relatedTarget)
     var workday = button.data('workday')
     var worktime = button.data('worktime')
     var leavetime = button.data('leavetime')
     var c_worktime = button.data('c_worktime')
     var c_leavetime = button.data('c_leavetime')
     var reason = button.data('reason')
     var title = button.data('title')
     var c_return = button.data('c_return')
     var modal = $(this)
     modal.find('#workday').text(workday)
     modal.find('#worktime').text(worktime)
     modal.find('#leavetime').text(leavetime)
     modal.find('#c_worktime').text(c_worktime)
     modal.find('#c_leavetime').text(c_leavetime)
     modal.find('#title').text(title)
     modal.find('#reason').text(reason)
     modal.find('#c_return').text(c_return)
   })
 });
</script>


</html>