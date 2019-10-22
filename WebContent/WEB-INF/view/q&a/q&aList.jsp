<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	table{
		width: 700px;
		margin: 20px auto;
		border-collapse: collapse;
		text-align: center;
		font-size: 13px;
		color: #333;
	}
	tr{
		border-bottom: 1px solid #ddd;
	}
	td{
		padding: 5px 10px;
	}
	a.detail{
		text-decoration: none;
		color: #333;
	}
</style>
<section>
	<%@ include file="../include/qna/front.jsp" %>
	<table>
		<tr>
			<td>순번</td>
			<td>구분</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<c:forEach var="q" items="${list}">
		<tr>
			<td>${q.qNo}</td>
			<td>${q.qType}</td>
			<td>
				<a href="${pageContext.request.contextPath}/question/detail.do?no=${q.qNo}" class="detail">
					${q.qTitle}
					<%-- <c:if> 답변 테이블에 질문 번호를 값으로 가진 행이 있으면
						<span id="answer"></span>
					</c:if> --%>
				</a>
			</td>
			<td>${q.mId}</td>
			<td>${q.qDate}</td>
		</tr>
		</c:forEach>
	</table>
</section>
<%@ include file="../include/footer.jsp" %>