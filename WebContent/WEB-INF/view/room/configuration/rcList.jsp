<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/headerA.jsp" %>
<style>
	table{
		margin: 20px auto;
		border-top:0.5px solid #dfd2d3;
		border-collapse: collapse;
		width: 980px;
	}
	th,td{
		border:0.5px solid #dfd2d3;
		border-collapse: collapse;
		text-align: center;
	}
	th{
		background: #977F51;
		color:white;
	}
	td,a{
		color:#888;
	}
	a:hover{
		color:#333;
		font-weight: bold;
	}
	th,td{
		padding:10px;
	}
	#pageBtns {
		border-bottom: 0.5px solid #dfd2d3;
	}
	#pageBtn{
		border:none;
	}
	#pageBtn > a{
		display: inline-block;
		width: 40px;
		height: 20px;
		color: #977F51;
		text-decoration: none;
		border: 0.5px solid #977F51;
		margin: 5px;
		cursor: pointer;
	}
	img{
		width: 400px;
		height: 300px;
	}
	th:last-child{
		width: 85px;
	}
	#insert{
		display: block;
		color:white;
		border:0.5px solid #977F51;
		border-radius: 8px;
		width: 90px;
		text-align: center;
		background-color:#977f51;
		padding:5px;
		font-weight: bold;
		margin-left:1329px; 
	}
	#insert:hover {
		background: white;
		color:#977f51;
	}
</style>
<script>
	$(function(){
		$(".btnNum").eq("${page.currentPage%5-1}").css("background","#977F51").css("color","white");
	})
</script>
	
	<a href = "insert.do" id = "insert">추가하기</a>
	<table>
		<tr>
			<th>객실 구성 번호</th>
			<th>객실 이름</th>
			<th>객실 면적</th>
			<th>객실 타입</th>
			<th>객실 타입에 따른 갯수</th>
			<th>객실 실내 구성</th>
			<th>수정 / 삭제 </th>
		</tr>
		<c:forEach var = "rc" items = "${list }">
			<tr>
				<td>${rc.rcNo }</td>
				<td>${rc.roomName.rnName }</td>
				<td>${rc.rcArea}</td>
				<td>${rc.rcType }</td>
				<td>${rc.rcTypeCount }</td>
				<td>${rc.rcInterior }</td>
				<td>
					<a href = "update.do?rcNo=${rc.rcNo }">수정</a> | 
					<a href = "delete.do?rcNo=${rc.rcNo }">삭제</a>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${total != 0}">
			<tr id="pageBtns">
				<td colspan="7" id="pageBtn">
					<c:if test="${page.startPage > 5}"><!--  && page.totalPages > 5 -->
						<a href="${pageContext.request.contextPath}/roomConfiguration/list.do?pageNo=${page.startPage-5}" id="btnPrev">이전</a>
					</c:if>
					
					<c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}">
						<a  href="${pageContext.request.contextPath}/roomConfiguration/list.do?pageNo=${pNo}" class="btnNum" data-pNo="${pNo}">${pNo}</a>
					</c:forEach>
					
					<c:if test="${page.endPage < page.totalPages && page.totalPages > 5}">
						<a href="${pageContext.request.contextPath}/roomConfiguration/list.do?pageNo=${page.startPage+5}" id="btnNext">다음</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
<%@ include file="../../include/footer.jsp" %>	