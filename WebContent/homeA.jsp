<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/view/include/headerA.jsp" %>
<style>
	h1{
		text-align: center;
	}
	a.chart{
		margin-left: 530px;
		padding: 10px;
		border: 1px solid #ccc;
		text-decoration: none;
		color: #000;
	}
	#test{/* 임시용 height */
		height: 500px;
	}
</style>
<div id = "test">
	<h1><a href = "${pageContext.request.contextPath}/home.jsp">회원용 홈</a></h1><!-- do?home=user -->
</div>
<%@ include file="WEB-INF/view/include/footer.jsp" %>