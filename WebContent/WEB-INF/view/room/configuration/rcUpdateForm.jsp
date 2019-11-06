<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/headerA.jsp" %>
<link href = "${pageContext.request.contextPath }/css/roomAll.css" type ="text/css" rel = "stylesheet">
<script src = "${pageContext.request.contextPath }/js/room.js"></script>
<script>
	$(function(){
		$("#rcUpdateForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name],select"));
			if(result == false){
				return false;
			}
		})
		
	})
</script>
	<form action = "update.do" method = "post" id = "rcUpdateForm">
		<fieldset>
			<legend>객실 구성 수정</legend>
			<p>
				<label>객실 번호</label>
				<input type = "text" readonly="readonly" name = "rcNo" value = "${rc.rcNo }">
			</p>
			<p>
				<label>타입</label>
				<input type = "text" readonly="readonly" name = "roomType" value = "${rn.roomType.rtName }">
			</p>
			<p>
				<label>객실 이름 </label>
				<select name = "roomName">
					<c:forEach var = "rc" items = "${list }">
						<option value = "${rc.roomName.rnNo }" >${rc.roomName.rnName }</option>
					</c:forEach>
				</select>
				<span class = "error">※객실 이름을 선택 하세요※</span>
			</p>
			<p>
				<label>객실 면적</label>
				<input type = "text" name = "rcArea" value = "${rc.rcArea }">
				<span class = "error">※객실 면적을 입력 하세요※</span>
			</p>
			<p>
				<label>객실 타입</label>
				<input type = "text" name = "rcType" value  = "${rc.rcType }">
				<span class = "error">※객실 타입을 입력 하세요※</span>
			</p>
			<p>
				<label>객실 갯수</label>
				<input type = "text" name = "rcTypeCount" value  = "${rc.rcTypeCount }">
				<span class = "error">※객실 갯수를 입력 하세요※</span>
			</p>
			<p>
				<label>객실 실내 구성</label>
				<input type = "text" name = "rcInterior" value = "${rc.rcInterior }">
				<span class = "error">※객실 실내 구성을 입력 하세요※</span>
			</p>
			<p>
				<input type = "submit" value = "수정">
			</p>
		</fieldset>
	</form>
<%@ include file="../../include/footer.jsp" %>