<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/headerA.jsp" %>
<link href = "${pageContext.request.contextPath }/css/roomAll.css" type ="text/css" rel = "stylesheet">
<script src = "${pageContext.request.contextPath }/js/room.js"></script>
<script>
	$(function(){
		$("#rnInsertForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name],textarea"));
			if(result == false){
				return false;
			}
		})
	})
</script>
	<form action = "insert.do" method = "post" id = "rnInsertForm">
		<fieldset>
			<legend>객실 정보 등록</legend>
			<p>
				<label>객실 이름 </label>
				<input type = "text" name = "rnName">
				<span class = "error">※객실 이름을 입력 하세요※</span>
			</p>
			<p>
				<label>객실 타입</label>
				<select name = "roomType">
					<c:forEach var = "rt" items = "${rt }">
						<option value = "${rt.rtNo }" >${rt.rtName }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>객실 상세 정보 </label>
				<br>
				<br>
				<textarea rows="10" cols="60" name = "rnDetail"></textarea>
				<br>
				<br>
				<span class = "error">※객실 상세 정보를 입력 하세요※</span>
			</p>
			<p>
				<label>객실 가격</label>
				<input type = "text" name = "rnPrice">
				<span class = "error">※객실 가격을 입력 하세요※</span>
			</p>
			<p>
				<label>객실 영문 이름</label>
				<input type = "text" name = "rnEngName">
				<span class = "error">※객실 영문 이름을 입력 하세요※</span>
			</p>
			<p>
				<input type = "submit" value = "등록">
			</p>
		</fieldset>
		
		
	</form>
	<%@ include file="../../include/footer.jsp" %>