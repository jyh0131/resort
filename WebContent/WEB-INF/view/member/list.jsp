<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../include/headerA.jsp" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%> 

<script>

$(function(){
	
/* 	$.ajax({
	
		url:"${pageContext.request.contextPath}/member/list.do",
		type:"get",
		data:{"id":$("#password").val()},
		dataType:"json",
		success:function(res){
			console.log(res);
			
			var star = "*";
			var password= "${member.mPassword }";
			
			for(var i= 0; i >= password.length; i++ ){
					replace.		
			}			
		}	
	}) */
	
})

</script>

<style>

table,th,td{
	border: 1px solid black;
}
table{
	border-collapse: collapse;	
}
#con{
	margin-left:600px;
	margin-top:100px;
}

#id,#out,#password,#date{
	text-align: center;
}
#list{
	font-size: 21px;
	font-weight: bold;
	margin-left:270px;
}


</style>


</head>
<body>

<div id = "con">

<p id = "list">모든 회원 검색</p>
<br>
<table>

	<tr>
		<th>회원 아이디</th>
		<th>회원 이름</th>
		<th>회원 전화번호</th>
		<th>회원 이메일</th>
		<th>회원 생년월일</th>
		<th>탈퇴 여부</th>
	</tr>

<c:forEach var ="member" items = "${list }">

	<tr>
		<td id = "id">${member.mId }</td>
		<td>${member.mName }</td>
		<td>${member.mPhone }</td>
		<td>${member.mEmail }</td>
		<td id = "date"><fmt:formatDate value="${member.mRegdate}" pattern="yyyy-MM-dd"/></td>
		<td id = "out">${member.mOut }</td>
	</tr>

</c:forEach>


</table>
</div>

