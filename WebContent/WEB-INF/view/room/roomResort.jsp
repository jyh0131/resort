<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	#roomResort{
		width: 1024px;
		margin: 0 auto;
	}
	#sideMenu{
		
	}
</style>
	<section id = "roomResort">
		<aside id = "sideMenu">
			<ul id="room_menu" class="bottom_sub">
				<c:forEach var = "rt" items = "${rtList }">
					<li>
					<a href="#?rnNo=1">${rt.rtName}</a>
					<ul class="room_sub">
						<c:forEach var = "rn" items = "${rnList }">
							<li><a href="#?rnNo=${rn.rnNo }">${rn.rnName }</a></li>
						</c:forEach>
					</ul><!-- room_sub 리조트 -->
				</li>
				</c:forEach>
			</ul><!-- room_menu -->
		</aside>
		<article id = "rR_mainTitle">
			
		</article>
	</section>
<%@ include file="../include/footer.jsp" %>