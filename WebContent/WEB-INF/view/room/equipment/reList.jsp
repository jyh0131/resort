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
			<th>비품 구성 번호</th>
			<th>객실 이름</th>
			<th>가구류</th>
			<th>가전류</th>
			<th>식기류</th>
			<th>세면류</th>
			<th>침구류</th>
			<th>기타</th>
			<th>어메니티</th>
			<th>수정 / 삭제 </th>
		</tr>
		<c:forEach var = "re" items = "${list }">
			<tr>
				<td>${re.reNo }</td>
				<td>${re.roomName.rnName }</td>
				<td>${re.reFurniture}</td>
				<td>${re.reHomeAppliances }</td>
				<td>${re.reTableWare }</td>
				<td>${re.reWash }</td>
				<td>${re.reBedding }</td>
				<td>${re.reOther }</td>
				<td>${re.reAmenity }</td>
				<td>
					<a href = "update.do?reNo=${re.reNo }">수정</a> | 
					<a href = "delete.do?reNo=${re.reNo }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href = "insert.do">추가하기</a>	
</body>
</html>