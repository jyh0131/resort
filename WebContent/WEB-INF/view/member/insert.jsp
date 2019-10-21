<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action = "add.do" method = "post">

<label>아이디 :</label> <input type = "text" name ="id"><br>
<label>비밀번호 :</label> <input type = "text" name ="password"><br>
<label>이름 :</label> <input type = "text" name ="name"><br>
<label>전화번호 :</label> <input type = "text" name ="number"><br>
<label>이메일 :</label> <input type = "text" name ="email"><br>
<label>생년월일 :</label> <input type = "date" name ="date"><br>

<input type = "hidden" name = "out" ><br>
<input type = "hidden" name = "admin"><br>

<input type = "submit" value = "회원 가입">


</form>


</body>
</html>