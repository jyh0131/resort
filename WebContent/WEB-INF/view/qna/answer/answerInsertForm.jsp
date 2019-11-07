<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	form{
		width: 900px;
		margin: 0 auto;
	}
	form>p{
		overflow: hidden;
		line-height: 50px;
	}
	p#btns{
		width: 900px;
		text-align: right;
	}
	label {
		width: 70px;
		float: left;
		margin-right: 20px;
		font-size: 14px;
		color: #977F51;
	}
	span.error{
		display: none;
		color: #977F51;
		font-size: 12px;
		padding-left: 80px;
	}
</style>
<script src="${pageContext.request.contextPath}/js/qna.js"></script>
<script>
	$(function() {
		$("form").submit(function() {
			var result = checkInputEmpty($("textarea"));
			if(result == false){
				return false;
			}		
		})
		
		$("#reset").click(function() {
			history.back();
		})
	})
</script>
<section>
	<%@ include file="../../include/qna/front.jsp" %>
	<form action="add.do?key=${key}" method="post">
		<p>
			<label>제목</label>
			<input type="text" size="70" id="title" readonly="readonly" value="RE : 대명리조트입니다.">
		</p>
		<p>
			<label>내용</label>
			<textarea name="content" cols="100" rows="30"></textarea>
			<span class="error">내용을 입력하세요.</span>
		</p>
		<p id="btns">
			<input type="submit" value="등록">
			<input type="button" value="취소" id="reset">
		</p>
		<input type="hidden" name="no" value="${no}">
	</form>
</section>
<%@ include file="../../include/footer.jsp" %>