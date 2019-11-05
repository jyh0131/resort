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
	#size{
		float: left;
		padding: 3px 7px;
		border: 0.5px solid #977F51;
		border-radius: 5px;
		padding: 3px 7px 5px;
		font-size: 12px;		
		color: #977F51;
		outline: none;
		cursor: pointer;
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
	span.notice{
		background: #DFD2B3;
		color: #fff;
		border-radius: 5px;
		padding: 1px 3px;
	}
	td.titleTD{
		text-align: left;
		padding-left: 30px;
	}
	a.detail{
		text-decoration: none;
		color: #333;
	}
	span.title{
		display: inline-block;
		width: 270px;
		vertical-align: middle;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	a#btnPrev, a#btnNext, a#btnPrevD, a#btnNextD{
		display: inline-block;
		width: 40px;
		height: 20px;
		color: #977F51;
		text-decoration: none;
		border: 0.5px solid #977F51;
		margin: 5px;
		cursor: pointer;
	}
	a.btnNum, a.btnNumD{
		display: inline-block;
		width: 20px;
		height: 20px;
		color: #977F51;
		text-decoration: none;
		border: 0.5px solid #977F51;
		margin: 5px;
		cursor: pointer;
	}
</style>
<script>
	$(function() {
		//작성하기
		$("#writeN").click(function() {
			location.href = "${pageContext.request.contextPath}/notice/add.do";
		})
		
		//페이지 사이즈 변경
		$("#size").change(function() {
			var val = $(this).val();
			location.href = "${pageContext.request.contextPath}/notice/list.do?size=" + val;
		})
		
		//페이지 사이즈 선택
		$("select").val("${size}").attr("selected", true);
		
		//선택된 페이지 번호 CSS
		$(".btnNum").eq("${page.currentPage%5-1}").css("background", "#977F51").css("color", "#fff");
	})
</script>
<section>
	<%@ include file="../include/notice/front.jsp" %>
	<p id="btns">
		<select name="size" id="size">
			<option value="5">5개씩 보기</option>
			<option value="10">10개씩 보기</option>
			<option value="20">20개씩 보기</option>
		</select>
		<c:if test="${admin == 1}"> <!-- 관리자일 때만 -->
			<button id="writeN">작성하기</button>
		</c:if>
	</p>
	<table>
		<tr>
			<td>순번</td>
			<td>제목</td>
			<td>작성일</td>
			<td>조회</td>
		</tr>
		<c:if test="${page.total == 0}"><!-- 게시글이 0개면 -->
			<tr>
				<td colspan="5">게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="n" items="${list}">
			<tr class="nList">
				<td>
				<c:if test="${n.nCheck == 1}"> <!-- 공지 O -->
					<span class="notice">공지</span>
				</c:if>
				<c:if test="${n.nCheck != 1}"> <!-- 공지 X -->
					${n.nNo}
				</c:if>
				</td>
				<td class="titleTD">
					<a href="${pageContext.request.contextPath}/notice/detail.do?no=${n.nNo}" class="detail">
						${n.nTitle}
					</a>
				</td>
				<td>${n.nDate}</td>
				<td>${n.nViews}</td>
			</tr>
		</c:forEach>
		<c:if test="${total != 0}">
			<tr id="pageBtns">
				<td colspan="5" id="pageBtn">
					<c:if test="${page.startPage > 5}"><!--  && page.totalPages > 5 -->
						<a href="${pageContext.request.contextPath}/notice/list.do?pageNo=${page.startPage-5}&size=${size}" id="btnPrev">이전</a>
					</c:if>
					
					<c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}">
						<a  href="${pageContext.request.contextPath}/notice/list.do?pageNo=${pNo}&size=${size}" class="btnNum" data-pNo="${pNo}">${pNo}</a>
					</c:forEach>
					
					<c:if test="${page.endPage < page.totalPages && page.totalPages > 5}">
						<a href="${pageContext.request.contextPath}/notice/list.do?pageNo=${page.startPage+5}&size=${size}" id="btnNext">다음</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
</section>
<%@ include file="../include/footer.jsp" %>