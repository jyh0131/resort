<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table,th,td{
		border:1px solid black;
		border-collapse: collapse;
	}
	th,td{
		padding:10px;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>객실 번호</th>
			<th>객실 이름</th>
			<th>객실 방 번호</th>
			<th>수정 / 삭제 </th>
		</tr>
		<c:forEach var = "r" items = "${list }">
			<tr>
				<td>${r.rNo }</td>
				<td>${r.roomName.rnName }</td>
				<td>${r.rRoom }</td>
				<td>
					<a href = "update.do?rNo=${r.rNo }">수정</a> | 
					<a href = "delete.do?rNo=${r.rNo }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>