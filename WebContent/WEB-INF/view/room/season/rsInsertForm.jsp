<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/headerA.jsp" %>
<link href = "${pageContext.request.contextPath }/css/roomAll.css" type ="text/css" rel = "stylesheet"> 
<script src = "${pageContext.request.contextPath }/js/room.js"></script>
<script>
	$(function(){
		$("#rsInsertForm").submit(function(i,obj){
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
	<form action = "insert.do" method = "post" id = "rsInsertForm">
		<fieldset>
			<legend>객실 가격 정보 등록</legend>
			<p>
				<label>객실 타입 </label>
				<select name = "roomType">
					<c:forEach var = "rt" items = "${rt }">
						<option value = "${rt.rtNo }" >${rt.rtName }</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>객실 이름 </label>
				<select name = "roomName">
					<%-- <c:forEach var = "rn" items = "${rn }">
						<option value = "${rn.rnNo }" >${rn.rnName }</option>
					</c:forEach> --%>
				</select>
			</p>
			<p>
				<label>시즌</label>
				<input type = "text" name = "rsSeason">
				<span class = "error">※시즌 정보를 입력 하세요※</span>
			</p>
			<p>
				<label>시즌 설명</label>
				<textarea rows="10" cols="60" name = "rsDetail"></textarea>
				<span class = "error">※시즌 설명에 대하여 입력 하세요※</span>
			</p>
			<p>
				<input type = "submit" value = "등록">
			</p>
		</fieldset>
		
		
	</form>
	<%@ include file="../../include/footer.jsp" %>