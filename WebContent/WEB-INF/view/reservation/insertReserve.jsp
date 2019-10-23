<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
#rsv_wrapper {
	width:1024px;
}
#calendar {
	width:48%;
	margin:0 auto;
	position:relative;
}
#calendar #day_title{
	position: absolute;
	top:-50px;
	left:35px;
	text-align:center;
}
#calendar table {
	border-collapse: collapse;
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
	})		
	</script>
		<%@ include file="../include/footer.jsp"%>