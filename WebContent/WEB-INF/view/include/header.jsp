<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin: 0px;
		padding: 0px;
	} 
	
	/* header */
	
	header{
		width: 100%;
		height: 200px;
		margin-bottom: 50px;
	}
	header ul{
		overflow: hidden;
	}
	header ul li{
		list-style: none;
		float: left;
		text-align: center;
	}
	header a{
		text-decoration: none;
		color: #000;
	}
	
	/* top_menu */
	
	div#top_menu{
		width: 100%;
		height: 30px;
		background: #31343B;
		padding: 10px 0px;
		position: relative;
	}
	#top_menu>a#home_btn_small{
		padding-right: 25px;
		color: #fff;
		font-size: 14px;
		font-weight: bold;
		background: url("${pageContext.request.contextPath}/images/homeBtn.png") no-repeat center right;
		position: absolute;
		left: 400px;
		top: 13px;
	}
	ul#top_main{
		width: 600px;
		height: 100%;
		margin: 0 auto;
	}
	#top_main>li{
		width: 160px;
		height: 100%;
		line-height: 30px;
		margin: 0px 20px;
	}
	#top_main>li>a{
		display: inline-block;
		width: 150px;
		height: 100%;
		color: #BFC0C1;
		padding-right: 10px;
		background: url("${pageContext.request.contextPath}/images/down.png") no-repeat center right;
		font-size: 14px;
		font-weight: bold;
	}
	div#top_right{
		position: absolute;
		top: 10px;
		right: 400px;
	}
	#top_right>a{
		color: #fff;
		font-size: 14px;
		margin: 0px 10px;
	}
	
	/* bottom_menu */
	
	div#bottom_menu{
		width: 100%;
		height: 50px;
		padding: 30px 0px;
		border: 1px solid #ccc;
		position: relative;
	}
	#bottom_menu>a#home_btn_big{
		display: inline-block;
		width: 155px;
		height: 60px;
		margin-left: 270px;
		background: url("${pageContext.request.contextPath}/images/logo.jpg") no-repeat center;
		float: left;
	}
	ul#bottom_main{
		width: 900px;
		height: 330px;
		position: relative;
		overflow: hidden;
		margin-left: 50px;
		display: inline-block;
	}
	#bottom_main>li{
		width: 150px;
		height: 100%;
		line-height: 55px;
		cursor: pointer;
	}
	#bottom_main>li>a{
		width: 100%;
		height: 100%;
		font-weight: bold;
		font-size: 18px;
	}
	ul.bottom_sub{
		width: 840px;
		height: 200px;
		display: none;
		overflow: hidden;
		position: absolute;
		top: 110px;
		left: 0px;
		padding-left: 30px;
		background: #fff;
	}
	.bottom_sub>li{
		clear: both;
		width: 270px;
		text-align: left;
		line-height: 40px;
	}
	.bottom_sub>li>a{
		margin-left: 20px;
	}
	ul.room_sub{
		display: none;
		position: absolute;
		top: 0px;
		left: 300px;
		z-index: 500;
	}
	.room_sub>li{
		clear: both;
		text-align: left;
		width: 270px;
		line-height: 40px;
	}
	.room_sub>li>a{
		margin-left: 20px;
	}
	ul#bottom_right{
		width: 300px;
		height: 60px;
		position: relative;
		float: right;
	}
	#bottom_right>li{
		margin: 0 5px;
		line-height: 60px;
	}
	#bottom_right span#langBtn{
		padding-right: 15px;
		background: url("${pageContext.request.contextPath}/images/down_small.png") no-repeat center right;
	}
	#bottom_right span#search{
		display: inline-block;
		width: 38px;
		height: 38px;
		margin-left: 10px;
		margin-top: 10px;
		background: url("${pageContext.request.contextPath}/images/search_btn.gif") no-repeat center;
		cursor: pointer;
	}
	ul#lang{
		width: 50px;
		height: 50px;
		position: absolute;
		top: 0px;
		background: #fff;
		border: 1px solid #ccc;
		display: none;
	}
	#lang>li{
		clear: both;
		width: 100%;
		height: 25px;
		line-height: 150%;
	}
	#lang>li>a{
		display: inline-block;
		width: 100%;
		height: 100%;
		font-size: 13px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		
		//아래 메인 메뉴
		$("#bottom_main>li").mouseover(function() {
			$(this).find(".bottom_sub").stop().slideDown(500);
			$(this).find("a").eq(0).css("color", "#977F51");
		}) 
		$("#bottom_main>li").mouseout(function() {
			$(this).find(".bottom_sub").stop().slideUp(100);
			$(this).find("a").eq(0).css("color", "#000");
		})
		
		
		//아래 서브 메뉴
		$(".bottom_sub>li").mouseover(function() {
			$(this).find(".room_sub").css("display","block");
			$(this).css("background", "#977F51");
			$(this).find("a").eq(0).css("color", "#fff");
		})
		$(".bottom_sub>li").mouseout(function() {
			$(this).find(".room_sub").css("display","none");
			$(this).css("background", "none");
			$(this).find("a").eq(0).css("color", "#000");
		})
		
		//2단 서브 메뉴
		$(".room_sub>li").mouseover(function() {
			$(this).find(".room_sub").css("display","block");
			$(this).css("background", "#DFD2B3");
			$(this).find("a").eq(0).css("color", "#fff");
		})
		$(".room_sub>li").mouseout(function() {
			$(this).find(".room_sub").css("display","none");
			$(this).css("background", "none");
			$(this).find("a").eq(0).css("color", "#000");
		})
		
		//언어 선택 버튼
		$("#langBtn").click(function() {
			$("#lang").css("display", "block");
		})
		
		$("#lang>li").click(function() {
			$("#langBtn").text($(this).text());
			$("#lang").css("display", "none");
		})
	}) 
