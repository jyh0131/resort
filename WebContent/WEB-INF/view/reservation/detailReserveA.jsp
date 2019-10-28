<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	#rsv_wrapper {
		width:400px;
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
	#rsv_wrapper button{
		border:1px solid black;
		background:#BABABA;
		margin:10px 10px 10px 0;
		font-size:16px;
		padding:3px;
		color:white;
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
				<td>${rsv.member.mId}</td>
			</tr>
			<tr> 
				<td>예약자</td>
				<td>${rsv.rsvName}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${rsv.rsvPhone}</td>
			</tr>
			<tr>
				<td>이용 객실</td>
				<td>${rsv.room.roomName.roomType.rtName} ${rsv.room.roomName.rnName} ${rsv.room.rRoom}호</td>
			</tr>
			<tr>
				<td>예약일</td>
				<fmt:formatDate var="startDate" value="${rsv.rsvStartDate}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="endDate" value="${rsv.rsvEndDate}" pattern="yyyy-MM-dd"/>
				<td>${startDate} ~ ${endDate}</td>
			</tr>
			<tr>
				<td>예약인원</td>
				<td>${rsv.rsvCount}명</td>
			</tr>
			<tr>
				<td>가격</td>
				<fmt:formatNumber var="price" value="${rsv.rsvPrice}" pattern="#,###"/>
				<td>${price}원</td>
			</tr>
			<tr>
				<td>취소여부</td>
				<td>
					<c:if test="${rsv.rsvCancel == 0}">
						No
					</c:if>
					<c:if test="${rsv.rsvCancel == 1}">
						Yes
					</c:if>
				</td>
			</tr>
		</table>
		<div id="btnbox">
			<c:if test="${rsv.rsvCancel == 0}">
				<button id="updatebtn" data-update="${rsv.rsvNo}">예약 수정</button>
				<button id="deletebtn" data-delete="${rsv.rsvNo}">예약 취소</button>
				<button id="listbtn">목록 보기</button>
			</c:if>
			<c:if test="${rsv.rsvCancel == 1}">
				<button id="updatebtn" data-update="${rsv.rsvNo}">예약 수정</button>
				<button id="updatebtn" disabled="disabled" style="color:red; background:white; border:none;">취소된 예약입니다.</button>
				<button id="listbtn">목록 보기</button>
			</c:if>
		</div>
	</div>
	<script>
	$("#btnbox #listbtn").click(function() {
		location.href = "${pageContext.request.contextPath}/reservation/listA.do";
	});
	
	$("#btnbox #updatebtn").click(function() {
		var no = $(this).attr("data-update");
		location.href = "${pageContext.request.contextPath}/reservation/update.do?no="+no;
	});
	
	$("#btnbox #deletebtn").click(function() {
		if(confirm("정말 취소하시겠습니까?") == true) {
			var no = $(this).attr("data-delete");
			location.href = "${pageContext.request.contextPath}/reservation/cancel.do?no="+no;
		} else {
			return false;
		}
	});	
</script>
<%@ include file="../include/footer.jsp" %>

