<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
</style>
<section>
	<%@ include file="../../include/qna/front.jsp" %>
	<table>
		<tr>
			<td colspan="4">${q.qTitle}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${q.mId}</td>
			<td>질문 유형</td>
			<td>${q.qType}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td colspan="3">
				<img src="${pageContext.request.contextPath}/upload/${q.qFile}">
			</td>
		</tr>
	</table>
</section>
<%@ include file="../../include/footer.jsp" %>