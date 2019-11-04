<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../include/header.jsp" %>

<style>

table,th,td{
	border: 1px solid black;
}
table{
	border-collapse: collapse;	
}
#con{
	margin-left:444px;
	margin-top:100px;
}

#id,#out,#password{
	text-align: center;
}
p{
	font-size: 21px;
	font-weight: bold;
	margin-left:333px;
}


</style>


</head>
<body>

<div id = "con">

<p>현재 가입된 회원 검색</p>
<br>
<table>

	<tr>
		<th>회원 아이디</th>
		<th>회원 비밀번호</th>
		<th>회원 이름</th>
		<th>회원 전화번호</th>
		<th>회원 이메일</th>
		<th>회원 생년월일</th>
		<th>탈퇴 여부</th>
	</tr>

<c:forEach var ="member" items = "${list }">

	<tr>
		<td id = "id">${member.mId }</td>
		<td id = "password">*******</td>
		<td>${member.mName }</td>
		<td>${member.mPhone }</td>
		<td>${member.mEmail }</td>
		<td>${member.mRegdate }</td>
		<td id = "out">${member.mOut }</td>
	</tr>

</c:forEach>


</table>
</div>

<%@ include file= "../include/footer.jsp" %>


