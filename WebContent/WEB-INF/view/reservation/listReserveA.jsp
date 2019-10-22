<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<table>
		<tr>
			<th>예약번호</th>
			<th>결제일</th>
			<th>예약자</th>
			<th>이용객실</th>
			<th>예약인원</th>
			<th>예약일</th>
			<th>취소여부</th>
		</tr> 
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.rsvNo}</td>
				<fmt:formatDate var="paymentDate" value="${list.rsvPaymentDate}" pattern="yyyy-MM-dd"/>
				<td>${paymentDate}</td>
				<td>${list.member.mName}</td>
				<td>${list.room.roomName.roomType.rtName} ${list.room.roomName.rnName} ${list.room.rRoom}</td>
				<td>${list.rsvCount}</td>
				<fmt:formatDate var="startDate" value="${list.rsvStartDate}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="endDate" value="${list.rsvEndDate}" pattern="yyyy-MM-dd"/>
				<td>${startDate} ~ ${endDate}</td>
				<td>${list.rsvCancel}</td>
				<td><a href="${pageContext.request.contextPath}/reservation/detailA.do">보기</a></td>
			</tr>
		</c:forEach>
	</table>
<%@ include file="../include/footer.jsp" %>