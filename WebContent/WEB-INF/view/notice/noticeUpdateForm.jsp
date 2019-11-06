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
			var reg = /^.{1,30}$/i;
			if(reg.test(title) == false){
				$(".titleError").css("display", "inline");
				return false;
			}
		})
		
		$("#reset").click(function() {
			history.back();
		})
		
		//체크박스 선택 여부 적용(1일 때만 체크)
		if("${n.nCheck}" == 1){
			$("#on").attr("checked", true);
		}
		
		//체크박스 선택 시 안내문
		$("#on").click(function() {
			if($(this).prop('checked')) { 
				$(this).next().css("display", "inline");
			}else { 
				$(this).next().css("display", "none");
			}
		})
		
		//파일 삭제 버튼
		$("#remove").click(function() {
			var target = $(this);
			var nNo = $(this).attr("data-nNo");
			$.ajax({
				url: "${pageContext.request.contextPath}/notice/updateFile.do",
				type: "get",
				data: {"no" : nNo},
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
	<%@ include file="../include/notice/front.jsp" %>
	<form action="update.do?no=${n.nNo}&key=${key}" method="post" enctype="multipart/form-data">
		<p id="check">
			<label for="on">공지 등록</label>
			<input type="checkbox" name="check" id="on">
			<span>(목록의 상위에 표시됩니다.)</span>
		</p>
		<p>
			<label>제목</label>
			<input type="text" name="title" size="70" id="title" value="${n.nTitle}">
			<span class="error">제목을 입력하세요.</span>
			<span class="titleError">제목은 30글자 이내로 입력 가능합니다.</span>
		</p>
		<p>
			<label>내용</label>
			<textarea name="content" cols="100" rows="30">${n.nContent}</textarea>
			<span class="error">내용을 입력하세요.</span>
		</p>
		<p>
			<label>첨부파일</label>
			<input type="file" name="file" id="file">
		</p>
		<p>
			<label>기존 파일</label>
			<c:if test="${n.nFile != null}">
				<span id="fileName">${n.nFile}</span>
				<span id="remove" data-nNo="${n.nNo}"> x </span>
			</c:if>
		</p>		
		<p id="btns">
			<input type="submit" value="수정">
			<input type="button" value="취소" id="reset">
		</p>
	</form>
	
</section>
<%@ include file="../include/footer.jsp" %>