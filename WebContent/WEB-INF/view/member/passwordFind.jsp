<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<script>

$(function(){
	
	$("form").submit(function(){
		var id = $("input[name='id']").val();
		
		if(id == ""){
			$(".up").text("아이디를 입력해주세요");
			$(".up").css("color","red");
			return false;
		}
		var name = $("input[name='name']").val();
		
		if(name == ""){
			$(".up").text("이름를 입력해주세요");
			$(".up").css("color","red");
			return false;
		}
		var phone = $("input[name='phone']").val();
		if(phone == ""){
			$(".up").text("전화번호를 입력해주세요");
			$(".up").css("color","red");
			return false;
		}
		
	})
})

</script>


<style>

table{
	width:300px;
	height:100px;
}
#con{
	margin-left:800px;
}
#submit{
	margin-left: 130px;
}
.up{
	margin-left: 70px;
}
.down{
	color:red;
}
</style>

</head>
<body>

<div id = "con">
<p>비밀번호 찾기</p>
<br>
<form action = "findCheckPassword.do" method = "post">
<table>
	<tr>
		<td>아이디</td>
		<td><input type = "text" name = "id"></td>
	</tr>

	<tr>
		<td>이름</td>
		<td><input type = "text" name = "name"></td>
	</tr>

	<tr>
		<td>휴대전화</td>
		<td><input type = "text" name = "phone" placeholder= "-없이 입력해주세요"></td>
	</tr>
	
</table>
<br>
<input type = "submit" value = "비밀번호 찾기" id = "submit">
<br><br>
<p class = "up"></p>

</form>

<c:if test = "${list == true }">
<br>
<p class = "down">아이디와 이름과 전화번호가 일치하지 않습니다</p>

</c:if>



</div>


<%@ include file="../include/footer.jsp"%>