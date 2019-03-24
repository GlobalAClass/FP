<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="empModify.do" method="post">
<table>
		<tr>
			<th>번호</th>
			<td>${dto.idx }<input type="hidden" name="idx" value="${dto.idx }"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="${dto.name }"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${dto.email }"></td>
		</tr>
		<tr>
			<th>부서</th>
			<td><input type="text" name="dept" value="${dto.dept }"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정하기"></td>
		</tr>
</table>
</form>
</body>
</html>