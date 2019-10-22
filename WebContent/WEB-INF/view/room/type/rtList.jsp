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
			<th>객실 타입 번호</th>
			<th>객실 타입 이름</th>
			<th>수정 / 삭제 </th>
		</tr>
		<c:forEach var = "rt" items = "${list }">
			<tr>
				<td>${rt.rtNo }</td>
				<td>${rt.rtName }</td>
				<td>
					<a href = "update.do?rtNo=${rt.rtNo }">수정</a> | 
					<a href = "delete.do?rtNo=${rt.rtNo }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>