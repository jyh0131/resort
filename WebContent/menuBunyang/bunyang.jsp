<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../WEB-INF/view/include/header.jsp" %>
<style>
	section{
		width:920px;
		margin:0 auto;
	}
	#top_list{
		width:100%;
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
	
	#contents{
		overflow: hidden;
	    width: 100%;
	    min-height: 770px;
	    margin-top: 17px;
	    letter-spacing: 0;
	}
	.dtail_box{
		border:1.5px solid #6193a1;
		border-radius: 10px;
	}
	.dtail_text{
		
	}
</style>
	<section>
		<div id = "top_list">
			<ul>
				<li><span><img src = "${pageContext.request.contextPath }/images/ico_location_home.gif"> &#62;</span></li>
				<li><span>멤버십 &#62;</span></li>
				<li><span>분양회원 &#62;</span></li>
			</ul>
			<h3>분양회원</h3>
		</div>
		<div id = "contents">
			<div class = "dtail_box">
				<div class = "dtail_text">
					<h4>리조트 분양회원이란?</h4>
					<p>
						소노호텔&리조트의 회원권을 구입하신 회원으로서 소노호텔&리조트의 모든 시설에 대한 특별한 권리를 보장받는 정식회원을 말합니다.<br>
						분양회원이시면 소노호텔&리조트의 연간 예약일정을 꼭 확인하세요.
					</p>
					<div class = "dtail_calenderBtn">소노호텔&리조트 연간예약일정 캘린더</div>
				</div>
			</div>
		</div>
	</section>
<%@ include file="../WEB-INF/view/include/footer.jsp" %>