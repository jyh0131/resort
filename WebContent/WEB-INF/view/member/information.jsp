<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>  
<%@ include file= "../include/header.jsp" %>
<style>
#con {
	width:1024px;
	margin:0 auto;
}
#con table td{
	border:0.1px solid gray;
}

#con .left{
	background-color:#FFF2E6;
	width:150px;
	height:40px;
	padding-left: 20px;
}
#con .right{
	width:700px;
	height:40px;
	padding-left: 10px;
}
#con input{
	height:17px;
}

#con table{
	margin-top :200px;
	border-collapse: collapse;
}
#con #bottom{   
	margin-top:20px;
	margin-left:400px;
}
#con #Line{
	font-weight: bold;
	font-size: 16px;
}
#con .input{
	display: none;
}
#con #bottom a{
	height: 27px;
    background-color: #6CC0FF;
    color: white;
    border-radius: 7px 7px 7px;
    font-weight: bold;
    text-decoration: none;
    padding:5px;
}

</style>

</head>
<body></body>
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
	 	<td class = "right"><fmt:formatDate value="${member.mRegdate}" pattern="yyyy-MM-dd"/></td>
	 </tr>
 
 </table>
	 <div id = "bottom"> 
		<a href = "update.do">회원 정보 수정</a>
	</div>
	<br>
</div>
<%@ include file= "../include/footer.jsp" %>