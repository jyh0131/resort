<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/view/include/header.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css?family=Italianno&display=swap');
@import url('https://fonts.googleapis.com/css?family=Cormorant+Garamond&display=swap');
	header{
		margin-bottom: 10px;
	}
	#wrapper_main {
		width:100%;
		z-index:1;
	}
	#room_introbox .room_detailbox {
		background:no-repeat center;
		background-size:cover;
		padding-left:200px;
		padding-top:100px;
		height:600px;
	}
	#room_introbox .room_detailbox .text_box{
		background:rgba(255,255,255,0.8);
		padding:30px;
		width:420px;
		position:relative;
	}
	#room_introbox .room_detailbox p.room_type{
		margin:10px;
		font-size:14px;
	}
	#room_introbox .room_detailbox p.room_name{
		color:rgb(151,127,81);
		font-size:48px;
		font-family: 'Italianno', cursive;
		margin:0 10px 10px 10px;
	}
	#room_introbox .room_detailbox p.room_detail{
		font-size:13px;
		color:#777777;
		margin:0 10px 10px 10px;
	}
	#room_introbox .room_detailbox a{
		text-align:right;
		text-decoration: none;
		display:inline-block;
		color:white;
		padding:15px;
		font-size:16px;
		font-weight:bold;
		background:rgb(151,127,81);
		margin:0 10px 10px 10px;
	}
	#room_introbox .room_detailbox .idx_cnt{
		position:absolute;
		right:42px;
		bottom:10px;
		font-size:14px;
	}
	#room_introbox .room_detailbox .btn_clickbox {
		position:absolute;
		right:10px;
		bottom:30px;
	}
	#room_introbox .room_detailbox .idx_cnt .totalCnt{
		color:rgb(151,127,81);
	}
	.hidebox {
		display:none;
	}
	#conv_box {
		text-align:center;
		margin:0 auto;
		width:1100px;
		height:500px;
		overflow:hidden;
		position:relative;
	}
	#conv_title {
		font-family: 'Cormorant Garamond', serif;
		margin:20px 0;
		text-align:center;
	}
	#conv_box .healing_info_box {
		width:366px;
		height:500px;
	}
	#page1, #page2 {
		position:relative;
	}
	#page1 .content {
		width:1100px;
		height:500px;
		background:no-repeat;
		background-image:url("${pageContext.request.contextPath}/images/healing_img01.jpg");
	}
	#info_box1 {
		position:absolute;
		top:0px;
		left:0px;
	}
	#info_box2 {
		position:absolute;
		margin-top:250px;
		height:250px;
		top:0px;
		left:366px;
	}
	#info_box3 {
		position:absolute;
		top:0px;
		left:732px;
	}
	#page2 .content {
		width:1100px;
		height:500px;
		background:no-repeat;
		background-image:url("${pageContext.request.contextPath}/images/healing_img02.jpg");
	}
	#info_box4 {
		position:absolute;
		top:0px;
		left:0px;
	}
	#info_box5 {
		position:absolute;
		margin-top:250px;
		height:250px;
		top:0px;
		left:366px;
	}
	#info_box6 {
		position:absolute;
		top:0px;
		left:732px;
	}
	.healing_info_box .healing_title {
		font-size: 22px;
    	display: block;
    	padding: 40px 0 15px 0;
	}
	.healing_info_box .healing_text {
		font-size: 13px;
    	color: #777;
    	line-height: 20px;
	}
	.healing_info_box a {
		display: block;
	    width: 110px;
	    font-family: Georgia;
	    letter-spacing: 0.01px;
	    height: 44px;
	    z-index: 10;
	    line-height: 44px;
	    cursor: pointer;
	    text-align: center;
	    border: 1px solid #d8d8d8;
	    color:#333;
	    text-decoration: none;
	    margin:5px auto;
	}	
	#healing_btn_box {
		text-align:center;
	}
	#healing_btn_box #healing1, #healing_btn_box #healing2 {
		background: #999;
	    text-align: center;
	    text-indent: -9999px;
	    display: inline-block;
	    width: 8px;
	    height: 8px;
	    margin: 0 7px;
	    outline: 0;
	    border-radius: 4px;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script	src="js/jquery.scrollTo.min.js"></script>
