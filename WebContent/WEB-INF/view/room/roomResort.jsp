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
		margin-left:100px;
		margin-right: 50px;
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
		margin-bottom: 40px;
	}
	#mb_mainImage{/* main화면에 있는 객실 이미지의 body*/
		width:1024px;
		margin: 0 auto;
		overflow: hidden;
	}
	#mb_mainImage > ul{/* main화면에 있는 이미지 리스트(ul) */
		width: 100%;
		height: 550px;
		margin: 0 auto;
	}
	#mb_mainImage > ul > li > img{/* main화면에 있는 객실의 이미지 */
		widht:1100px;
		height: 550px;
	}
	/* .left{
		display: inline-block;
   		width: 50px;
    	height: 50px;
    	background: rgba(0, 0, 0, 0.5) url(${pageContext.request.contextPath }/images/room_left_btn.png) no-repeat;		
	}
	.right{
		display: inline-block;
   		width: 50px;
    	height: 50px;
    	background: rgba(0, 0, 0, 0.5) url(${pageContext.request.contextPath }/images/room_right_btn.png) no-repeat 0 0;		
	} */
	
	/* 모든 객실 리스트의 테이블 */
	h3{
		margin: 90px 0 20px;
    	font-size: 20px;
    	color: #333;
    	text-align: left;
	}
	table{
		border-top: 1.5px solid #777; 
		border-spacing: 2px;
		width: 100%;
		border-collapse: collapse;
	}
	th,td{
		border-collapse: collapse;
		padding:15px;
		text-align: center;
		border:1px solid #d8d8d8;
		border-top:none;
		color: #777;
		font-size:14px;
	}
	th{
		background: #f4f4f4;
		color:#333;
	}
	th:first-child,td:first-child {
		border-left:none;
	}
	th:last-child,td:last-child {
		border-right:none;
	}
	/* room_season의 시즌 적용 날짜 span */
	.season_date{
		display: inline-block;
	    margin-left: 20px;
	    font-size: 14px;
	    color: #777;
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
			<div id = "mb_mainTitle">
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
			</div><!-- 메인 타이틀(객실 이름) -->
			<div id = "mb_mainImage">
				<ul>
					<c:forEach var = "ri" items = "${riList }">
						<c:if test = "${rnList[selectRnNo-1].rnNo == ri.roomName.rnNo}">
							<li>
								<img src = "${pageContext.request.contextPath }/images/roomImg/${ri.riFile}">
							</li>
						</c:if>
					</c:forEach>
				</ul>
				<!-- <div id = "mainImg_btn">
					<span class = "left"></span>
					<span class = "rigth"></span> 
				</div>이미지를 넘기는 버튼을 담고 있는 div -->
			</div><!-- 객실에 따른 객실 메인 이미지 -->
			<div id = "mb_roomConfiguration">
				<h3>객실 구성</h3>
				<table id = "rc_table">
					<tr>
						<th>구분</th>
						<th>면적</th>
						<th>객실 타입</th>
						<th>실내 구성</th>
					</tr>
					<tr>
					<c:forEach var = "rcList" items = "${rcList }">
						<c:if test = "${rnList[selectRnNo-1].rnNo == rcList.roomName.rnNo }">
							<td>
								${rcList.roomName.rnName }
							</td>
							<td>
								${rcList.rcArea }m&#178;
							</td>
							<td>
								${rcList.rcType } : ${rcList.rcTypeCount }실
							</td>
							<td>
								${rcList.rcInterior }
							</td>
						</c:if>
					</c:forEach>
					</tr>
				</table>
			</div><!-- 객실 구성을 담은 div -->
			<div id = "mb_roomSeason">
				<h3>객실요금 (VAT포함) <span class = "season_date">* 요금 적용기간 : 2019년 7월 19일 ~</span></h3>
				<table id = "rs_table">
					<tr>
						<th colspan="2">구분</th>
						<th>기본 요금</th>
					</tr>
					<tr>
						<td rowspan="6">
							${rnList[selectRnNo-1].rnName }
						</td>
					</tr>
					<tr>
					<c:forEach var = "rs" items = "${rsList }">
						<c:if test = "${rnList[selectRnNo-1].rnNo == rs.roomName.rnNo }">
							<td>
								${rs.rsSeason }
							</td>
							<td>
								${rs.rsDetail }
							</td>
						</c:if>
					</c:forEach>
					</tr>
					<tr>
						<td rowspan="6">
							${rnList[selectRnNo-1].rnPrice }
						</td>
					</tr>
				</table>
			</div><!-- 객실 시즌 정보를 담은 div -->
		</article>
	</section><!-- 객실 body -->
<%@ include file="../include/footer.jsp" %>