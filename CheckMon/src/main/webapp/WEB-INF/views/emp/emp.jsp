<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사원 관리 프로그램</h1>
<form action="empAdd.do">
<fieldset>
	<legend>사원 등록</legend>
	<table>
		<tr>
			<th>사원이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<th>부서명</th>
			<td><input type="text" name="dept"></td>
		</tr>
		<tr>
			<th colspan="2" align="center">
				<input type="submit" value="사원등록">
				<input type="reset" value="다시작성">
			</th>
		</tr>
	</table>
</fieldset>
</form>
<br>
<form action="empDel.do">
<fieldset>
	<legend>사원 삭제</legend>
	사원 이름 : <input type="text" name = "name"> <input type="submit" value="삭제하기">
</fieldset>
</form>
<br>
<form action="">
<fieldset>
	<legend>모든사원 내역</legend>
	<a href="empList.do">모든사원 내역 보기</a>
</fieldset>
</form>
<br>
<form action="empSelect.do">
<fieldset>
	<legend>사원 조회</legend>
	사원 이름 : <input type="text" name="name"> <input type="submit" value="검색하기">
</fieldset>
</form>
<br>
<form action="empModify.do" method="get">
<fieldset>
	<legend>사원 수정</legend>
	사원 번호 : <input type="text" name="idx"> <input type="submit" value="수정하기">
</fieldset>
</form>
</body>
</html>