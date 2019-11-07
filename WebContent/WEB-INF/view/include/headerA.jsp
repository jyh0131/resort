<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SONO : Hotel &amp; Resorts</title>
<style>
	*{
		margin: 0;
		padding:0;
	}
	header ul{
		list-style:none;
	}
	header a{
		text-decoration: none;
	}
	#admin_mainHeader{
		overflow: hidden;
	}
	/* -------------------메인 로고-------------------- */
	#am_contaner{/* 메인 로고의 div */
		
		width: 100%;
		height: 52px;
		padding:30px 0;
	}
	.MainTitle{/* 메인로고 */
		display: inline-block;
		width: 155px;
		height: 60px;
		margin-left: 150px;
		background: url("${pageContext.request.contextPath}/images/logo.jpg") no-repeat center;
		float: left;
	}
	/* -------------------메인 메뉴 -------------------- */
	#am_menuBody{/* nav태그 */
		float: left;
		width: 1000px;
		margin: 10px 60px 0;
	}
	#am_mainMenu{
		width: 100%;
	}
	#am_mainMenu > li {
		float: left;
		width: 25%;
	}
	#am_mainMenu > li > span{
		display: block;
		width: 100%;
	    height: 100%;
	    font-weight: bold;
	    font-size: 18px;
	    border-right: 1px solid #999;
	    color:#666;
	    text-align: center;
	}
	#am_mainMenu > li:last-child > span{
		border:none;
	}
	#am_mainMenu > li > ul.am_subMenu{/* 메인메뉴 안의 서브메뉴 */
		width: 100%;
		display: none;
		padding-left:60px;
	}
	.am_subMenu > li{
		width: 100%; 
	}
	.am_subMenu > li > a{
		display: block;
		padding:10px;
		color:#888;
	}
	.am_subMenu > li > ul.am_sm_submenu{/* 메인메뉴 안의 서브메뉴 안의 서브메뉴 */
		width: 100%;
		display: none;
		padding-left:30px;
	}
	.am_sm_submenu > li > a{
		display: block;
		text-align: left;
		color:#888;
	}
	
	/* login & logout */
	#am_join{
		float: right;
		margin-right:50px; 
		overflow: hidden;
	}
	#am_join > li{
		float: left;
	}
	#am_join > li > a{
		color: #888;
	}
	#am_join > li:first-child > a {
		border-right:  1px solid #555;
		padding-right: 20px;
		margin-right: 20px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function(){
		$("#am_mainMenu > li").mouseover(function(){
			$(this).find(".am_subMenu").css("display","block");
			$(this).find("span").css("color","#977F51");
		})
		$("#am_mainMenu > li").mouseout(function(){
			$(this).find(".am_subMenu").css("display","none");
			$(this).find("span").css("color","#666");
		})
		
		
		
		$(".am_subMenu > li").mouseover(function(){
			$(this).find(".am_sm_submenu").css("display","block");
		})
		$(".am_subMenu > li").mouseout(function(){
			$(this).find(".am_sm_submenu").css("display","none");
		})
		
	})
</script>

