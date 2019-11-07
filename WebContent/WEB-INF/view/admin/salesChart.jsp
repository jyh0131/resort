<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerA.jsp" %>
<style>
	section{
		width: 100%;
		padding-top: 50px;
	}
	h1{
		text-align: center;
		color: #977F51;
	}
	div#chart_div{
		width: 1000px;
		margin: 0 auto;
		padding: 10px;
	}
	a#home{
		float: right;
		margin-right: 300px;
		text-decoration: none;
		color : #fff;
		background: #977F51;
		padding: 5px 10px; 
	}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
	var list_data = [
		['Month', '월 매출'],
   		<c:forEach var="mSales" items="${mSales}">
   			["${mSales.key}월", ${mSales.value}],
   		</c:forEach>
    ];
	
	function drawVisualization() {
	  var data = google.visualization.arrayToDataTable(list_data);
	
	  var options = {
	    title : '[2019년 월별 매출액]',
	    seriesType: 'bars',
	    fontSize : 13
	  	};
	
	  var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       ]);
	  
	  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	  chart.draw(view, options);
	}
</script>
<section>
	<h1>월별 매출액</h1>
	<div id="chart_div"></div>
</section>
<%@ include file="../include/footer.jsp" %>