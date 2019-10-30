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
	width:300px;
	margin:0 auto;
	position:relative;
	float:left;
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
#calendar td{
	cursor: pointer;
}
#calendar th, td {
	padding: 5px;
	border: 1px solid black;
	text-align:center;
}

#calendar table th:first-child, table td:first-child {
	color: #FF1291;
}

#calendar table th:last-child, table td:last-child {
	color: #6EE3F7;
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
	height:300px;
	float:left;
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
	margin-left:10px;
	width:300px;
	float:left;
	border:1px solid black;
	padding:5px;
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
	<form action="${pageContext.request.contextPath}/reservation/insert.do" method="post">
	<div id="calendar">
		<div id="day_title">
			<p>날짜선택</p>
			
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
			Check in <input type="date" name="start_date" value="2019-10-01" readonly="readonly"><br>
			Check Out <input type="date" name="end_date" readonly="readonly">
		</div>
	</div>
	<div id="roombox">
	</div>
	<div id="info">
		예약정보<br>
		<label>예약자명</label>
		<input type="text" name="name" value="${member.mName}"><br>
		<label>전화번호</label>
		<input type="text" name="phone" value="${member.mPhone}"><br>
		<label>이용객실<br><span id="room"></span></label><br>
		<label>이용인원
			<select name="count">
				<c:forEach begin="1" end="5" var="num">
					<option>${num}</option>
				</c:forEach>
			</select>
		</label><br>
		<label>이용일정</label><br>
			<span id="useDate"></span><br>
			<label>객실 요금</label>
			<p id="price"></p>
			<input type="hidden" name="rt_no" value="">
			<input type="hidden" name="rn_no" value="">
			<input type="hidden" name="price" value="">
			<input type="submit" value="예약하기">
		</div>
	</form>
</div>
<script>
	$(function() {
		var t = new Date();
		var y = t.getFullYear();
		var m = t.getMonth();
				
		makeCal();
		
	function makeCal() {
		$("#calendar #title").text(y+"년"+(m+1)+"월");
		$(".new_cal").remove();
		
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
		
		var tableObj = document.getElementsByTagName("table")[0];
		var trObjs = document.getElementsByTagName("tr");
		var cnt = 1;
		
		for(var i=1; i<=row; i++) { // 행
			// tableObj.innerHTML += "<tr>";
			$("#calendar table").append("<tr class='new_cal'>");
			for(var j=1; j<=7; j++) { // 열
				if(i==1 && j<=day || num > lastDay) {
					// trObjs[cnt].innerHTML += "<td></td>";
					$("#calendar table tr").eq(cnt).append("<td></td>");
				} else {
					// trObjs[cnt].innerHTML += "<td>"+num+"</td>";
					$("#calendar table tr").eq(cnt).append("<td>"+num+"</td>");
					num++;
				}
			}
			$("#calendar table").append("</tr>");
			cnt++;
		}		
		// divObj.innerHTML += "</table>";
	}
		
		$("#calendar #preMonth").click(function() {
			m--;
			if(m == -1) {
				y--;
				m = 11;
			}
			makeCal();		
		});

		$("#calendar #nextMonth").click(function() {
			m++;
			if(m == 12){
				y++;
				m = 0;
			}
			makeCal();
		});
		
		// 달력의 날짜 클릭 시
		$(document).on("click", "#calendar td", function() {
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
			
			$("#roombox").empty();
			
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
						$("#roombox").append($room);
	
					});
				}
			});
		});
		
		// 객실 선택 시
		$(document).on("click", "button.choose", function() {
			var room = $(this).parent().parent().find("span").text();
			$("#info #room").text(room);
			
			var price = $(this).parent().parent().find(".roomprice").text();
			$("#info #price").text(price+"원");
			$("#info input[name='price']").val(price);
			
			var rt_no = $(this).parent().parent().find(".rt_no").text();
			$("#info input[name='rt_no']").text(rt_no);
			
			var rn_no = $(this).parent().parent().find(".rn_no").text();
			$("#info input[name='rn_no']").text(rn_no);
			
			$("#info input[type='submit']").css("display", "inline");
		});
		
		// 예약 시
		$("form").submit(function () {
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