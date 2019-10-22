<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../include/header.jsp" %> --%>
<c:forEach var="rsv" items="${list}">
	<table>
		<tr>
			<td>${rsv.rsvPaymentDate}</td> <!-- 결제일 -->
		</tr>
		<tr>
			<td>예약번호</td>
			<td>${rsv.rsvNo}</td>
		</tr> 
		<tr>
			<td>예약자</td>
			<td>${rsv.member.mName}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${rsv.member.mPhone}</td>
		</tr>
		<tr>
			<td>이용 객실</td>
			<td>${rsv.room.roomName.roomType.rtName} ${rsv.room.roomName.rnName} ${rsv.room.rRoom}</td>
		</tr>
		<tr>
			<td>예약일</td>
			<td>${rsv.rsvStartDate} ~ ${rsv.rsvEndDate}</td>
		</tr>
		<tr>
			<td>예약인원</td>
			<td>${rsv.rsvCount}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${rsv.rsvPrice}</td>
		</tr>
		<tr>
			<td>취소여부</td>
			<td>${rsv.rsvCancel}</td>
		</tr>
	</table>
	<button data-update="${rsv.rsvNo }">예약 수정</button><button data-delete="${rsv.rsvNo }">예약 취소</button>
</c:forEach>
<%-- <%@ include file="../include/footer.jsp" %> --%>