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
			<img src="${pageContext.request.contextPath}/images/main_bg1.jpg" title="main_bg1">
		</div>
		<div>
			<img src="${pageContext.request.contextPath}/images/main_bg2.jpg" title="main_bg2">
		</div>
		<div>
			<img src="${pageContext.request.contextPath}/images/main_bg3.jpg" title="main_bg3">
		</div>
	</div>
	<div id="room_introbox">
		<%-- <c:forEach var="" items=""> --%>
			<div class="room_detailbox">
				<%-- <c:if test="${rt_name == '리조트'}">
					<p>Resort</p>
				</c:if>
				<c:if test="${rt_name == '호텔'}">
					<p>Hotel</p>
				</c:if> --%>
				<p class="room_type">Resort</p>
				<p class="room_name">presidential sweat / royal sweat</p>
				<a href="#">Read More</a>
				<p><span class="nowCnt">10</span>/<span class="totalCnt">12</span></p>
				<img src="${pageContext.request.contextPath}/images/room_leftbtn.png" class="room_leftbtn">
				<img src="${pageContext.request.contextPath}/images/room_rightbtn.png" class="room_rightbtn">
			</div>
		<%-- </c:forEach> --%>
	</div>
	<div style="text-align:center;">
		<img src="${pageContext.request.contextPath}/images/main_bg_aqua.PNG" title="main_bg_aqua">
	</div>
</div>
<%@ include file="WEB-INF/view/include/footer.jsp" %>