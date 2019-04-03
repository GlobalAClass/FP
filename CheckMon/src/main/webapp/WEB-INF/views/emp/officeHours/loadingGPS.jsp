<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
<script src="assets/js/jquery-1.10.2.min.js"></script>
<script src="assets/js/spin.js"></script>
<script type="text/javascript" src="assets/js/httpRequest.js"></script>
<script>

//원형 프로그래스바 옵션값
var opts={
		lines: 12,
		length: 20,
		width: 10,
		radius: 30,
		corners: 1,
		rotate: 0,
		direction: 1,
		color:'#000',
		speed: 1,
		trail: 60,
		shadow: false,
		hwaccel: false,
		className: 'spinner',
		zIndex: 2e9,
		top:'50%',
		scale: 4.0
};
var spinner;

jQuery(function(){
    spinner = new Spinner(opts).spin().el;
    jQuery(document.body).append(spinner);
    
    var spinerTextFontSize = 50;
    var spinerTextPadding = 10;
    var spinerTextWidth = 500;
    var spinerTextBorderWidth = 2;
    var spinerTextMarginTop = (((spinerTextFontSize + (spinerTextBorderWidth * 2) + (spinerTextPadding * 2)) / 2) * -1);
    var spinnerMarginLeft = (spinerTextWidth/2);
 
    $(spinner).append('<div class="spinerText"><div class="spinerTextDiv">위치 인식중입니다</div></div>');
    $(".spinerText").css("width",spinerTextWidth + "px");
    $(".spinerText").css("font-size",spinerTextFontSize + "px");
    $(".spinerText").css("line-height",spinerTextFontSize + "px");
    $(".spinerText").css("margin-top",spinerTextMarginTop + "px");
    $(".spinerText").css("padding",spinerTextPadding + "px");
    $(".spinerText").css("background-color","#FFF");
    $(".spinerText").css("border",spinerTextBorderWidth + "px solid #303030");
    $(".spinerText").css("position","absolute");
    $(".spinerText").css("font-weight","bold");
    $(".spinerText").css("display","table");
    $(".spinerTextDiv").css("display","table-cell");
    $(".spinerTextDiv").css("text-align","center");
    $(".spinerTextDiv").css("vertical-align","middle");
 
    $(spinner).css('margin-left','-' + spinnerMarginLeft + 'px');
    
    getLocation();

});

function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
		  	//추가적인 조건 걸고(핸드폰일때만?)
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	var latitude=position.coords.latitude;
	    	var longitude=position.coords.longitude;
	    	
	    	//현재 위치와 DB에서 존재하는 위치와 계산하기 위한 함수 호출
	    	calDistance(latitude,longitude);
	    	
	    }, function(error) {
	    	var res = error.code;
	    	if(res==1){ //사용자가 위치 정보 수집을 거부함
	    		alert('위치 수집을 거절하신 경우 \n사이트를 이용할 수 없습니다.\n');
	    	}else if(res==2){ //위치 정보 수집 불가(ex. GPS 동작 불가 지역)
	    		alert('위치정보 수집 불가한 지역에 위치하고 있습니다.');
	    	}
	    }, {
	      enableHighAccuracy: true, //배터리 소모를 늘려서 정확도를 높임
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('현재 접속한 기기가 \nGPS를 지원하지 않습니다');
	  }
}

function calDistance(latitude,longitude){
	
	var params = 'latitude='+latitude+'&longitude='+longitude;
	
	sendRequest('distanceCal.do',params,resultCal,'POST');
	
}

function resultCal(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = eval('('+XHR.responseText+')');
			var msg = data.msg;
			var loc = data.loc;
			if(msg!=''){
				alert(msg);
			}
			location.href=loc;
		}
	}
}

</script>
</html>