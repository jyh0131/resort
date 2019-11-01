<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	div#chart_div, div#piechart{
		width: 1000px;
		margin: 0 auto;
	}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawTitleSubtitle);
	
	function drawTitleSubtitle() {
	      var data = new google.visualization.DataTable();
	      data.addColumn('timeofday', 'Time of Day');
	      data.addColumn('number', 'Motivation Level');
	      data.addColumn('number', 'Energy Level');
	
	      data.addRows([
	        [{v: [8, 0, 0], f: '8 am'}, 1, .25],
	        [{v: [9, 0, 0], f: '9 am'}, 2, .5],
	        [{v: [10, 0, 0], f:'10 am'}, 3, 1],
	        [{v: [11, 0, 0], f: '11 am'}, 4, 2.25],
	        [{v: [12, 0, 0], f: '12 pm'}, 5, 2.25],
	        [{v: [13, 0, 0], f: '1 pm'}, 6, 3],
	        [{v: [14, 0, 0], f: '2 pm'}, 7, 4],
	        [{v: [15, 0, 0], f: '3 pm'}, 8, 5.25],
	        [{v: [16, 0, 0], f: '4 pm'}, 9, 7.5],
	        [{v: [17, 0, 0], f: '5 pm'}, 10, 10],
	      ]);
	
	      var options = {
	        chart: {
	          title: 'Motivation and Energy Level Throughout the Day',
	          subtitle: 'Based on a scale of 1 to 10'
	        },
	        hAxis: {
	          title: 'Time of Day',
	          format: 'h:mm a',
	          viewWindow: {
	            min: [7, 30, 0],
	            max: [17, 30, 0]
	          }
	        },
	        vAxis: {
	          title: 'Rating (scale of 1-10)'
	        }
	      };
	
	      var materialChart = new google.charts.Bar(document.getElementById('chart_div'));
	      materialChart.draw(data, options);
	    }
</script>
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
	<div id="piechart" style="width: 900px; height: 500px;">
	</div>
</section>
<%@ include file="../include/footer.jsp" %>