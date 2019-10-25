<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	p#btns{
		width: 700px;
		margin: 0 auto;
		text-align: right;
		overflow: hidden;
	}
	button#allList{
		float: left;
	}
	table{
		width: 700px;
		margin: 20px auto;
		border-collapse: collapse;
		text-align: center;
		font-size: 13px;
		color: #333;
		border-top: 2px solid #977F51;
	}
	tr{
		border-bottom: 1px solid #ddd;
	}
	td{
		padding: 10px;
	}
	td#title{
		display: inline-block;
		width: 300px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	a.detail{
		text-decoration: none;
		color: #333;
	}
	span#answer{
		background: #DFD2B3;
		color: #fff;
		border-radius: 5px;
		padding: 1px 3px;
	}
</style>
<script>
	$(function() {
		$("#allList").click(function() {
			location.href = "${pageContext.request.contextPath}/question/list.do";
		})
		
		$("#write").click(function() {
			<c:if test="${Auth==null}">
				alert("로그인 후 이용해주세요.");
			</c:if>
			<c:if test="${Auth!=null}">
				location.href = "${pageContext.request.contextPath}/question/add.do";
			</c:if>	
		})
	})
</script>
<section>
	<%@ include file="../../include/qna/front.jsp" %>
	<p id="btns">
		<button id="allList">전체 목록</button>
		<button id="write">질문하기</button>
	</p>
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
			<td id="title">
				<a href="${pageContext.request.contextPath}/question/detail.do?no=${q.qNo}" class="detail">
					${q.qTitle}
					<c:forEach var="dbQNo" items="${qNoList}">
						<c:if test="${q.qNo == dbQNo}"> <!-- 답변이 있으면 -->
							<span id="answer">Re</span>
						</c:if>
					</c:forEach>
				</a>
			</td>
			<td>${q.mId}</td>
			<td>${q.qDate}</td>
		</tr>
		</c:forEach>
	</table>
</section>
<%@ include file="../../include/footer.jsp" %>