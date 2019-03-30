<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="container" id="demo-content">
		<h1 class="title">QR코드를 인식해주세요.</h1>
		수정해야 할 부분 : Session에서 근무자의 id 혹은 index를 이용하여 조회하는 거 구성하기.
		1. form태그 안에 근무자 정보 받을 태그 쓰기
		2. controller 수정
		3. dao 수정
		4. sql 수정.
		<br>
		<div>
			<video id="video" width="300" height="200"
				style="border: 1px solid gray"></video>
		</div>
		
	</section>

	<form id="QRfm" action="checkQRInfo.do" method="post">
		
		<input type="hidden" id="input_result" name="storeIx">
	</form>

	<script type="text/javascript"
		src="https://unpkg.com/@zxing/library@latest"></script>
	<script type="text/javascript">
        window.addEventListener('load', function () {
            const codeReader = new ZXing.BrowserQRCodeReader()
            
            //QR코드 읽을 미디어
            codeReader.getVideoInputDevices()
                .then((videoInputDevices) => {
                    
                    //QR코드 읽기.
                    codeReader.decodeFromInputVideoDevice(undefined, 'video').then((result) => {
                    	document.getElementById('input_result').value = result.text
                    	codeReader.reset()
                    	document.getElementById('QRfm').submit();
                    }).catch((err) => {
                        //document.getElementById('input_result').value = err
                        document.getElementById('input_result').value = 'err'
                    })
                    
                })
                .catch((err) => {
                	document.getElementById('input_result').value = 'err'
                })
        })
    </script>
</body>
</html>