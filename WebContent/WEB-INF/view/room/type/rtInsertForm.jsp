<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/headerA.jsp" %>
<link href = "${pageContext.request.contextPath }/css/roomAll.css" type ="text/css" rel = "stylesheet">  
<script src = "${pageContext.request.contextPath }/js/room.js"></script>
<script>
	$(function(){
		$("#rtInsertForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name]"));
			if(result == false){
				return false;
			}
		})
	})
</script>
	<form action = "insert.do" method = "post" id = "rtInsertForm">
		<fieldset>
			<legend>객실 타입 등록</legend>
			<p>
				<label>객실 타입 이름</label>
				<input type = "text" name = "rtName">
				<span class = "error">※객실 타입 이름을 입력 하세요※</span>
			</p>
			<p>
				<input type = "submit" value = "등록">
			</p>
		</fieldset>
	</form>
	<%@ include file="../../include/footer.jsp" %>