<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	form{
		width: 400px;
		margin: 0 auto;
	}
	p{
		overflow: hidden;
	}
	label {
		width: 100px;
		float: left;
		background: #ddd;
	}
</style>
<section>
	<form action="add.do" method="post">
		<p>
			<label>제목</label>
			<input type="text" name="title">
		</p>
		<p>
			<label>이름</label>
			<input type="text" name="name">
		</p>
		<p>
			<label>내용</label>
			<input type="text" name="content">
		</p>
		<p>
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</p>
	</form>
</section>
<%@ include file="../../include/footer.jsp" %>