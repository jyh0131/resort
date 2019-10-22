<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	div#banner{
		width: 700px;
		margin: 0 auto;
		overflow: hidden;
	}
	#banner>img{
		float: right;
	}
	div#explan{
		width: 640px;
		margin: 0 auto;
		padding: 30px;
		border: 2px solid #DFD2B3;
		border-radius: 15px;
	}
	#explan>h3{
		font-size: 16px;
		line-height: 200%;
		color: #977F51;
	}
	#explan>p{
		font-size: 13px;
	}
	#explan>p>span{
		color: #ff0000;
	}
	form{
		width: 900px;
		margin: 0 auto;
	}
	p{
		overflow: hidden;
	}
	p#btns{
		text-align: right;
	}
	label {
		width: 70px;
		float: left;
		margin-right: 20px;
	}
</style>
<section>
	<div id="banner">
		<img src="${pageContext.request.contextPath}/images/qna_bg.jpg">
	
	</div>
	<div id="explan">
		<h3>QUESTION & ANSWER 무엇이든 물어보세요</h3>
		<p>이용하시는데 보다 정확하고 빠른 답변을 드리기 위하여 <b>분야별 고객문의 담당제를 실시</b> 합니다.</p>
		<p>자주 발생하는 질문에 대하여서는 <b>FAQ에 등록된 질문 및 답변내용을 참조</b>하여 주십시오.</p>
		<p>* 불건전한 내용(예: 개인 정보 보안, 불충분한 증거/귀책사유에 대한 개인 음해성 비방의 글, 욕설, 음란) 또는 광고성 게시물은 사전 통보없이 삭제될 수 있으며, 답변을 드리지 않습니다.</p>
		<p><span>* 개인정보에 관련한 내용의 작성은 삼가해 주시기 바랍니다.</span></p>
		<br>
		<p>* <b>업무시간(9:00 ~ 18:00)</b> 이후 문의의 경우 질문 유형에 따라 답변이 다소 지연될 수 있습니다.
	</div>
	<form action="add.do" method="post">
		<p>
			<label>제목</label>
			<input type="text" name="title" size="70">
		</p>
		<p>
			<label>내용</label>
			<textarea name="content" cols="100" rows="30"></textarea>
		</p>
		<p id="btns">
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</p>
		<input type="text" name="id"> (임시로 아이디 직접 입력 )
	</form>
	
</section>
<%@ include file="../../include/footer.jsp" %>