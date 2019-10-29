<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	p#btns{
		width: 700px;
		height: 30px;
		margin: 0 auto;
		text-align: right;
		overflow: hidden;
	}
	#btns>#list{
		float: left;
	}
	table{
		width: 700px;
		margin: 20px auto;
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
	div#answer{
		width: 660px;
		margin: 30px auto;
		background: rgba(223, 210, 179, 0.5);
		border-radius: 10px;
		padding: 20px;
		font-size: 14px;
	}
	#answer>p{
		text-align: right;
		color: #666;
	}
	#answer>p>span{
		float: left;
		color: #977F51;
	}
	hr{
		border: 1px dashed #977F51;
		margin: 10px 0px;
	}
</style>
<script>
	$(function() {
		$("#list").click(function() {
			location.href="${pageContext.request.contextPath}/question/list.do";
		})
		$("#updateQ").click(function() {
			location.href="${pageContext.request.contextPath}/question/update.do?no=${q.qNo}";
		})
		$("#deleteQ").click(function() {
			location.href="${pageContext.request.contextPath}/question/delete.do?no=${q.qNo}";
		})
		$("#insertA").click(function() {
			location.href="${pageContext.request.contextPath}/answer/add.do?no=${q.qNo}";
		})
		$("#updateA").click(function() {
			location.href="${pageContext.request.contextPath}/answer/update.do?no=${q.qNo}";
		})
		$("#deleteA").click(function() {
			location.href="${pageContext.request.contextPath}/answer/delete.do?no=${a.aNo}";
		})
	})
</script>
<section>
	<%@ include file="../../include/qna/front.jsp" %>
	<p id="btns">
		<button id="list">목록 가기</button>
		<c:if test="${Auth == q.mId}">
			<button id="updateQ">질문 수정</button>
		</c:if>
		<c:if test="${a == null && admin == 1}"><!-- 답변 없을 때 -->
			<button id="insertA">답변 등록</button>
		</c:if>
		<c:if test="${a != null && admin == 1}"><!-- 답변 있을 때 -->
			<button id="updateA">답변 수정</button>
			<button id="deleteA">답변 삭제</button>
		</c:if>
		<c:if test="${Auth == q.mId || admin == 1}">
			<button id="deleteQ">질문 삭제</button>
		</c:if>
	</p>
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
				<c:if test="${q.qFile != null}">
					<img src="${pageContext.request.contextPath}/upload/${q.qFile}">
				</c:if>
			</td>
		</tr>
		<tr>
			<td>내용  | </td>
			<td colspan="3">${q.qContent}</td>
		</tr>
	</table>
	<!-- 답변 있을 때만 -->
	<c:if test="${a != null}">
		<div id="answer">
			<p><span>RE : 대명리조트입니다.</span> 관리자 | ${a.aDate}</p>
			<hr>
			${a.aContent}
		</div>
	</c:if>
	
</section>
<%@ include file="../../include/footer.jsp" %>