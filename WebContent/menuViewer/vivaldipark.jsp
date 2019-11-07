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
		<a href="#">골프</a>
		<img src="${pageContext.request.contextPath}/images/menuViewer/bg_visual02.jpg">
	</div>
	<div id="menu_wrap">
		<ul id="menu_list">
			<li><a>비발디파크CC</a></li>
			<li><a>소노펠리체CC</a></li>
			<li><a>델피노CC</a></li>
			<li><a>비발디9GC</a></li>
		</ul>
	</div>
	<div id="imgView">
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100101.jpg">
			</div>
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100102.jpg">
				<p style="clear:both;">비발디파크 C.C에는 아웃코스인 비발디코스와 인코스인 파크코스의 2가지 코스가 마련되어있습니다.<br>
				해발 500m에 위치하고 있고 1,122만㎡ 의 대자연 속에 펼쳐진 비발디파크 C.C는 자연미와 인공미가 적절히 조화된 최상의 휴식공간입니다.<br>
				이제 비발디파크 C.C에서 환상의 라운딩을 마음껏 누려보세요.</p>		
			</div>
			<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100103.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100104.jpg">
				</div>
				<div class="right">
					<p>
						<span>대자연속에서 경험하는 감동의 샷 ‘비발디코스(아웃코스)'</span>
						<br><br>
						비발디코스는 매봉산 정상으로 뻗은 산악형 코스로 산맥의 기운이<br>
						호탕한 남성적 에너지를 불어넣어줍니다.<br>
						1~9홀, 3,421yrd로 이뤄진 비발디코스는 푸르른 자연 속에서 가슴이<br>
						탁 트이는 경험을 선사합니다.<br>
						휴식이 필요한 날, 드넓은 자연을 배경으로 펼쳐진 비발디코스에서<br>
						재충전의 기회를 가지세요.
					</p>
				</div>				
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100104_2.jpg">
				</div>
				<div class="right">
					<p>
						<span>현대적 세련된 감각의 코스 ‘파크코스(인코스)’</span>
						<br><br>
						북미지역을 떠올리게 하는 모던한 느낌의 파크코스는<br>
						호수와 평지로 이루어진 최적의 코스입니다. 울창한 산림 속에 위치한<br>
						그라운드는 보는 것만으로도 가슴을 시원하게 열어줍니다.<br>
						10~18홀, 3,604yrd로 구성된 파크코스는 현대적 감각의 평지형 코스로<br>
						기분 좋은 휴식을 안겨줍니다.
					</p>
				</div>
			</div>
		</div>
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100301.jpg">
			</div>
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100302.gif">
				<p style="clear:both;">
					<span>
						소노펠리체에 이은 잘리콩의 또 다른 작품, 소노펠리체CC 클럽하우스<br>
						세계적인 건축가 다비드 피에르 잘리콩을 만날 수 있는 클럽하우스는 당신만의 특별한 휴식과 여유를 선사합니다.<br>
						차가운 세상에서 동화 속 유토피아로 가까워지는 방법이 있습니다.
					</span>
					차가운 세상에서 동화 속 유토피아로 가까워지는 방법이 있습니다.<br>
					코스 전장 6,630m, 총면적 1,322,655㎡에 달하는 소노펠리체CC는 광활한 천혜의 자연지형을 그대로 보여줍니다.<br>
					짙은 녹음을 헤치고 편안히 보이는 푸른 초원과 잔잔히 빛나는 호수는 팔봉산의 아름다운 명작을 펴쳐줍니다.<br>
					하늘에 맞닿아 꿈으로 가는 세계, 누구도 쉽게 넘보지 못하는 바로 그곳에서 당신만의 최적의 라운딩을 경험해 보십시오.
				</p>		
			</div>
			<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100303.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100304.jpg">
				</div>
				<div class="right">
					<p>
						<span>힐링 코스</span>
						<br><br>
						하늘과 맞닿은 정상에서 최적의 라운딩을 즐겨 보십시오.<br>
						약 18,800㎡의 빛나는 호수와 품격 있는 자연으로 이제까지<br>
						보지 못한 경이로운 풍광은<br>
						존경받는 당신에게 새로운 감동을 드릴 것입니다.
					</p>
				</div>				
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100305.jpg">
				</div>
				<div class="right">
					<p>
						<span>에코 코스</span>
						<br><br>
						동화 속 유토피아의 골프라이프를 즐겨보십시오.<br>
						장엄한 산 가운데 보이는 푸른 초원과 계곡은<br>
						친환경적인 코스설계 속에 한층 더 편안한 라운딩을<br>
						도와드릴 것입니다.
					</p>
				</div>
			</div>
		</div>
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100201.jpg">
			</div>
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100202.gif">
				<p style="clear:both;">
					델피노란 스페인어로 "소나무"를 뜻합니다. 주변에 펼쳐진 소나무 숲의 특징을 살린 델피노CC는 세월의 강건함이 살아있는<br>
					울산바위와 자연환경을 모티브로 휴식과 건강을 동시에 누릴 수 있는 마음의 힐링 코스입니다.
				</p>		
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100203.jpg">
				</div>
				<div class="right">
					<p>
						<span>오션 코스</span>
						<br><br>
						푸른 에메랄드빛 동해를 바라보며 이태리풍의 정취에 젖어<br>
						절로 아름다운 탄성이 일게 하는 낭만적인 코스입니다.
					</p>
				</div>				
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100204.jpg">
				</div>
				<div class="right">
					<p>
						<span>마운틴 코스</span>
						<br><br>
						대자연 속에서 펼쳐지는 짜릿한 묘미를 느낄 수 있는 코스로서<br>
						멋진 울산바위 절경과 난이도가 있어<br>
						감각적인 샷과 동시에 전략적으로 도전해야 하는<br>
						홀로 구성된 코스입니다.
					</p>
				</div>
			</div>
		</div>
		<div class="info">
			<div class="box">
				<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100401.jpg">
			</div>
			<div class="box">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100403.jpg">
			</div>
			<div class="box">
				<div class="left">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100402.jpg">
				</div>
				<div class="right">
					<img src="${pageContext.request.contextPath}/images/menuViewer/vivaldipark/img_060100403.gif"  style="margin-bottom:30px;">
					<p align="right">
						곤돌라를 타고 오르는 순간 자연과 인간<br>
						골프의 절묘한 조화를 체험해 보십시오.<br>
						일상에서 벗어난 탁 트인 하늘, 짙푸른 자연 속에서<br>
						호연지기를 만끽하는 즐거운 세상을 보는<br>
						안목을 지닌 분들께 더욱 격찬 받습니다.<br>
						완벽한 드라이브 샷을 원하는 고객님께 비발디9 GC를 소개합니다.
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="../WEB-INF/view/include/footer.jsp" %>