var XHR = null;

function getXHR() {
	if(window.ActiveXObject){
		return new ActiveXObject('Msxml2.XMLHTTP');
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else{
		null;
	}
}

function sendRequest(url, params, callback, method){
	XHR=getXHR();
	
	//1. 전송방식 1차 검증
	var httpMethod = method? method : 'GET';
	
	//2. 전송방식 2차 검증
	if(httpMethod!='GET' && httpMethod!='POST'){
		httpMethod='GET';
	}
	
	//3. 파라미터에 대한 검증
	var httpParams=(params==null || params=='')? null : params;
	
	var httpUrl = url;
	if(httpMethod=='GET' && httpParams!=null){
		httpUrl = httpUrl + '?' + httpParams;
	}
	
	XHR.onreadystatechange = callback;
	XHR.open(httpMethod, httpUrl, true);
	XHR.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	XHR.send(httpMethod=='POST'?httpParams:null);	
}