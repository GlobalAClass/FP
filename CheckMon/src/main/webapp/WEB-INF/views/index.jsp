<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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

<!-- Custom CSS -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<script>

</script>
</head>
<body>
	<div class="container h-200 justify-content-center">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="card">
				<h4 class="card-header">ChechMon 로그인 하기</h4>
				<div class="card-body">
					<form name="login" action="login.do">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>이메일</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"><i class="fa fa-envelope-open-o" aria-hidden="true"></i></span>
										</div>
										<input type="email" class="form-control" name="login_email" data-error="Input valid email" placeholder="example@gmail.com" required="required">
									</div>
									<div class="help-block with-errors text-danger"></div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>비밀번호</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1"><i class="fa fa-unlock" aria-hidden="true"></i></span>
										</div>
										<input type="password" id="inputPassword" data-minlength="6" name="login_password" class="form-control" data-error="Password to short" required="required">
									</div>
									<div class="help-block with-errors text-danger"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="checkbox checkbox-primary">
								<input id="checkbox_remember" type="checkbox" name="remember">
								<label for="checkbox_remember">자동 로그인</label>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<input type="hidden" name="redirect" value=""> 
								<input type="submit" class="btn btn-primary btn-lg btn-block" value="로그인" name="submit">
							</div>
						</div>
					</form>
					<div class="clear"></div><br>
					<i class="fa fa-user fa-fw"></i> 처음 방문하셨나요?<br>
					<a href="goEmpJoin.do">근무자 회원가입</a><br>
					<a href="goManJoin.do">관리자 회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="assets/js/jquery-1.10.2.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</html>