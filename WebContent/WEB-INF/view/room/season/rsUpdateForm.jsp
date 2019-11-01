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
		$("#rsUpdateForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name],select,textarea"));
			if(result == false){
				return false;
			}
		})
		
	})
</script>
</head>
<body>
	<form action = "update.do" method = "post" id = "rsUpdateForm">
		<fieldset>
			<legend>객실 가격 정보 수정</legend>
			<p>
				<label>번호</label>
				<input type = "text" readonly="readonly" name = "rsNo" value = "${rs.rsNo }">
			</p>
			<p>
				<label>객실 이름 </label>
				<select name = "roomName">
					<c:forEach var = "rn" items = "${rn }">
						<option value = "${rn.rnNo }" >${rn.rnName }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>시즌</label>
				<input type = "text" name = "rpSeason" value = "${rs.rsSeason }">
				<span class = "error">※시즌 정보를 입력 하세요※</span>
			</p>
			<p>
				<label>시즌 설명</label>
				<textarea rows="10" cols="60" name = "rsDetail">${rs.rsDetail }</textarea>
				<span class = "error">※시즌 설명에 대하여 입력 하세요※</span>
			</p>
			<p>
				<input type = "submit" value = "수정">
			</p>
		</fieldset>
	</form>
</body>
</html>