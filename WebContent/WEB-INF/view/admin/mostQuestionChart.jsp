<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	div#piechart{
		width: 1000px;
		margin: 0 auto;
	}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    
    var list_data = [
    	["type", "cnt"],
    	<c:forEach var="q" items="${list}">
    		["${q.qType}", ${q.qTypeCnt}],
    	</c:forEach>
    ];
    
	function drawChart() {		
		var data = google.visualization.arrayToDataTable(list_data);

		var options = {
			title: '[유형별 질문 빈도]'
		};

		var chart = new google.visualization.PieChart(document.getElementById('piechart'));

		chart.draw(data, options);
	}
</script>
<section>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
</section>
<%@ include file="../include/footer.jsp" %>