<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/view/include/headerA.jsp"%>
<style>
a.chart {
	margin-left: 530px;
	padding: 10px;
	border: 1px solid #ccc;
	text-decoration: none;
	color: #000;
}

#homeA_wrapper {
	width:900px;
	height: 500px;
	margin:20px auto;
}

#homeA_wrapper .title{
	font-size:18px;
	color:#977F51;
	margin-bottom:10px;
}

#homeA_wrapper a{
	font-size:14px;
	text-decoration: none;
	color:gray;
	display:inline-block;
}

#homeA_wrapper img {
	width: 130px;
	height: 130px;
}

#homeA_wrapper ul{
	height: 500px;
	list-style:none;
}

#homeA_wrapper li{
	text-align:left;
	margin-left:20px;
}

#homeA_wrapper li a:hover{
	text-decoration: underline;
}

#homeA_wrapper .content_box {
	width:150px;
	margin:10px;
	float: left;
	text-align:center;
}

#homeA_wrapper #home li{
	text-align:center;
	margin:0px;
}
</style>
<div id="homeA_wrapper">
	<div id="home" class="content_box">
		<img src="${pageContext.request.contextPath}/images/homepage_icon.jpg">
		<p class="title">홈</p>
		<ul>
			<li><a href="${pageContext.request.contextPath}/home.do">회원용 홈</a><!-- do?home=user --></li>
			<li><a href="${pageContext.request.contextPath}/home.do">관리자용 홈</a></li>
		</ul>
	</div>

	<div id="reserve" class="content_box">
		<img src="${pageContext.request.contextPath}/images/list_icon.jpg">
		<p class="title">예약 관리</p>
		<ul>
			<li><a href="${pageContext.request.contextPath }/reservation/list.do">전체 예약 정보 확인</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/salesChart.do">월별 매출액</a></li>
		</ul>
	</div>

	<div id="room" class="content_box">
		<img src="${pageContext.request.contextPath}/images/room_icon.jpg">
		<p class="title">객실 관리</p>
		<ul>
			<li><a href="${pageContext.request.contextPath}/roomType/insert.do">객실 타입 추가</a></li>
			<li><a href="${pageContext.request.contextPath}/roomType/list.do">객실 타입 리스트</a></li>

			<li><a href="${pageContext.request.contextPath}/roomName/insert.do">객실 정보 추가</a></li>
			<li><a href="${pageContext.request.contextPath}/roomName/list.do">객실 정보 리스트</a></li>

			<li><a href="${pageContext.request.contextPath}/roomImg/insert.do">객실 이미지 추가</a></li>
			<li><a href="${pageContext.request.contextPath}/roomImg/list.do">객실 이미지 리스트</a></li>
					
			<li><a href="${pageContext.request.contextPath}/room/insert.do">객실 방 정보 추가</a></li>
			<li><a href="${pageContext.request.contextPath}/room/list.do">객실 방 정보 리스트</a></li>
					
			<li><a href="${pageContext.request.contextPath}/roomConfiguration/insert.do">객실 구성 추가</a></li>
			<li><a href="${pageContext.request.contextPath}/roomConfiguration/list.do">객실 구성 리스트</a></li>
					
			<li><a href="${pageContext.request.contextPath}/roomSeason/insert.do">시즌 정보 추가</a></li>
			<li><a href="${pageContext.request.contextPath}/roomSeason/list.do">시즌 정보 리스트</a></li>
					
			<li><a href="${pageContext.request.contextPath}/roomEquipment/insert.do">비품 구성 추가</a></li>
			<li><a href="${pageContext.request.contextPath}/roomEquipment/list.do">비품 구성 리스트</a></li>
		</ul>
	</div>

	<div id="member" class="content_box">
		<img src="${pageContext.request.contextPath}/images/member_icon.jpg">
		<p class="title">회원 관리</p>
		<ul>
			<li><a href="${pageContext.request.contextPath}/member/adminList.do">관리자 리스트</a></li>
			<li><a href="${pageContext.request.contextPath}/member/list.do">전체 회원 리스트</a></li>
			<li><a href="${pageContext.request.contextPath}/member/listWithout.do">회원 리스트<br>(탈퇴회원 제외)</a></li>
			<li><a href="${pageContext.request.contextPath}/member/listWithdraw.do">탈퇴 회원 리스트</a></li>
		</ul>
	</div>

	<div id="customer" class="content_box">
		<img src="${pageContext.request.contextPath}/images/customer_icon.jpg">
		<p class="title">고객 센터 관리</p>
		<ul>
			<li><a href="">질문 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/qTypeChart.do">유형별 질문 빈도</a></li>
			<li><a href="${pageContext.request.contextPath}/notice/list.do?key=admin">공지사항 관리</a></li>

		</ul>
	</div>
</div>
<%@ include file="WEB-INF/view/include/footer.jsp"%>
