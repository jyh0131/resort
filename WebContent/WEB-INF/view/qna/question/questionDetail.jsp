<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	table{
		width: 700px;
		margin: 0 auto;
		border-collapse: collapse;
		border-top: 2px solid #977F51;
	}
	tr{
		border-bottom: 1px solid #ddd;
	}
	td{
		padding: 10px 5px;
		font-size: 14px;
		color: #333;
	}
	td:nth-child(2n-1){
		width: 70px;
		color: #DFD2B3;
		padding-right: 20px;
	}
	td:nth-child(2n){
		padding-left: 20px;
	}
	td#title{
		font-weight: bold;
		color: #977F51;
	}
	td>img{
		width: 30%;
	}
</style>
<section>
	<%@ include file="../../include/qna/front.jsp" %>
	<table>
		<tr>
			<td colspan="4" id="title">${q.qTitle}</td> 
		</tr>
		<tr>
			<td>작성자 | </td>
			<td>${q.mId}</td>
			<td>질문 유형 | </td>
			<td>${q.qType}</td>
		</tr>
		<tr>
			<td>첨부파일 | </td>
			<td colspan="3">
				<c:if test="${q.qFile} != null">
					<img src="${pageContext.request.contextPath}/upload/${q.qFile}">
				</c:if>
			</td>
		</tr>
		<tr>
			<td>내용  | </td>
			<td colspan="3">${q.qContent}</td>
		</tr>
	</table>
	<!-- 답변 -->
</section>
<%@ include file="../../include/footer.jsp" %>