</script>
</head>
<body>
	<header>
		<div id="top_menu">
			<a href="#" id="home_btn_small">SONO HOME</a>
			<ul id="top_main">
				<li><a href="#">리조트&amp;호텔</a></li>
				<li><a href="#">레저&amp;스포츠</a></li>
				<li><a href="#">체인&amp;제휴리조트</a></li>
			</ul><!-- top_main -->
			<div id="top_right">
				<a href="#">단체행사</a>
				<a href="#">회원권분양</a>
			</div><!-- top_right -->
		</div><!-- top_menu -->
		
		<div id="bottom_menu">
			<a id="home_btn_big" href="#"></a>
			<ul id="bottom_right">
				<li><a href="login.do">로그인</a> | </li> 
				<li><a href="add.do">회원가입</a> | </li>
				<li>
					<span id="langBtn">KOR</span>
					<ul id="lang">
						<li><a href="#">KOR</a></li>
						<li><a href="#">ENG</a></li>
					</ul>
				</li>
				<li><span id="search"></span></li>
			</ul><!-- bottom_right -->
			<ul id="bottom_main">
				<li>
					<a href="#">예약 서비스</a>
					<ul id="rsv_menu" class="bottom_sub">
						<li><a href="${pageContext.request.contextPath}/reservation/insert.do">빠른예약</a></li>
						<li><a href="${pageContext.request.contextPath}/reservation/list.do">예약 조회</a></li>
						<li><a href="${pageContext.request.contextPath}/reservation/cancel.do">예약 취소</a></li>
					</ul><!-- rsv_meun -->
				</li>
				<li><a href="#">객실 안내</a>
					<ul id="room_menu" class="bottom_sub">
						<li>
							<a href="#">리조트</a>
							<ul class="room_sub">
								<li><a href="#">패밀리</a></li>
								<li><a href="#">스위트</a></li>
							</ul><!-- room_sub 리조트 -->
						</li>
						<li>
							<a href="#">호텔</a>
							<ul class="room_sub">
								<li><a href="#">슈페리어</a></li>
								<li><a href="#">디럭스 오션 스위트</a></li>
								<li><a href="#">이그제큐티브 스위트</a></li>
								<li><a href="#">오션스위트 / 실버스위트</a></li>
								<li><a href="#">프레지덴셜 스위트 / 로얄스위트</a></li>			
							</ul><!-- room_sub 호텔 -->
						</li>
					</ul><!-- room_menu -->
				</li>
				<li><a href="#">테마여행</a></li>
				<li><a href="#">이벤트&amp;할인</a></li>
				<li><a href="#">분양회원</a></li>
				<li><a href="#">고객센터</a>
					<ul id="service_menu" class="bottom_sub">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Q&amp;A</a></li>
						<li><a href="#">고객의 말씀</a></li>
						<li><a href="#">분실물센터</a></li>
					</ul>
				</li>
			</ul><!-- bottom_main -->
		</div><!-- bottom_menu -->		
	</header>