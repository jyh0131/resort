<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<c:forEach var="" items="">
	<table>
		<tr>
			<td></td> <!-- 결제일 -->
		</tr>
		<tr>
			<td>예약번호</td>
			<td></td>
		</tr>
		<tr>
			<td>예약자</td>
			<td></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td></td>
		</tr>
		<tr>
			<td>이용 객실</td>
			<td></td>
		</tr>
		<tr>
			<td>예약인원</td>
			<td></td>
		</tr>
		<tr>
			<td>가격</td>
			<td></td>
		</tr>
		<tr>
			<td>예약일</td>
			<td></td>
		</tr>
		<tr>
			<td>취소여부</td>
			<td></td>
		</tr>
	</table>
	<button>예약 수정</button><button>예약 취소</button>
</c:forEach>
<%@ include file="../include/footer.jsp" %>