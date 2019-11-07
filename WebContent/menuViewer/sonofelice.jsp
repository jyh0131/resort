<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../WEB-INF/view/include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
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
		color: #6987aa;
		cursor: pointer;
	}
	#banner>img{
		float: right;
	}
	div#menu_wrap{
		width: 740px;
		height: 50px;
		margin: 0 auto;
		background: url("${pageContext.request.contextPath}/images/menuViewer/tab3_bg.gif") center no-repeat;
	}
	ul#menu_list{
		list-style: none;
		width: 700px;
		margin: 0 auto;
		padding: 0 20px;
	}
	#menu_list>li{
		height: 50px;
		float: left;
		padding: 0px 10px;
		line-height: 50px;
		cursor: pointer;
	}
	#menu_list>li>a{
		color: #fff;
		font-size: 12px;
		font-weight: bold;
	}
	div#imgView{
		width: 740px;
		margin: 30px auto;
		overflow: hidden;
	}
	#imgView img{
		float: left;
		margin-bottom: 10px;
	}
	#imgView p{
		font-size: 12px;
	}
	div.info{
		width: 100%;
		display: none;
	}
	div.box{
		width: 100%;
		float: left;
		margin: 10px 0px;
		text-align: left;
	}
	#imgView>.info>.box>.left{
		width: 50%;
		height: 100%;
		text-align: left;
	}
	#imgView>.info>.box>.right{
		float: left;
		width: 50%;
		height: 100%;
		text-align: left;
		margin-left: 20px;
	}
	#imgView>.info>.box>.right>img{
		float: right;
		margin-bottom: 10px;
	}
	#imgView>.info>.box>.right>p{
		clear: both;
	}
	.right>p>span{
		color: #6987aa;
		font-weight: bold;
	}
</style>
<script>
	$(function() {
		$("#menu_list>li").click(function() {
			var i = $(this).index();
			$("#menu_list>li").css("background", "none");
			$("#menu_list>li>a").css("color", "#fff");
			$(this).css("background", "url('${pageContext.request.contextPath}/images/menuViewer/tab3_on_right.gif') 0 no-repeat");
			$(this).find("a").css("color", "#6987aa");
			$(".info").css("display", "none");
			$(".info").eq(i).css("display", "block");
		})
		
		$("#menu_list>li").eq(0).click();
	})
</script>
<section>
	<div id="banner">
		<a href="#">승마</a>
		<img src="${pageContext.request.contextPath}/images/menuViewer/bg_visual02.jpg">
	</div>
	<div id="menu_wrap">
		<ul id="menu_list">
			<li><a>소노펠리체</a></li>
		</ul>
	</div>
	<div id="imgView">
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/sonofelice/horse_sono1.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/sonofelice/horse_sono2.jpg">
				</div>
				<div class="right">
					<p>
						<span>The Best facilities Q&amp; design</span>
						<br><br>
						소노펠리체의 수준 높은 품격을 느낄 수 있는 실내ㆍ외 마장과 마사,<br>
						실내 연습마장, 원형 트랙 등 다양한 시설을 구비해 초보자 레슨기승은<br>
						물론 승마대회도 가능한 공간으로 구성되어 있습니다.<br>
						이와 함께 중, 상급자와 마니아를 위한 대규모 마장과<br>
						초보자 전용 마장으로 이 보다 조금 작은 마장을 별도로 구비했는데<br>
						이 또한 클럽 내에 두 개의 실내마장을 설계한 것 역시<br>
						소노펠리체 Equestrian Club이 유일합니다.
					</p>
				</div>				
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/sonofelice/horse_sono3.jpg">
				</div>
				<div class="right">
					<p>
						<span>The Excellent Horse</span>
						<br><br>
						소노펠리체 Equestrian Club은 시설뿐 아니라 혈통이 있는<br>
						명품의 명마를 구비하여 고품격을 자랑합니다.
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../WEB-INF/view/include/footer.jsp" %>