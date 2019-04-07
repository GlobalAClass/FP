<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
if(${QRcheck}){
	alert('정상적으로 출근을 기록햇습니다.');
}else{
	alert('출근 매장과 QRcode가 일치하지 않습니다.');
}

location.href = "empHome.do";
</script>

