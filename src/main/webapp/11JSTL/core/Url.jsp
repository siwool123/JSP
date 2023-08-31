<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - url</title>
</head>
<body>
<!-- url 태그 : url생성시 사용. 절대경로 사용시 컨텍스트루트는 제외한다
var속성 지정안한경우 핻아위치에 생성된 url이 출력된다
param 태그로 지정한 값을 쿼리스트링으로 url뒤에 연결된다.

host(도메인 부분) 제외한 나머지 경로 반환. 즉 컨텍스트루트 경로를 자동으로 삽입해준다.
var속성이 지정되었으므로 해당 위치엔 출력안된다  -->
<h4>url 태그로 링크걸기</h4>
<c:url value="/11JSTL/inc/OtherPage.jsp" var="url">
	<c:param name="user_param1" value="Must" />
	<c:param name="user_param2">Have</c:param>
</c:url>
<a href="${ url }">OtherPage.jsp 바로가기</a>
</body>
</html>