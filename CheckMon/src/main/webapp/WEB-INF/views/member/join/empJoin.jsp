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
<script type="text/javascript" src="assets/js/httpRequest.js"></script>
<script>
//올바른 이메일 주소인지 확인. = ^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$ 
function empCheckEmail(str) {
    var email_pattern = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if(!email_pattern.exec(str)) { //exec는 정규표현식 패턴에 맞는 문자열 탐색
        return false;
    }else{
    	return true;
    }
}

//아이디 중복 확인
function empIdcheck(){
	// DB에 아이디 저장 을 위해 합침
	var idemail=document.all.idemail.value;
	var idemail2=document.all.idemail2.value;
	var eemail=idemail+"@"+idemail2;
	document.empJoin.eemail.value=eemail;
	if(empCheckEmail(eemail)){ // 올바른 이메일 주소인지 여부 판단
		var params='eemail='+eemail;
		sendRequest('empIdCheck.do',params,showResult,'GET');
	}else{
		alert("올바른 이메일 주소를 입력해주세요.");
	}
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			 var msg=document.all.msg;
			 msg.innerHTML=data;
		}
	}
}

function noSpace(obj) { // 공백 사용 못하게
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.\n공백은 자동적으로 제거 됩니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}

function select(){
	var email=document.empJoin.selectEmail.value;
	
	if(email !="직접입력"){
		document.empJoin.idemail2.value=email;
		document.empJoin.idemail2.readOnly="readonly";
	}else{
		document.empJoin.idemail2.readOnly=false;
		document.empJoin.idemail2.value="";
	}
}
//미리 보기 이미지 기본 세팅
function setDefaultImg(){
	empJoin.proimg.src="img/profile_default.jpg";
}
function showImg(profile){
	
	var reader = new FileReader();
	var file = profile.files[0]; //파일 배열로 저장 되기 때문에 첫번째 파일이 현재 선택된 파일
	if(file == undefined){ //파일 선택하지 않은경우
		setDefaultImg();
	}else{ //파일 선택한 경우
		reader.readAsDataURL(file);
		reader.onload = function(){
			var img = empJoin.proimg; //미리보기 이미지 띄우기
			img.src = reader.result;
		}
	}
}
//핸드폰번호 입력시 숫자와 4자리 입력
function checktel(tel){
    var num_pattern = /^\d{4}$/;  // 정규표현식 사용. []안에서 ^는 '일치하지 않는'을 의미한다.
    if(!num_pattern.exec(tel.value)) { //exec는 정규표현식 패턴에 맞는 문자열 탐색
        alert("해당 항목에는 4자리의 숫자만 사용할수 있습니다.\n다른 문자는 자동적으로 제거 됩니다.");
        tel.value = tel.value.replace(/.*/g,''); //숫자를 제외한 문자열 내 모든 패턴(g=global)찾아 빈문자열로 대체.
        return false;
    }
}
//비밀번호 일치 여부 출력
function checkPwd(){
	epwd1=document.empJoin.epwd1.value;
	epwd2=document.empJoin.epwd2.value;
	
	if(typeof epwd2!="undefined"&&epwd2.length>0){
		if(epwd1 == epwd2){
			document.empJoin.checkpwd.value = "비밀번호가 일치합니다.";
			document.empJoin.checkpwd.style.color = 'green';
			document.empJoin.epwd.value=epwd2;
			return true;
		}else{
			document.empJoin.checkpwd.value = "비밀번호가 일치하지 않습니다.";
			document.empJoin.checkpwd.style.color = 'red';
			return false;
		}
	}else{
		document.empJoin.checkpwd.value = "비밀번호확인을 입력하세요.";
		document.empJoin.checkpwd.style.color = 'red';
		return false;
	}
}

