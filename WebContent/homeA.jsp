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
</style>
<h1>임시 관리자 홈 화면</h1>
<br>
<a href="${pageContext.request.contextPath}/admin/qTypeChart.do" class="chart">질문 유형 차트</a>
<a href="${pageContext.request.contextPath}/admin/salesChart.do" class="chart">월별 매출 차트</a>
<%@ include file="WEB-INF/view/include/footer.jsp" %>