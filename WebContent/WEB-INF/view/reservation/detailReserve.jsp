<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
#rsv_wrapper {
	width: 1024px;
	margin: 0 auto;
}

#rsv_wrapper #rsv_title{
	margin:10px 65px;
	font-weight: bold;
	font-size:20px;
}

#rsv_wrapper table {
	border-collapse: collapse;
	padding-left:10px;
}

#rsv_wrapper table td {
	font-size:14px;
	padding: 10px;
}

#rsv_room_info table, #rsv_member_info table {
	width: 900px;
	margin: 0 auto;
}

#rsv_room_info table td:first-child{
	background:#EAEAEA;
	border-top:1px solid gray;
	border-bottom:1px solid gray;
	width:150px;
}
#rsv_room_info table td:last-child {
	border-top:1px solid gray;
	border-bottom:1px solid gray;
}

#rsv_room_info tr:first-child td{
	border-top:3px solid #918EDB;
}

#rsv_member_info {
	margin-top:40px;
	margin-right:65px;
	height:200px;
}

#rsv_member_info table {
	margin-left:62px;
}

#rsv_member_info table td:first-child{
	background:#EAEAEA;
	border-top:1px solid gray;
	border-bottom:1px solid gray;
	width:150px;
}
#rsv_member_info table td:last-child {
	border-top:1px solid gray;
	border-bottom:1px solid gray;
}

#rsv_member_info tr:first-child td{
	border-top:3px solid #918EDB;
}

#rsv_wrapper #btnbox {
	text-align: center;
}

#rsv_wrapper button {
	border: 1px solid gray;
	background: #EAEAEA;
	margin: 10px 10px 10px 0;
	font-size: 14px;
	padding: 3px;
	color: black;
	cursor: pointer;
}
</style>
	<div id="rsv_wrapper">
		<div id="rsv_room_info">
			<p id="rsv_title">예약 조회</p>
				<table>
					<tr>
						<td>결제일</td>
						<fmt:formatDate var="paymentDate" value="${rsv.rsvPaymentDate}" pattern="yyyy-MM-dd" />
						<td>${paymentDate}</td>
					</tr>
					<tr>
						<td>예약번호</td>
						<td>${rsv.rsvNo}</td>
					</tr>
					<tr>
						<td>이용 객실</td>
						<td>${rsv.room.roomName.roomType.rtName}
							${rsv.room.roomName.rnName} ${rsv.room.rRoom}호</td>
					</tr>
					<tr>
						<td>예약날짜</td><fmt:formatDate var="startDate" value="${rsv.rsvStartDate}"	pattern="yyyy-MM-dd" />
						<fmt:formatDate var="endDate" value="${rsv.rsvEndDate}" pattern="yyyy-MM-dd" />
						<td>${startDate}~ ${endDate}</td>
					</tr>
					<tr>
						<td>인원</td>
						<td>${rsv.rsvCount}명</td>
					</tr>
					<tr>
						<td>취소 여부</td>
						<td>
							<c:if test="${rsv.rsvCancel == 0}">
								No
							</c:if> <c:if test="${rsv.rsvCancel == 1}">
								Yes
							</c:if>
						</td>
					</tr>
				</table>
			</div>
			
			<div id="rsv_member_info">
				<p id="rsv_title">예약자 정보</p>
				<table>
					<tr>
						<td>예약자 이름</td><td>${rsv.rsvName}</td>
					</tr>
					<tr>
						<td>전화번호</td><td>${rsv.rsvPhone}</td>
					</tr>
					<tr>
						<td>가격</td>
						<fmt:formatNumber var="price" value="${rsv.rsvPrice}" pattern="#,###" />
						<td>${price}원</td>
					</tr>
				</table>
			</div>
			
			<div id="btnbox">
				<c:if test="${rsv.rsvCancel == 0}">
					<button id="deletebtn" data-delete="${rsv.rsvNo}">예약 취소</button>
				</c:if>
				<c:if test="${rsv.rsvCancel == 1}">
					<button id="updatebtn" disabled="disabled"
						style="color: red; background: white; border: none;">취소된
						예약은 수정이 불가능합니다.</button>
				</c:if>
				<button id="listbtn">목록 보기</button>
			</div>
		</div>
<script>
	$("#btnbox #listbtn").click(function() {
		location.href = "${pageContext.request.contextPath}/reservation/list.do";
	});
	
	$("#btnbox #deletebtn").click(function() {
		if (confirm("정말 취소하시겠습니까?") == true) {
			var no = $(this).attr("data-delete");
			location.href = "${pageContext.request.contextPath}/reservation/cancel.do?no="+no;
		} else {
			return false;
		}
	});
</script>
<%@ include file="../include/footer.jsp"%>