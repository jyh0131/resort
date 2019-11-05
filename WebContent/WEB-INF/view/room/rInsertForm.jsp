<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/headerA.jsp" %>
<link href = "${pageContext.request.contextPath }/css/roomAll.css" type ="text/css" rel = "stylesheet">  
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
	<form action = "insert.do" method = "post" id = "rInsertForm">
		<fieldset>
			<legend>객실 등록</legend>
			<p>
				<label>객실 타입</label>
				<select name = "roomType">
					<c:forEach var = "rt" items = "${rt }">
						<option value = "${rt.rtNo }" >${rt.rtName }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>객실 이름</label>
				<select name = "roomName">
					<c:forEach var = "rt" items = "${rt }">
						<c:forEach var = "rn" items = "${rn }">
							<c:if test = "${rt.rtNo == rn.roomType.rtNo }">
								<option value = "${rn.rnNo }" >${rn.rnName }</option>
							</c:if>	
						</c:forEach>
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
	<%@ include file="../include/footer.jsp" %>