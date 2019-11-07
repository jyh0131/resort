<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../WEB-INF/view/include/header.jsp" %>
<style>
	.bunyang_body{
		width:920px;
		margin:0 auto;
	}
	#top_list{
		width:100%;
		height: 156px;
	}
	#top_list > ul{
		width:100%;
	}
	#top_list > ul > li{
		display: inline;
	    margin-left: 6px;
	}
	#top_list > ul > li > span{
		font-size: 12px;
		color:#333;
	}
	#top_list > ul > li > span > img{
		width: 12px;
		height: 11px;
	}
	
	#top_list > h3{
		margin-top: 40px;
	    font-size: 40px;
	    color: #6283ab;
	    letter-spacing: -4px;
	    font-family: Arial,'돋움', Dotum;
	}
	
	.contents{
		overflow: hidden;
	    width: 100%;
	    min-height: 770px;
	    margin-top: 17px;
	    letter-spacing: 0;
	}
	.dtail_box{
		border:1.5px solid #6283ab;
		border-radius: 10px;
		margin: 20px 0 30px 0;
		padding:20px 20px 30px;
	}
	.dtail_text{
		position: relative;
	}
	.dtail_text > h4{
		margin: 0 0 3px 0;
	    font-size: 15px;
	    font-weight: bold;
	    color: #335082;
	}
	.dtail_text > p{
		font-size: 12px;
		color:#666;
	}
	.dtail_text > .dtail_calenderBtn{
		display: inline-block;
	    float: right;
	    position: absolute;
	    right: 2px;
	    bottom: -19px;
	}
	.dtail_text > .dtail_calenderBtn > span{
		background: linear-gradient(to bottom, #41a6b6 0%,#419eac 100%);
		border: 1px solid #428b96;
		border-radius: 3px;
	    font-size: 13px;
	    font-weight: bold;
	    color: #fff;
	    display: inline-block;
	    padding:6px 4px 6px;
	    
	}
	#bunyang_list{
		width: 100%;
		height: 43px;
	}
	#bunyang_list > ul{
		list-style:none;
		height: 33px;
		margin-bottom: 10px;
	}
	#bunyang_list > ul > .pic{
		border-bottom: 0;
    	background: #fff;
    	border-left: 1px solid #d3d3d3;
    	width: 107px;
    	z-index: 10;
    	padding-right:13px;
	}
	#bunyang_list > ul > .pic > a{
		color: #335082;
		font-size:13px;
		background: url('${pageContext.request.contextPath}/images/bul_arrow_down.gif') no-repeat right 1.2em;
	}
	#bunyang_list > ul > li{
		float:left;
		margin: -1px 0 0 0;
	    padding: 0 9px 0 0;
	    border: 1px solid #d3d3d3;
	    border-left: 0;
	    background: #efefef;
	    width: 97px;
	    height: 100%;
	    z-index: 1;
	}
	
	#bunyang_list > ul > li > a{
		text-decoration: none;
		display:block;
		text-align:center;
		font-family: Arial,'돋움', Dotum;
		font-weight: bold;
	    padding: 10px 0px 9px 0px;
	    font-size: 13px;
	    color: #777;
	    width: 101px;
	}
	
</style>
<script>
	$(function(){
		$("#bunyang_list > ul > li > a").prop("disabled", true);
		$("#bunyang_list > ul > li").click(function(){
			
			$("#bunyang_list > ul > li").removeClass("pic");
			$(this).addClass("pic"); 
		})
		
	})
</script>
	<section class = "bunyang_body">
		<div id = "top_list">
			<ul>
				<li><span><img src = "${pageContext.request.contextPath }/images/ico_location_home.gif"> &#62;</span></li>
				<li><span>멤버십 &#62;</span></li>
				<li><span>분양회원 &#62;</span></li>
			</ul>
			<h3>분양회원</h3>
		</div>
		<div class = "contents">
			<div class = "dtail_box">
				<div class = "dtail_text">
					<h4>리조트 분양회원이란?</h4>
					<p>
						소노호텔&#38;리조트의 회원권을 구입하신 회원으로서 소노호텔&#38;리조트의 모든 시설에 대한 특별한 권리를 보장받는 정식회원을 말합니다.<br>
						분양회원이시면 소노호텔&#38;리조트의 연간 예약일정을 꼭 확인하세요.
					</p>
					<div class = "dtail_calenderBtn">
						<span>
							소노호텔&#38;리조트 연간예약일정 캘린더
						</span>
					</div>
				</div>
			</div>
			<div id = "bunyang_list">
				<ul>
					<li class = "pic"><a href = "${pageContext.request.contextPath }/menuBunyang/Procedure.jsp">이용절차</a></li>
					<li><a href ="">예약방법</a></li>
					<li><a href ="">이용일수</a></li>
					<li><a href ="">추첨예약일정</a></li>
					<li><a href ="">추첨배점기준</a></li>
					<li><a href ="">시설이용약관</a></li>
					<li><a href ="">회원혜택안내</a></li>
					<li><a href ="">모바일카드</a></li>
				</ul>
			</div>