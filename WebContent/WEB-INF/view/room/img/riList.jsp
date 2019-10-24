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
	td > img{
		width: 300px;
		height: 250px;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>객실 이미지 번호</th>
			<th>객실 이름</th>
			<th>객실 이미지</th>
			<th>수정 / 삭제 </th>
		</tr>
		<c:forEach var = "ri" items = "${list }">
			<tr>
				<td>${ri.riNo }</td>
				<td>${ri.roomName.rnName }</td>
				<td>
					<img src = "${pageContext.request.contextPath }/roomimages/${ri.riFile }">
				</td>
				<td>
					<a href = "update.do?riNo=${ri.riNo }">수정</a> | 
					<a href = "delete.do?riNo=${ri.riNo }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>