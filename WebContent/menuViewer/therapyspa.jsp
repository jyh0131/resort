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
		font-size: 45px;
		text-decoration: none;
		margin-top: 90px;
		margin-left: 10px;
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
	.box_wrap{
		width: 100%;
		min-height: 500px;
		margin: 50px 0px;
		overflow: hidden;  
	}
	#imgView img{
		float: left;
		margin: 10px 5px;
	}
	#imgView p{
		font-size: 12px;
		clear: both; 
		margin: 10px 5px;
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
	.box>p>span{
		color: #aaa;
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
		<a href="#">테라피&amp;스파</a>
		<img src="${pageContext.request.contextPath}/images/menuViewer/bg_visual02.jpg">
	</div>
	<div id="menu_wrap">
		<ul id="menu_list">
			<li><a>오션월드</a></li>
		</ul>
	</div>
	<div id="imgView">
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_01.jpg">
			</div>
			<div class="box_wrap">
				<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_txt_01.jpg">
					<p>
						일상의 지친 몸과 영혼에 건강과 새로운 활력을 불어넣어 주는 스파 시설을 갖추고 있으며 전문 테라피스트들의 정성 어린 서비스로<br>
						세계적인 수준의 스파 트리트먼트와 바디캐어 프로그램을 제공하고 있습니다.<br>
						High-End Level의 리조트 스파에서 가족, 연인, 친구들과 고품격 서비스로 편안하고 즐거운 시간을 누려보세요.<br><br>
						<span>문의처 033) 439 - 7030</span>
					</p>
				</div>
				<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_02.jpg">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_04.jpg">
				</div>
				<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_12.jpg">	
				</div>
			</div>
			<div class="box_wrap">
				<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_txt_02.jpg">
					<p>
						아늑한 실내공간에 샤워실과 다양한 탕 및 다양한 편의시설로 구성되어 있으며, 시기별 이벤트탕을 운영합니다.<br>
						한약제, 쑥 등이 배치된 건,습식 도크도 운영합니다. 다양한 탕을 통해 피로를 풀 수 있는 오션월드 사우나존 입니다.<br><br>
						<span>문의처 033) 439 - 7030</span>
					</p>
				</div>
				<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_06.jpg">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_07.jpg">
				</div>
			</div>
			<div class="box_wrap">
				<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_txt_03.jpg">
					<p>
						하이드로 욕조로 구성되어진 가족탕은 가족, 친구, 연인분들이 오손도손 물놀이를 즐길 수 있는 최적의 장소입니다.<br>
						실내 아쿠아존에서 신나게 즐기는 물놀이와 가족탕에서 오븟한 분위기는 물놀이의 진수를 보여줍니다.<br>
						연인 또는 가족과 함께 느낄 수 있는 오션월드 속 오븟한 분위기 하이드로 욕조로 구성된 엔젤스파에서 느껴보세요!<br><br>
						<span>문의처033) 439 - 7019</span>
					</p>
				</div>
				<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_08.jpg">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_09.jpg">
				</div>
			</div>
			<div class="box_wrap">
				<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_txt_04.jpg">
					<p>
						산림속에서 호수공원과 오션월드를 바라보며, 즐기는 빌리지 형태의 스파빌리지.<br>
						하이드로 욕조를 이용하실 수 있으며, 여름에는 푸르름을, 겨울에는 새하얀 설경 등 4계절마다 색다른 분위기를 연출합니다.<br>
						산림속에서 호수공원과 오션월드를 바라보며 즐기는 빌리지 형태의 스파빌리지.<br><br>
						<span>문의처033) 439 - 7019</span>
					</p>
				</div>
				<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_10.jpg">
					<img src="${pageContext.request.contextPath}/images/menuViewer/therapyspa/img_therapy_oceanworld_11.jpg">
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../WEB-INF/view/include/footer.jsp" %>