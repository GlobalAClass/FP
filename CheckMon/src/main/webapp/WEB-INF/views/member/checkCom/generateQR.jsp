<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
<script type="text/javascript" src="assets/js/qrcode.min.js"></script>
<style>
canvas {
	width: 0px;
	height: 0px;
}
</style>
</head>
<body>
	<div class="alert alert-primary" role="alert">
		<h4 class="alert-heading" style="text-align: center">매장 QR code</h4>
	</div>
	<div class="card" style="text-align: center; margin: 0px auto">
		<div id="qrcode" style="text-align: center;"></div>
		<br>
		<div class="card-body">
			회사 / 매장명 : ${sdto.store_name}<br>
			매장 주소 : ${sdto.store_addr}
		</div>
		<canvas id="canvas"></canvas>
		<a id="download" download="QR.png">
			<button class="btn btn-success" id="savebtn" onclick="download()">QR Code Save</button>
		</a>
	</div>



	<script type="text/javascript">
		var a = 0;

		function download() {
			base_image = new Image();
			var source = document.getElementsByTagName('img')[0].src;
			base_image.src = 'data:image/png;base64,'
					+ source.substring(source.indexOf('base64') + 7);
			var canvas = document.getElementById("canvas");
			var context = canvas.getContext('2d'); //No I18N
			canvas.width = document.getElementsByTagName('img')[0].width;
			canvas.height = document.getElementsByTagName('img')[0].height;
			context.drawImage(base_image, 0, 0,
					document.getElementsByTagName('img')[0].width,
					document.getElementsByTagName('img')[0].height);
			var download = document.getElementById("download");
			var image = canvas.toDataURL("image/png").replace("image/png",
					"image/octet-stream"); //No I18N
			download.setAttribute("href", image);
		}

		var qrload = new Promise(function(resolve, reject) {
			var qrcode = new QRCode(document.getElementById("qrcode"), {
				text : "${sdto.store_ix}",
				width : 255,
				height : 255,
				colorDark : "#000000",
				colorLight : "#ffffff",
				correctLevel : QRCode.CorrectLevel.H
			});
			resolve(qrcode);
		});

		qrload.then(function(value) {
			console.log(value);
			console.log('-----------------------------------');

			var img_QR = document.getElementsByTagName('img')[0];
			console.log(img_QR);
			console.log('-----------------------------------');
			
			img_QR.style.margin = '0px auto';
		});
	</script>
</body>
</html>