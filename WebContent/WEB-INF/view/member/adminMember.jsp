<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

table,td{
	border: 1px solid black;
}
table{
	border-collapse: collapse;
}

</style>


</head>
<body>

<table>

	<tr>
		<td>회원 아이디</td>
		<td>회원 비밀번호</td>
		<td>회원 이름</td>
		<td>회원 전화번호</td>
		<td>회원 이메일</td>
		<td>회원 생년월일</td>
		<td>탈퇴 여부</td>
		<td>관리자 여부</td>
	</tr>

<c:forEach var ="member" items = "${list }">

	<tr>
		<td>${member.mId }</td>
		<td>${member.mPassword }</td>
		<td>${member.mName }</td>
		<td>${member.mPhone }</td>
		<td>${member.mEmail }</td>
		<td>${member.mRegdate }</td>
		<td>${member.mOut }</td>
		<td>${member.mAdmin }</td>
	</tr>

</c:forEach>


</table>


</body>
</html>


