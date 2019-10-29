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
		
		/* $(".sideM_sm").click(function(){
			var t = $(this).html();
			$(".mainTitle").html(t);
<<<<<<< HEAD
			
			var eng = $(this).next().html();
			$(".engTitle").html(eng);
			console.log(t);
		}) */
=======
		})
>>>>>>> branch 'master' of https://github.com/jyh0131/resort.git
	})
</script>
	<section id = "roomResort">
		<aside id = "sideMenu">
			<ul  id = "reMainMenu">
				<c:forEach var = "rt" items = "${rtList }">
					<li>
<<<<<<< HEAD
						<a href="#" class  = "sideM_T">
							${rt.rtName}
						</a> <!-- resort & hotel -->
						<ul class = "reSubMenu">
							<c:forEach var = "rn" items = "${rnList }">
								<c:if test = "${rt.rtNo == rn.roomType.rtNo }">
									<li>
										<a href="list.do?rnNo=${rn.rnNo }" class = "sideM_sm"><!-- sub_menu -->
											 ${rn.rnName }
										</a><!-- 한글이름 -->
										<a href = "list.do?rnNo=${rn.rnNo }" class = "sideM_e_sm">
											${rn.rnEngName }
										</a><!-- 영문이름 -->
									</li><!-- 객실 타입에 따른 객실 이름 -->
								</c:if><!-- 객실 타입과 객실 정보가 일치한지 확인하는 조건문 -->
							</c:forEach><!-- 객실 정보를 담고있는 리스트 for문 -->
						</ul><!-- 객실 타입의 서브 메뉴의 ul -->
					</li><!-- 객실 타입의 이름 -->
				</c:forEach><!-- 객실 타입 리스트 for문 -->
			</ul><!-- 객실 메뉴의  ul -->
		</aside><!-- 객실 사이드메뉴 border -->
=======
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
>>>>>>> branch 'master' of https://github.com/jyh0131/resort.git
		<article id = "rR_mainBody"><!-- Main body -->
			<div id = "mb_mainTitle">
				<p class = "mainTitle">
<<<<<<< HEAD
					${rnList[selectRnNo-1].rnName }
				</p><!-- 한글 이름 -->
				<span class = "title_border"></span>
				<p class = "engTitle">
					${rnList[selectRnNo-1].rnEngName }
				</p><!-- 영문 이름 -->
				<p class = "subText">
					${rnList[selectRnNo-1].rnDetail }
=======
					${rnList[0].rnName }
>>>>>>> branch 'master' of https://github.com/jyh0131/resort.git
				</p>
				<span class = "title_border"></span>
			</div>
		</article>
	</section>
<%@ include file="../include/footer.jsp" %>