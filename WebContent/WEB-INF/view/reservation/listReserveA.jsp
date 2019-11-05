<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	#rsv_wrapper {
		width:1200px;
		margin:0 auto;
	}
	#rsv_wrapper table {
		border-collapse:collapse;
		background:#FAECC5;
		margin:0 auto;
	}
	#rsv_wrapper td, th {
		padding:7px;
		text-align:center;		
		border:1px solid black;
	}
	#rsv_wrapper td.paydate{
		font-size:14px;
		color:gray;
		text-align: right;
	}
	#rsv_wrapper #btnbox {
		text-align:center;
	}
	#rsv_wrapper a{
		border:1px solid black;
		background:#BABABA;
		font-size:16px;
		padding:3px;
		color:white;
		text-decoration: none;
	}
	#findbox {
		margin-top:10px;
		text-align: center;
	}
</style>
	<div id="rsv_wrapper">
		<table>
			<tr>
				<th>예약번호</th>
				<th>결제일</th>
				<th>예약 아이디</th>
				<th>예약자</th>
				<th>이용객실</th>
				<th>예약인원</th>
				<th>예약일</th>
				<th>취소여부</th>
				<th></th>
			</tr> 
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.rsvNo}</td>
					<fmt:formatDate var="paymentDate" value="${list.rsvPaymentDate}" pattern="yyyy-MM-dd"/>
					<td>${paymentDate}</td>
					<td>${list.member.mId}</td>
					<td>${list.rsvName}</td>
					<td>${list.room.roomName.roomType.rtName} ${list.room.roomName.rnName} ${list.room.rRoom}호</td>
					<td>${list.rsvCount}명</td>
					<fmt:formatDate var="startDate" value="${list.rsvStartDate}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="endDate" value="${list.rsvEndDate}" pattern="yyyy-MM-dd"/>
					<td>${startDate} ~ ${endDate}</td>
					<td>
						<c:if test="${list.rsvCancel == 0}">
							No
						</c:if>
						<c:if test="${list.rsvCancel == 1}">
							Yes
						</c:if>
					</td>	
					<td><a href="${pageContext.request.contextPath}/reservation/detailA.do?rsv_no=${list.rsvNo}">보기</a></td>
				</tr>
			</c:forEach>
		</table>
		<div id="findbox">
			<form action="${pageContext.request.contextPath}/reservation/findA.do">
				<select name="find">
					<option value="1">예약번호</option>	
					<option value="2">예약자</option>
					<option value="3">예약 아이디</option>
				</select>
				<input type="text" name="findtext">
				<input type="submit" value="검색">
			</form>
		</div>
		<a href="${pageContext.request.contextPath}/reservation/list.do" style="margin-left:50px;">모든 예약 보기</a>
	</div>
<script>
	$("form").submit(function() {
		var text = $("#findbox input[name='findtext']").val();
		if(text == "") {
			alert("검색할 단어를 입력해주세요.");
			return false;
		}		
		
		var select = $("select[name='find']").val();
		if(select == 1) {
			var textreg = /^[0-9]$/;
			if(textreg.test(text) == false) {
				alert("예약번호는 숫자만 입력해주세요.");
				return false;
			}
		}
	});
</script>
<%@ include file="../include/footer.jsp" %>