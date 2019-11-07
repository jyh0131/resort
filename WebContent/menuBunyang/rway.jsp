<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="bunyang.jsp" %>
<style>
	#table_body{
		width: 100%;
	}
	#table_body > h4{
		clear: both;
	    margin: 30px 0 10px 0;
	    font-size: 16px;
	    font-weight: bold;
	    color: #335082;
	}
	#table_body > .open_table{
		width: 100%;
		border-top: 1px solid #e1e1e1;
		border-collapse: collapse;
	}
	#table_body > .open_table th{
		color: #777;
   		background: #f8f8f8;
   		border-bottom: 1px solid #e1e1e1;
   		border-left: 1px solid #e1e1e1;
   		font-size: 12px;
   		font-family: Dotum, '돋움';
   		border-collapse: collapse;
   		color:#666;
   		padding:10px 0 9px;
	}
	#table_body > .open_table th:first-child{
		border-left:none;
	}
    #table_body > .open_table td{
	    padding: 10px 0 9px 0;
	    border-left: 1px solid #e1e1e1;
	    border-bottom: 1px solid #e1e1e1;
	    font-size: 12px;
    	font-family: Dotum, '돋움';
    	border-collapse: collapse;
    	text-align: center;
    	color:#666;
    }
</style>
<script>
	$(function(){
		$("#bunyang_list > ul > li").removeClass("pic");
		$("#bunyang_list > ul > li").eq(1).addClass("pic"); 
	})
</script>
		<div id = "table_body">
			<h4>객실오픈일정</h4>
			<table class = "open_table">
				<tr>
					<th rowspan="2">구분</th>
					<th colspan="3">비수기</th>
					<th colspan="2">성수기</th>
				</tr>
				<tr>
					<th>상반기</th>
					<th>하반기</th>
					<th>어린이날<br>현충일<br>추석<br>개천절</th>
					<th>여름</th>
					<th>겨울</th>
				</tr>
				<tr>
					<th rowspan="4">기간</th>
					<td rowspan="4">2019.03.01<br>~<br>2019.07.18</td>
					<td rowspan="4">2019.08.25<br>~<br>2020.02.29</td>
					<td rowspan="4">2019.05.03~05.05<br>/<br>2019.06.05~06.08<br>/<br>2019.09.11~09.14<br>/<br>2019.10.02~10.05</td>
					<td rowspan="4">2019.07.19<br>~<br>2019.08.24</td>
					<td>비발디파크</td>
				</tr>
				<tr>
					<td>2019.12.20<br>~<br>2020.01.31<br>전기간<br>/<br><span>2020.02월 中<br>주말 및 연휴<br>(구정연휴 포함)</span>
				</tr>
				<tr>
					<td>그 외 지역</td>
				</tr>
				<tr>
					<td>2019.12.20<br>~<br>2020.01.31<br>中<br>주말 및 연휴<br>(구정연휴 포함)</span>
				</tr>
				<tr>
					<th>추첨</th>
					<td>-</td>
					<td>-</td>
					<td>추첨 접수<br>2019.03.01~03.11<br>추첨 발표<br>2019.03.15</td>
					<td>추첨 접수<br>2019.06.01~06.10<br>추첨 발표<br>2019.06.13</td>
					<td>추첨 접수<br>2019.10.25~11.04<br>추첨 발표<br>2019.11.08</td>
				</tr>
				<tr>
					<th>객실 오픈일</th>
					<td>2019.01.02</td>
					<td>2019.07.01</td>
					<td>추첨 발표後<br>2019.03.15</td>
					<td>추첨 발표後<br>2019.06.13</td>
					<td>추첨 발표後<br>2019.11.08</td>
				</tr>
			</table>
		</div>	
	</div>
</section>
<%@ include file="../WEB-INF/view/include/footer.jsp" %>