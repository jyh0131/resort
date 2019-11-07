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
	td#pageBtn>a{
		display: inline-block;
		width: 20px;
		height: 20px;
		color: #977F51;
		text-decoration: none;
		border: 0.5px solid #977F51;
		margin: 5px;
		cursor: pointer;
	}
	a#btnPrev{
		background: url("${pageContext.request.contextPath}/images/pageBtn/btn_prev.png") center;
	} 
	a#btnNext{
		background: url("${pageContext.request.contextPath}/images/pageBtn/btn_next.png") center;
	}
	a#btnFirst{
		background: url("${pageContext.request.contextPath}/images/pageBtn/btn_first.png") center;
	}
	a#btnLast{
		background: url("${pageContext.request.contextPath}/images/pageBtn/btn_last.png") center;
	}
	p#pageNumber{
		width: 700px;
		color: #aaa;
		font-size: 13px;
		margin: 0 auto;
	}
	p#pageNumber>span{
		color: #977F51;
		font-weight: bold;
	}	
</style>
<script>
	$(function() {
		//전체 목록
		$("#allList").click(function() {
			location.href = "${pageContext.request.contextPath}/question/list.do";
		})
		
		//질문하기
		$("#write").click(function() {
			<c:if test="${Auth==null}">
				alert("로그인 후 이용해주세요.");
			</c:if>
			<c:if test="${Auth!=null}">
				location.href = "${pageContext.request.contextPath}/question/add.do";
			</c:if>	
		})
		
		//선택된 페이지 번호 CSS
		$(".btnNum").eq("${page.currentPage%5-1}").css("background", "#977F51").css("color", "#fff");
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
		<c:if test="${page.total == 0}"><!-- 게시글이 0개면 -->
			<tr>
				<td colspan="5">게시글이 없습니다.</td>
			</tr>
		</c:if>
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
		<c:if test="${total != 0}">
			<tr id="pageBtns">
				<td colspan="5" id="pageBtn">
					<c:if test="${page.startPage > 5}">
						<a href="${pageContext.request.contextPath}/question/myQ.do?pageNo=1" id="btnFirst">&nbsp;</a>
						<a href="${pageContext.request.contextPath}/question/myQ.do?pageNo=${page.startPage-5}" id="btnPrev">&nbsp;</a>
					</c:if>
					
					<c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}">
						<a  href="${pageContext.request.contextPath}/question/myQ.do?pageNo=${pNo}" class="btnNum" data-pNo="${pNo}">${pNo}</a>
					</c:forEach>
					
					<c:if test="${page.endPage < page.totalPages && page.totalPages > 5}">
						<a href="${pageContext.request.contextPath}/question/myQ.do?pageNo=${page.startPage+5}" id="btnNext">&nbsp;</a>
						<a href="${pageContext.request.contextPath}/question/myQ.do?pageNo=${page.totalPages}" id="btnLast">&nbsp;</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
	<p id="pageNumber">전체 ${page.total} | 페이지 <span>${page.currentPage}</span>/${page.totalPages}</p>
</section>
<%@ include file="../../include/footer.jsp" %>