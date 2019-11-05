<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
#rsv_wrapper {
	width:1024px;
	height:500px;
	margin:0 auto;
}
#calendar {
	width:250px;
	margin:0 auto;
	position:relative;
	float:left;
	margin-top:50px;
}
#calendar #day_title{
	position: absolute;
	top:-50px;
	left:50px;
	text-align:center;
}
#calendar table {
	margin-left:15px;
	border-collapse: collapse;
}

#calendar th, #calendar td {
	padding: 5px;
	border: 1px solid black;
	text-align:center;
}

#calendar table th:first-child, #calendar table td:first-child {
	color: #FF1291;
}

#calendar table th:last-child, #calendar table td:last-child {
	color: #6B66FF;
}

#calendar table td.pastdate{
	color:lightgray;
}

#calendar table td.afterdate:hover{
	cursor:pointer;
	background:lightgray;
	color:white;
}

#calendar #title {
	display: inline;
}

#calendar img {
	width: 20px;
	height: 20px;
}
#calendar .clicked {
	background:lightgray;
}
#calendar #datebox {
	margin:10px;
}
#datebox input {
	width:125px;
}
#datebox input[name="start_date"]{
	margin-left:14px;
}
#roombox {
	width:300px;
	height:500px;
	float:left;
}
#roombox #selectroombox {
	width:300px;
	height:500px;
	overflow:auto;
}
#roombox .roomlist {
	border:1px solid black;
	background:#FAECC5;
	margin-bottom:5px;
	padding:5px;
}
#roombox .roomlist button {
	margin-left:5px;
}
#roombox .roomprice, #roombox .rt_no, #roombox .rn_no{
	display:none;
}
#info {
	margin-left:30px;
	width:300px;
	float:left;
	padding:5px;
}
#info table {
	width:400px;
	border:1px solid black;
}
#info table td:first-child{
	width:50px;
}
#info table td:last-child{
	width:200px;
}
#info table th, #info table td{
	padding:5px;
}
#info table tr:last-child td {
	text-align:center;
}
#info span {
	margin-left:5px;
}
#info input[type='submit'] {
	display:none;
}
footer {
	clear:both;
}
</style>
<div id="rsv_wrapper">
	<form id="rsv_form" action="${pageContext.request.contextPath}/reservation/insert.do" method="post">
	<div id="calendar">
		<div id="day_title">
			<p style="font-weight:bold">날짜선택</p>
			
			<img src="${pageContext.request.contextPath}/images/cal_left.png" id="preMonth">
			<p id="title"></p>
			<img src="${pageContext.request.contextPath}/images/cal_right.png" id="nextMonth">
		</div>
		<table>
			<tr id="week">
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
		</table>
		<div id="datebox">
			Check in <input type="date" name="start_date" value="" readonly="readonly"><br>
			Check Out <input type="date" name="end_date" readonly="readonly">
		</div>
	</div>
	<div id="roombox">
		<p style="font-weight:bold; text-align:center; margin-bottom:5px">객실 선택</p>
		
		<div id="selectroombox"></div>
	</div>
	<div id="info">
		<p style="font-weight:bold; text-align:center; margin-bottom:5px; width:400px;">예약 정보</p>
		<table>
			<tr>	
				<td>예약자명</td>
				<td><input type="text" name="name" value="${member.mName}" style="width:50px;"></td>
			</tr>
			<tr>	
				<td>전화번호</td>
				<td><input type="text" name="phone" value="${member.mPhone}" style="width:100px;"></td>
			</tr>
			<tr>	
				<td>이용객실</td>
				<td><span id="room"></span></td>
			</tr>
			<tr>	
				<td>이용인원</td>
				<td>
					<select name="count">
					<c:forEach begin="1" end="5" var="num">
						<option>${num}</option>
					</c:forEach>
					</select>명
				</td>
			</tr>
			<tr>	
				<td>이용일정</td>
				<td><span id="useDate"></span></td>
			</tr>
			<tr>	
				<td>객실요금</td>
				<td><p id="price"></p>
					<input type="hidden" name="rt_no" value="">
					<input type="hidden" name="rn_no" value="">
					<input type="hidden" name="price" value="">
				</td>
			</tr>
			<tr>	
				<td colspan="2"><input type="submit" value="예약하기"></td>
			</tr>
		</table>
		</div> 
	</form>
