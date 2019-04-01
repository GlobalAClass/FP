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
<script src="assets/js/jquery-1.10.2.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
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

</script>
</head>
<body>
<div class="container">
<div class="card">
	<form class="form-inline" name="modMan" action="manProfile.do" method="post">
	<h1 class="card-header" align="center">관리자 프로필</h1>
		<table class="table">
			<tr>
				<td colspan="3" align="center">
					<img width="120" height="120" name="proimg" src="img/profile_default.jpg">
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
				<td><div class="form-group"><input type="text" class="form-control" name="e_name" readonly="readonly" required="required"></div></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><div class="form-group"><input type="text" class="form-control" name="e_email" readonly="readonly">&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-primary" name="changePwd" value="비밀번호 변경하기">
				</div></td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td>
				<div class="form-group">
					<input type="text" hidden="" name="e_tel">
						<select class="form-control" name="seltel" required="required">
							<option>010</option>
							<option>011</option>
							<option>018</option>
						</select>-
					<input style="width:70px;height:40px;" type="text" class="form-control" maxlength="4" name="tel1" maxlength="4" required="required" onchange="checktel(this);">-
					<input style="width:70px;height:40px;" type="text" class="form-control" maxlength="4" name="tel2" maxlength="4" required="required" onchange="checktel(this);">
				</div>
				</td>
			</tr>
			<tr>
				<th>사업자 등록번호</th>
				<td><div class="form-group"><input type="text" class="form-control" name="CORPORATE_NUMBER" readonly="readonly"></div></td>
			</tr>
			<tr>
				<th>회사 / 매장 명</th>
				<td><div class="form-group"><input type="text" class="form-control" name="STORE_NAME" readonly="readonly"></div></td>
			</tr>
			<tr>
				<th>매장 주소</th>
				<td><div class="form-group"><input type="text" size="65" class="form-control" name="STORE_ADDR" readonly="readonly"></div></td>
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
</body>
</html>