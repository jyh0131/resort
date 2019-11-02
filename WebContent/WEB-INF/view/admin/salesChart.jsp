<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	div#chart_div{
		width: 1000px;
		margin: 0 auto;
	}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
	var list_data = [
		['Month', 
		<c:forEach var="rmn" items="${rmnList}">
			'${rmn}',
		</c:forEach>
		'월 매출'],
    	<c:forEach var="rsv" items="${rsvList}">
  
    	
    		[월, 객실별매출, , , , , , , 월매출],	
    	</c:forEach>
    ];
	
	function drawVisualization() {
	  var data = google.visualization.arrayToDataTable([
	    ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda'],
	    ['2004/05',  165,      938,         522,             998,           450],
	    ['2005/06',  135,      1120,        599,             1268,          288],
	    ['2006/07',  157,      1167,        587,             807,           397],
	    ['2007/08',  139,      1110,        615,             968,           215],
	    ['2008/09',  136,      691,         629,             1026,          366]
	  ]);
	
	  var options = {
	    title : '[월별 매출액 & 객실별 매출액]',
	    vAxis: {title: 'sales'},
	    hAxis: {title: 'Month'},
	    seriesType: 'bars',
	    series: {5: {type: 'line'}}        };
	
	  var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	  chart.draw(data, options);
	}
</script>
<section>
	<div id="chart_div"></div>
	<div>
		<c:forEach var="r" items="${list}">
			<p>${r.rsvPrice} | ${r.rsvPaymentDate} | ${r.room.rNo}</p> 
		</c:forEach>
	</div>
</section>
<%@ include file="../include/footer.jsp" %>