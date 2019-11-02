<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Tienne&display=swap" rel="stylesheet">
<%@ include file="../include/header.jsp" %>

<style>
	ul{
		list-style:none;
	}
	a{
		text-decoration: none;
	} 
/* -----------------------------mainBody--------------------------- */
	#roomResort{
		width: 100%;
		margin: 0 auto;
		overflow: hidden;
	}
/* -------------------------------aside(사이드메뉴)---------------------------------- */
	#sideMenu{
		float:left;
		width:235px;
		height: 500px;/* 임시용 높이  */
		border:2px solid #977F51;
		padding:10px;
		text-align: center;
		margin-left:220px;
	}
	#reMainMenu a { /* 사이드메뉴의 가장 상위 ul태그 안에 모든 a태그 */
		color:#977F51;
	}
	.reSubMenu{/* roomType(submenu)안의 submenu(roomName의 ul태그) */
		display: none;
	}
	.sideM_T{/* submenu의 type name */
		display: block;
		border-bottom: 1px dotted #977F51;
		margin: 10px auto;
		padding:5px 0;
	}
	#rR_mainBody{/* 객실의 메인 화면  */
		float:left;
		width:1024px;
		margin: 0 auto;
		text-align: center;
	}
	.title_border{/* 한글 title과 영문 title 사이의  border */
		display: block;
		border-bottom: 1px solid black;
		width:70px;
		margin:0 auto;
	}
	.mainTitle{/* main화면에 있는 한글 title */
		font-size: 28px;
		margin-bottom:20px;
		color: #333;
	}
	.sideM_e_sm{
		display: none;
	}
	.engTitle{/* main화면에 있는 영문 title */
		font-size: 46px;
		margin-top:15px;
		font-family: 'Tienne', serif;
		font-style: italic;
		color: #333;
	}
	.subText{/* main화면에 있는 객실에 대한 설명글 */
		color: #999;
		font-size:14px;
	}
	#mb_mainImage{/* main화면에 있는 객실 이미지의 body*/
		width:1024px;
		margin: 0 auto;
	}
	#mb_mainImage > ul > li > img{
		widht:1100px;
		height: 550px;
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
		<article id = "rR_mainBody"><!-- Main body -->
			<div id = "mb_mainTitle"><!-- 메인 타이틀(객실 이름) -->
				<p class = "mainTitle">
					${rnList[selectRnNo-1].rnName }
				</p><!-- 한글 이름 -->
				<span class = "title_border"></span>
				<p class = "engTitle">
					${rnList[selectRnNo-1].rnEngName }
				</p><!-- 영문 이름 -->
				<p class = "subText">
					${rnList[selectRnNo-1].rnDetail }
				</p><!-- 객실에 대한 설명 글 -->
			</div>
			<div id = "mb_mainImage">
				<ul>
					<c:forEach var = "rn" items = "${rnList }">
						<c:forEach var = "ri" items = "${riList }">
							<c:if test = "${rn.rnNo == ri.roomName.rnNo}">
								<li>
									<img src = "${pageContext.request.contextPath }/images/roomImg/${ri.riFile}">
								</li>
							</c:if>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
		</article>
	</section><!-- 객실 body -->
<%@ include file="../include/footer.jsp" %>