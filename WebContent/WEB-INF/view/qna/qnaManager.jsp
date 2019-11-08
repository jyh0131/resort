<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerA.jsp" %>
<style>
	section{
		width: 100%;
		padding-top: 50px; 
	}
	h1{
		text-align: center;
		color: #977F51;
	}
	table{
		width: 1000px;
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
	span.question, span.delete, span.answerUpd, span.answerDel, span.answerAdd{
		background: #DFD2B3;
		color: #fff;
		border-radius: 5px;
		padding: 1px 3px;
		cursor: pointer;
	}
	span.delete:hover{
		color: #977F51;
	}
	td.titleTD{
		text-align: left;
		padding-left: 30px;
	}
	a.detail{
		text-decoration: none;
		color: #333;
		cursor: pointer;
	}
	.selDetail{
		color: #977F51;
		font-weight: bold;
		background: rgba(223, 210, 179, 0.5);
		border: 1px solid #DFD2B3;
	}
	.selDetail a{
		color: #977F51;
	}
	a.detail:hover{
		text-decoration: underline;
	}
	span.title{
		display: inline-block;
		width: 270px;
		vertical-align: middle;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	tr.hold{
		display: none;
		border: 1px solid #DFD2B3;
	}
	td.content{
		text-align: left;
		padding: 0px 30px;
	}
	tr.hold span{
		font-size: 12px;
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
		width: 1000px;
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
		//제목 클릭 시 내용 보이기
		$(".detail").click(function() {
			$(this).closest(".qList").toggleClass("selDetail");
			$(this).closest(".qList").next().toggle();
			$(this).closest(".qList").next().next().toggle();
		})
		
		//질문 삭제 버튼 클릭 시 삭제 후 페이지 갱신
		$(".delete").click(function() {
			var no = $(this).attr("data-no");
			location.href="${pageContext.request.contextPath}/question/delete.do?key=admin&no=" + no;
		})
		
		//답변 수정 버튼 클릭 시 수정 페이지로 이동
		$(".answerUpd").click(function() {
			var no = $(this).attr("data-no");
			location.href="${pageContext.request.contextPath}/answer/update.do?key=admin&no=" + no;
		})
		
		//답변 삭제 버튼 클릭 시 삭제 후 갱신
		$(".answerDel").click(function() {
			var no = $(this).attr("data-no");
			location.href="${pageContext.request.contextPath}/answer/delete.do?key=admin&no=" + no;
		})
		
		//답변 추가 버튼 클릭 시 해당 질문 detail 페이지로 이동
		$(".answerAdd").click(function() {
			var no = $(this).attr("data-no");
			location.href="${pageContext.request.contextPath}/answer/add.do?key=admin&no=" + no;
		})
		
		//선택된 페이지 번호 CSS
		$(".btnNum").eq("${page.currentPage%5-1}").css("background", "#977F51").css("color", "#fff");
	})
</script>
<section>
	<h1>질문 관리</h1>
	<table>
		<tr>
			<td>순번</td>
			<td>구분</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>삭제</td>
			<td>답변</td>
		</tr>
		<c:if test="${page.total == 0}"><!-- 공지사항이 0개면 -->
			<tr>
				<td colspan="5">게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="q" items="${list}" varStatus="i">
			<tr class="qList">
				<td>${q.qNo}</td>
				<td>${q.qType}</td>
				<td class="titleTD">
					<a class="detail">${q.qTitle}</a>
				</td>
				<td>${q.mId}</td>
				<td>${q.qDate}</td>
				<td>
					<span class="delete" data-no="${q.qNo}">&cross;</span>
				</td>
				<td>
					<c:set var="i" value="0"/> <!-- 구분 변수 선언 -->
					<c:forEach var="dbQNo" items="${qNoList}">
						<c:if test="${dbQNo == q.qNo}"><!-- 답변이 있으면  1 -->
							<c:set var="i" value="1"/>
							<span class="answerUpd" data-no="${q.qNo}">수정</span>
							<span class="answerDel" data-no="${0}">삭제</span>
						</c:if>	
					</c:forEach>
					<c:if test="${i == 0}"> <!-- 답변이 없을 경우 -->
						<span class="answerAdd" data-no="${q.qNo}">추가</span> 
					</c:if>
				</td>
			</tr>
			<tr class="hold">	
				<td>내용</td>
				<td colspan="6" class="content">${q.qContent}</td>
			</tr>
			<tr class="hold">	
				<td>파일</td>
				<td colspan="6">
					<c:if test="${q.qFile != null}">
						<img src="${pageContext.request.contextPath}/upload/question/${q.qFile}">
					</c:if>
					<c:if test="${q.qFile == null}">
						<span>첨부파일이 없습니다.</span>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${total != 0}">
			<tr id="pageBtns">
				<td colspan="6" id="pageBtn">
					<c:if test="${page.startPage > 5}">
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=1&key=admin" id="btnFirst">&nbsp;</a>
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=${page.startPage-5}&key=admin" id="btnPrev">&nbsp;</a>
					</c:if>
					
					<c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}">
						<a  href="${pageContext.request.contextPath}/question/list.do?pageNo=${pNo}&key=admin" class="btnNum" data-pNo="${pNo}">${pNo}</a>
					</c:forEach>
					
					<c:if test="${page.endPage < page.totalPages && page.totalPages > 5}">
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=${page.startPage+5}&key=admin" id="btnNext">&nbsp;</a>
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=${page.totalPages}&key=admin" id="btnLast">&nbsp;</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
	<p id="pageNumber">전체 ${page.total} | 페이지 <span>${page.currentPage}</span>/${page.totalPages}</p>
</section>
<%@ include file="../include/footer.jsp" %>