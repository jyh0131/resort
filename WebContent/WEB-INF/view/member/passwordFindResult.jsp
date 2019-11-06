<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../include/headerA.jsp" %>

<style>

#con{
	margin-top:100px;
	margin-left:800px;
}
table{
	width:300px;
	height:130px;
	border-collapse: collapse;
}

table,td{
	border: 1px solid gray;
}
.left{
	width:100px;
	text-align: center;
}
.right{
	text-align: center;
}
.down{
	margin-left:90px;
}

</style>

</head>
<body>

<div id = "con">
<c:forEach var ="member" items = "${list }">

<table>

<tr>
	<td class = "left"><label>비밀번호</label></td>
	<td class = "right">${member.mPassword }</td>
</tr>


</table>

</c:forEach>
<br><br>
<a href = "login.do" class = "down">로그인 바로 가기</a>
<br><br>

</div>

<%@ include file="../include/footer.jsp"%>