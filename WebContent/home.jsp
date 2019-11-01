<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/view/include/header.jsp" %>
<style>
	header{
		margin-bottom: 10px;
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
	<div>
		<img src="${pageContext.request.contextPath}/images/main_bg3.jpg" title="main_bg3">
	</div>
</div>
<%@ include file="WEB-INF/view/include/footer.jsp" %>