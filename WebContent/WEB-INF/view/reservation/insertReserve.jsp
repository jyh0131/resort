<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
#rsv_wrapper {
	width:1024px;
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
#datebox input[name="start_date"]{
	margin-left:14px;
}
#roombox {
	width:300px;
	height:300px;
	float:left;
}
#roombox li{
	list-style:none;
}
#info {
	width:300px;
	float:left;
}
#info span {
	margin-left:5px;
}
footer {
	clear:both;
}
</style>
<div id="rsv_wrapper">
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
			Check in <input type="date" name="start_date" disabled="disabled"><br>
			Check Out <input type="date" name="end_date" disabled="disabled">
		</div>
	</div>
	<div id="roombox">
		<button></button>
		<button></button>
		<button></button>
		<button></button>
			<%-- <ul>
				<li><span class="room_name">호텔 패밀리룸</span>
					<select name="count">
						<option selected="selected">0</option>
						<c:forEach begin="1" end="5" var="num"> <!-- end값이 남은 방의 갯수가 되어야 함 -->
							<option>${num}</option>
						</c:forEach>
					</select>
				</li>				
			</ul> --%>
		</div>
	<div id="info">
			예약정보<br>
			<label>예약자명</label>
			<input type="text" name="name"><br>
			<label>전화번호</label>
			<input type="text" name="phone"><br>
			<label>이용객실<span id="room"></span></label><br>
			<label>이용인원<span id="count"></span></label><br>
			<label>이용일정</label><br>
			<span id="useDate"></span><br>
			<label>객실 요금</label>
			<p id="price"></p>
			<input type="submit" value="예약하기">
		</div>
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
	
		$(document).on("click", "#calendar td", function() {
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
			
			// 객실 유무 확인
			
			var target = $(this);
			$.ajax({
				url:"${pageContext.request.contextPath}/reservation/load.do?no="+$(this).attr("data-update"),
				type:"get",
				data:{"count":$(this).parent().find("input[name='count']").val()},
				dataType:"json",
				success:function(res) {
					console.log(res);
				}
			});		
		});
		
		/* 방 갯수 선택 시 변경 */
		/* $("select[name='count']").change(function() {
			var room = $(this).parent().find("li span").val();
			$("#info #room").text(room);
			
			var value = $(this).val();
			$("#info #count").text(value + "명");			
		}); */
	});
	</script>
		<%@ include file="../include/footer.jsp"%>