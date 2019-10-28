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
		border:2px solid #977F51;
		padding:10px;
		text-align: center;
		margin-left:275px;
	}
	.reSubMenu{
		display: none;
	}
	#reMainMenu a {
		color:#977F51;
	}
	.sideM_T{
		display: block;
		border-bottom: 1px dotted #977F51;
		margin: 10px auto;
		padding:5px 0;
	}
	#rR_mainBody{
		float:left;
		width:1024px;
		margin: 0 auto;
		text-align: center;
	}
	.title_border{
		display: block;
		border-bottom: 1px solid black;
		width:70px;
		margin:0 auto;
	}
	.mainTitle{
		font-size: 28px;
		margin-bottom:20px;
	}
</style>
<script>
	$(function(){
		$("#reMainMenu > li > a").click(function(){
			$(".reSubMenu").css("display","none");
			$(this).next().css("display","block");
		})
		
		$(".sideM_sm").click(function(){
			var t = $(this).html();
			$(".mainTitle").html(t);
		})
	})
</script>
	<section id = "roomResort">
		<aside id = "sideMenu">
			<ul  id = "reMainMenu">
				<c:forEach var = "rt" items = "${rtList }">
					<li>
					<a href="#?rnNo=1" class  = "sideM_T">${rt.rtName}</a> <!-- resort & hotel -->
					<ul class = "reSubMenu">
						<c:forEach var = "rn" items = "${rnList }">
							<c:if test = "${rt.rtNo == rn.roomType.rtNo }">
								<li>
									<a href="#?rnNo=${rn.rnNo }" class = "sideM_sm"><!-- sub_menu -->
										 ${rn.rnName }
									</a>
								</li>
							</c:if>
						</c:forEach>
					</ul><!-- room_sub 리조트 -->
				</li>
				</c:forEach>
			</ul><!-- room_menu -->
		</aside><!-- side Menu -->
		<article id = "rR_mainBody"><!-- Main body -->
			<div id = "mb_mainTitle">
				<p class = "mainTitle">
					${rnList[0].rnName }
				</p>
				<span class = "title_border"></span>
			</div>
		</article>
	</section>
<%@ include file="../include/footer.jsp" %>