<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>  
<%@ include file= "../include/header.jsp" %>

<script>

$(function(){
	
	$("#join").click(function(){
					
		var Password = /^[a-zA-Z0-9]{4,13}$/;
		var password = $("input[name='password']").val();
			
		if(Password.test(password) == true) {
			$(".input").eq(0).css("display", "none");			
			
		} else {
			$(".input").eq(0).css("display", "inline");	
			return false;
		}
		
		var Number = /^[0-9]{10,11}$/;
		var number = $("input[name='number']").val();
			
		if(Number.test(number) == true) {
			$(".input").eq(1).css("display", "none");			
			
		} else {
			$(".input").eq(1).css("display", "inline");	
			return false;
		}			
		
		var Email = /^[a-zA-Z0-9]{4,17}/;
		var email = $("input[name='email']").val();
		
		if(Email.test(email) == true) {
			$(".input").eq(2).css("display", "none");			
		} else {
			$(".input").eq(2).css("display", "inline");	
			return false;
		}		
		
		var date = $("input[name='date']").val();
		
		if(date != null){
			$(".input").eq(3).css("diplay","none");
		}else if(date == null){
			$(".input").eq(3).css("diplay","inline");
			return false;
		}

		 	 
	})	
		
})

function passwordCheckFunction(){
	
	var password1 = $("#password").val();
	var password2 = $("#passwordCheck").val();
	
	if(password1 != password2){
		$("#pass").text("비밀번호가 일치하지 않습니다")
		
	}else{
		$("#pass").text("비밀번호가 일치합니다")
	}
}
</script>
<style>
#con {
	width:1024px;
	margin: 0 auto;
}
#con table td{
	border:0.1px solid gray;
}
#con table {
	border-collapse: collapse;
	margin-top :200px;
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

#con #bottom #join {
    height: 27px;
    background-color: #6CC0FF;
    color: white;
    border-radius: 7px 7px 7px;
    font-weight: bold;
    text-decoration: none;
    padding:5px;
    border:none;
}

#con #bottom{
	margin-top:17px;
	margin-left:400px;
}
#con #Line{
	font-weight: bold;
	font-size: 16px;
}
#con #cancel{
	height:27px;
}
 
#con .input{
	display: none;
}

#con #withdraw{
	margin-left:940px;
}
#out {
	margin-top:10px;
	margin-left:825px;
}
#out a{
	display:inline-block;
	border:1px solid black;
	background:#FFF2E6;
	color:black;
	text-decoration: none;
	padding:5px;
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
	 	<td class = "left"><label>비밀번호 </label></td>
	 	<td class = "right"><input type = "password" name ="password" id = "password" value = "" placeholder= "4자 이상 17자 이하 비밀번호"><span class="input">4자리 이상의 17자리 이하의 비밀번호를 입력하세요.</span></td>
	 </tr>
	 
	 <tr>
	 	<td class = "left"><label>비밀번호 확인 </label></td>
	 	<td class = "right"><input type = "password" name ="passwordCheck" id = "passwordCheck" onkeyup = "passwordCheckFunction()"> &nbsp; <span id ="pass"></span></td>
	 </tr>
	 
	  <tr>
	 	<td class = "left"><label>전화번호 </label></td>
	 	<td class = "right"><input type = "text" name ="number" placeholder ="-없이 입력해주세요"><span class="input">전화번호를 입력하세요.</span></td>
	 </tr>
	 
	  <tr>
	 	<td class = "left"><label>이메일 </label></td>
	 	<td class = "right"><input type = "text" name ="email"><span class="input">이메일을 입력하세요.</span></td>
	 </tr>
	 
	  <tr>
	 	<td class = "left"><label>생년월일</label></td>
	 	<td class = "right"><input type = "date" name ="date"><span class="input">생년월일을 입력하세요.</span></td>
	 </tr>
 
 </table>
 
	 <div id = "bottom"> 
		<input type = "submit" value = "변경" id = "join">
		<input type = "reset" value = "취소" id = "cancel">
	</div>
	<br>

</div>
	<div id="out">
 		<a href = "withdraw.do" id = "withdraw">회원 탈퇴하기</a>
	</div>
</form>
<%@ include file= "../include/footer.jsp" %>

