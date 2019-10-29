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
	td#titleTD{
		text-align: left;
		padding-left: 30px;
	}
	a.detail{
		text-decoration: none;
		color: #333;
	}
	span#title{
		display: inline-block;
		width: 270px;
		vertical-align: middle;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
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
		//질문 유형 선택
		$("#type").val("${qType}").prop("selected", true);
		$("#type").change(function() {
			var type = $(this).val();
			if(type == ""){ //선택 안 하면 기본 리스트
				location.href = "${pageContext.request.contextPath}/question/list.do";
				return;
			}
			location.href = "${pageContext.request.contextPath}/question/typeList.do?type="+type;
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
		
		//내 질문보기
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
		<select id="type">
			<option value="" selected="selected">=질문 유형 선택=</option>
			<option>객실관련</option>
			<option>입퇴실관련</option>
			<option>부대시설관련</option>
			<option>식음료관련</option>
			<option>패키지관련</option>
			<option>셔틀버스관련</option>
			<option>차량등록</option>
			<option>기타</option>
		</select>
		<c:if test="${admin != 1}">
			<button id="write">질문하기</button>
			<button id="read">내 질문보기</button>
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
		<c:if test="${total == 0}">
			<tr>
				<td colspan="5">게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="q" items="${page.qList}">
		<tr>
			<td>${q.qNo}</td>
			<td>${q.qType}</td>
			<td id="titleTD">
				<a href="${pageContext.request.contextPath}/question/detail.do?no=${q.qNo}" class="detail">
					<span id="title">${q.qTitle}</span>
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
			<tr>
				<td colspan="5">
					<c:if test="${page.startPage > 5}">
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=${page.startPage-5}">[이전]</a>
					</c:if>
					<c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}">
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=${pNo}">[${pNo}]</a>
					</c:forEach>
					<c:if test="${page.endPage > page.totalPages}">
						<a href="${pageContext.request.contextPath}/question/list.do?pageNo=${page.startPage+5}">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
</section>
<%@ include file="../include/footer.jsp" %>