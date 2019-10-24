<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$("#rInsertForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name]"));
			if(result == false){
				return false;
			}
		})
	})
</script>
</head>
<body>
	<form action = "insert.do" method = "post" id = "rInsertForm">
		<fieldset>
			<legend>객실 등록</legend>
			<p>
				<label>객실 이름</label>
				<select name = "roomName">
					<c:forEach var = "rn" items = "${rn }">
						<option value = "${rn.rnNo }" >${rn.rnName }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>객실 방 번호</label>
				<input type = "text" name = "rRoom">
				<span class = "error">※객실의 방 번호를 입력해주세요※</span>
			</p>
			<p>
				<input type = "submit" value = "등록">
			</p>
		</fieldset>
	</form>
</body>
</html>