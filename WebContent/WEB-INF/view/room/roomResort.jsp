<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	ul{
		list-style:none;
	}
	a{
		text-decoration: none;
	} 
	#roomResort{
		width: 100%;
		margin: 0 auto;
		overflow: hidden;
	}
	#sideMenu{
		float:left;
		width: 150px;
		height: 500px;/* 임시용 높이  */
		border:2px solid #BFC0C1;
		padding:10px;
		text-align: center;
		margin-left:275px;
	}
	.reSubMenu{
		display: none;
	}
</style>
<script>
	$(function(){
		$("#reMainMenu > li > a").click(function(){
			$(".reSubMenu").css("display","none");
			$(this).next().css("display","block");
		})
	})
</script>
	<section id = "roomResort">
		<aside id = "sideMenu">
			<ul  id = "reMainMenu">
				<c:forEach var = "rt" items = "${rtList }">
					<li>
					<a href="#?rnNo=1">${rt.rtName}</a>
					<ul class = "reSubMenu">
						<c:forEach var = "rn" items = "${rnList }">
							<c:if test = "${rt.rtNo == rn.roomType.rtNo }">
								<li><a href="#?rnNo=${rn.rnNo }">${rn.rnName }</a></li>
							</c:if>
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