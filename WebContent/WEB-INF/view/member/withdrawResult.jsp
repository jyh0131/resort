<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../include/header.jsp" %>

<style>

#con{
	margin-left:800px;
}
#home{
	color:black;
	margin-left:24px;
}
.img{
	margin-left:510px;
}
</style>

</head>
<body>
<br><br>

<img src = "${pageContext.request.contextPath}/images/withdraw2.PNG"class = "img">

<div id ="con">
	
	<br>
	<a href = "/resort/home.do" id = "home">홈으로</a>
</div>

<%@ include file= "../include/footer.jsp" %>>