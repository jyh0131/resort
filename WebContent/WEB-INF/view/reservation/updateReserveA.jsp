<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerA.jsp" %>
<style>
	#rsv_wrapper {
		width:430px;
		margin:0 auto;
	}
	#rsv_wrapper h1{
		margin:30px 0;
		font-size:1.5em;
		color:#977F51;
		text-align:center;
	}
	#rsv_wrapper table {
		width:430px;
		border-collapse: collapse;
		margin:0 auto;		
	}
	#rsv_wrapper td {
		padding:5px;
		font-size:14px;
		border-bottom:1px solid lightgray;
	}
	#rsv_wrapper tr:first-child td{
		border-top:2px solid #977F51;
	}
	#rsv_wrapper .length{
		width:60px;
	}
	#rsv_wrapper td.paydate{
		font-size:14px;
		font-style:italic;
		color:gray;
	}
	#rsv_wrapper #btnbox {
		text-align:center;
	}
	#rsv_wrapper #btnbox button, #rsv_wrapper #btnbox input{
		border:1px solid #977F51;
		background:white;
		margin:10px 10px 10px 0;
		font-size:14px;
		padding:4px;
		color:black;
		cursor: pointer;
	}
</style>
	<div id="rsv_wrapper">
		<h1>예약 수정</h1>
		<form action="${pageContext.request.contextPath}/reservation/update.do" method="post">
			<table>
				<tr>
				<fmt:formatDate var="paymentDate" value="${rsv.rsvPaymentDate}" pattern="yyyy-MM-dd"/>
					<td class="paydate">결제일 ${paymentDate}</td>
					<td></td>
				</tr>
				<tr>
					<td>예약번호</td>
					<td>
						${rsv.rsvNo}
						<input type="hidden" name="rsv_no" value="${rsv.rsvNo}">
					</td>
				</tr>
				<tr> 
					<td>예약 아이디</td>
					<td>${rsv.member.mId}</td>
				</tr>
				<tr> 
					<td>예약자</td>
					<td><input type="text" name="name" value="${rsv.rsvName}" class="length"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" value="${rsv.rsvPhone}"></td>
				</tr>
				<tr>
					<td>이용 객실</td>
					<td id="updateroom">
						${rsv.room.roomName.roomType.rtName} ${rsv.room.roomName.rnName}
						${rsv.room.rRoom}호
					</td>
				</tr>
				<tr>
					<td>예약일</td>
					<fmt:formatDate var="startDate" value="${rsv.rsvStartDate}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="endDate" value="${rsv.rsvEndDate}" pattern="yyyy-MM-dd"/>
					<td>${startDate} ~ ${endDate}</td>
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
					<td><input type="text" name="price" value="${rsv.rsvPrice}" class="length">원</td>
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
				<input type="submit" value="수정완료" id="submit">
				<button id="returnbtn" data-return="${rsv.rsvNo}" type="button">돌아가기</button>
			</div>
		</form>
	</div>
	<script>
	$("#btnbox #submit").click(function() {
		if(confirm("정말 수정하시겠습니까?") == true) {
			// 예약자 성함이 비었을 경우		
			var name = $("input[name='name']").val();
			if(name == "") {
				alert("예약자 성함을 입력해주세요.");
				return false;
			}
			
			// 예약자 전화번호가 비었을 경우		
			var phone = $("input[name='phone']").val();
			if(phone == "") {
				alert("예약자 전화번호를 입력해주세요.");
				return false;
			}
			
			// 가격이 비었을 경우		
			var price = $("input[name='price']").val();
			if(price == "") {
				alert("가격을 입력해주세요.");
				return false;
			}
			alert("수정되었습니다.");
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
	});
	
</script>
<%@ include file="../include/footer.jsp" %>

