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
	span.error, span.titleError{
		display: none;
		color: #977F51;
		font-size: 12px;
		margin-left: 10px;
	}
	textarea+span.error{
		padding-left: 80px;
	}
</style>
<script src="${pageContext.request.contextPath}/js/qna.js"></script>
<script>
	$(function() {
		$("form").submit(function() {
			var result = checkInputEmpty($("input[name]:not(#file), textarea, select"));
			if(result == false){
				return false;
			}
			
			//제목 글자 수 제한
			var title = $("#title").val();
			var reg = /^.{1,20}$/i;
			if(reg.test(title) == false){
				$(".titleError").css("display", "inline");
				return false;
			}			
		})
	})
</script>
<section>
	<%@ include file="../../include/qna/front.jsp" %>
	<form action="add.do" method="post" enctype="multipart/form-data">
		<p>
			<label>제목</label>
			<input type="text" name="title" size="70" id="title">
			<span class="error">제목을 입력하세요.</span>
			<span class="titleError">제목은 20글자 이내로 입력 가능합니다.</span>
		</p>
		<p>
			<label>질문 유형</label>
			<select name="type">
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
			<span class="error">질문 유형을 선택하세요.</span>
		</p>
		<p>
			<label>내용</label>
			<textarea name="content" cols="100" rows="30"></textarea>
			<span class="error">내용을 입력하세요.</span>
		</p>
		<p>
			<label>첨부파일</label>
			<input type="file" name="file" id="file">
		</p>
		<p id="btns">
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</p>
	</form>
	
</section>
<%@ include file="../../include/footer.jsp" %>