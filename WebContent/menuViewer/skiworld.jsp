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
		width: 50%;
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
		<a href="#">스키&amp;보드</a>
		<img src="${pageContext.request.contextPath}/images/menuViewer/bg_visual02.jpg">
	</div>
	<div id="menu_wrap">
		<ul id="menu_list">
			<li><a>비발디파크 스키월드</a></li>
		</ul>
	</div>
	<div id="imgView">
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/skiworld/img_060200101.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/skiworld/img_060200102.jpg">
				</div>
				<div class="right">
					<img src="${pageContext.request.contextPath}/images/menuViewer/skiworld/img_060200103.jpg">
					<p>하얀눈 위에서 펼쳐지는 박진감 넘치는 스피드와<br>
					 짜릿한 스릴을 만나보세요.<br>
					스키월드가 여러분에게 행복한 시간을 선물합니다.<br>
					비발디파크 스키월드는 다양한 수준의 코스와 최신식 시설로 영원히<br>
					잊지못할 소중한 추억을 안겨드립니다.</p>
					<img src="${pageContext.request.contextPath}/images/menuViewer/skiworld/img_060200104.jpg">
				</div>				
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/skiworld/img_060200105.jpg">
				</div>
				<div class="right">
					<img src="${pageContext.request.contextPath}/images/menuViewer/skiworld/img_060200106.jpg">
					<p>스키월드는 슬로프 총 면적 1,322,021㎡, 슬로프 총 길이<br>
					6,784m, 리프트 총 길이 6,332m의 규모로 일일 최대<br>
					약 2만 명을 수용 가능한 최고급 레저시설입니다.<br>
					비발디파크 스키월드는 아시아 최초 8인승 고속 리프트기 및<br>
					8인승 고속 곤돌라기를 포함하여 총 10기의 리프트와<br>
					곤돌라기를 운영하고 있습니다.</p>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../WEB-INF/view/include/footer.jsp" %>