<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/headerA.jsp" %>
<link href = "${pageContext.request.contextPath }/css/roomAll.css" type ="text/css" rel = "stylesheet">
<script src = "${pageContext.request.contextPath }/js/room.js"></script>
<script>
	$(function(){
		$("#reUpdateForm").submit(function(i,obj){
			var result = checkInputEmpty($("input[name],select,textarea"));
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
	<form action = "update.do" method = "post" id = "reUpdateForm">
		<fieldset>
			<legend>비품 구성 정보 수정</legend>
			<p>
				<label>번호</label>
				<input type = "text" readonly="readonly" name = "reNo" value = "${re.reNo }">
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
				<label>객실 이름 </label>
				<select name = "roomName">
					<%-- <c:forEach var = "rn" items = "${rn }">
						<option value = "${rn.rnNo }" >${rn.rnName }</option>
					</c:forEach> --%>
				</select>
			</p>
			<p>
				<label>가구류</label>
				<textarea rows="3" cols="40" name = "reFurniture">${re.reFurniture }</textarea>
				<span class = "error">※가구류를 입력 하세요※</span>
			</p>
			<p>
				<label>가전류</label>
				<textarea rows="3" cols="40" name = "reHomeAppliances">${re.reHomeAppliances }</textarea>
				<span class = "error">※가전류를 입력 하세요※</span> 
			</p>
			<p>
				<label>식기류</label>
				<textarea rows="3" cols="40" name = "reTableWare">${re.reTableWare }</textarea> 
				<span class = "error">※식기류를 입력 하세요※</span>
			</p>
			<p>
				<label>세면류</label>
				<textarea rows="3" cols="40" name = "reWash">${re.reWash }</textarea> 
				<span class = "error">※세면류를 입력 하세요※</span>
			</p>
			<p>
				<label>침구류</label>
				<textarea rows="3" cols="40" name = "reBedding">${re.reBedding }</textarea> 
				<span class = "error">※침구류를 입력 하세요※</span>
			</p>
			<p>
				<label>기타</label>
				<textarea rows="3" cols="40" name = "reOther">${re.reOther }</textarea>
				<span class = "error">※기타 정보를 입력 하세요※</span>
			</p>
			<p>
				<label>어메니티</label>
				<textarea rows="3" cols="40" name = "reAmenity">${re.reAmenity }</textarea>
				<span class = "error">※어메니티를 입력 하세요※</span>
			</p>
			<p>
				<input type = "submit" value = "수정">
			</p>
		</fieldset>
	</form>
	<%@ include file="../../include/footer.jsp" %>