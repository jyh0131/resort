<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<script>

$(function(){
	
	$("form").submit(function(){
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
fieldset{
	width:300px;
	padding-top:10px;
	padding-left:10px;
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
<fieldset>

<p>아이디 찾기</p>
<br>
<form action = "findCheck.do" method = "post">

<table>
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
<input type = "submit" value = "아이디 찾기" id = "submit">
<br><br>
<p class = "up"></p>

</form>

<c:if test = "${list == true }">
<br>
<p class = "down">이름과 전화번호가 일치하지 않습니다</p>

</c:if>
</fieldset>
</div>


<%@ include file="../include/footer.jsp"%>