</head>
<body>
	<header id = "admin_mainHeader">
		<div id = "am_contaner">
			<a href = "${pageContext.request.contextPath}/home.do" class = "MainTitle"></a><!-- main로고 -->
			<nav id = "am_menuBody">
				<ul id = "am_mainMenu">
					<li>
						<span>예약 관리</span>
						<ul id = "reservation" class = "am_subMenu">
							<li><a href = "${pageContext.request.contextPath }/reservation/list.do">전체 예약 정보 확인</a></li>
							<li><a href = "${pageContext.request.contextPath }/admin/salesChart.do">월별 매출액</a></li>
						</ul>
					</li>  
					<li>
						<span>객실 관리</span>
						<ul id = "room" class = "am_subMenu">
							<li>
								<a href = "${pageContext.request.contextPath }/roomType/list.do">객실 타입 정보</a>
								<ul class = "am_sm_submenu">
									<li><a href = "${pageContext.request.contextPath }/roomType/insert.do">- 객실 타입 추가</a></li>
									<li><a href = "${pageContext.request.contextPath }/roomType/list.do">- 객실 타입 LIST</a></li>
								</ul>
							</li>
							<li>
								<a href = "${pageContext.request.contextPath }/roomName/list.do">객실 정보</a>
								<ul class = "am_sm_submenu">
									<li><a href = "${pageContext.request.contextPath }/roomName/insert.do">- 객실 정보 추가</a></li>
									<li><a href = "${pageContext.request.contextPath }/roomName/list.do">- 객실 정보 LIST</a></li>
								</ul>
							</li>
							<li>
								<a href = "${pageContext.request.contextPath }/roomImg/list.do">객실 이미지 정보</a>
								<ul class = "am_sm_submenu">
									<li><a href = "${pageContext.request.contextPath }/roomImg/insert.do">- 객실 이미지 추가</a></li>
									<li><a href = "${pageContext.request.contextPath }/roomImg/list.do">- 객실 이미지 LIST</a></li>
								</ul>
							</li>
							<li>
								<a href = "${pageContext.request.contextPath }/room/list.do">객실 방 번호 정보</a>
								<ul class = "am_sm_submenu">
									<li><a href = "${pageContext.request.contextPath }/room/insert.do">- 객실 방 번호 추가</a></li>
									<li><a href = "${pageContext.request.contextPath }/room/list.do">- 객실 방 번호 LIST</a></li>
								</ul>
							</li>
							<li>
								<a href = "${pageContext.request.contextPath }/roomConfiguration/list.do">객실 구성 정보</a>
								<ul class = "am_sm_submenu">
									<li><a href = "${pageContext.request.contextPath }/roomConfiguration/insert.do">- 객실 구성 추가</a></li>
									<li><a href = "${pageContext.request.contextPath }/roomConfiguration/list.do">- 객실 구성 LIST</a></li>
								</ul>
							</li>
							<li>
								<a href = "${pageContext.request.contextPath }/roomSeason/list.do">시즌 정보</a>
								<ul class = "am_sm_submenu">
									<li><a href = "${pageContext.request.contextPath }/roomSeason/insert.do">- 시즌 정보 추가</a></li>
									<li><a href = "${pageContext.request.contextPath }/roomSeason/list.do">- 시즌 정보 LIST</a></li>
								</ul>
							</li>
							<li>
								<a href = "${pageContext.request.contextPath }/roomEquipment/list.do">비품 구성 정보</a>
								<ul class = "am_sm_submenu">
									<li><a href = "${pageContext.request.contextPath }/roomEquipment/insert.do">- 비품 구성 추가</a></li>
									<li><a href = "${pageContext.request.contextPath }/roomEquipment/list.do">- 비품 구성 LIST</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<span>회원 관리</span>
						<ul id = "member" class = "am_subMenu">
							<li><a href = "${pageContext.request.contextPath}/member/adminList.do">관리자 리스트</a></li>
							<li><a href = "${pageContext.request.contextPath}/member/list.do">전체 회원 리스트</a></li>
							<li><a href = "${pageContext.request.contextPath}/member/listWithout.do">회원 리스트(탈퇴제외)</a></li>
							<li><a href = "${pageContext.request.contextPath}/member/listWithdraw.do">탈퇴 회원 리스트</a></li>
						</ul>
					</li>
					<li>
						<span>고객 센터 관리</span>
						<ul id = "CustomerCare" class = "am_subMenu">
							<li>
								<a href = "">Q&#38;A</a>
								<ul class = "am_sm_submenu">
									<li><a href = "">- 질문 관리</a></li>
									<li><a href = "${pageContext.request.contextPath }/admin/qTypeChart.do">- 유형별 질문 빈도</a></li>
								</ul>
							</li>
							<li>
								<a href = "">공지 사항</a>
								<ul class = "am_sm_submenu">
									<li><a href = "${pageContext.request.contextPath}/notice/list.do?key=admin">- 공지 사항 관리</a></li>
								</ul>	
							</li>
						</ul>
					</li>
				</ul>
			</nav><!-- 메인 메뉴의 nav -->
			<ul id="am_join">
				<c:if test="${Auth == null}">
					<li><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></li> 
					<li><a href="${pageContext.request.contextPath}/member/add.do">회원가입</a></li>
				</c:if>
				<c:if test="${Auth != null}">
					<li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li> 
					<li><a href="${pageContext.request.contextPath}/member/information.do">내 정보보기</a></li>
				</c:if>
			</ul><!-- bottom_right -->
		</div><!-- 메인 로고  -->
		
	</header><!-- header -->