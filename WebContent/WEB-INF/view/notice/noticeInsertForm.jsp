<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
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
	span.error, span.titleError, p#check>span{
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
			var reg = /^.{1,30}$/i;
			if(reg.test(title) == false){
				$(".titleError").css("display", "inline");
				return false;
			}
		})
		
		$("#reset").click(function() {
			history.back();
		})
		
		//체크박스 선택 시 안내문
		$("#on").click(function() {
			if($(this).prop('checked')) { 
				$(this).next().css("display", "inline");
			}else { 
				$(this).next().css("display", "none");
			}
		})
	})
</script>
<section>
	<%@ include file="../include/notice/front.jsp" %>
	<form action="add.do" method="post" enctype="multipart/form-data">
		<p id="check">
			<label for="on">공지 등록</label>
			<input type="checkbox" name="check" id="on">
			<span>(목록의 상위에 표시됩니다.)</span>
		</p>
		<p>
			<label>제목</label>
			<input type="text" name="title" size="70" id="title">
			<span class="error">제목을 입력하세요.</span>
			<span class="titleError">제목은 30글자 이내로 입력 가능합니다.</span>
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
			<input type="button" value="취소" id="reset">
		</p>
	</form>
	
</section>
<%@ include file="../include/footer.jsp" %>