<script>
	$(function(){
		$('.bxslider').bxSlider({
		  auto: true,
		  autoControls: true,
		  stopAutoOnClick: true,
		  captions: false,
		  pager: true,
		  pause:6000,
		  speed:700,
		  slideWidth: 1920
		});
		
		$(document).ready(function() {
			// 방 이미지 삽입
			$("#boxNum1").css("background-image", "url('${pageContext.request.contextPath}/images/resort_family_img.jpg')");			
			$("#boxNum2").css("background-image", "url('${pageContext.request.contextPath}/images/resort_suite_img.jpg')");			
			$("#boxNum3").css("background-image", "url('${pageContext.request.contextPath}/images/hotel_superior_img.jpg')");			
			$("#boxNum4").css("background-image", "url('${pageContext.request.contextPath}/images/hotel_deluxe_ocean_suite_img.jpg')");			
			$("#boxNum5").css("background-image", "url('${pageContext.request.contextPath}/images/hotel_executive_suite_img.jpg')");
			$("#boxNum6").css("background-image", "url('${pageContext.request.contextPath}/images/hotel_ocean_suite_img.jpg')");
			$("#boxNum7").css("background-image", "url('${pageContext.request.contextPath}/images/hotel_presidential_suite_img.jpg')");
			
			// 첫화면에 보여질 방 정보
			$("#boxNum1").removeClass("hidebox");
			
			// 표시된 방 정보에서 왼쪽 버튼 위에 마우스를 올렸을 때
			$(".room_leftbtn").hover(function() {
				$(this).attr("src", "${pageContext.request.contextPath}/images/room_leftbtn_hover.png");
				$(this).css("cursor", "pointer");
			}, function() {
				$(this).attr("src", "${pageContext.request.contextPath}/images/room_leftbtn.png");
			})
			
			// 표시된 방 정보에서 왼쪽 버튼을 눌렀을 때 
			$(".room_leftbtn").click(function() {
				var index = $(this).parent().parent().find(".nowCnt").text();
				index = Number(index);
				var total = $(this).parent().parent().find(".totalCnt").text();
				total = Number(total);
				
				$(".room_detailbox").css("display", "none");   		
				
				if(index == 1) {
					$(this).parents().find("#boxNum"+total).fadeIn(1000);
					
				} else {
					$(this).parents().find("#boxNum"+(index-1)).fadeIn(1000);
					
				}
			});
			
			// 표시된 방 정보에서 오른쪽 버튼 위에 마우스를 올렸을 때
			$(".room_rightbtn").hover(function() {
				$(this).attr("src", "${pageContext.request.contextPath}/images/room_rightbtn_hover.png");
				$(this).css("cursor", "pointer");
			}, function() {
				$(this).attr("src", "${pageContext.request.contextPath}/images/room_rightbtn.png");
			})
			
			// 표시된 방 정보에서 오른쪽 버튼을 눌렀을 때 
			$(".room_rightbtn").click(function() {
				var index = $(this).parent().parent().find(".nowCnt").text();
				index = Number(index);
				var total = $(this).parent().parent().find(".totalCnt").text();
				total = Number(total);
				
				$(".room_detailbox").css("display", "none");
				
				if(index == total) {
					$(this).parents().find("#boxNum1").fadeIn(1000);		
				} else {
					$(this).parents().find("#boxNum"+(index+1)).fadeIn(1000);
				}
			});
			
			// conv_box 밑의 동그란 버튼에 마우스를 올렸을 때
			$("#healing1, #healing2").hover(function() {
				$(this).css("width", "12px")
						.css("height","12px")
						.css("text-align","center")						
						.css("margin","0 5px")
						.css("background","#333")
						.css("border-radius","6px");
			}, function() {
				$(this).css("width", "8px")
				.css("height","8px")
				.css("text-align","center")						
				.css("margin","0 7px")
				.css("background","#999")
				.css("border-radius","4px")
				.css("outline","0")
				.css("text-indent", "-9999px");
			});
			
			// conv_box에 있는 Read More 버튼 클릭 시
			$("#conv_box a").click(function(e) {
				e.preventDefault();
				alert("준비 중입니다.");
			})
			
			// conv_box 밑의 동그란 버튼을 눌렀을 때
			$("#healing1, #healing2").click(function(e) {
				e.preventDefault();
				var href = $(this).attr("href");
				$("#conv_box").scrollTo(href, 800);	
			});			
		});		
	});
