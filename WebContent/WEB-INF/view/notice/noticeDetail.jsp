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
		width: 12%;
		color: #DFD2B3;
		text-align: right;
	}
	td:nth-child(2n){
		width: 35%;
		padding-left: 20px;
	}
	td#title{
		font-weight: bold;
		color: #977F51;
		padding-left: 20px;
	}
	td>img{
		width: 100%;
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
			location.href="${pageContext.request.contextPath}/notice/list.do";
		})
		$("#updateN").click(function() {
			location.href="${pageContext.request.contextPath}/notice/update.do?no=${n.nNo}";
		})
		$("#deleteN").click(function() {
			location.href="${pageContext.request.contextPath}/notice/delete.do?no=${n.nNo}";
		})
	})
</script>
<section>
	<%@ include file="../include/notice/front.jsp" %>
	<p id="btns">
		<button id="list">목록 가기</button>
		<c:if test="${admin == 1}"> <!-- 관리자일 때만 -->
			<button id="updateN">공지 수정</button>
			<button id="deleteN">공지 삭제</button>
		</c:if>
	</p>
	<table>
		<tr>
			<td>제목 | </td>
			<td colspan="3" id="title">${n.nTitle}</td> 
		</tr>
		<tr>
			<td>작성일 | </td>
			<td>${n.nDate}</td>
			<td>조회 수 | </td>
			<td>${n.nViews}회</td>
		</tr>
		<tr>
			<td>내용  | </td>
			<td colspan="3">${n.nContent}</td>
		</tr>
		<tr>
			<td>첨부파일 | </td>
			<td colspan="3">
				<c:if test="${n.nFile != null}">
					<img src="${pageContext.request.contextPath}/upload/notice/${n.nFile}">
				</c:if>
			</td>
		</tr>
	</table>	
</section>
<%@ include file="../include/footer.jsp" %>