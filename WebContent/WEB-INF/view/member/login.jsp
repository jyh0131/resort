<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>

$(function(){
	$("#submit").click(function(){
		var result = checkInputEmpty($("input[name]"));
		if(result == false){
			return false;
		}
	})
	
})

</script>


</head>
<body>

<form action = "login.do" method ="post">

아이디 :<input type ="text" name = "id" id = "id"><br>
비밀번호 :<input type ="text" name = "password" ><br>
 
<input type ="submit" value = "접속" id ="submit" ><br>

</form>

<c:if test = "${login == true }">

아이디와 비밀번호가 일치하지 않습니다

</c:if>


</body>
</html>