</script>
<div id="wrapper_main">
	<div class="bxslider">
		<div>
			<img src="${pageContext.request.contextPath}/images/main_bg1.jpg">
		</div>
		<div>
			<img src="${pageContext.request.contextPath}/images/main_bg2.jpg">
		</div>
		<div>
			<img src="${pageContext.request.contextPath}/images/main_bg3.jpg">
		</div>
	</div>
	<div id="room_introbox">
		<c:forEach var="rn" items="${list}">
		<fmt:formatNumber var="roomidx" value="${rn.ranking}" pattern="##"></fmt:formatNumber>
			<div class="room_detailbox hidebox" id="boxNum${rn.rnNo}">
				<div class="text_box">
					<c:if test="${rn.roomType.rtNo == 1}">
						<p class="room_type">Resort</p>
					</c:if>
					<c:if test="${rn.roomType.rtNo == 2}">
						<p class="room_type">Hotel</p>
					</c:if>
					<p class="room_name">${rn.rnEngName}</p>
					<p class="room_detail">${rn.rnDetail}</p>
					<a href="${pageContext.request.contextPath}/room/M/list.do?rnNo=${rn.rnNo}">Read More</a>
					<p class="idx_cnt"><span class="nowCnt">${rn.rnNo}</span> / <span class="totalCnt">7</span></p>
					
					<div class="btn_clickbox">
						<img src="${pageContext.request.contextPath}/images/room_leftbtn.png" class="room_leftbtn">
						<img src="${pageContext.request.contextPath}/images/room_rightbtn.png" class="room_rightbtn">
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div style="text-align:center;">
		<img src="${pageContext.request.contextPath}/images/main_bg_aqua.PNG">
	</div>
	
	<h1 id="conv_title">Healing &amp; Convenience</h1>
	
	<div id="conv_box">		
		<div id="page1" class="page">
			<div class="content">
				<div class="healing_info_box" id="info_box1">
					<p class="healing_title">Martherapy</p>
					<p class="healing_text">동해안 최초의 프로그램 테라피 센터로써<br>
						바다라는 의미의 MAR와 치료, 요법 의미인<br>
						THERAPY의 합성어로 바다 요법이라는 의미입니다.</p>
					<a href="#">Read More</a>
				</div>
				<div class="healing_info_box" id="info_box2">
					<p class="healing_title">La Flor</p>
					<p class="healing_text">스페인풍 자연을 모티브로한 쏠비치 플라워샵 라플로르는<br>
						고객여러분의 추억을 더욱 아름답게 만들어드릴<br>
						유러피안 스타일의 플라워 어레인지먼트를 제공합니다.</p>
					<a href="#">Read More</a>
				</div>
				<div class="healing_info_box" id="info_box3">
					<p class="healing_title">Business Center</p>
					<p class="healing_text">투숙 고객을 위한<br>
						PC, 인터넷, 복사, 팩스 업무 등의 업무는 물론,<br>
						소파와 테이블에서 편하게 업무를 볼 수 있는<br>
						고객 편의 시설입니다.</p>
					<a href="#">Read More</a>
				</div>				
			</div>
		</div>
		<div id="page2" class="page">
			<div class="content">
				<div class="healing_info_box" id="info_box4">
					<p class="healing_title">Urbaney</p>
					<p class="healing_text">URBANEY는 urban과 journey의 합성어로 세계의 아름다운<br>
						도시들을 여행하며 만난 아티스트들과 함께하는<br>
						아트 콜라보레이션 브랜드입니다.<br>
						해외 또는 국내 유명작가들과의 콜라보레이션 작업을 통해<br>
						그들의 작품을 보다 친숙하게 만나보실 수 있습니다.</p>
					<a href="#">Read More</a>
				</div>
				<div class="healing_info_box" id="info_box5">
					<p class="healing_title">Good &amp; Goods</p>
					<p class="healing_text">고객님들이 필요로 하는 물품들로 채워진<br>
						마트에서 편안한 분위기로 고객님의<br>
						여유로운 쇼핑을 도와드립니다.</p>
					<a href="#">Read More</a>
				</div>
				<div class="healing_info_box" id="info_box6">
					<p class="healing_title">Play zone</p>
					<p class="healing_text">온 가족이 함께 즐기는 전자오락실, 당구장, 탁구장 등<br>
						다양한 놀거리로 가득한 Play zone 입니다.</p>
					<a href="#">Read More</a>
				</div>				
			</div>
		</div>
	</div>
	<div id="healing_btn_box">
		<a href="#page1" id="healing1"></a>
		<a href="#page2" id="healing2"></a>
	</div>
</div>
<%@ include file="WEB-INF/view/include/footer.jsp" %>