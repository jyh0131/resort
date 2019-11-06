<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	div#banner{
		width: 700px;
		margin: 20px auto;
		overflow: hidden;
	}
	#banner>a{
		float: left;
		font-size: 50px;
		text-decoration: none;
		margin-top: 90px;
		margin-left: 30px;
		font-weight: bold;
		color: #6283ab;
		cursor: pointer;
	}
	#banner>img{
		float: right;
	}
	div#explan{
		width: 640px;
		margin: 20px auto;
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
	p#btns>button, p#btns>input{
		padding: 3px 7px;
		border: 0.5px solid #977F51;
		border-radius: 5px;
		text-decoration: none;
		font-size: 12px;
		background: #fff;
		color: #977F51;
		outline: none;
		cursor: pointer;
	}
	p#btns>button:hover{
		background: #DFD2B3;
		color: #fff; 
	}
</style>
<div id="banner">
	<a href="${pageContext.request.contextPath}/question/list.do">Q&amp;A</a>
	<img src="${pageContext.request.contextPath}/images/banner_bg.jpg">
</div>
<div id="explan">
	<h3>QUESTION &amp; ANSWER 무엇이든 물어보세요</h3>
	<p>이용하시는데 보다 정확하고 빠른 답변을 드리기 위하여 <b>분야별 고객문의 담당제를 실시</b> 합니다.</p>
	<p>자주 발생하는 질문에 대하여서는 <b>FAQ에 등록된 질문 및 답변내용을 참조</b>하여 주십시오.</p>
	<p>* 불건전한 내용(예: 개인 정보 보안, 불충분한 증거/귀책사유에 대한 개인 음해성 비방의 글, 욕설, 음란) 또는 광고성 게시물은 사전 통보없이 삭제될 수 있으며, 답변을 드리지 않습니다.</p>
	<p><span>* 개인정보에 관련한 내용의 작성은 삼가해 주시기 바랍니다.</span></p>
	<br>
	<p>* <b>업무시간(9:00 ~ 18:00)</b> 이후 문의의 경우 질문 유형에 따라 답변이 다소 지연될 수 있습니다.
</div>