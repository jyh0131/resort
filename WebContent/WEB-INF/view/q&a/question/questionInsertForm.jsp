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
	<%@ include file="../../include/qna/front.jsp" %>
	<form action="add.do" method="post" enctype="multipart/form-data">
		<p>
			<label>제목</label>
			<input type="text" name="title" size="70">
		</p>
		<p>
			<label>질문 유형</label>
			<select name="type">
				<option selected="selected">=질문 유형 선택=</option>
				<option>객실관련</option>
				<option>입퇴실관련</option>
				<option>부대시설관련</option>
				<option>식음료관련</option>
				<option>패키지관련</option>
				<option>셔틀버스관련</option>
				<option>차량등록</option>
				<option>기타</option>
			</select>
		</p>
		<p>
			<label>내용</label>
			<textarea name="content" cols="100" rows="30"></textarea>
		</p>
		<p>
			<label>첨부파일</label>
			<input type="file" name="file">
		</p>
		<p id="btns">
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</p>
		<input type="text" name="id"> (임시로 아이디 직접 입력 )
	</form>
	
</section>
<%@ include file="../../include/footer.jsp" %>