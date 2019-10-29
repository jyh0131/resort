<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>  
<%@ include file= "../include/header.jsp" %>

<style>

#con{
	margin-top:170px;
	margin-left: 860px;
}

p{
	font-weight: bold;
}

#href{
	margin-left:60px;
	text-decoration: none;
	color: black;
	font-size: 19px;
}

</style>

</head>
<body>

<div id = "con">

<p>회원 정보가 변경되었습니다.</p>
<br><br>
<a href = "main.do" id = "href">메인으로</a>

</div>

<%@ include file= "../include/footer.jsp" %>


