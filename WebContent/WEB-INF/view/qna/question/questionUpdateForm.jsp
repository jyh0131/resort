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
	span#fileName{
		font-size: 14px;
	}
	span#remove{
		cursor: pointer;
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
		
		$("#reset").click(function() {
			history.back();
		})
		
		//질문 유형 선택
		$("#type").val("${q.qType}").prop("selected", true);
		
		//파일 삭제 버튼
		$("#remove").click(function() {
			var target = $(this);
			var qNo = $(this).attr("data-qNo");
			$.ajax({
				url: "${pageContext.request.contextPath}/question/updateFile.do",
				type: "get",
				data: {"no" : qNo},
				dataType: "json",
				success : function(res) {
					console.log(res);
					$("#fileName").text("삭제 되었습니다.");
					target.remove();
				}
			})
		})
	})
</script>
<section>
	<%@ include file="../../include/qna/front.jsp" %>
	<form action="update.do?no=${q.qNo}" method="post" enctype="multipart/form-data">
		<p>
			<label>제목</label>
			<input type="text" name="title" size="70" id="title" value="${q.qTitle}">
			<span class="error">제목을 입력하세요.</span>
			<span class="titleError">제목은 20글자 이내로 입력 가능합니다.</span>
		</p>
		<p>
			<label>질문 유형</label>
			<select name="type" id="type">
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
			<textarea name="content" cols="100" rows="30">${q.qContent}</textarea>
			<span class="error">내용을 입력하세요.</span>
		</p>
		<p>
			<label>첨부파일</label>
			<input type="file" name="file" id="file">
		</p>
		<p>
			<label>기존 파일</label>
			<c:if test="${q.qFile != null}">
				<span id="fileName">${q.qFile}</span>
				<span id="remove" data-qNo="${q.qNo}"> x </span>
			</c:if>
		</p>		
		<p id="btns">
			<input type="submit" value="수정">
			<input type="button" value="취소" id="reset">
		</p>
	</form>
</section>
<%@ include file="../../include/footer.jsp" %>