//Submit 전에 유효성 검사 및 생년월일 / 전화번호 조합
function checked(){
	//생년월일 조합
	empJoin.ebirthDay.value=empJoin.year.value+"-"+empJoin.month.value+"-"+empJoin.day.value;
	//전화번호 조합
	empJoin.etel.value=empJoin.seltel.value+"-"+empJoin.tel1.value+"-"+empJoin.tel2.value;
	if(empJoin.eemail.value==""){
		alert("아이디 중복을 확인해주세요.");
		empJoin.cid.focus();
		return false;
	}else if(empJoin.epwd.value==""){
		alert("비밀번호를 확인해주세요.");
		empJoin.epwd.focus();
		return false;
	}else if(empJoin.ename.value==""){
		alert("이름을 확인해주세요.");
		empJoin.ename.focus();
		return false;
	}else if(empJoin.ebirthDay.value==""){
		alert("생년월일을 선택해주세요.");
		empJoin.ebirthDay.focus();
		return false;
	}else if(empJoin.etel.value==""){
		alert("핸드폰번호를 입력해주세요.");
		empJoin.etel.focus();
		return false;
	}else{
		return true;
	}
}

</script>
</head>
<body>
<div class="container">
	<div class="card">
<form class="form-inline" name="empJoin" action="empJoin.do" onsubmit="return checked()" method="post">
<h1 class="card-header" align="center">근무자 회원가입</h1>
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
		<th>이메일</th>
		<td>
		<div class="form-group">
		<input type="text" hidden="" name="eemail">
		<input type="text" class="form-control" size="12" name="idemail" onkeyup="noSpace(this);" onchange="noSpace(this);" placeholder="이메일 입력" required="required"> @
		<input type="text" class="form-control" size="12" name="idemail2" onkeyup="noSpace(this);" onchange="noSpace(this);" required="required" readonly="readonly">&nbsp;
		<select class="form-control" name="selectEmail" onchange="select()">
				<option value="">선택하세요</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="직접입력">직접입력</option>
		</select>&nbsp;
		<input type="button" class="btn btn-primary" name="cid" value="중복확인" onclick="empIdcheck()">
		</div>
		</td>
		<td id="msg"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
		<div class="form-group">
			<input type="text" class="form-control" hidden="" name="epwd" value="">
			<input type="password" class="form-control" name="epwd1" placeholder="비밀번호 입력" required="required" onchange="noSpace(this);checkPwd()">
		</div>
		</td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td>
		<div class="form-group">
			<input type="password" class="form-control" name="epwd2" placeholder="비밀번호 재입력" required="required" onchange="noSpace(this);checkPwd()">
			<input type="text" class="form-control" name="checkpwd" disabled="disabled" style="width: 250px; border: none; background: none;">
		</div>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><div class="form-group"><input type="text" class="form-control" name="ename" placeholder="실명을 입력해주세요" required="required" onkeyup="noSpace(this);" onchange="noSpace(this);"></div></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>
		<div class="form-group">
			<input type="text" hidden="" name="ebirthDay">
			<select class="form-control" name="year" required="required">
				<option value="">년</option>
				<c:forEach var="i" begin="1970" end="2019" step="1">
					<option>${i}</option>
				</c:forEach>
			</select>&nbsp;
			<select class="form-control" name="month" required="required">
				<option value="">월</option>
				<c:forEach var="i" begin="1" end="12" step="1">
					<option>${i}</option>
				</c:forEach>
			</select>&nbsp;
			<select class="form-control" name="day" required="required">
				<option value="">일</option>
				<c:forEach var="i" begin="1" end="31" step="1">
					<option>${i}</option>
				</c:forEach>
			</select>
		</div>
		</td>
	</tr>
	<tr>
		<th>핸드폰번호</th>
		<td>
		<div class="form-group">
		<input type="text" hidden="" name="etel">
		<select class="form-control" name="seltel" required="required">
				<option>010</option>
				<option>011</option>
				<option>018</option>
		</select>-
		<input style="width:70px;height:30px;" type="text" class="form-control" maxlength="4" name="tel1" maxlength="4" required="required" onchange="checktel(this);">-
		<input style="width:70px;height:30px;" type="text" class="form-control" maxlength="4" name="tel2" maxlength="4" required="required" onchange="checktel(this);">
		</div>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<input type="submit" class="btn btn-success" value="가입하기">
			<a href="index.do"><input type="button" class="btn btn-secondary" value="취소"></a>
		</td>
	</tr>
</table>
</form>
	</div>
</div>
</body>
</html>