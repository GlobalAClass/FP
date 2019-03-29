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
	
<style>
/* 다음 지도 APO에서 필요로 하는 CSS 속성 */
#map img {
	max-width: none;
	height: auto;
	border: 0
}
.map_wrap, .map_wrap * {margin:10px;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:6px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {margin-left:30px;align:center;}
#menu_wrap {height:350px;top:0;left:0;bottom:0;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<script src="assets/js/jquery-1.10.2.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/httpRequest.js"></script>
<script>
//올바른 이메일 주소인지 확인. = ^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$ 
function checkEmail(str) {
    var email_pattern = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if(!email_pattern.exec(str)) { //exec는 정규표현식 패턴에 맞는 문자열 탐색
        return false;
    }else{
    	return true;
    }
}

//아이디 중복 확인
function idcheck(){
	// DB에 아이디 저장 을 위해 합침
	var idemail=document.all.idemail.value;
	var idemail2=document.all.idemail2.value;
	var memail=idemail+"@"+idemail2;
	document.manJoin.memail.value=memail;
	if(checkEmail(memail)){ // 올바른 이메일 주소인지 여부 판단
		var params='memail='+memail;
		sendRequest('manIdCheck.do',params,showResult,'GET');
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
	var email=document.manJoin.selectEmail.value;
	
	if(email !="직접입력"){
		document.manJoin.idemail2.value=email;
		document.manJoin.idemail2.readOnly="readonly";
	}else{
		document.manJoin.idemail2.readOnly=false;
		document.manJoin.idemail2.value="";
	}
}
//미리 보기 이미지 기본 세팅
function setDefaultImg(){
	manJoin.proimg.src="img/profile_default.jpg";
}
function showImg(profile){
	
	var reader = new FileReader();
	var file = profile.files[0]; //파일 배열로 저장 되기 때문에 첫번째 파일이 현재 선택된 파일
	if(file == undefined){ //파일 선택하지 않은경우
		setDefaultImg();
	}else{ //파일 선택한 경우
		reader.readAsDataURL(file);
		reader.onload = function(){
			var img = manJoin.proimg; //미리보기 이미지 띄우기
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
//사업자 등록번호 유효성 검사
function checkcornum(cornum){
	var num_pattern = /[0-9]/; // 정규표현식 숫자만
    if(!num_pattern.exec(cornum.value)) { //exec는 정규표현식 패턴에 맞는 문자열 탐색
        alert("해당 항목에는 숫자만 사용할수 있습니다.\n다른 문자는 자동적으로 제거 됩니다.");
        cornum.value = cornum.value.replace(/.*/g,''); //숫자를 제외한 문자열 내 모든 패턴(g=global)찾아 빈문자열로 대체.
        return false;
    }
}

//비밀번호 일치 여부 출력
function checkPwd(){
	mpwd1=document.manJoin.mpwd1.value;
	mpwd2=document.manJoin.mpwd2.value;
	
	if(typeof mpwd2!="undefined"&&mpwd2.length>0){
		if(mpwd1 == mpwd2){
			document.manJoin.checkpwd.value = "비밀번호가 일치합니다.";
			document.manJoin.checkpwd.style.color = 'green';
			document.manJoin.mpwd.value=mpwd2;
		}else{
			document.manJoin.checkpwd.value = "비밀번호가 일치하지 않습니다.";
			document.manJoin.checkpwd.style.color = 'red';
		}
	} else{
		document.manJoin.checkpwd.value = "비밀번호확인을 입력하세요.";
		document.manJoin.checkpwd.style.color = 'red';
	}
}

//매장정보 등록했는지 유효성 검사
function checkStore(){
	res = document.manJoin.mlatitude.value;
	
	if(res==null || res==''){
		alert('매장을 검색 후 입력해주세요.');
	}else{
		setStoreName();
	}
}

//Submit 전에 유효성 검사 및 생년월일 / 전화번호 조합
function checked(){
	//전화번호 조합
	manJoin.mtel.value=manJoin.seltel.value+"-"+manJoin.tel1.value+"-"+manJoin.tel2.value;
	//사업자등록번호 조합
	manJoin.cornum.value=manJoin.cornum1.value+"-"+manJoin.cornum2.value+"-"+manJoin.cornum3.value;
	if(manJoin.memail.value==""){
		alert("아이디 중복을 확인해주세요.");
		manJoin.cid.focus();
		return false;
	}else if(manJoin.mpwd.value==""){
		alert("비밀번호를 확인해주세요.");
		manJoin.mpwd.focus();
		return false;
	}else if(manJoin.mname.value==""){
		alert("이름을 확인해주세요.");
		manJoin.mname.focus();
		return false;
	}else if(manJoin.mtel.value==""){
		alert("핸드폰번호를 입력해주세요.");
		manJoin.mtel.focus();
		return false;
	}else if(manJoin.cornum.value==""){
		alert("사업자 등록번호를 입력해주세요.");
		manJoin.cornum.focus();
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
<form class="form-inline" name="manJoin" action="manJoin.do" onsubmit="return checked()" method="post">
<h1 class="card-header">관리자 회원가입</h1>
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
		<input type="text" hidden="" name="memail">
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
		<input type="button" class="btn btn-primary" name="cid" value="중복확인" onclick="idcheck()">
		</div>
		</td>
		<td id="msg"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
		<div class="form-group">
			<input type="text" class="form-control" hidden="" name="mpwd" value="">
			<input type="password" class="form-control" name="mpwd1" placeholder="비밀번호 입력" required="required" onchange="noSpace(this);checkPwd()">
		</div>
		</td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td>
		<div class="form-group">
			<input type="password" class="form-control" name="mpwd2" placeholder="비밀번호 재입력" required="required" onchange="noSpace(this);checkPwd()">
			<input type="text" class="form-control" name="checkpwd" disabled="disabled" style="width: 250px; border: none; background: none;">
		</div>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><div class="form-group"><input type="text" class="form-control" name="mname" placeholder="실명을 입력해주세요" required="required" onkeyup="noSpace(this);" onchange="noSpace(this);"></div></td>
	</tr>
	<tr>
		<th>핸드폰번호</th>
		<td>
		<div class="form-group">
		<input type="text" hidden="" name="mtel">
		<select class="form-control" name="seltel" required="required">
				<option>010</option>
				<option>011</option>
				<option>018</option>
		</select>-
		<input style="width:70px;height:30px;" class="form-control" type="text" maxlength="4" name="tel1" maxlength="4" required="required" onchange="checktel(this);">-
		<input style="width:70px;height:30px;" class="form-control" type="text" maxlength="4" name="tel2" maxlength="4" required="required" onchange="checktel(this);">
		</div>
		</td>
	</tr>
	<tr>
		<th>사업자 등록 번호</th>
		<td>
		<div class="form-group">
			<input type="text" hidden="" name="cornum">
			<input type="text" class="form-control" name="cornum1" required="required" maxlength="3" size="5" onchange="checkcornum(this);" onkeyup="noSpace(this);">-
			<input type="text" class="form-control" name="cornum2" required="required" maxlength="2" size="5" onchange="checkcornum(this);" onkeyup="noSpace(this);">-
			<input type="text" class="form-control" name="cornum3" required="required" maxlength="5" size="11" onchange="checkcornum(this);" onkeyup="noSpace(this);">
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
				      	<div class="row">
							<!-- 검색 리스트 생성-->
								<div id="menu_wrap" class="col-xs-6">
									<div class="option">
											<div class="col-md-12 mb-6" class="form-inline">
												<input class="form-control" id="keyword" type="text">
												&nbsp;
												<input class="btn btn-primary" type="button" value="검색하기" onclick="searchPlaces()">
											</div>
									</div>
									<ul id="placesList"></ul>
								    <div id="pagination"></div>
								</div>
								
								<!-- 지도를 표시할  div -->
								<div class="col-xs-6" >
									<div id="map" style="width:350px;height:350px;margin-left:20px;"></div>
								</div>
							</div>
							<div class="row">
							<!-- 지도에서 클릭한 정보 표시해주는 div -->
							<div class="col-md-12 mb-6" style="padding:10px;" class="form-inline">
								<div class="col-md-12 mb-6">
									<h5 style="font-weight:bold;">매장명<input type="text" class="form-control-plaintext" name="storename" readonly></h5>
								</div>
								<div class="col-md-12 mb-6">
									<h5 style="font-weight:bold;">매장 주소<input type="text" class="form-control-plaintext" name="storeaddr" readonly></h5>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" align="center">
					<!-- 클릭한 매장 정보 -->
						<input type="text" name="mlatitude" value="">
						<input type="text" name="mlongitude" value="">
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
			<input type="submit" class="btn btn-success" value="가입하기">
			<a href="index.do"><input type="button" class="btn btn-secondary" value="취소"></a>
		</td>
	</tr>
</table>
</form>
</div>
</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=481b44d52e7e30455d59a5d6206d3b65&libraries=services"></script>
<script>

//지도를 생성합니다    
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption);

$('#myModal').on('shown.bs.modal', function (e) {
map.relayout();
})

//마커를 담을 배열입니다
var markers = [];

// 마우스 드래그와 모바일 터치를 이용한 지도 이동을 막는다
map.setDraggable(false);		

// 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
map.setZoomable(false);   

// 마우스 클릭을 이용한 지도 확대를 막는다
//map.setClickable(false);

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
           
        })(marker, places[i].place_name);
        
        (function(title, address, latitude, longitude){
        	// 마커에 click 이벤트를 등록하여
       		// 마커를 클릭하거나 리스트를 클릭하면 해당 되는 매장의 이름, 주소, 위도, 경도값을 알 수 있음
           daum.maps.event.addListener(marker, 'click', function() {
        	   document.getElementsByName('storename')[0].value = title;
        	   document.getElementsByName('storeaddr')[0].value = address;
        	   document.getElementsByName('mlatitude')[0].value = latitude;
        	   document.getElementsByName('mlongitude')[0].value = longitude;
  
           });
           
           itemEl.onclick = function() {
        	   document.getElementsByName('storename')[0].value = title;
        	   document.getElementsByName('storeaddr')[0].value = address;
        	   document.getElementsByName('mlatitude')[0].value = latitude;
        	   document.getElementsByName('mlongitude')[0].value = longitude;
           };
        	
        })(places[i].place_name, places[i].address_name, places[i].y, places[i].x);

        fragment.appendChild(itemEl);
        
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5 style="font-size:15px;">' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}


// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="font-size:11px;padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
//매장 등록 후 매장 이름을 뿌려줌
function setStoreName(){
	document.getElementById('s_name').value=document.getElementsByName('storename')[0].value;
	$('#myModal').modal('hide');
}
</script>
</html>