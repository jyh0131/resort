<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href = "${pageContext.request.contextPath }/roomType/list.do">객실타입리스트</a>
	<a href = "${pageContext.request.contextPath }/roomType/insert.do">객실타입추가</a>
	
	
	<a href = "${pageContext.request.contextPath }/roomName/insert.do">객실정보추가</a>
	<a href = "${pageContext.request.contextPath }/roomName/list.do">객실정보리스트</a>
	
	<a href = "${pageContext.request.contextPath }/roomImg/insert.do">객실이미지추가</a>
	<a href = "${pageContext.request.contextPath }/roomImg/list.do">객실이미지리스트</a>
</body>
</html>