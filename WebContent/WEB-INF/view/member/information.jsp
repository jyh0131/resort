<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>  
<%@ include file= "../include/header.jsp" %>

<script>



</script>



<style>

table,td{
	border:0.1px solid gray;
}
table{
	border-collapse: collapse;
}

.left{
	background-color:#FFF2E6;
	width:150px;
	height:40px;
	padding-left: 20px;
}
.right{
	width:700px;
	height:40px;
	padding-left: 10px;
}
input{
	height:17px;
}

#con,table{
	margin-top :200px;
	margin-left: 270px;
}
#bottom{
	margin-top:17px;
	margin-left:700px;
}
#Line{
	font-weight: bold;
	font-size: 16px;
}
#join{
	height:27px;
	background-color: #6CC0FF;
	color:white;
	border-radius: 7px 7px 7px;
	font-weight: bold;
}
#cancel{
	height:27px;
}
 
.input{
	display: none;
}

#withdraw{
	margin-left:940px;
}

</style>

</head>
<body>

<form action = "update.do" method ="post">
 
 <div id = "con">
 
 <table>
 
	 <tr>
	 	<td class = "left">회원분류</td>
	 	<td class = "right" id = "Line">D멤버스 회원</td>
	 </tr>
	 <tr>
	 	<td class = "left"><label>이름 </label></td>
	 	<td class = "right">${member.mName }</td>
	 </tr>
	 <tr>
	 	<td class = "left"><label>아이디 </label></td>
	 	<td class = "right">${member.mId }</td>
	 </tr>

	  <tr>
	 	<td class = "left"><label>비밀번호 </label></td>
	 	<td class = "right">*******</td>
	 </tr>

	  <tr>
	 	<td class = "left"><label>전화번호 </label></td>
	 	<td class = "right">${member.mPhone }</td>
	 </tr>
	 
	  <tr>
	 	<td class = "left"><label>이메일 </label></td>
	 	<td class = "right">${member.mEmail }</td>
	 </tr>
	 
	  <tr>
	 	<td class = "left"><label>생년월일</label></td>
	 	<td class = "right">${member.mRegdate }</td>
	 </tr>
 
 </table>
 
	 <div id = "bottom"> 
		<input type = "submit" value = "변경" id = "join">
		<input type = "reset" value = "취소" id = "cancel">
	</div>
	<br>

</div>

</form>

<a href = "update.do" id = "withdraw">회원 정보 수정</a>


<%@ include file= "../include/footer.jsp" %>