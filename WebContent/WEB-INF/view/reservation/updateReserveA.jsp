<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	#rsv_wrapper {
		width:500px;
		margin:0 auto;
	}
	#rsv_wrapper table {
		background:#FAECC5;
		border:1px solid black;
		margin:0 auto;
	}
	#rsv_wrapper td {
		padding:5px;
	}
	#rsv_wrapper td.paydate{
		font-size:14px;
		color:gray;
		text-align: right;
	}
	#rsv_wrapper #btnbox {
		text-align:center;
	}
	#rsv_wrapper #btnbox button, #rsv_wrapper #btn_box input{
		border:1px solid black;
		background:#BABABA;
		margin:10px 10px 10px 0;
		font-size:16px;
		padding:3px;
		color:white;
		cursor:pointer;
	}
</style>
	<div id="rsv_wrapper">
		<table>
			<tr>
			<fmt:formatDate var="paymentDate" value="${rsv.rsvPaymentDate}" pattern="yyyy-MM-dd"/>
				<td class="paydate">결제일 ${paymentDate}</td> <!-- 결제일 -->
			</tr>
			<tr>
				<td>예약번호</td>
				<td>${rsv.rsvNo}</td>
			</tr>
			<tr> 
				<td>예약 아이디</td>
				<td><input type="text" name="id" value="${rsv.member.mId}"></td>
			</tr>
			<tr> 
				<td>예약자</td>
				<td><input type="text" name="name" value="${rsv.member.mName}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value="${rsv.member.mPhone}"></td>
			</tr>
			<tr>
				<td>이용 객실</td>
				<td>
					<select name="rtNo">
						<option value="1">리조트</option>
						<option value="2">호텔</option>
					</select>
					<input type="text" name="rnName" value="${rsv.room.roomName.rnName}">
					<input type="text" name="rRoom" value="${rsv.room.rRoom}">호
				</td>
			</tr>
			<tr>
				<td>예약일</td>
				<td><input type="date" name="start_date" value="${rsv.rsvStartDate}"> ~
				<input type="date" name="end_date" value="${rsv.rsvEndDate}"></td>
			</tr>
			<tr>
				<td>예약인원</td>
				<td>
					<select name="count">
						<c:forEach begin="1" end="5" var="num">
							<option value="${num}">${num}</option>
						</c:forEach>
					</select>명
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="${rsv.rsvPrice}">원</td>
			</tr>
			<tr>
				<td>취소여부</td>
				<td>
					<select name="cancel">
						<option value="0">No</option>
						<option value="1">Yes</option>
					</select>
				</td>
			</tr>
		</table>
		<div id="btnbox">
			<input type="submit" value="수정완료">
			<button id="returnbtn" data-return="${rsv.rsvNo}">돌아가기</button>
		</div>
	</div>
	<script>
	$("#btnbox input").submit(function() {
		if(confirm("정말 수정하시겠습니까?") == true) {
			// 수정 조건
			
		} else {
			return false;
		}
	});
	
	$("#btnbox button").click(function() {
		if(confirm("정말 돌아가시겠습니까?") == true) {
			var no = $(this).attr("data-return");
			location.href = "${pageContext.request.contextPath}/reservation/detailA.do?rsv_no="+no;
		} else {
			return false;
		}		
	})	
</script>
<%@ include file="../include/footer.jsp" %>

