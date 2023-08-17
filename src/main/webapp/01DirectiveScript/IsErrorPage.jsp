<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!-- 해당페이지에 전달된 에러 처리하기위해 page지시어에 isErrorPage 속성을 true로 지정해야한다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
<h2>서비스 중 일시적인 오류가 발생했습니다. </h2>
<div><img src="../images/Error.jpg" alt="공사중입니다."></div>
<p>
오류명 : <%= exception.getClass().getName() %><br>
오류메시지 : <%= exception.getMessage() %>
</p>
</body>
</html>