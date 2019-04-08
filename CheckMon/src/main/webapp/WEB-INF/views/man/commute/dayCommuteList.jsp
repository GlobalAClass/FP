<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
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
	<!-- 헤더 및 네비게이션 가지고 있는 header.jsp -->
   <%@include file="/WEB-INF/views/man/header.jsp"%>
   <div class="content-page">
         <!-- Start content -->
         <div class="content">
            <div class="container">
               <div class="card mb-3" align="center">
                  <h1 class="card-header" align="center">당일 근태 현황</h1>
                  <div class="card-body">
                     <table class="table table-bordered">
                        <thead>
                           <tr align="center">
                              <th scope="col">이름</th>
                              <th scope="col">직급</th>
                              <th scope="col">상태</th>
                              <th scope="col">출근시간</th>
                              <th scope="col">퇴근시간</th>
                           </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty list}">
                        	<td colspan="5" align="center">검색된 기록이 없습니다.</td>
                        </c:if>
                        <c:forEach var="dto" items="${list}">
                           <tr align="center">
                              <td>${dto.e_name}</td>
                              <td>${dto.e_position}</td>
                              <td>${dto.state}</td>
                   			  <td>${dto.worktime}</td>
                   			  <td>${dto.leavetime}</td>
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