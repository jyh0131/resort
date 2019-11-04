<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$.ajax({
			url:"${pageContext.request.contextPath}/loadRoomInfo.do",
			type:"get",
			// data:,
			dataType:"json",
			success:function(res) {
				console.log(res);
			}		
		});
		location.href = "${pageContext.request.contextPath}/home.jsp";
	})
</script>