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
	var e_email=idemail+"@"+idemail2;
	document.empJoin.e_email.value=e_email;
	if(empCheckEmail(e_email)){ // 올바른 이메일 주소인지 여부 판단
		var params='e_email='+e_email;
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
	var e_email=document.empJoin.selectEmail.value;
	
	if(e_email !="직접입력"){
		document.empJoin.idemail2.value=e_email;
		document.empJoin.idemail2.readOnly="readonly";
	}else{
		document.empJoin.idemail2.readOnly=false;
		document.empJoin.idemail2.value="";
	}
}
//미리 보기 이미지 기본 세팅
function setDefaultImg(){
	empJoin.proimg.src="assets/images/emp/profile_default.jpg";
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
	e_pwd1=document.empJoin.e_pwd1.value;
	e_pwd2=document.empJoin.e_pwd2.value;
	
	if(typeof e_pwd2!="undefined"&&e_pwd2.length>0){
		if(e_pwd1 == e_pwd2){
			document.empJoin.checkpwd.value = "비밀번호가 일치합니다.";
			document.empJoin.checkpwd.style.color = 'green';
			document.empJoin.e_pwd.value=e_pwd2;
		}else{
			document.empJoin.checkpwd.value = "비밀번호가 일치하지 않습니다.";
			document.empJoin.checkpwd.style.color = 'red';
		}
	}else{
		document.empJoin.checkpwd.value = "비밀번호확인을 입력하세요.";
		document.empJoin.checkpwd.style.color = 'red';
	}
}

//Submit 전에 유효성 검사 및 생년월일 / 전화번호 조합
function checked(){
	//생년월일 조합
	empJoin.e_birthday.value=empJoin.year.value+"-"+empJoin.month.value+"-"+empJoin.day.value;
	//전화번호 조합
	empJoin.e_tel.value=empJoin.seltel.value+"-"+empJoin.tel1.value+"-"+empJoin.tel2.value;
	if(empJoin.e_email.value==""){
		alert("아이디 중복을 확인해주세요.");
		empJoin.cid.focus();
		return false;
	}else if(empJoin.e_pwd.value==""){
		alert("비밀번호를 확인해주세요.");
		empJoin.epwd.focus();
		return false;
	}else if(empJoin.e_name.value==""){
		alert("이름을 확인해주세요.");
		empJoin.ename.focus();
		return false;
	}else if(empJoin.e_birthday.value==""){
		alert("생년월일을 선택해주세요.");
		empJoin.ebirthday.focus();
		return false;
	}else if(empJoin.e_tel.value==""){
		alert("핸드폰번호를 입력해주세요.");
		empJoin.etel.focus();
		return false;
	}else{
		empJoin.e_color.value = "#"+Math.round(Math.random()*0xffffff).toString(16);
		return true;
	}
}

</script>
</head>
<body>
<div class="container">
	<div class="card">
<form class="form-inline" name="empJoin" action="empJoin.do" onsubmit="return checked()" method="post" enctype="multipart/form-data">
<h1 class="card-header" align="center">근무자 회원가입</h1>
<table class="table">
	<tr>
		<td colspan="3" align="center">
			<img width="120" height="120" name="proimg" src="assets/images/emp/profile_default.jpg">
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
		<input type="text" hidden="" name="e_email">
		<input type="text" class="form-control" size="12" name="idemail" onkeyup="noSpace(this);" onchange="noSpace(this);" placeholder="이메일 입력" required="required"> @
		<input type="text" class="form-control" size="12" name="idemail2" onkeyup="noSpace(this);" onchange="noSpace(this);" required="required" readonly="readonly">&nbsp;
		<select class="form-control" name="selectEmail" onchange="select()" required="required">
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
			<input type="text" class="form-control" hidden="" name="e_pwd" value="">
			<input type="password" class="form-control" name="e_pwd1" placeholder="비밀번호 입력" required="required" onkeyup="noSpace(this);checkPwd()">
		</div>
		</td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td>
		<div class="form-group">
			<input type="password" class="form-control" name="e_pwd2" placeholder="비밀번호 재입력" required="required" onkeyup="noSpace(this);checkPwd()">
			<input type="text" class="form-control" name="checkpwd" disabled="disabled" style="width: 250px; border: none; background: none;">
		</div>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><div class="form-group"><input type="text" class="form-control" name="e_name" placeholder="실명을 입력해주세요" required="required" onkeyup="noSpace(this);" onchange="noSpace(this);"></div></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>
		<div class="form-group">
			<input type="text" hidden="" name="e_birthday">
			<select class="form-control" 	name="year" required="required">
				<option value="">년</option>
				<c:forEach var="i" begin="1970" end="2019" step="1">
					<option>${i}</option>
				</c:forEach>
			</select>&nbsp;
			<select class="form-control" name="month" required="required">
				<option value="">월</option>
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>	
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
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
		<input type="text" hidden="" name="e_tel">
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
		<th>매장 이름</th>
		<td>
		<div class="form-group">
			<input type="text" class="form-control" id="s_name" required="required" size="50" placeholder="찾기 버튼을 눌러주세요." readonly="readonly">&nbsp;
			<input type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg" value="매장 찾기">
			<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			   		<div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">매장 찾기</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
			     	 </div>
			     	 <div class="modal-body">
			     		 <!-- 검색 진행하여 db에서 가져온 매장 목록 출력 -->
			     			<div class="col-12">
								<input class="form-control" type="text" size="70" id="searchStore" placeholder="매장명을 입력해주세요">
								<input class="btn btn-primary" type="button" value="검색하기" onclick="showStore()">
							</div>
				      	<div class="row" style="margin-top:10px;">
							 <div class="col-6">
							    <div class="list-group" id="loc_list" role="tablist">
							  
							    </div>
							  </div>
							  <div class="col-6">
							    <div class="tab-content" id="loc_content">
							   
							    </div>
							  </div>
						</div>
					</div>
					<div class="modal-footer" align="center">
					<!-- 클릭한 매장 정보 -->
						<input type="hidden" id="choose_store" name="req_store" value="">
						<input type="hidden" id="man_ix" name="man_ix" value="">
						<input type="hidden" id="store_name" value="">
						<input class="btn btn-success" type="button" value="매장 등록하기" onclick="checkStore();">
					</div>
					</div>
			    </div>
			  </div>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<input type="hidden" id="e_color" name="e_color">
			<input type="submit" class="btn btn-success" id="submit" value="가입하기">
			<a href="index.do"><input type="button" class="btn btn-secondary" value="취소"></a>
		</td>
	</tr>