</div>
<script>
	$(function() {
		// t = 오늘날짜, y = 현재 년도 , m = 현재 달
		var t = new Date();
		var y = t.getFullYear();
		var m = t.getMonth();
				
		makeCal();
	
	// 달력 생성 함수
	function makeCal() {
		// 달력의 년월 제목 생성
		$("#calendar #title").text(y+"년"+(m+1)+"월");
		$(".new_cal").remove(); // 새로 만들어진 달력의 일들 삭제
		
		//해당 월의 1일 날짜로 변경해서 빈칸 개수를 구해야함.
		var t2 = new Date(y, m, 1); // 매달 1일로 설정
		var day = t2.getDay(); // 빈칸 개수
		
		var lastArr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; // 달의 마지막 날
		
		//윤달 : 4년 주기인데 100년 주기는 제외, 400년 주기는 맞음
		if(y%4==0 && y%100!=0 || y%400==0){
			lastArr[1] = 29;
		}
		var lastDay = lastArr[m]; // 이번달 마지막 날짜
		
		var row = Math.ceil((day + lastDay) / 7); // (빈칸 갯수 + 마지막 날짜) / 7
			
		var num = 1; // 달력에 찍을 일
		var cnt = 1; // 달력의 두번째 행 부터 찍기 위해
		
		// 오늘 날짜 생성
		var today = new Date();
		
		// 오늘 날짜와 달력의 날짜를 비교하기 위해,
		// 오늘 연, 월, 일을 하나의 숫자로 합치기 
		var today_year = today.getFullYear() + "";
		var today_month = today.getMonth() + "";
		if(today_month.length == 1) {
			today_month = "0" + today_month;
		}

		var today_date = today.getDate() + "";
		if(today_date.length == 1) {
			today_date = "0" + today_date;
		}
		var now = today_year + today_month + today_date;
		now = Number(now);
		
		// 달력의 날짜 연, 월, 일을 하나의 숫자로 합치기
		var cal_now = "";
		var m_two = m + "";
		if(m_two.length == 1) {
			m_two = "0" + m;
		}
		
		for(var i=1; i<=row; i++) { // 행
			$("#calendar table").append("<tr class='new_cal'>");
			for(var j=1; j<=7; j++) { // 열
				if(i==1 && j<=day || num > lastDay) {
					$("#calendar table tr").eq(cnt).append("<td></td>");
				} else {
					// 달력에 찍을 일, num의 값을 가져와서 달력의 날짜 cal_now에 숫자로 합하기
					var d_two = num + "";
					if(d_two.length == 1) {
						d_two = "0" + num; 
					}
					cal_now = y + "" + m_two + "" + d_two + "";
					cal_now = Number(cal_now);
					
					// 오늘 날짜와 달력의 날짜를 비교하여 오늘보다 전의 날짜는 선택 불가능하게 하기
					if(cal_now < now) {
						$("#calendar table tr").eq(cnt).append("<td class='pastdate'>"+num+"</td>");
					} else {
						$("#calendar table tr").eq(cnt).append("<td class='afterdate'>"+num+"</td>");					
					}
					num++;
				}
			}
			$("#calendar table").append("</tr>");
			cnt++; // 한 주를 다 채우고, 다음 주를 채우기 위해
		}		
	}
		// 이전 달로 이동
		$("#calendar #preMonth").click(function() {
			m--;
			if(m == -1) {
				y--;
				m = 11;
			}
			makeCal();		
		});

		// 다음 달로 이동
		$("#calendar #nextMonth").click(function() {
			m++;
			if(m == 12){
				y++;
				m = 0;
			}
			makeCal();
		});
		
		// 달력의 날짜 클릭 시
		$(document).on("click", "#calendar td.afterdate", function() {
			// 원래 있던 데이터 값 지우기
			$("#info #room").text("");
			$("#info #useDate").text("");
			$("#info #price").text("");
			$("#info input[name='rt_no']").text("");
			$("#info input[name='rn_no']").text("");
			$("#info input[name='value']").text("");
			// 예약 등록 버튼 숨기기
			$("#info input[type='submit']").css("display","none");
			
			var title = $("#day_title #title").text();
			var year = title.substring(0,4);
			var index = title.indexOf("월");
			var month = title.substring(5,index);
			var day = $(this).text();
			if(day == "") {
				return false;
			}
			
			$("#calendar td").removeClass("clicked");
			$(this).addClass("clicked");
			
			var sd = new Date(year, month-1, day);
			var ed = new Date(year, month-1, sd.getDate()+1);
			
			var y = sd.getFullYear();
			var m = sd.getMonth()+1+"";
			if(m.length == 1) {
				m = "0" + m;
			}
			
			var d = sd.getDate()+"";
			if(d.length == 1) {
				d = "0" + d;
			}
			$("input[name='start_date']").val(y+"-"+m+"-"+d);
			
			var y1 = ed.getFullYear();
			var m1 = ed.getMonth()+1+"";
			if(m1.length == 1) {
				m1 = "0" + m1;
			}
			var d1 = ed.getDate()+"";
			if(d1.length == 1) {
				d1 = "0" + d1;
			}
			$("input[name='end_date']").val(y1+"-"+m1+"-"+d1);
			
			$("#useDate").text(y+"-"+m+"-"+d+" ~ "+y1+"-"+m1+"-"+d1);
			
			$("#roombox #selectroombox").empty();
			// var $room_title = $("<p>").css("font-weight","bold").css("text-align","center").css("margin-bottom","5px").text("객실 선택");
			// $("#roombox #selectroombox").append($room_title);
			
			// 객실 유무 확인
			$.ajax({
				url:"${pageContext.request.contextPath}/reservation/load.do",
				type:"get",
				data:{"start_date":$("input[name='start_date']").val(), "end_date":$("input[name='end_date']").val()},
				dataType:"json",
				success:function(res) {
					console.log(res);
					
					$.each(res, function(i, obj) {		
						var room_type = obj.room.roomName.roomType.rtName;
						var room_name = obj.room.roomName.rnName;
						
						if(obj.cnt > 0){
							var $button = $("<button>").text("선택").addClass("choose").attr("type", "button");
							var $p = $("<p>").text("예약 가능").css("color","blue").append($button);
						} else if(obj.cnt == 0){
							
							var $button = $("<button>").text("선택불가").addClass("choose").attr("disabled", "disabled").attr("type", "button");
							var $p = $("<p>").text("예약 불가능").css("color","red").append($button);
						}
						var $rt_no = $("<p>").text(obj.room.roomName.roomType.rtNo).addClass("rt_no");
						var $rn_no = $("<p>").text(obj.room.roomName.rnNo).addClass("rn_no");
						var $price = $("<p>").text(obj.room.roomName.rnPrice).addClass("roomprice");
						var $span = $("<span>").text(room_type + " " + room_name);
						var $room = $("<div>").append($span).append($p).append($price).append($rt_no).append($rn_no).addClass("roomlist");				
						$("#roombox #selectroombox").append($room);
	
					});
				}
			});
		});
		
		// 객실 선택 시
		$(document).on("click", "button.choose", function() {
			var room = $(this).parent().parent().find("span").text();
			$("#info #room").text(room);
			
			var price = $(this).parent().parent().find(".roomprice").text();
			$("#info input[name='price']").val(price);
			price = Number(price);
			price = price.toLocaleString();
			$("#info #price").text(price+"원");			
			
			var rt_no = $(this).parent().parent().find(".rt_no").text();
			$("#info input[name='rt_no']").val(rt_no);
			
			var rn_no = $(this).parent().parent().find(".rn_no").text();
			$("#info input[name='rn_no']").val(rn_no);
			
			$("#info input[type='submit']").css("display", "inline");
		});
		
		// 예약 시
		$("form#rsv_form").submit(function () {
			if(confirm("예약하시겠습니까?") == true) {
				// 예약자 성함이 빈칸일 경우
				var name = $("#info input[name='name']").val();
				if(name == "") {
					alert("예약자 성함을 입력해주세요.");
					return false;
				}
				
				// 예약자 전화번호가 빈칸일 경우
				var phone = $("#info input[name='phone']").val();
				if(phone == "") {
					alert("예약자 전화번호를 입력해주세요.");
					return false;
				}
				
				// 방 선택을 하지 않은 경우
				var price = $("#info #price").text();
				if(price == "") {
					alert("방을 선택해주세요.");
					return false;
				}
			} else {
				return false;
			}
		});				
	});
	</script>
		<%@ include file="../include/footer.jsp"%>