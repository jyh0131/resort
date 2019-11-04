<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/view/include/header.jsp" %>
<style>
	header{
		margin-bottom: 10px;
	}
	#wrapper_main {
		width:100%;
		z-index:1;
	}	
	#room_introbox {
		border:1px solid black;	
	}
	#room_introbox .room_detailbox {
		background:url("");	
		display:none;
	}
	.showbox {
		display:block;	
	}	
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
			// 첫화면에 보여질 방 정보
			$("#boxNum1").addClass("showbox");
			
			// 표시된 방 정보에서 왼쪽 버튼을 눌렀을 때 
			$(".room_leftbtn").click(function() {
				var index = $(this).parent().find(".nowCnt").text();
				if(index < 1) {
					$(".room_detailbox").removeClass("showbox");
					$(this).parent().parent().find("#boxNum${list.size()}").addClass("showbox");
				} else {
					$(".room_detailbox").removeClass("showbox");
					$(this).next().next().addClass("showbox");
				}
			});
			
			// 표시된 방 정보에서 오른쪽 버튼을 눌렀을 때 
			$(".room_leftbtn").click(function() {
				var index = $(this).parent().find(".nowCnt").text();
				var total = $(this).parent().find(".totalCnt").text();
				
				if(index > total) {
					$(".room_detailbox").removeClass("showbox");
					$(this).parent().parent().find("#boxNum1").addClass("showbox");				
				} else {
					$(".room_detailbox").removeClass("showbox");
					$(this).next().next().addClass("showbox");
				}
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
			<div class="room_detailbox" id="boxNum${roomidx}">
				<c:if test="${rn.roomType.rtNo == 1}">
					<p class="room_type">Resort</p>
				</c:if>
				<c:if test="${rn.roomType.rtNo == 2}">
					<p class="room_type">Hotel</p>
				</c:if>
				<p class="room_name">${rn.rnEngName}</p>
				<p class="room_detail">${rn.rnDetail}</p>
				<a href="${pageContext.request.contextPath}/room/M/rnNo=${rn.rnNo}">Read More</a>
				<p><span class="nowCnt">${roomidx}</span>/<span class="totalCnt">${list.size()}</span></p>
				<img src="${pageContext.request.contextPath}/images/room_leftbtn.png" class="room_leftbtn">
				<img src="${pageContext.request.contextPath}/images/room_rightbtn.png" class="room_rightbtn">
			</div>
		</c:forEach>
	</div>
	<div style="text-align:center;">
		<img src="${pageContext.request.contextPath}/images/main_bg_aqua.PNG">
	</div>
</div>
<%@ include file="WEB-INF/view/include/footer.jsp" %>