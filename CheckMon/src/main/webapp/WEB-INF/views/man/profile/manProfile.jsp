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
<script>
//핸드폰번호 입력시 숫자와 4자리 입력
function checktel(tel){
    var num_pattern = /^\d{4}$/;  // 정규표현식 사용. []안에서 ^는 '일치하지 않는'을 의미한다.
    if(!num_pattern.exec(tel.value)) { //exec는 정규표현식 패턴에 맞는 문자열 탐색
        alert("해당 항목에는 4자리의 숫자만 사용할수 있습니다.\n다른 문자는 자동적으로 제거 됩니다.");
        tel.value = tel.value.replace(/.*/g,''); //숫자를 제외한 문자열 내 모든 패턴(g=global)찾아 빈문자열로 대체.
        return false;
    }
}

//미리 보기 이미지 기본 세팅
function showImg(profile){
	
	var reader = new FileReader();
	var file = profile.files[0]; //파일 배열로 저장 되기 때문에 첫번째 파일이 현재 선택된 파일
	reader.readAsDataURL(file);
	reader.onload = function(){
		var img = modMan.proimg; //미리보기 이미지 띄우기
		img.src = reader.result;
	}
}

//데이터 전송 전에 조합
function checked(){
	//전화번호 조합
	modMan.m_tel.value=modMan.seltel.value+"-"+modMan.tel1.value+"-"+modMan.tel2.value;
}

</script>
</head>
<body class="adminbody">
	<div id="main">
		<!-- 헤더 및 네비게이션 가지고 있는 header.jsp -->
		<%@include file="/WEB-INF/views/man/header.jsp"%>
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="card">
						<form class="form-inline" name="modMan" action="manProfile.do" onsubmit="return checked()" method="post" enctype="multipart/form-data">
						<h1 class="card-header" align="center">관리자 프로필</h1>
							<table class="table">
								<c:set var="mdto" value="${m_list}"/>
								<c:set var="sdto" value="${s_list}"/>
								<tr>
									<td colspan="3" align="center">
										<!-- 관리자 인덱스 넘기기 -->
										<input type="hidden" name="man_ix" value="${man_ix}">
										<img width="120" height="120" name="proimg" src="${imgpath}">
									</td>
								</tr>
								<tr>
									<td colspan="3" align="center">
										<input type="file" name="picture" onchange="showImg(this);" accept=""><br>
										<span style="margin-left:8px; font-size:8px; color:#FA5882;">사진은 자동으로 이미지 크기에 맞게 적용됩니다.</span>
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td><div class="form-group"><input type="text" value="${mdto.m_name}" class="form-control" name="pro_m_name" readonly="readonly" required="required"></div></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><div class="form-group"><input type="text" value="${mdto.m_email}" class="form-control" name="pro_m_email" readonly="readonly"></div></td>
								</tr>
								<tr>
									<th>비밀번호 변경</th>
									<td>
										<div class="form-group">
										<input type="password" class="form-control" name="m_pwd">
										</div>
									</td>
								</tr>
								<tr>
									<th>핸드폰번호</th>
									<td>
									<div class="form-group">
										<input type="text" hidden="" name="m_tel">
											<select class="form-control" name="seltel" required="required">
												<option value="010">010</option>
													<option value="011">011</option>
												<option value="018">018</option>
											</select>-
										<input style="width:70px;height:40px;" type="text" value="${m_tel1}" class="form-control" maxlength="4" name="tel1" maxlength="4" required="required" onchange="checktel(this);">-
										<input style="width:70px;height:40px;" type="text" value="${m_tel2}" class="form-control" maxlength="4" name="tel2" maxlength="4" required="required" onchange="checktel(this);">
									</div>
									</td>
								</tr>
								<tr>
									<th>사업자 등록번호</th>
									<td><div class="form-group"><input type="text" value="${mdto.corporate_number}" class="form-control" name="corporate_number" readonly="readonly"></div></td>
								</tr>
								<tr>
									<th>회사 / 매장 명</th>
									<td><div class="form-group"><input type="text" value="${sdto.store_name}" class="form-control" name="store_name" readonly="readonly"></div></td>
								</tr>
								<tr>
									<th>매장 주소</th>
									<td><div class="form-group"><input type="text" value="${sdto.store_addr}" size="65" class="form-control" name="store_addr" readonly="readonly"></div></td>
								</tr>
								<tr>
									<td colspan="3" align="center">
										<input type="submit" class="btn btn-success" value="프로필 수정">
										<a href="index.do"><input type="button" class="btn btn-secondary" value="취소"></a>
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
<script src="assets/js/jquery-ui.min.js"></script>
</html>