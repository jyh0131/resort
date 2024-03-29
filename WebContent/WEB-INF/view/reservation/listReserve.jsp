<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	#rsv_wrapper {
		width:1200px;
		height:800px;
		margin:0 auto;
		position:relative;
	}
	#rsv_wrapper #no_reserve{
		margin-top:50px;
		text-align:center;
		font-size:14px;
	}
	#rsv_wrapper #rsv_title{
		margin:100px 0 50px 240px;
		font-weight: bold;
		font-size:20px;
	}
	#rsv_wrapper #rsv_img{
		width:75px;
		height:75px;
		position: absolute;
		top:-23px;
		left:160px;
	}
	#rsv_wrapper #scroll_box{
		width:100%;
		height:600px;
		overflow:auto;
	}
	#rsv_wrapper table {
		border-collapse:collapse;
		margin:0 auto;
		width:881px;
	}
	#rsv_wrapper tr:first-child th {
		border-top:3px solid #918EDB;
		background:#EAEAEA;
		font-weight:normal;
	}
	#rsv_wrapper td, #rsv_wrapper th {
		font-size:14px;
		padding:7px;
		text-align:center;		
		border-bottom:1px solid gray;
	}
	#rsv_wrapper #btnbox {
		text-align:center;
	}
	#rsv_wrapper a{
		background:#EAEAEA;
		border:1px solid gray;
		font-size:13px;
		padding:4px;
		color:black;
		text-decoration: none;
	}
	#findbox {
		margin-top:10px;
		text-align: center;
	}
	#find_date_box{
		display:none;
	}
	input[type='submit'] {
		border:1px solid gray;
		background:white;
		color:black;
	}
	input[type='submit']:hover {
		border:1px solid gray;
		background:#EAEAEA;
		cursor:pointer;
	}
</style>
	<div id="rsv_wrapper">
		<p id="rsv_title">예약 조회</p>
		<img id="rsv_img" src="${pageContext.request.contextPath}/images/rsv_find_img.jpg">
		<div id="scroll_box">
		<table>
			<tr>
				<th>예약번호</th>
				<th>결제일</th>
				<th>예약일</th>
				<th>예약자</th>
				<th>이용객실</th>
				<th>예약인원</th>				
				<th>취소여부</th>
				<th></th>
			</tr>
			<c:if test="${list.size() != 0 && (list[0] != null)}">
			<c:forEach var="rsv" items="${list}">
				<tr>
					<td>${rsv.rsvNo}</td>
					<fmt:formatDate var="paymentDate" value="${rsv.rsvPaymentDate}" pattern="yyyy-MM-dd"/>
					<td>${paymentDate}</td>
					<fmt:formatDate var="startDate" value="${rsv.rsvStartDate}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="endDate" value="${rsv.rsvEndDate}" pattern="yyyy-MM-dd"/>
					<td>${startDate} ~ ${endDate}</td>					
					<td>${rsv.rsvName}</td>
					<td>${rsv.room.roomName.roomType.rtName} ${rsv.room.roomName.rnName} ${rsv.room.rRoom}호</td>
					<td>${rsv.rsvCount}명</td>
					<td>
						<c:if test="${rsv.rsvCancel == 0}">
							-
						</c:if>
						<c:if test="${rsv.rsvCancel == 1}">
							<span style="color:red">취소</span>
						</c:if>
					</td>	
					<td><a href="${pageContext.request.contextPath}/reservation/detail.do?rsv_no=${rsv.rsvNo}">보기</a></td>
				</tr>
			</c:forEach>
			</c:if>
		</table>		
		<c:if test="${list.size() == 0 || (list != null && list[0] == null)}">
			<div id="no_reserve">예약된 내용이 없습니다.</div>
		</c:if>
		</div>
		<div id="findbox">
			<form action="${pageContext.request.contextPath}/reservation/find.do">
				<select name="find">
					<option value="1">예약번호</option>	
					<option value="2">이름</option>
					<option value="4">예약날짜</option>
				</select>
				<input type="text" name="findtext">
				<div id="find_date_box">
					<!-- <input type="date" name="start_date"> ~ 
					<input type="date" name="end_date" readonly="readonly"> -->
				</div>
				<input type="submit" value="검색">
			</form>
		</div>
		<a href="${pageContext.request.contextPath}/reservation/list.do" style="margin-left:160px;">모든 예약 보기</a>
	</div>
<script>
	// 검색 버튼을 눌렀을 때
	$("form").submit(function() {
		var text = $("#findbox input[name='findtext']").val();
		var find = $("select[name='find']").val();
		
		if(text == "" && find != 4) {
			alert("검색할 단어를 입력해주세요.");
			return false;
		}		
		
		var select = $("select[name='find']").val();
		if(select == 1) {
			var textreg = /^[0-9]{0,5}$/;
			if(textreg.test(text) == false) {
				alert("예약번호는 숫자만 입력해주세요.");
				return false;
			}
		}
		
		var text2 = $("#findbox input[name='start_date']").val();
		if(text2 == "" && find == 4) {
			alert("검색할 날짜를 입력해주세요.");
			return false;
		}	
	});
	
	// select의 옵션이 날짜 검색으로 바뀌었을 때
	$("select[name='find']").change(function() {
		var value = $(this).val();
		if(value == 4) {
			var $date1 = $("<input type='date' name='start_date'>");
			var $span = $("<span>~</span>");
			var $date2 = $("<input type='date' name='end_date' readonly='readonly'>");
			$("#find_date_box").append($date1).append($span).append($date2);
			
			$("#find_date_box").css("display", "inline");
			$("input[name='findtext']").css("display", "none");		
		} else {
			$("#find_date_box").empty();
			$("#find_date_box").css("display", "none");
			$("input[name='findtext']").css("display", "inline");		
		}
	});
	
	// 날짜 검색 시 날짜를 선택했을 때
	$(document).on("change", "input[name='start_date']", function() {
		var sDate = $(this).val();
		var d = new Date(sDate);
		
		var y = d.getFullYear() + "";
		var M = d.getMonth()+1 + "";
		if(M.length == 1) {
			M = "0" + M
		}
		var day = d.getDate()+1 + "";
		if(day.length == 1) {
			day = "0" + day;
		}
		
		$("input[name='end_date']").val(y+"-"+M+"-"+day);
	});
	
	// 예약 조회 시 데이터가 없을 경우
	$(document).ready(function() {
		var no_reserve = $("#no_reserve").css("display");
		if(no_reserve == "block") {
			$("#rsv_wrapper #scroll_box").css("width", "100%")
										.css("height", "300px")
										.css("overflow", "auto");
		}
	});
</script>
<%@ include file="../include/footer.jsp" %>