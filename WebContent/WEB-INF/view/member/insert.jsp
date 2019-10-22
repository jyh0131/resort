<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../include/header.jsp" %>

</head>
<body>

<form action = "add.do" method = "post">
 
<label>아이디 :</label> <input type = "text" name ="id"><br>
<label>비밀번호 :</label> <input type = "text" name ="password"><br>
<label>이름 :</label> <input type = "text" name ="name"><br>
<label>전화번호 :</label> <input type = "text" name ="number"><br>
<label>이메일 :</label> <input type = "text" name ="email"><br>
<label>생년월일 :</label> <input type = "date" name ="date"><br>
 
<input type = "submit" value = "회원 가입">


</form>

<%@ include file= "../include/footer.jsp" %>