<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../include/header.jsp" %>

<style>

#con{
	margin-left:800px;
	width:400px;
}
span{
	text-align:center;
}
#con a{
	text-align:center;
	font-weight:bold;
	font-style:inherit;
	text-decoration: none;
	color:black;
}

#img{
	text-align:center;
}
</style>

</head>
<body>

<div id = "img">
<img src = "${pageContext.request.contextPath}/images/cc.PNG" class = "img">
</div>

<br><br>
<div id = "con">

<span>가입을 축하드립니다.</span>  |  <a href = "login.do">로그인</a>


</div>
 <br><br><br><br><br>

  
<%@ include file= "../include/footer.jsp" %>