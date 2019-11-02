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
	#type{
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
	span.answer{
		background: #DFD2B3;
		color: #fff;
		border-radius: 5px;
		padding: 1px 3px;
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
		//질문 유형 선택
		$("#type").change(function() {
			var type = $(this).val();
			$.ajax({
				url: "${pageContext.request.contextPath}/question/typeList.do",
				type: "get",
				data: {"type" : type},
				dataType: "json",
				success : function(res) {
					console.log(res);
					$(".qList").remove();
					$("#pageBtn").empty();

					//Q&A 리스트 생성
					$(res.page.qList).each(function(i, obj) {
						qnaList(i, obj);	
					})
					pageBtns(res); //버튼 생성
					$(".btnNumD").eq(0).css("background", "#977F51").css("color", "#fff"); //default 1페이지 버튼 css
				}//success
			})//ajax
		})//changeSelect	
		
		//질문 유형 선택 후 버튼 클릭
		$(document).on("click", ".btnNumD, #btnPrevD, #btnNextD", function() {
			var type = $("#type").val();
			var pNo = $(this).attr("data-pNo");
				
			$.ajax({
				url: "${pageContext.request.contextPath}/question/typeList.do",
				type: "get",
				data: {"type" : type, "pageNo" : pNo},
				dataType: "json",
				success : function(res) {
					console.log(res);
					$(".qList").remove();
					$("#pageBtn").empty();

					//Q&A 리스트 생성
					$(res.page.qList).each(function(i, obj) {
						qnaList(i, obj);
					})
					pageBtns(res); //버튼 생성
					$(".btnNumD").eq(pNo%5-1).css("background", "#977F51").css("color", "#fff"); //선택된 페이지 버튼 css
				}//success
			})//ajax
		})//clickPageBtns
		
		/* === Q&A 리스트 생성 function === */
		function qnaList(i, obj) {
			var $tr = $("<tr>").addClass("qList");
			var $tdNo = $("<td>").text(obj.qNo); //순번
			var $tdType = $("<td>").text(obj.qType); //구분
			var $tdTitle = $("<td>").addClass("titleTD");
			var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/question/detail.do?no="+obj.qNo).addClass("detail");
			var $span = $("<span>").addClass("title").text(obj.qTitle);
			$a.append($span)
			$tdTitle.append($a); //제목
			var $tdId = $("<td>").text(obj.mId); //작성자
			var $tdDate = $("<td>").text(obj.qDate); //작성일
			$tr.append($tdNo, $tdType, $tdTitle, $tdId, $tdDate);
			
			$("#pageBtns").before($tr);
		}
		
		/* === page 버튼 생성 function === */
		function pageBtns(res){
			//페이지 번호 버튼
			for(i=res.page.startPage; i<=res.page.endPage; i++){
				var $aNum = "<a class='btnNumD' data-pNo='" + i + "'>" + i + "</a>";
				$("#pageBtn").append($aNum);
			}	
			
			//이전 버튼
			if(res.page.startPage > 5){
				var $aPrev = "<a id='btnPrevD' data-pNo='" + (res.page.startPage-5) + "'>이전</a>";
				$("#pageBtn").prepend($aPrev);
			}
			
			//다음 버튼
			if(res.page.endPage < res.page.totalPages && res.page.totalPages > 5){
				var $aNext = "<a id='btnNextD' data-pNo='" + (res.page.startPage+5) + "'>다음</a>";		
				$("#pageBtn").append($aNext);
			}
		}
		
		/* === ajax 끝 ====================================================================== */
		
		//질문하기
		$("#writeQ").click(function() {
			<c:if test="${Auth==null}">
				alert("로그인 후 이용해주세요.");
			</c:if>
			<c:if test="${Auth!=null}">
				location.href = "${pageContext.request.contextPath}/question/add.do";
			</c:if>	
		})
		
		//내 질문보기
		$("#readQ").click(function() {
			<c:if test="${Auth==null}">
				alert("로그인 후 이용해주세요.");
			</c:if>
			<c:if test="${Auth!=null}">
				location.href = "${pageContext.request.contextPath}/question/myQ.do?id=${q.mId}";
			</c:if>	
		})
		
		//선택된 페이지 번호 CSS
		$(".btnNum").eq("${page.currentPage%5-1}").css("background", "#977F51").css("color", "#fff");
	})
</script>
<section>
	<%@ include file="../include/qna/front.jsp" %>
	<p id="btns">
		<select id="type">
			<option value="no" selected="selected">=질문 유형 선택=</option>
			<option>객실관련</option>
			<option>입퇴실관련</option>
			<option>부대시설관련</option>
			<option>식음료관련</option>
			<option>패키지관련</option>
			<option>셔틀버스관련</option>
			<option>차량등록</option>
			<option>기타</option>
		</select>
		<c:if test="${admin != 1}"> <!-- 사용자/로그아웃일 때 (관리자에게 안 보이기)-->
			<button id="writeQ">질문하기</button>
			<button id="readQ">내 질문보기</button>
		</c:if>
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
		<c:forEach var="q" items="${page.qList}">
			<tr class="qList">
				<td>${q.qNo}</td>
				<td>${q.qType}</td>
				<td class="titleTD">
					<a href="${pageContext.request.contextPath}/question/detail.do?no=${q.qNo}" class="detail">
						<span class="title">${q.qTitle}</span>
						<c:forEach var="dbQNo" items="${qNoList}">
							<c:if test="${q.qNo == dbQNo}"> <!-- 답변이 있으면 -->
								<span class="answer">Re</span>
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
					<c:if test="${page.startPage > 5}"><!--  && page.totalPages > 5 -->
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=${page.startPage-5}" id="btnPrev">이전</a>
					</c:if>
					
					<c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}">
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=${pNo}" class="btnNum" data-pNo="${pNo}">${pNo}</a>
					</c:forEach>
					
					<c:if test="${page.endPage < page.totalPages && page.totalPages > 5}">
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=${page.startPage+5}" id="btnNext">다음</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
	<p>현재 선택된 페이지 : ${page.currentPage}</p>
	<p>타입 넘어오는 거 확ㅇ니 : ${qtype}</p>
</section>
<%@ include file="../include/footer.jsp" %>