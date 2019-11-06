<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/headerA.jsp" %>
<link href = "${pageContext.request.contextPath }/css/roomAll.css" type ="text/css" rel = "stylesheet">  
<script src = "${pageContext.request.contextPath }/js/room.js"></script>
<script>
	$(function(){
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
	<form action = "insert.do" method = "post">
		<fieldset>
			<legend>비품 구성 정보 등록</legend>
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
				<textarea rows="3" cols="40" name = "reFurniture"></textarea>
			</p>
			<p>
				<label>가전류</label>
				<textarea rows="3" cols="40" name = "reHomeAppliances"></textarea> 
			</p>
			<p>
				<label>식기류</label>
				<textarea rows="3" cols="40" name = "reTableWare"></textarea> 
			</p>
			<p>
				<label>세면류</label>
				<textarea rows="3" cols="40" name = "reWash"></textarea> 
			</p>
			<p>
				<label>침구류</label>
				<textarea rows="3" cols="40" name = "reBedding"></textarea> 
			</p>
			<p>
				<label>기타</label>
				<textarea rows="3" cols="40" name = "reOther"></textarea>
			</p>
			<p>
				<label>어메니티</label>
				<textarea rows="3" cols="40" name = "reAmenity"></textarea>
			</p>
			<p>
				<input type = "submit" value = "등록">
			</p>
		</fieldset>
		
		
	</form>
	<%@ include file="../../include/footer.jsp" %>