<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/view/include/header.jsp" %>
<style>
	h1{
		text-align: center;
	}
	a#chart{
		margin-left: 530px;
		padding: 10px;
		border: 1px solid #ccc;
		text-decoration: none;
		color: #000;
	}
</style>
<h1>임시 관리자 홈 화면</h1>
<br>
<a href="${pageContext.request.contextPath}/question/chart.do" id="chart">질문 유형 차트</a>

<%@ include file="WEB-INF/view/include/footer.jsp" %>