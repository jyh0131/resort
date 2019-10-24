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
		$("#riUpdateForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name]"));
			if(result == false){
				return false;
			}
		})
	})
</script>
</head>
<body>
	<form action = "update.do" method = "post" id = "riUpdateForm" enctype="multipart/form-data">
		<fieldset>
			<legend>객실 정보 수정</legend>
			<p>
				<label>객실 번호</label>
				<input type = "text" readonly="readonly" name = "riNo" value = "${ri.riNo }">
			</p>
			<p>
				<label>객실 이름</label>
				<input type = "text" readonly="readonly" name = "roomName" value = "${ri.roomName.rnName}">
			</p>
			<p>
				<label>객실 이미지</label>
				<input type = "file" name = "riFile" value = "${ri.riFile }">
				<span class = "error">※객실 이미지파일을 선택해주세요※</span>
			</p>
			<p>
				<input type = "submit" value = "수정">
			</p>
		</fieldset>
	</form>
</body>
</html>