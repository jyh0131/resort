<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../include/header.jsp" %>

<style>

#con{
	margin-left:800px;
}
#aa{
	color:black;
}
.img{
	margin-left:510px;
}
</style>

</head>
<body>

<img src = "${pageContext.request.contextPath}/images/withdraw.PNG"class = "img">

<div id ="con">
	
	<a href = "withdrawLogout.do" class = "aa">탈퇴하시겠습니까?</a>&nbsp;&nbsp;&nbsp;<a href = "/resort/home.do" class = "aa">홈으로</a>
</div>

<%@ include file= "../include/footer.jsp" %>>