</table>
</form>
	</div>
</div>
</body>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=481b44d52e7e30455d59a5d6206d3b65"></script>
<script>

//list 클릭 시 map 메소드 호출하여 해당 지도 위치 출력하기
function map(latitude,longitude){
	//지도 생성
	
	var size = document.getElementsByName('map').length;
	
	for(var i=0 ; i<size ; i++){
	
		var mapContainer = document.getElementsByName('map')[i], // 지도를 표시할 div
		    mapOption = {
		        center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		
		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 마우스 드래그와 모바일 터치를 이용한 지도 이동을 막는다
		map.setDraggable(false);		
	
		// 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
		map.setZoomable(false);  
		
		// 지도 재로딩
		$('#myModal').on('shown.bs.modal', function (e) {
			map.relayout();
		})
		
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(latitude, longitude), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
	}
} 



//매장 정보 불러오기 위한 AJax 구현
function showStore(){
	var searchStore = 'searchStore='+document.all.searchStore.value;
	sendRequest('getStoreName.do',searchStore,showResultStore,'POST');
}
 
function showResultStore(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			
			var data = eval('('+XHR.responseText+')');
		    var storeList=data.list;
		    
		    //리스트가 위치한 곳
		    var loc_list = document.all.loc_list;
		    var text_list='';
		    
		    //리스트에 해당하는 내용이 위치한 곳
		    var loc_content = document.all.loc_content;
		    var text_content='';
		    
		    //리스트 출력 후 매장 등록 여부 문구 출력하는 곳
		    var loc_comment = document.all.loc_comment;
		    //매장 이름 임시 저장하는 곳
		    var store_name = document.all.store_name;
		    
		      for(var i=0; i<storeList.length;i++){
		         list=storeList[i];
		         text_list += '<a class="list-group-item list-group-item-action" id="list-'+i+'-list" data-toggle="list" href="#list-'+i+'"' 
		         			+'onclick="setTimeout(function(){map('+list.m_latitude+','+list.m_longitude+')},500);'
		         			+'document.all.choose_store.value='+list.store_ix+';document.all.store_name.value=\''+list.store_name+'\';'
		         			+'document.all.man_ix.value='+list.man_ix+'" role="tab">'+list.store_name+'</a>';
		         text_content += '<div class="tab-pane fade" id="list-'+i+'" role="tabpane'+i+'" aria-labelledby="list-'+i+'-list">'
		         				+'<div name="map" style="width:350px;height:350px;"></div>'
		         				+'<h5>주소 : '+list.store_addr+'</h5>'
		         				+'</div>';
		      }
		    
		    loc_list.innerHTML = text_list;
		    loc_content.innerHTML = text_content;

		}
	}
}

//매장정보 등록했는지 유효성 검사
function checkStore(){
	res = document.all.choose_store.value;
	
	if(res==null || res==''){
		alert('매장을 검색 후 입력해주세요.');
	}else{
		setStoreName();
	}
}

//매장 등록 후 매장 이름을 뿌려줌
function setStoreName(){
	document.getElementById('s_name').value=document.getElementById('store_name').value;
	$('#myModal').modal('hide');
}

//모달에서 엔터키 눌럿을 때 검색으로 들어가도록 서정
$('#myModal').on('keypress', function (event) { 
    var keycode = (event.keyCode ? event.keyCode : event.which); 
    if(keycode == '13'){
    	showStore();
    	return false;
    } 
});

</script>
</html>