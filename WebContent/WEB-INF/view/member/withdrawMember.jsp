<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>    

<%@ include file= "../include/header.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>

$(function(){
	$("form").submit(function(){
		
		var Id = /^[a-zA-Z0-9]{4,17}$/;
		var id = $("input[name='id']").val();
		if(id == false) {
			$(".show").eq(0).css("display", "inline");		
			return false;
		}else if(Id.test(id) == false){
			$(".show").eq(0).css("display", "inline");
			$(".show").eq(0).text("영어 숫자 조합의 아이디를 입력하십시오");
			return false;
		}
		
		var Password = /^[a-zA-Z0-9]{4,17}$/;
		var password = $("input[name='password']").val();	
		if(password == false) {
			$(".show").eq(1).css("display", "inline");						
			return false;
		}else if(Password.test(password) == false){
			$(".show").eq(1).css("display", "inline");
			$(".show").eq(1).text("영어 숫자 조합의 비밀번호를 입력하십시오");
			return false;
		}
		
		
		
		
		
	})
})

</script>

<style>
#title{
	font-size: 27px;
	color:#00B4DB;
	text-align: center;
}
#con{
	margin: 0 auto;
	width:360px;
	margin-top:20px;
}
#con fieldset{
	width:360px;
	height:160px;
	border-color: #D4F4FA;
}
#con #login_title{
	font-weight: bold;
	margin-left:30px;
}
#con table{
	margin-left:50px;
	margin-top:30px;
}
#con label{
	font-size: 17px;
	color: gray;
}
#con input{
	height:17px;
}
#con #submit{
	margin-left:224px;
	height:27px;
	margin-top:7px;
	width:70px
}
#con .show{
	font-size: 12px;
	font-weight: normal;
	display: none;
	color:red;
}
#con #correct{
	text-align: center;
	color:red;
	font-size: 17px;
}
#con a.admin_list {
	text-decoration: none;
	color:#00B4DB;
	text-align:center;
	display:block;
	margin-top:5px;
}
#con #withdraw{
	text-align:center;
	display: none;
}
</style>
<p id="title">회원 탈퇴</p>
<form action="withdraw.do" method="post">
<div id="con">
	<fieldset>
	<br>
	<span id="login_title">회원 탈퇴를 위해 비밀번호를 입력해주세요</span>
		<table>
			<tr>
				<td><label>비밀번호</label></td>
				<td><input type="password" name="password"></td>
			</tr>
		</table>
			<span class="show">비밀번호를 입력하십시오</span>
		<input type="submit" value="확인" id="submit">
	</fieldset>
</div>
</form>

<c:if test = "${login == true }">
<br>
<p id = "correct">아이디와 비밀번호가 일치하지 않습니다</p>

</c:if>

<%@ include file= "../include/footer.jsp" %>

