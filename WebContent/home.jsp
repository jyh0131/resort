<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/view/include/header.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css?family=Italianno&display=swap');
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
		right:45px;
		bottom:10px;
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
		width:1100px;
		height:500px;
		overflow:hidden;
	}
	#healing1, #healing2 {
		background: #999;
	    text-align: center;
	    text-indent: -9999px;
	    display: block;
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
				
				$(".room_detailbox").addClass("hidebox");
				
				if(index == 1) {
					$(this).parents().find("#boxNum"+total).removeClass("hidebox");
				} else {
					$(this).parents().find("#boxNum"+(index-1)).removeClass("hidebox");
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
				
				$(".room_detailbox").addClass("hidebox");
				
				if(index == total) {
					$(this).parents().find("#boxNum1").removeClass("hidebox");				
				} else {
					$(this).parents().find("#boxNum"+(index+1)).removeClass("hidebox");
				}
			});
			
			// conv_box 밑의 동그란 버튼에 마우스를 올렸을 때
			$("#healing1, #healing2").hover(function() {
				e.preventDefault();
				var href = $(this).attr("href");
				$("#conv_box").scrollTo(href, 800);	
			});
			
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
					<p class="idx_cnt"><span class="nowCnt">${rn.rnNo}</span>/<span class="totalCnt">7</span></p>
					
					<div class="btn_clickbox">
						<img src="${pageContext.request.contextPath}/images/room_leftbtn.png" class="room_leftbtn">
						<img src="${pageContext.request.contextPath}/images/room_rightbtn.png" class="room_rightbtn">
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div style="text-align:center;" style = "width:100%;">
		<img src="${pageContext.request.contextPath}/images/main_bg_aqua.PNG" style = "width:100%;">
	</div>
	<div id="conv_box">
	
		<div id="page1" class="page">
			<div class="content">
				<img src="${pageContext.request.contextPath}/images/healing_img01.jpg">
			</div>
		</div>
		<div id="page2" class="page">
			<div class="content">
				<img src="${pageContext.request.contextPath}/images/healing_img02.jpg">
			</div>
		</div>
	</div>
	<a href="#page1" id="healing1"></a>
	<a href="#page2" id="healing2"></a>
</div>
<%@ include file="WEB-INF/view/include/footer.jsp" %>