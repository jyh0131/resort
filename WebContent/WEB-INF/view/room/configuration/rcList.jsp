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
			<th>객실 구성 번호</th>
			<th>객실 이름</th>
			<th>객실 면적</th>
			<th>객실 타입</th>
			<th>객실 타입에 따른 갯수</th>
			<th>객실 실내 구성</th>
			<th>수정 / 삭제 </th>
		</tr>
		<c:forEach var = "rc" items = "${list }">
			<tr>
				<td>${rc.rcNo }</td>
				<td>${rc.roomName.rnName }</td>
				<td>${rc.rcArea}</td>
				<td>${rc.rcType }</td>
				<td>${rc.rcTypeCount }</td>
				<td>${rc.rcInterior }</td>
				<td>
					<a href = "update.do?rcNo=${rc.rcNo }">수정</a> | 
					<a href = "delete.do?rcNo=${rc.rcNo }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href = "insert.do">추가하기</a>
</body>
</html>