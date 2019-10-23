<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	p#btns{
		width: 700px;
		height: 30px;
		margin: 0 auto;
		text-align: right;
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
</style>
<script>
	$(function() {
		$("#write").click(function() {
			<c:if test="${Auth==null}">
				alert("로그인 후 이용해주세요.");
			</c:if>
			<c:if test="${Auth!=null}">
				location.href = "${pageContext.request.contextPath}/question/add.do";
			</c:if>	
		})
		
		$("#read").click(function() {
			<c:if test="${Auth==null}">
				alert("로그인 후 이용해주세요.");
			</c:if>
			<c:if test="${Auth!=null}">
				location.href = "${pageContext.request.contextPath}/question/myQ.do?id=${q.mId}";
			</c:if>	
		})
	})
</script>
<section>
	<%@ include file="../include/qna/front.jsp" %>
	<p id="btns">
		<button id="write">질문하기</button>
		<button id="read">내 질문보기</button>
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