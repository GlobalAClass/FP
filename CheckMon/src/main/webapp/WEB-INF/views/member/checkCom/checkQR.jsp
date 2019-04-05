<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR인식</title>
<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<title>CheckMon</title>
		<meta name="description" content="Free Bootstrap 4 Admin Theme | Pike Admin">
		<meta name="author" content="Pike Web Development - https://www.pikephp.com">

		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">

		<!-- Bootstrap CSS -->
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		
		<!-- Font Awesome CSS -->
		<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		
		<!-- Custom CSS -->
		<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
		
		<!-- BEGIN CSS for this page -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
		<!-- END CSS for this page -->
		
</head>
<body>
	<section class="container" id="demo-content">
		<br>
		<div class="alert alert-success" role="alert">
			  <h4 class="alert-heading" style="text-align: center">QR code를 인식시켜 주세요.</h4>
		</div>
		<div class="card" >
		  <video id="video" class="card-img-top" style="border: 1px solid gray"></video>
		</div>
		<br>
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