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
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>부서</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list }">
		<tr>
			<td colspan="4">등록된 사원이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.idx }</td>
			<td>${list.name }</td>
			<td>${list.email }</td>
			<td>${list.dept }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>