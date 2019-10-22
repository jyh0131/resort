<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "${pageContext.request.contextPath }/css/roomAll.css" type ="text/css" rel = "stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src = "${pageContext.request.contextPath }/js/room.js"></script>
<script>
	$(function(){
		$("#rtUpdateForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name]"));
			if(result == false){
				return false;
			}
		})
	})
</script>
</head>
<body>
	<form action = "update.do" method = "post" id = "rtUpdateForm">
		<fieldset>
			<legend>객실 타입 수정</legend>
			<p>
				<label>번호</label>
				<input type = "text" readonly="readonly" name = "rtNo" value = "${rt.rtNo }">
			</p>
			<p>
				<label>객실 타입 이름</label>
				<input type = "text" name = "rtName">
				<span class = "error">※수정할 객실 타입 이름을 입력하세요※</span>
			</p>
			<p>
				<input type = "submit" value = "수정">
			</p>
		</fieldset>
	</form>
</body>
</html>