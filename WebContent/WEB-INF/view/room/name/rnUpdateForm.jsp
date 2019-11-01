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
		$("#rnUpdateForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name],textarea"));
			if(result == false){
				return false;
			}
		})
		$("select[name='roomType']").change(function(){
			var rt = $(this).val();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/room/select.do",
				type:"get",
				data:{"roomType":$("select[name='roomType'] option:selected").val()},
				dataType:"json",
				success:function(res){
					console.log(res);
					$("select[name='roomName']").empty();
					$(res.rtList).each(function(i,obj){
						var $option = $("<option>").html(this.rnName).val(this.rnNo);
						
						$("select[name='roomName']").append($option);
					})
					
				}
			})
		})
		$("select[name='roomType']").change();
	})
</script>
</head>
<body>
	<form action = "update.do" method = "post" id = "rnUpdateForm">
		<fieldset>
			<legend>객실 정보 수정</legend>
			<p>
				<label>객실 번호</label>
				<input type = "text" readonly="readonly" name = "rnNo" value = "${rn.rnNo }">
			</p>
			<p>
				<label>객실 타입 </label>
				<select name = "roomType">
					<c:forEach var = "rt" items = "${rt }">
						<option value = "${rt.rtNo }" >${rt.rtName }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>객실 이름</label>
				<select name = "roomName">
					
				</select>
			</p>
			<p>
				<label>객실 상세 정보 </label>
				<br>
				<br>
				<textarea rows="10" cols="60" name = "rnDetail">${rn.rnDetail }</textarea>
				<br>
				<br>
				<span class = "error">※객실 상세 정보를 입력 하세요※</span>
			</p>
			<p>
				<label>객실 가격</label>
				<input type = "text" name = "rnPrice" value = "${rn.rnPrice }">
				<span class = "error">※객실 가격을 입력 하세요※</span>
			</p>
			<p>
				<label>객실 영문 이름</label>
				<input type = "text" name = "rnEngName" value = "${rn.rnEngName }">
				<span class = "error">※객실 영문 이름을 입력 하세요※</span>
			</p>
			<p>
				<input type = "submit" value = "수정">
			</p>
		</fieldset>
	</form>
</body>
</html>