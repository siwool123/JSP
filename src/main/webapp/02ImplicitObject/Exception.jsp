<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 = exception</title>
</head>
<body>
<%
int status = response.getStatus();
switch(status){
case 404: out.print("404 에러가 발생했습니다. <br>파일경로를 확인해주세요."); break;
case 405: out.print("405 에러가 발생했습니다. <br>요청방식(method)을 확인해주세요."); break;
case 500: out.print("500 에러가 발생했습니다. <br>소스코드에 오류가 없는지 확인해주세요."); 
}
%>
<div><img src="../images/Error.jpg" alt="공사중입니다."></div>
</body>
</html>