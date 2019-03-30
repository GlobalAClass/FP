<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/qrcode.min.js"></script>
<style>
canvas {
	width: 0px;
	height: 0px;
}
</style>
</head>
<body>
	<div id="qrcode"></div>

	<canvas id="canvas"></canvas>
	<a id="download" download="QR.png">
		<button id="savebtn" onclick="download()"
			style="float: right; margin-right: 0px"
			>Save</button>
	</a>
	
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
				text : "503",
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
			//alert(img_QR.src);
			
			
		});
	</script>
aaaaaaaa
</body>
</html>