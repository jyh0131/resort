<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/view/include/header.jsp" %>
<style>
	header{
		margin-bottom: 10px;
	}
	#wrapper_main {
		width:100%;
	}	
	#room_introbox {
		border:1px solid black;
	}
	#room_introbox .room_detailbox {
		background:url("");
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
		<c:forEach var="list" items="${list}">
			<div class="room_detailbox" id="boxNum${list.ranking}">
				<c:if test="${list.roomtype.rt_name == '리조트'}">
					<p class="room_type">Resort</p>
				</c:if>
				<c:if test="${list.roomtype.rt_name == '호텔'}">
					<p class="room_type">Hotel</p>
				</c:if>
				<p class="room_name">${list.rn_eng_name}</p>
				<a href="${pageContext.request.contextPath}/room/M/rnNo=${list.rn_no}">Read More</a>
				<p><span class="nowCnt">${list.ranking}</span>/<span class="totalCnt">${list.size()}</span></p>
				<img src="${pageContext.request.contextPath}/images/room_leftbtn.png" class="room_leftbtn">
				<img src="${pageContext.request.contextPath}/images/room_rightbtn.png" class="room_rightbtn">
			</div>
		</c:forEach>
	</div>
	<div style="text-align:center;">
		<img src="${pageContext.request.contextPath}/images/main_bg_aqua.PNG">
	</div>
</div>
<script>
	$(function() {
		// 첫화면에 보여질 방 정보
		$("#room_introbox .room_detailbox").eq(0).addClass("showbox");
		
		// 표시된 방 정보에서 왼쪽 버튼을 눌렀을 때 
		$(".room_leftbtn").click(function() {
			
			$(this).parent().parent().find("#boxNum"+1 2 3 4 5 ).removeClass("showbox");
			$(this).next().next().addClass("showbox");
		});
		
		// 표시된 방 정보에서 오른쪽 버튼을 눌렀을 때 
		$(".room_leftbtn").click(function() {
			$(this).parent().removeClass("showbox");
			$(this).next().next().addClass("showbox");
		});
	});
</script>
<%@ include file="WEB-INF/view/include/footer.jsp" %>