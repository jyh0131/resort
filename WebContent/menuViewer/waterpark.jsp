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
		float: right;
		width: 400px;
		height: 100%;
		text-align: right;
	}
	#imgView>.info>.box>.right>img{
		float: right;
		margin-bottom: 10px;
	}
	#imgView>.info>.box>.right>p{
		clear: both;
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
		<a href="#">워터파크</a>
		<img src="${pageContext.request.contextPath}/images/menuViewer/bg_visual02.jpg">
	</div>
	<div id="menu_wrap">
		<ul id="menu_list">
			<li><a>오션월드</a></li>
			<li><a>오션파크</a></li>
			<li><a>오션베이</a></li>
			<li><a>델피노</a></li>
		</ul>
	</div>
	<div id="imgView">
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua1_1.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua1_2.jpg">
				</div>
				<div class="right">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua1_3.jpg">
					<p>1년 365일, 이글거리는 태양 아래 넘실대는 파도가 끊이지 않는<br>
					테마 워터파크 ‘비발디파크 오션월드’ 이집트 사막과 오아시스의 이국적인<br>
					풍경을 그대로 옮겨놓은 오션월드에서 여러분의 바다를 만끽하세요.</p>
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua1_4.jpg" style="margin-top:40px;">
				</div>				
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua1_5.jpg">
				</div>
				<div class="right">
					<p>고대이집트 문화의 신비스러움과<br>
					지중해의 파도가 어우러져 즐거움이 출렁이는 곳,<br>
					전체 규모는 실내존 43,291㎡, 익스트림존 23,787㎡,<br>
					파도풀존 19,284㎡, 다이나믹존 31,242㎡,<br>
					메가슬라이드존 7,041㎡로 총 124,645㎡이며,<br>
					이는 축구장 14배 넓이로 동시 수용 가능인원은 2만 3천명입니다.</p>
				</div>
			</div>
		</div>
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua9_1.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua9_2.jpg">
				</div>
				<div class="right">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua9_3.jpg">
					<p>로마, 스페인, 핀란드, 베네치아 등<br>
					유럽 각국의 다양한 문화를 테마로 한 워터파크와 함께<br>
					추억을 만들어보세요.</p>
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua9_4.jpg"  style="margin-top:30px;">
				</div>				
			</div>
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua9_5.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua9_6.jpg">
				</div>
				<div class="right">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua9_7.jpg">
				</div>
			</div>
		</div>
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua7_1.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua7_2.jpg">
				</div>
				<div class="right">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua7_3.jpg">
					<p>태초의 신비를 간직한 거제 오션베이는 온 가족이 즐길 수 있는<br>
					아름다운 워터파크입니다. 우주를 테마로 한 실내존과 미지의 세계를<br>
					테마로 한 야외존, 짜릿함을 선사할 슬라이드존은<br>
					마치 시간여행을 하는 듯한 환상적인 경험을 선물해드립니다.</p>
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua7_4.jpg" style="margin-top:20px;">
				</div>				
			</div>
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua7_5.jpg">
			</div>
		</div>
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua2_1.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua2_4.jpg">
				</div>
				<div class="right">
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua2_2.jpg" style="float:left; margin-left:10px;">
					<p align="left" style="margin-left:10px;">델피노의 아쿠아월드는 실내 워터파크 및 노천탕과 사우나 시설,<br>
					 썬텐시설로 구성된 물놀이 테마파크입니다. 휴식과 건강이 공존하는<br> 
					 웰빙을 컨셉으로 일상생활에서 벗어나 자연 안에서 가족과 연인들이<br> 
					 즐길 수 있는 아쿠아월드 델피노로 여러분을 초대합니다.</p>
					<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua2_3.jpg" style="margin-top:20px;">
				</div>				
			</div>
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/waterpark/aqua2_5.jpg">
			</div>
		</div>
	</div>
</section>
<%@ include file="../WEB-INF/view/include/footer.jsp" %>