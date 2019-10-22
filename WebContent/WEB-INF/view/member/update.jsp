<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../include/header.jsp" %>

</head>
<body>

<form action = "update.do" method ="post">
 
패스워드 :<input type ="text" name = "password" ><br>
폰번호 :<input type ="text" name = "number" ><br>
이메일 :<input type ="text" name = "email" ><br>
날짜 :<input type ="date" name = "date" ><br>
<input type ="submit" value = "변경" ><br>
 
</form>


<%@ include file= "../include/footer.jsp" %>