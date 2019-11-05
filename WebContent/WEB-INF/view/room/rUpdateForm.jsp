<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerA.jsp" %>
<link href = "${pageContext.request.contextPath }/css/roomAll.css" type ="text/css" rel = "stylesheet">
<script src = "${pageContext.request.contextPath }/js/room.js"></script>
<script>
	$(function(){
		$("#rUpdateForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name]"));
			if(result == false){
				return false;
			}
		})
	})
</script>
	<form action = "update.do" method = "post" id = "rUpdateForm">
		<fieldset>
			<legend>객실 수정</legend>
			<p>
				<label>객실 번호</label>
				<input type = "text" readonly="readonly" name = "rNo" value = "${r.rNo }">
			</p>
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
				<input type = "text" name = "rRoom" value = "${r.rRoom }">
				<span class = "error">※객실 방 번호를 입력 하세요※</span>
			</p>
			<p>
				<input type = "submit" value = "수정">
			</p>
		</fieldset>
	</form>
	<%@ include file="../include/footer.jsp" %>