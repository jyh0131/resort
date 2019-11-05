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
	p#btns>button{
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
	<a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a>
	<img src="${pageContext.request.contextPath}/images/banner_bg.jpg">
</div>