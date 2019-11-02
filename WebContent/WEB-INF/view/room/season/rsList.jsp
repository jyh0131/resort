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
		padding:5px;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<th>객실 이름</th>
			<th>시즌</th>
			<th>시즌 설명</th>
			<th>수정 / 삭제 </th>
		</tr>
		<c:forEach var = "rs" items = "${list }">
			<tr>
				<td>${rs.rsNo }</td>
				<td>${rs.roomName.rnName }</td>
				<td>${rs.rsSeason}</td>
				<td>${rs.rsDetail }</td>
				<td>
					<a href = "update.do?rsNo=${rs.rsNo }">수정</a> | 
					<a href = "delete.do?rsNo=${rs.rsNo }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href = "insert.do">추가하기</a>	
</body>
</html>