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
</style>
<script>
	$(function() {
		//질문 유형 선택
		$("#type").val("${qType}").prop("selected", true);
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
					$(res.list).each(function(i, obj) {
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
						$("table").append($tr); 
					})
				}
			})
		})
		
		
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
		
		//내 답변보기
		$("#readA").click(function() {
			//location.href = "${pageContext.request.contextPath}/answer/myA.do?id=${q.mId}";
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
		<c:forEach var="q" items="${list}">
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
	</table>
</section>
<%@ include file="../include/footer.jsp" %>