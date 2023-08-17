<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
<%
//해당파일을 처음실행시 파라미터값이 없는상태이므로 numberformatException 발생
//실행후 주소창에 파일명뒤에 ?age=20 같이 기술하면 에러사라진다
int myAge = Integer.parseInt(request.getParameter("age"))+10;
out.println("10년 후 당신의 나이는 "+myAge+" 입니다.");
%>
</body>
</html>